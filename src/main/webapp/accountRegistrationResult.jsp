<%@ page import="iuh.fit.phamngochung_tuan03.modal.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Registration Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }
        .result-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        h2 {
            color: #28a745; /* Green color for success */
        }
        p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        .error {
            color: #dc3545; /* Red color for error */
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="result-container">
    <%
        // Lấy đối tượng 'account' mà Servlet đã gửi qua
        Account account = (Account) request.getAttribute("account");

        // Kiểm tra xem đối tượng có tồn tại không
        if (account != null) {
    %>
    <h2>Đăng ký thành công! ✅</h2>
    <p>Chào mừng, <strong><%= account.getFirstName() %> <%= account.getLastName() %></strong>!</p>
    <p>Thông tin tài khoản của bạn:</p>
    <p><strong>Email:</strong> <%= account.getEmail() %></p>
    <%
    } else {
    %>
    <h2 class="error">Đã xảy ra lỗi ❌</h2>
    <p>Không tìm thấy thông tin tài khoản. Vui lòng thử lại.</p>
    <%
        }
    %>
    <a href="index.jsp">Quay về trang chủ</a>
</div>

</body>
</html>