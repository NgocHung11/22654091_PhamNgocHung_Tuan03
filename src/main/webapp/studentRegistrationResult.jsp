<%@ page import="iuh.fit.phamngochung_tuan03.modal.Student" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="iuh.fit.phamngochung_tuan03.modal.Hobby" %>
<%@ page import="iuh.fit.phamngochung_tuan03.modal.Qualification" %><%--
  Created by IntelliJ IDEA.
  User: nhp11
  Date: 9/14/2025
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả đăng ký</title>
    <!-- Tích hợp Tailwind CSS qua CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

<%-- Lấy đối tượng 'student' đã được servlet gửi đến thông qua request attribute --%>
<% Student student = (Student) request.getAttribute("student"); %>

<%-- Kiểm tra nếu đối tượng student tồn tại để tránh lỗi NullPointerException --%>
<% if (student != null) { %>
<div class="w-full max-w-3xl bg-white p-6 md:p-8 rounded-lg shadow-lg">
    <div class="text-center mb-6">
        <!-- Icon thành công -->
        <svg class="w-16 h-16 mx-auto text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <h1 class="text-3xl font-bold text-gray-800 mt-4">Đăng Ký Thành Công!</h1>
        <p class="text-gray-600 mt-2">Cảm ơn, <strong><%= student.getFirstName() %></strong>. Thông tin của bạn đã được ghi nhận.</p>
    </div>

    <!-- Phần tóm tắt thông tin -->
    <div class="border-t pt-6">
        <h2 class="text-xl font-semibold text-gray-700 mb-4">Tóm Tắt Thông Tin</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4 text-gray-700">
            <p><strong>Họ và Tên:</strong> <%= student.getFirstName() %> <%= student.getLastName() %></p>
            <p><strong>Ngày sinh:</strong> <%= student.getDateOfBirth() %></p>
            <p><strong>Email:</strong> <%= student.getEmail() %></p>
            <p><strong>Điện thoại:</strong> <%= student.getMobile() %></p>
            <p><strong>Giới tính:</strong> <%= student.getGender().getDisplayName() %></p>
            <p><strong>Khóa học:</strong> <%= student.getCourse().getDisplayName() %></p>
            <p class="md:col-span-2"><strong>Địa chỉ:</strong> <%= student.getAddress() %>, <%= student.getCity() %>, <%= student.getState() %>, <%= student.getCountry() %> - <%= student.getPinCode() %></p>

            <%-- Hiển thị danh sách sở thích --%>
            <% if (student.getHobbies() != null && !student.getHobbies().isEmpty()) { %>
            <p class="md:col-span-2"><strong>Sở thích:</strong>
                <%= student.getHobbies().stream().map(Hobby::getDisplayName).collect(Collectors.joining(", ")) %>
            </p>
            <% } %>
        </div>
    </div>

    <%-- Hiển thị bảng trình độ học vấn nếu có --%>
    <% if (student.getQualifications() != null && !student.getQualifications().isEmpty()) { %>
    <div class="mt-6 border-t pt-6">
        <h2 class="text-xl font-semibold text-gray-700 mb-4">Trình Độ Học Vấn</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full text-left text-sm table-auto">
                <thead class="bg-gray-100 text-gray-600">
                <tr>
                    <th class="px-4 py-2 font-medium">Kỳ thi</th>
                    <th class="px-4 py-2 font-medium">Hội đồng</th>
                    <th class="px-4 py-2 font-medium">Tỷ lệ (%)</th>
                    <th class="px-4 py-2 font-medium">Năm tốt nghiệp</th>
                </tr>
                </thead>
                <tbody class="text-gray-700">
                <% for (Qualification q : student.getQualifications()) { %>
                <tr class="border-b hover:bg-gray-50">
                    <td class="px-4 py-2"><%= q.getExamination() %></td>
                    <td class="px-4 py-2"><%= q.getBoard() %></td>
                    <td class="px-4 py-2"><%= q.getPercentage() %></td>
                    <td class="px-4 py-2"><%= q.getYearOfPassing() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>

    <div class="text-center mt-8">
        <a href="studentRegistrationForm.jsp" class="text-blue-600 hover:underline font-medium">← Quay lại trang đăng ký</a>
    </div>
</div>
<% } else { %>
<%-- Hiển thị thông báo lỗi nếu không tìm thấy thông tin sinh viên --%>
<div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg text-center">
    <h1 class="text-2xl font-bold text-red-600">Lỗi!</h1>
    <p class="text-gray-600 mt-2">Không tìm thấy thông tin đăng ký. Vui lòng thử lại.</p>
    <div class="mt-6">
        <a href="studentRegistrationForm.jsp" class="text-blue-600 hover:underline font-medium">Quay lại trang đăng ký</a>
    </div>
</div>
<% } %>

</body>
</html>
