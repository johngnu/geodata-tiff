<%-- 
    Document   : parametros
    Created on : Oct 25, 2017, 6:07:39 PM
    Author     : John Castillo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="<c:url value="/admin/css/animate.min.css"/>" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="<c:url value="/admin/css/light-bootstrap-dashboard.css"/>" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="<c:url value="/admin/css/demo.css"/>" rel="stylesheet" />

        <!--     Fonts and icons     -->
        <link href="<c:url value="/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
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
                        <li>
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
                        <li class="active">
                            <a href="<c:url value="/admin/parametros"/>">
                                <i class="pe-7s-tools"></i>
                                <p>Patametros</p>
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
                            <a class="navbar-brand" href="#">Parametros</a>
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
                                        <h4 class="title">Parametros</h4>
                                        <p class="category">Variables y valores globales del sistema</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>key</th>
                                            <th>description</th>
                                            <th>value</th>
                                            <th class="td-actions text-right">option</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="var" items="${params}" varStatus="i">
                                                    <tr>
                                                        <td>${var.key}</td>
                                                        <td>${var.description}</td>
                                                        <td>${var.value}</td>
                                                        <td class="td-actions text-right">
                                                            <a data-toggle="modal" href="#edit_param"  data-id="${var.param_id}" class="editparam btn btn-gray btn-simple btn-xs">
                                                                <i class="icon-edit"></i>
                                                                <div class="hidden param-value">${var.value}</div>
                                                                <div class="hidden param-key">${var.key}</div>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
        <div id="edit_param" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Parametro</h4>
                    </div>
                    <form id="form_var_reporte" action="<c:url value="/admin/parametro/persist"/>" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group label-floating">
                                        <label class="control-label">Key</label>
                                        <input name="key" type="text" class="form-control" id="key" disabled="true"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group label-floating">
                                        <label class="control-label">Valor</label>
                                        <input name="value" type="text" class="form-control" id="value"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="param_id" id="param_id" value=""/>
                            <button type="submit" type="button" class="btn btn-info">Guardar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </form>    
                </div>
            </div>
        </div>                                
        <!-- Core JS Files   -->
        <script src="<c:url value="/admin/js/jquery-1.10.2.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/admin/js/bootstrap.min.js"/>" type="text/javascript"></script>

        <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
        <script src="<c:url value="/admin/js/light-bootstrap-dashboard.js"/>"></script>

        <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
        <script src="<c:url value="/admin/js/demo.js"/>">
        </script>
        <script type="text/javascript">
            $(document).on("click", ".editparam", function () {
                var id = $(this).data('id');
                $("#value").val($(this).find('.param-value').html());
                $("#key").val($(this).find('.param-key').html());
                $(".modal-footer #param_id").val(id);
            });
        </script>
    </body>
</html>
