<%@page errorPage="error_page.jsp" %>
<form action="loginServlet" method="post">
    <!-- Email input -->
    <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Email address</label>
        <input name="user_email" required type="email" id="form2Example1" class="form-control border border-danger" />

    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
        <label class="form-label" for="form2Example2">Password</label>
        <input name="user_password" required type="password" id="form2Example2" class="form-control border border-danger" />

    </div>

    <!-- 2 column grid layout for inline styling -->
    <div class="row mb-4">
        <div class="col d-flex offset-1 ">
            <!-- Checkbox -->
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                <label class="form-check-label" for="form2Example31"> Remember me </label>
            </div>
        </div>

        <div class="col">
            <!-- Simple link -->
            <a href="forgot_password.jsp">Forgot password?</a>
        </div>
    </div>

    <!-- Submit button -->
    <div class="d-grid gap-2">
        <button type="submit" class="btn btn-danger btn-block mb-4 r glitch_font_text fs-4">Sign in</button>
    </div>


    <!-- Register buttons -->
    <div class="text-center">
        <p>Not a member? <a href="register_page.jsp">Register</a></p>
        <p>or sign up with:</p>
        
        
        <button type="button" class="btn btn-link btn-floating mx-1 text-danger">
            <i class="fab fa-facebook-f"></i>
        </button>

        <button type="button" class="btn btn-link btn-floating mx-1 text-danger">
            <i class="fab fa-google"></i>
        </button>

        <button type="button" class="btn btn-link btn-floating mx-1 text-danger">
            <i class="fab fa-twitter"></i>
        </button>

        <button type="button" class="btn btn-link btn-floating mx-1 text-danger">
            <i class="fab fa-github"></i>
        </button>
        
        <p>An admin? <a href="admin_login.jsp">Log in</a></p>
    </div>
</form>