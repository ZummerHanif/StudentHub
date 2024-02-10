<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>

   
    <style>
    .Signup-form {
    width: 300px;
    margin: 0 auto;
    padding: 30px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 5px;
}

.form-label {
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
}

.form-input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.form-submit {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.form-submit:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
    
</body>
</html>
<form action="SignUp" method="post" class="Signup-form" name="Signup" >
    

    <label  class ="form-label" for="username">Username:</label>
    <input class ="form-input" type="text" id="username" name="username" placeholder="Username" required>
    <br>
    <label class ="form-label" for="email">Email:</label>
    <input class ="form-input" type="email" id="email" name="email"  placeholder="Email" required>
    <br>
    <label class ="form-label" for="password">Password:</label>
    <input  class ="form-input" type="password" id="password" name="password" value=""  placeholder="Password" required>
    <br>
    <label class="form-label" for="confirmPassword">Confirm Password:</label>
   <input  class ="form-input" type="password" id="confirmPassword" name="confirmPassword"  placeholder="Confirm Password"required>
   <br>
    <label class ="form-label" for="rollno">Enter RollNo:</label>
    <input class ="form-input" type="text" id="rollno" name="rollno"  placeholder="Complete Roll no" required>
    <br>
    <label class ="form-label" for="phoneno">Enter Phonenumber:</label>
    <input class ="form-input" type="text" id="phoneno" name="phoneno"  placeholder="Phone number" required>
    <br>
     
    <button  class ="form-submit" type="submit" value="SignUp">SignUp </button>
</form>



</html>