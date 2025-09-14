<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Form container styling */
        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            border: 1px solid #e0e0e0;
        }

        /* Form heading */
        .form-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        /* Styling for input fields and selects */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Important for padding and width */
            font-size: 16px;
        }

        /* Flex container for fields on the same line */
        .form-row {
            display: flex;
            gap: 15px; /* Space between items */
        }

        .form-row > * {
            flex: 1; /* Each item takes equal space */
        }

        /* Gender section styling */
        .gender-group {
            margin-bottom: 15px;
        }

        .gender-group label {
            margin-right: 15px;
            font-size: 16px;
            color: #555;
        }

        /* Submit button styling */
        .signup-btn {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .signup-btn:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<div class="form-container">
    <h2>User Registration Form</h2>
    <form action="${pageContext.request.contextPath}/accountRegister" method="post">
        <div class="form-row">
            <input type="text" name="firstName" placeholder="First Name" required>
            <input type="text" name="lastName" placeholder="Last Name" required>
        </div>

        <input type="email" name="email" placeholder="Your Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <label>Birthday</label>
        <div class="form-row">
            <select name="month" required>
                <option value="" disabled selected>Month</option>
                <option value="1">January</option>
                <option value="2">February</option>
                <option value="3">March</option>
                <option value="4">April</option>
                <option value="5">May</option>
                <option value="6">June</option>
                <option value="7">July</option>
                <option value="8">August</option>
                <option value="9">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
            </select>
            <select name="day" required>
                <option value="" disabled selected>Day</option>
                <% for(int i = 1; i <= 31; i++) { %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <select name="year" required>
                <option value="" disabled selected>Year</option>
                <% for(int i = 2025; i >= 1920; i--) { %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
        </div>

        <div class="gender-group">
            <label>Gender</label>
            <input type="radio" id="female" name="gender" value="female" required>
            <label for="female">Female</label>
            <input type="radio" id="male" name="gender" value="male">
            <label for="male">Male</label>
        </div>

        <button type="submit" class="signup-btn">Sign Up</button>
    </form>
</div>

</body>
</html>