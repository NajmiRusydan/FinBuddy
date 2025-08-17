<html>
<head>
    <title>Create an account</title>
    <link rel="stylesheet" href="CreateAccStyle.css">
</head>
<body>
    <div class="createAcc">
        <form action="create_accHandler.php" method="post">
            <fieldset>
                <legend> Account Details </legend>
                <label for="fullname">Full Name:</label>
                <input type="text" name="txtFullName" required><br>

                <label for="email">E-mail:</label>
                <input type="email" name="txtEmail" required><br>

                <label for="phone">Phone Number:</label>
                <input type="tel" name="txtPhone" id="phone" required
                    pattern="01[0-46-9]-?[0-9]{7,8}"
                    maxlength="11"
                    placeholder="e.g. 0123456789"
                    title="Enter a valid Malaysian phone number, e.g. 0123456789"><br>

                <label for="username">Username:</label>
                <input type="text" name="txtUser" required><br>

                <label for="txtPass">Password:</label>
                <input type="password" name="txtPass" id="txtPass" required>
                <div class="password-options">
                    <div class="show-password-row">
                        <input type="checkbox" id="showPassword">
                        <label for="showPassword">Show Password</label>
                        <span id="strengthMessage"></span>
                    </div>
                </div>
            </fieldset>

            <fieldset>
                <legend>Bank Details</legend>
                <div id="bankInput">
                    <label for="bank">Bank:</label>
                    <select name="bank[]" required>
                        <option value="">-- Select Bank --</option>
                        <option value="Maybank">Maybank</option>
                        <option value="CIMB">CIMB</option>
                        <option value="Public Bank">Public Bank</option>
                        <option value="RHB">RHB</option>
                        <option value="Hong Leong Bank">Hong Leong Bank</option>
                        <option value="AmBank">AmBank</option>
                        <option value="Bank Islam">Bank Islam</option>
                        <option value="Bank Rakyat">Bank Rakyat</option>
                        <option value="Affin Bank">Affin Bank</option>
                        <option value="Alliance Bank">Alliance Bank</option>
                        <option value="UOB">UOB</option>
                        <option value="HSBC">HSBC</option>
                        <option value="OCBC">OCBC</option>
                        <option value="Standard Chartered">Standard Chartered</option>
                        <option value="Agrobank">Agrobank</option>
                        <option value="Bank Muamalat">Bank Muamalat</option>
                        <option value="Bank Simpanan Nasional">Bank Simpanan Nasional</option>
                        <option value="Citibank">Citibank</option>
                        <option value="Al Rajhi Bank">Al Rajhi Bank</option>
                        <option value="Kuwait Finance House">Kuwait Finance House</option>
                    </select>
                    <label for="balance">Balance:</label>
                    <input type="number" name="bank_bal[]" required>
                    <button type="button" onclick="addBankInput()">+ Add Another Bank</button>
                </div>
            </fieldset>
            <input type="submit" value="Create">
            <a href='login.php'> Cancel </a>
        </form>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('txtPass');
            const showPasswordCheckbox = document.getElementById('showPassword');
            if (showPasswordCheckbox && passwordInput) {
                showPasswordCheckbox.addEventListener('change', function() {
                    passwordInput.type = this.checked ? 'text' : 'password';
                });
            }
            const strengthMessage = document.getElementById('strengthMessage');
            if (passwordInput && strengthMessage) {
                passwordInput.addEventListener("input", function () {
                    const password = this.value;
                    let strength = 0;
                    if (password.length >= 8) strength++;
                    if (/[A-Z]/.test(password)) strength++;
                    if (/[a-z]/.test(password)) strength++;
                    if (/[0-9]/.test(password)) strength++;
                    if (/[^A-Za-z0-9]/.test(password)) strength++;
                    const levels = ["Very Weak", "Weak", "Medium", "Strong", "Very Strong"];
                    const colors = ["#ff4d4d", "#ff944d", "#ffcc00", "#99cc00", "#33cc33"];
                    strengthMessage.textContent = levels[strength];
                    strengthMessage.style.color = colors[strength];
                });
            }
        });
        function addBankInput() {
            const container = document.getElementById("bankInput");
            const newGroup = document.createElement("div");
            newGroup.classList.add("bank-group");
            newGroup.style.marginTop = "20px";
            newGroup.innerHTML = `
                <label>Bank:</label>
                <select name="bank[]" required>
                    <option value="">-- Select Bank --</option>
                    <option value="Maybank">Maybank</option>
                    <option value="CIMB">CIMB</option>
                    <option value="Public Bank">Public Bank</option>
                    <option value="RHB">RHB</option>
                    <option value="Hong Leong Bank">Hong Leong Bank</option>
                    <option value="AmBank">AmBank</option>
                    <option value="Bank Islam">Bank Islam</option>
                    <option value="Bank Rakyat">Bank Rakyat</option>
                    <option value="Affin Bank">Affin Bank</option>
                    <option value="Alliance Bank">Alliance Bank</option>
                    <option value="UOB">UOB</option>
                    <option value="HSBC">HSBC</option>
                    <option value="OCBC">OCBC</option>
                    <option value="Standard Chartered">Standard Chartered</option>
                    <option value="Agrobank">Agrobank</option>
                    <option value="Bank Muamalat">Bank Muamalat</option>
                    <option value="Bank Simpanan Nasional">Bank Simpanan Nasional</option>
                    <option value="Citibank">Citibank</option>
                    <option value="Al Rajhi Bank">Al Rajhi Bank</option>
                    <option value="Kuwait Finance House">Kuwait Finance House</option>
                </select>
                <label>Balance:</label>
                <input type="number" name="bank_bal[]" required>
                <button type="button" onclick="addBankInput()">+ Add Another Bank</button>
                <button type="button" class="removeBtn" onclick="removeBankInput(this)">Remove</button>
            `;
            container.appendChild(newGroup);
        }
        function removeBankInput(button) {
            const bankGroup = button.parentElement;
            bankGroup.remove();
        }
    </script>
</body>
</html>