package iuh.fit.phamngochung_tuan03.Servlet;

import iuh.fit.phamngochung_tuan03.modal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/studentRegistrationForm")
public class StudentRegisterServlet extends HttpServlet {
    public StudentRegisterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        req.setCharacterEncoding("UTF-8");

        Student student = new Student();

        try {
            student.setFirstName(req.getParameter("firstName"));
            student.setLastName(req.getParameter("lastName"));
            student.setEmail(req.getParameter("email"));
            student.setMobile(req.getParameter("mobile"));

            String dobString = req.getParameter("dateOfBirth");
            if (dobString != null && !dobString.isEmpty()) {
                student.setDateOfBirth(LocalDate.parse(dobString));
            }

            student.setAddress(req.getParameter("address"));
            student.setCity(req.getParameter("city"));
            student.setState(req.getParameter("state"));
            student.setCountry(req.getParameter("country"));
            student.setCountry(req.getParameter("country"));

            // Value Enum
            String genderStr = req.getParameter("gender");
            if (genderStr != null) {
                student.setGender(Gender.valueOf(genderStr.toUpperCase()));
            }

            String courseStr = req.getParameter("course");
            if (courseStr != null) {
                student.setCourse(Course.valueOf(courseStr.toUpperCase()));
            }

            // Value List
            String[] hobbies = req.getParameter("hobbies").split(",");
            if (hobbies != null) {
                Set<Hobby> hobbySet = new HashSet<>();

                for (String hobbyStr : hobbies) {
                    hobbySet.add(Hobby.valueOf(hobbyStr.toUpperCase()));
                }
                student.setHobbies(hobbySet);
            }

            List<Qualification> qualifications = new ArrayList<>();
            String boardX = req.getParameter("boardX");
            String percentageX = req.getParameter("percentageX");
            String yearX = req.getParameter("yearX");
            if (isQualificationValid(boardX, percentageX, yearX)) {
                qualifications.add(new Qualification("Class X", boardX, percentageX, yearX));
            }

            String boardXII = req.getParameter("boardXII");
            String percentageXII = req.getParameter("percentageXII");
            String yearXII = req.getParameter("yearXII");
            if (isQualificationValid(boardXII, percentageX, yearXII)) {
                qualifications.add(new Qualification("Class XII", boardXII, percentageXII, yearXII));
            }
            student.setQualifications(qualifications);

            req.setAttribute("student", student);
            req.getRequestDispatcher("studentRegistrationResult.jsp").forward(req, resp);


        }  catch (DateTimeParseException e) {
            // Xử lý lỗi nếu ngày sinh không đúng định dạng
            resp.getWriter().println("Error: Invalid date format. Please use yyyy-mm-dd.");
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // Xử lý lỗi nếu giá trị enum không hợp lệ
            resp.getWriter().println("Error: Invalid value for gender, course, or hobby.");
            e.printStackTrace();
        } catch (Exception e) {
            // Bắt các lỗi khác
            resp.getWriter().println("An unexpected error occurred.");
            e.printStackTrace();
        }


    }
    private boolean isQualificationValid(String board, String percentage, String year) {
        return (board != null && !board.trim().isEmpty()) ||
                (percentage != null && !percentage.trim().isEmpty()) ||
                (year != null && !year.trim().isEmpty());
    }

}
