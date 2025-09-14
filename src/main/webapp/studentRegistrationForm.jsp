<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center p-4">

<div class="w-full max-w-5xl bg-white p-6 md:p-10 rounded-lg shadow-lg border-t-8 border-cyan-500">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-8">Student Registration Form</h1>

    <form action="studentRegistrationForm" method="POST">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mb-6">
            <div>
                <label for="first-name" class="block text-sm font-medium text-gray-700">First Name</label>
                <input type="text" id="first-name" name="firstName" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="last-name" class="block text-sm font-medium text-gray-700">Last Name</label>
                <input type="text" id="last-name" name="lastName" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="dob" class="block text-sm font-medium text-gray-700">Date of Birth</label>
                <input type="date" id="dob" name="dateOfBirth" placeholder="dd/mm/yyyy" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="email" name="email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile</label>
                <input type="tel" id="mobile" name="mobile" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Gender</label>
                <div class="mt-2 flex items-center space-x-6">
                    <label class="inline-flex items-center">
                        <input type="radio" name="gender" value="male" class="form-radio text-cyan-600">
                        <span class="ml-2">Male</span>
                    </label>
                    <label class="inline-flex items-center">
                        <input type="radio" name="gender" value="female" class="form-radio text-cyan-600">
                        <span class="ml-2">Female</span>
                    </label>
                </div>
            </div>
        </div>

        <div class="mb-6">
            <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
            <textarea id="address" name="address" rows="3" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500"></textarea>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mb-6">
            <div>
                <label for="city" class="block text-sm font-medium text-gray-700">City</label>
                <input type="text" id="city" name="city" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="pin-code" class="block text-sm font-medium text-gray-700">Pin Code</label>
                <input type="text" id="pin-code" name="pinCode" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="state" class="block text-sm font-medium text-gray-700">State</label>
                <input type="text" id="state" name="state" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
            <div>
                <label for="country" class="block text-sm font-medium text-gray-700">Country</label>
                <input type="text" id="country" name="country" value="India" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm bg-gray-50 focus:outline-none focus:ring-cyan-500 focus:border-cyan-500">
            </div>
        </div>

        <div class="mb-6">
            <label class="block text-sm font-medium text-gray-700">Hobbies</label>
            <div class="mt-2 flex flex-wrap items-center gap-x-6 gap-y-2">
                <label class="inline-flex items-center">
                    <input type="checkbox" name="hobbies" value="drawing" class="form-checkbox text-cyan-600 rounded">
                    <span class="ml-2">Drawing</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="hobbies" value="singing" class="form-checkbox text-cyan-600 rounded">
                    <span class="ml-2">Singing</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="hobbies" value="dancing" class="form-checkbox text-cyan-600 rounded">
                    <span class="ml-2">Dancing</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="hobbies" value="sketching" class="form-checkbox text-cyan-600 rounded">
                    <span class="ml-2">Sketching</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="hobbies" value="others" class="form-checkbox text-cyan-600 rounded">
                    <span class="ml-2">Others</span>
                </label>
            </div>
        </div>

        <div class="mb-6">
            <label class="block text-sm font-medium text-gray-700 mb-2">Qualification</label>
            <div class="overflow-x-auto">
                <table class="min-w-full border-collapse border border-gray-300">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-2 border border-gray-300 text-left text-sm font-medium text-gray-600">Sl.No</th>
                        <th class="px-4 py-2 border border-gray-300 text-left text-sm font-medium text-gray-600">Examination</th>
                        <th class="px-4 py-2 border border-gray-300 text-left text-sm font-medium text-gray-600">Board</th>
                        <th class="px-4 py-2 border border-gray-300 text-left text-sm font-medium text-gray-600">Percentage</th>
                        <th class="px-4 py-2 border border-gray-300 text-left text-sm font-medium text-gray-600">Year of Passing</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="px-4 py-1 border border-gray-300 text-center">1</td>
                        <td class="px-4 py-1 border border-gray-300">Class X</td>
                        <td class="border border-gray-300"><input type="text" name="boardX" class="w-full border-none p-2 focus:ring-0"></td>
                        <td class="border border-gray-300"><input type="text" name="percentageX" class="w-full border-none p-2 focus:ring-0"></td>
                        <td class="border border-gray-300"><input type="text" name="yearX" class="w-full border-none p-2 focus:ring-0"></td>
                    </tr>
                    <tr>
                        <td class="px-4 py-1 border border-gray-300 text-center">2</td>
                        <td class="px-4 py-1 border border-gray-300">Class XII</td>
                        <td class="border border-gray-300"><input type="text" name="boardXII" class="w-full border-none p-2 focus:ring-0"></td>
                        <td class="border border-gray-300"><input type="text" name="percentageXII" class="w-full border-none p-2 focus:ring-0"></td>
                        <td class="border border-gray-300"><input type="text" name="yearXII" class="w-full border-none p-2 focus:ring-0"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mb-8">
            <label class="block text-sm font-medium text-gray-700">Course applies for</label>
            <div class="mt-2 flex flex-wrap items-center gap-x-6 gap-y-2">
                <label class="inline-flex items-center">
                    <input type="radio" name="course" value="bca" class="form-radio text-cyan-600">
                    <span class="ml-2">BCA</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="radio" name="course" value="bcom" class="form-radio text-cyan-600">
                    <span class="ml-2">B.Com</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="radio" name="course" value="bsc" class="form-radio text-cyan-600">
                    <span class="ml-2">B.Sc</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="radio" name="course" value="ba" class="form-radio text-cyan-600">
                    <span class="ml-2">B.A</span>
                </label>
            </div>
        </div>

        <div class="flex justify-center space-x-4">
            <button type="submit" class="px-10 py-2 bg-blue-600 text-white font-semibold rounded-md shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors">
                Submit
            </button>
            <button type="reset" class="px-10 py-2 bg-gray-600 text-white font-semibold rounded-md shadow-sm hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 transition-colors">
                Reset
            </button>
        </div>
    </form>
</div>

</body>
</html>