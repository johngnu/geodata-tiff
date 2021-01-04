<%-- 
    Document   : dbForm
    Created on : Oct 25, 2017, 6:07:39 PM
    Author     : John Castillo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="<c:url value="/admin/img/favicon.ico"/>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Consola de administración</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <!-- Bootstrap core CSS     -->
        <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/assets/css/fileinput.min.css"/>" rel="stylesheet"/>

        <!-- Animation library for notifications   -->
        <link href="<c:url value="/admin/css/animate.min.css"/>" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="<c:url value="/admin/css/light-bootstrap-dashboard.css"/>" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="<c:url value="/admin/css/demo.css"/>" rel="stylesheet" />

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/admin/css/pe-icon-7-stroke.css"/>" rel="stylesheet" />
    </head>

    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="red" data-image="<c:url value="/admin/img/sidebar-4.jpg"/>">
                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="<c:url value="/admin"/>" class="simple-text">
                            Admin
                        </a>
                    </div>
                    <ul class="nav">
                        <li>
                            <a href="<c:url value="/admin"/>">
                                <i class="pe-7s-server"></i>
                                <p>Bases de Datos</p>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<c:url value="/admin/dbform"/>">
                                <i class="pe-7s-note2"></i>
                                <p>Crear nuevo</p>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/variables"/>">
                                <i class="pe-7s-settings"></i>
                                <p>Variables</p>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/parametros"/>">
                                <i class="pe-7s-tools"></i>
                                <p>Parametros</p>
                            </a>
                        </li>

                        <li class="active-pro">
                            <a href="<c:url value="/"/>">
                                <i class="pe-7s-graph3"></i>
                                <p>Ver Geovisor</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Crear nuevo</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-dashboard"></i>
                                    </a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="">
                                        Cuenta
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/logout"/>">
                                        Salir
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Nueva Base de Datos</h4>
                                    </div>
                                    <div class="content">
                                        <form action="<c:url value="/admin/savebasedato"/>" method="post">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Nombre</label>
                                                        <input name="nombre" type="number" class="form-control" placeholder="Año de la base" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Etiqueta</label>
                                                        <input name="etiqueta" type="text" class="form-control" placeholder="Ej: Gestión 2020">
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-success btn-fill pull-right">Guardar</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="<c:url value="/"/>">
                                        Inicio
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Geodata
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <p class="copyright pull-right">
                            &copy;
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="#" target="_blank">Geodata Platform</a>
                        </p>
                    </div>
                </footer>
            </div>
        </div>

    </body>
    <!-- Core JS Files   -->
    <script src="<c:url value="/admin/js/jquery-1.10.2.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/admin/js/bootstrap.min.js"/>" type="text/javascript"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="<c:url value="/admin/js/light-bootstrap-dashboard.js"/>"></script>
    <script src="<c:url value="/assets/js/fileinput.min.js"/>"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="<c:url value="/admin/js/demo.js"/>"></script>

</html>
