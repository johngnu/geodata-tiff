<%-- 
    Document   : errorPage
    Created on : 15-oct-2017, 11:18:35
    Author     : John Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="<c:url value="/admin/img/favicon.ico"/>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap core CSS     -->
        <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel="stylesheet" />
        <title>Error</title>
        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/admin/css/pe-icon-7-stroke.css"/>" rel="stylesheet" />
        <style type="text/css">
            body.errorfour {
                background-color: #ff3333;
                padding: 0;
                text-align: center;
            }

            body.errorfour .errorfour-container {
                max-width: 400px;
                width: 400px;
                text-align: center;
                color: white;
                position: absolute;
                top: 50%;
                left: 50%;
                margin: -200px 0 0 -200px;
            }
            body.errorfour .errorfour-container h1 {
                font-size: 200px;
                font-weight: 100;
                text-shadow: #cc0033 1px 1px, #cc0033 2px 2px, #cc0033 3px 3px
            }
            body.errorfour .errorfour-container h2 {
                font-size: 32px;
                font-weight: 200;
                margin-bottom: 40px; 
            }
            body.errorfour .errorfour-container a.btn {
                border-color: white;
                color: white;
            }
            body.errorfour .errorfour-container a.btn:hover {
                color: #007aff;
                background-color: white; 
            }
        </style>
    </head>
    <body class="errorfour">
        <!-- Error Screen -->
        <div class="errorfour-container">
            <h1>
                Error
            </h1>
            <h2>
                Se produjo un error en el sistema. Esta incidencia fue registrada para su revisión técnica.
            </h2>
            <p style="text-align: justify"><b>${errorMessage}</b></p>
            <a class="btn btn-lg btn-default-outline" href="" onclick="history.back()"><i class="icon-home"></i>Volver</a>
        </div>
        <!-- End Error Screen -->
    </body>
</html>
