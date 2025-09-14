package iuh.fit.phamngochung_tuan03.Servlet;

import iuh.fit.phamngochung_tuan03.dao.AccountDAO;
import iuh.fit.phamngochung_tuan03.modal.Account;
import iuh.fit.phamngochung_tuan03.modal.Gender;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/accountRegister")
public class AccountRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;
    @Resource(name = "jdbc/storedb")
    private DataSource dataSource;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            accountDAO = new AccountDAO(dataSource);
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        req.setCharacterEncoding("UTF-8");

        Account account = new Account();

        try {
            account.setFirstName(req.getParameter("firstName"));
            account.setLastName(req.getParameter("lastName"));
            account.setEmail(req.getParameter("email"));
            account.setPassword(req.getParameter("password"));

            String genderStr = req.getParameter("gender");
            if (genderStr != null) {
                account.setGender(Gender.valueOf(genderStr.toUpperCase()));
            }

            int day = Integer.parseInt(req.getParameter("day"));
            int month = Integer.parseInt(req.getParameter("month"));
            int year = Integer.parseInt(req.getParameter("year"));
            LocalDate localDate = LocalDate.of(year, month, day);
            java.sql.Date dob = java.sql.Date.valueOf(localDate);
            account.setDateOfBirth(localDate);

            accountDAO.addAccount(account);

            req.setAttribute("account", account);
            RequestDispatcher dispatcher = req.getRequestDispatcher("accountRegistrationResult.jsp");
            dispatcher.forward(req, resp);
        } catch (RuntimeException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
    }
}
