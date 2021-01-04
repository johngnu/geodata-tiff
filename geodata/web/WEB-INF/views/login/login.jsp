<%--
    Document   : login
    Created on : 2015/07/08, 7:54:48
    Author     : Edy Huiza, John Castillo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html id="sitmax" lang="es">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/assets/img/favicon.ico"/>" />
        <link rel="icon" type="image/png" href="<c:url value="/assets/img/favicon.ico"/>"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Login</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <!-- Bootstrap core CSS     -->
        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" />
        <!--  Material Dashboard CSS    -->
        <!--<link href="<c:url value="/assets/css/material-dashboard.css?v=1.2.0"/>" rel="stylesheet" />-->
        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <!--<link href="<c:url value="/assets/css/demo.css"/>" rel="stylesheet" />-->
        <!--     Fonts and icons     -->
        <link href="<c:url value="/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <style>
            body.login2 {
                padding: 30px 0 0;
                background: #eeeeee; }
            body.login2 .login-wrapper {
                max-width: 420px;
                margin: 0 auto;
                text-align: center; }
            body.login2 .login-wrapper img {
                margin: 40px auto; }
            body.login2 .login-wrapper .input-group-addon {
                padding: 8px 0;
                background: #f4f4f4;
                min-width: 48px;
                text-align: center; }
            body.login2 .login-wrapper .input-group-addon i.icon-lock {
                font-size: 18px; }
            body.login2 .login-wrapper input.form-control {
                height: 48px;
                font-size: 15px;
                box-shadow: none; }
            body.login2 .login-wrapper .checkbox {
                margin-bottom: 30px; }
            body.login2 .login-wrapper input[type="submit"] {
                padding: 10px 0 12px;
                margin: 20px 0 30px; }
            body.login2 .login-wrapper input[type="submit"]:hover {
                background: transparent; }
            body.login2 .login-wrapper .social-login {
                margin-bottom: 20px;
                padding-bottom: 25px;
                border-bottom: 1px solid #cccccc; }
            body.login2 .login-wrapper .social-login > .btn {
                width: 49%;
                margin: 0; }
            body.login2 .login-wrapper .social-login .facebook {
                background-color: #335397;
                border-color: #335397; }
            body.login2 .login-wrapper .social-login .facebook:hover {
                background-color: transparent;
                color: #335397; }
            body.login2 .login-wrapper .social-login .twitter {
                background-color: #00c7f7;
                border-color: #00c7f7; }
            body.login2 .login-wrapper .social-login .twitter:hover {
                background-color: transparent;
                color: #00c7f7; }
            </style>
        </head>
        <body class="login2">
        <div class="login-wrapper">
            <a href="#"><img width="200" src="<c:url value="/img/geodata.jpg"/>" /></a>
            <form action="<c:url value="/j_spring_security_check"/>" method="post" id="__login_fomr"> 
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon-user"></i></span><input value="admin" class="form-control"  autocomplete="off" name="j_username" placeholder="Nombre de usuario o email" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon-lock"></i></span><input value="sitmaxadmin" class="form-control" name="j_password" placeholder="Contraseña" type="password">
                    </div>
                </div>

                <div class="text-left">

                </div>

                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Iniciar sesión">
            </form>

            <c:if test="${!empty key}">
                <div class="alert alert-danger">
                    <button class="close" data-dismiss="alert" type="button">&times;</button>Usuario o clave incorrectos.  Intente nuevamente o comuníquese con el administrador del sistema.
                </div>
            </c:if>
            
            <c:if test="${empty key}">
                <div class="alert alert-warning">
                    <button class="close" data-dismiss="alert" type="button">&times;</button>Uso exclusivo del soporte técnico de Geodata.
                </div>
            </c:if>
        </div>
    </body>
    <!--   Core JS Files   -->
    <script src="<c:url value="/assets/js/jquery-3.2.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/js/material.min.js"/>" type="text/javascript"></script>
    <!--  Charts Plugin -->
    <script src="<c:url value="/assets/js/chartist.min.js"/>"></script>
    <!--  Dynamic Elements plugin -->
    <script src="<c:url value="/assets/js/arrive.min.js"/>"></script>
    <!--  PerfectScrollbar Library -->
    <script src="<c:url value="/assets/js/perfect-scrollbar.jquery.min.js"/>"></script>
    <!--  Notifications Plugin    -->
    <script src="<c:url value="/assets/js/bootstrap-notify.js"/>"></script>
    <!-- Material Dashboard javascript methods -->
    <script src="<c:url value="/assets/js/material-dashboard.js?v=1.2.0"/>"></script>
    <!-- Material Dashboard DEMO methods, don't include it in your project! -->
    <script src="<c:url value="/assets/js/demo.js"/>"></script>
    <%@include file="../utils/ImportJqueryValidation.jsp"%>
    <!-- Local scripts code --> 
    <script type="text/javascript">
        $(document).ready(function () {
            $("#__login_fomr").validate({
                rules: {
                    j_username: {
                        required: true
                    },
                    j_password: {
                        required: true
                    }
                }
            });
        });
    </script>  
</html>