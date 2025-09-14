package iuh.fit.phamngochung_tuan03.dao;

import iuh.fit.phamngochung_tuan03.modal.Account;
import iuh.fit.phamngochung_tuan03.modal.Gender;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    private DataSource dataSource;

    public AccountDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Lấy danh sách account
    public List<Account> getAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM accounts ORDER BY ID";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                long id = rs.getInt("ID");
                String fname = rs.getString("FIRSTNAME");
                String lname = rs.getString("LASTNAME");
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                LocalDate dateOfBirth = rs.getDate("DATEOFBIRTH").toLocalDate();
                String genderStr = rs.getString("GENDER");
                Gender gender = Gender.valueOf(genderStr.toUpperCase());

                Account acc = new Account(id,fname, lname, email, password, dateOfBirth, gender);
                accounts.add(acc);
            }
        }
        return accounts;
    }

    // Thêm account
    public void addAccount(Account acc) throws SQLException {
        // Thêm cột GENDER vào câu lệnh SQL
        String sql = "INSERT INTO accounts (FIRSTNAME, LASTNAME, EMAIL, PASSWORD, DATEOFBIRTH, GENDER) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, acc.getFirstName());
            ps.setString(2, acc.getLastName());
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getPassword());
            ps.setObject(5, acc.getDateOfBirth());

            // Thêm tham số cho GENDER
            ps.setString(6, acc.getGender().name()); // Chuyển enum thành String

            ps.executeUpdate();
        }
    }
}
