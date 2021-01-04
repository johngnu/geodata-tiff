<%-- 
    Document   : baseDetail
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
        <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel="stylesheet" />
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
                        <li class="active">
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
                            <a class="navbar-brand" href="#">Bases de Datos</a>
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
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Bases de Datos / [${base.nombre}] ${base.etiqueta}</h4>
                                        <p class="category">ID ${base.base_id}</p>
                                    </div>
                                    <div class="content">
                                        <button class="btn btn-info btn-fill" data-toggle="modal" data-target="#update_base">Editar</button>
                                        <button data-href="<c:url value="/admin/basedato/deletebase"/>?id=${base.base_id}" class="btn btn-danger btn-fill" data-toggle="modal" data-target="#confirm-delete">Eliminar</button>                                        
                                        <button class="btn btn-success btn-fill" data-toggle="modal" data-target="#upload_geotiff">Cargar</button>
                                        <a href="<c:url value="/admin"/>" class="btn btn-success btn-fill pull-right">Salir</a>
                                        
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">            
                        <c:forEach var="v" items="${vars}">
                        
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">${v.nombre}</h4>
                                        <p class="category">
                                            Cargar una capa desde GeoTIFF.
                                        </p>
                                        
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>#</th>
                                            <th>Mes</th>
                                            <th>Mensaje</th>
                                            <th class="td-actions text-right"></th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${v.meses}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td>${c.mes}</td>  
                                                        <td class="text-warning">
                                                            ${c.layer.message}
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <c:if test="${c.layer.state}">
                                                                <a href="#" rel="tooltip" title="Ver layer" class="btn btn-primary btn-simple btn-xs">
                                                                    <i class="fa fa-paper-plane"></i>
                                                                </a>
                                                            </c:if>
                                                            <a href="#" data-href="<c:url value="/admin/basedato/deletelayer"/>?base=${base.base_id}&id=${c.clima_id}&key=clima" rel="tooltip" title="Eliminar" class="btn btn-gray btn-simple btn-xs" data-toggle="modal" data-target="#confirm-delete">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                        </c:forEach>            
                        </div>             
                                    
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">ShapeFile Reporte</h4>
                                        <p class="category">
                                            Contiene la codificación y geografía de las cuencas (ShapeFile).
                                        </p>
                                    </div>
                                    <div class="content">
                                        <c:if test="${empty brep}">
                                            <button class="btn btn-info btn-fill btn-block" data-toggle="modal" data-target="#upload_shaper">Subir ShapeFile</button>
                                        </c:if>  
                                        <c:if test="${empty arep && !empty brep}">
                                            <button data-href="<c:url value="/admin/basedato/deletesource"/>?base=${base.base_dato_id}&id=${brep.base_reporte_id}&key=reporte" class="btn btn-danger btn-fill btn-block" data-toggle="modal" data-target="#confirm-delete">Eliminar</button>
                                            <c:if test="${brep.state}">
                                                ${brep.message}
                                            </c:if>
                                            <c:if test="${!brep.state}">
                                                <div class="alert alert-warning">
                                                    <span><b> Warning - </b> Proceso pendiente.</span>
                                                </div>
                                            </c:if>
                                        </c:if>  
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">ShapeFile Calibración</h4>
                                        <p class="category">
                                            Contiene la codificación y geografía de las cuencas (ShapeFile).
                                        </p>
                                    </div>
                                    <div class="content">
                                        <c:if test="${empty bcal}">
                                            <button class="btn btn-info btn-fill btn-block" data-toggle="modal" data-target="#upload_shapec">Subir ShapeFile</button>
                                        </c:if>  
                                        <c:if test="${empty acal && !empty bcal}">
                                            <button data-href="<c:url value="/admin/basedato/deletesource"/>?base=${base.base_dato_id}&id=${bcal.base_calibracion_id}&key=calibracion" class="btn btn-danger btn-fill btn-block" data-toggle="modal" data-target="#confirm-delete">Eliminar</button>
                                            <c:if test="${bcal.state}">
                                                ${bcal.message}
                                            </c:if>
                                            <c:if test="${!bcal.state}">
                                                <div class="alert alert-warning">
                                                    <span><b> Warning - </b> Proceso pendiente.</span>
                                                </div>
                                            </c:if>
                                        </c:if>  
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Data Reporte</h4>
                                        <p class="category">

                                        </p>
                                        <c:if test="${!empty brep}">
                                            <c:if test="${brep.state}">
                                                <button class="btn btn-default btn-fill btn-block" data-toggle="modal" data-target="#upload_csvr">Cargar CSV</button>
                                            </c:if>
                                        </c:if>    
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>#</th>
                                            <th>Variable</th>
                                            <th>Unidad</th>
                                            <th>Mensaje</th>
                                            <th class="td-actions text-right"></th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${arep}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td>${c.nombre}</td>
                                                        <td>${c.unidad}</td>                                                        
                                                        <td>${c.message}</td>
                                                        <td class="td-actions text-right">                                                            
                                                            <a href="#" rel="tooltip" title="Datos" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="fa fa-edit"></i>
                                                            </a>
                                                            <a href="#" data-href="<c:url value="/admin/basedato/deletedata"/>?base=${base.base_dato_id}&id=${c.archivo_reporte_id}&key=reporte" rel="tooltip" title="Eliminar" class="btn btn-gray btn-simple btn-xs" data-toggle="modal" data-target="#confirm-delete">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Data Calibración</h4>
                                        <p class="category">

                                        </p>
                                        <c:if test="${!empty bcal}">
                                            <c:if test="${bcal.state}">
                                                <button class="btn btn-default btn-fill btn-block" data-toggle="modal" data-target="#upload_csvc">Cargar CSV</button>
                                            </c:if>                                            
                                        </c:if>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Unidad</th>
                                            <th>Mensaje</th>
                                            <th class="td-actions text-right">Opción</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${acal}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td>${c.nombre}</td>
                                                        <td>${c.unidad}</td> 
                                                        <td>${c.message}</td>
                                                        <td class="td-actions text-right">
                                                            <a href="#" rel="tooltip" title="Datos" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="fa fa-edit"></i>
                                                            </a>
                                                            <a href="#" data-href="<c:url value="/admin/basedato/deletedata"/>?base=${base.base_dato_id}&id=${c.archivo_calibracion_id}&key=calibracion" rel="tooltip" title="Eliminar" class="btn btn-gray btn-simple btn-xs" data-toggle="modal" data-target="#confirm-delete">
                                                                <i class="fa fa-times"></i>
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

                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Capas de clima (GeoTIFF)</h4>
                                        <p class="category">
                                            Cargar una capa desde GeoTIFF o registrar una capa existente.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button class="btn btn-info btn-fill btn-block" data-toggle="modal" data-target="#upload_geotiff">Cargar</button>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="btn btn-default btn-fill btn-block" data-toggle="modal" data-target="#register_geotiff">Registrar</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>#</th>
                                            <th>Variable</th>
                                            <th>URL</th>
                                            <th>Mensaje</th>
                                            <th class="td-actions text-right"></th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${acli}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td>${c.nombre}</td>  
                                                        <td>${c.url}</td>
                                                        <td class="text-warning">${c.message}</td>
                                                        <td class="td-actions text-right">
                                                            <c:if test="${c.state}">
                                                                <a href="#" rel="tooltip" title="Ver layer" class="btn btn-primary btn-simple btn-xs">
                                                                    <i class="fa fa-paper-plane"></i>
                                                                </a>
                                                            </c:if>
                                                            <a href="#" data-href="<c:url value="/admin/basedato/deletelayer"/>?base=${base.base_dato_id}&id=${c.clima_id}&key=clima" rel="tooltip" title="Eliminar" class="btn btn-gray btn-simple btn-xs" data-toggle="modal" data-target="#confirm-delete">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Capas adicionales (ShapeFile)</h4>
                                        <p class="category">
                                            Cargar una capa desde ShapeFile o registrar una capa existente.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button class="btn btn-info btn-fill btn-block" data-toggle="modal" data-target="#upload_shp">Cargar</button>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="btn btn-default btn-fill btn-block" data-toggle="modal" data-target="#register_shp">Registrar</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>URL</th>
                                            <th>Tipo objeto</th>
                                            <th>Mensaje</th>
                                            <th class="td-actions text-right">Opción</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${ashp}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td>${c.nombre}</td>
                                                        <td>${c.url}</td>
                                                        <td>${c.estilo}</td>
                                                        <td class="text-warning">${c.message}</td>
                                                        <td class="td-actions text-right">
                                                            <c:if test="${c.state}">
                                                                <a href="#" rel="tooltip" title="Ver layer" class="btn btn-primary btn-simple btn-xs">
                                                                    <i class="fa fa-paper-plane"></i>
                                                                </a>
                                                            </c:if>
                                                            <a href="#" data-href="<c:url value="/admin/basedato/deletelayer"/>?base=${base.base_dato_id}&id=${c.capa_adicional_id}&key=capa_adicional" rel="tooltip" title="Eliminar" class="btn btn-gray btn-simple btn-xs" data-toggle="modal" data-target="#confirm-delete">
                                                                <i class="fa fa-times"></i>
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

        <!-- GeoTiff -->                    
        <div class="modal fade" id="upload_geotiff" role="dialog" aria-labelledby="upload_geotiff" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">GeoTIFF</h4>
                    </div>
                    <form action="<c:url value="/admin/cargararchivo"/>" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Variable</label>
                                            <select name="var" class="form-control">
                                                <c:forEach var="v" items="${vars}">
                                                    <option value="${v.variable_id}">${v.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Meses</label>
                                            <select name="mes" class="form-control">
                                                <c:forEach var="v" items="${meses}">
                                                    <option value="${v.mes_id}">${v.code} - ${v.mes}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input name="file" type="file" class="file" data-show-preview="false">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="${base.base_id}">                            
                            <button type="submit" class="btn btn-success btn-fill">Subir</button>
                            <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>  

        <div class="modal fade" id="register_geotiff" role="dialog" aria-labelledby="register_geotiff" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Registrar</h4>
                    </div>
                    <form action="<c:url value="/admin/registerlayer"/>" method="post">
                        <div class="modal-body">
                            <div class="content">
                                <div class="alert alert-warning">
                                    <span><b>Aviso - </b> Solo capas del Geoserver principal pueden ser registradas en esta seccion.</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Variable</label>
                                            <select name="var" class="form-control">
                                                <c:forEach var="v" items="${varcli}">
                                                    <option value="${v.variable_clima_id}">${v.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Layer</label>
                                            <input name="layer" type="text" class="form-control" placeholder="workspace:layers">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="${base.base_dato_id}">
                            <input type="hidden" name="type" value="tiff">
                            <button type="submit" class="btn btn-success btn-fill">Guardar</button>
                            <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>   

        <!-- Capas adicionales -->                    
        <div class="modal fade" id="upload_shp" role="dialog" aria-labelledby="upload_shp" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">ShapeFile</h4>
                    </div>
                    <form action="<c:url value="/admin/cargararchivo"/>" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input name="name" type="text" class="form-control" placeholder="Nombre de capa">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Tipo objeto (Style)</label>
                                            <select name="style" class="form-control">
                                                <option value="polygon">Polígono</option>
                                                <option value="point">Punto</option>
                                                <option value="line">Linea</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input name="file" type="file" class="file" data-show-preview="false">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="${base.base_dato_id}">
                            <input type="hidden" name="key" value="shape">
                            <input type="hidden" name="type" value="shape">
                            <button type="submit" class="btn btn-success btn-fill">Subir</button>
                            <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 

        <div class="modal fade" id="register_shp" role="dialog" aria-labelledby="register_shp" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Registrar</h4>
                    </div>
                    <form action="<c:url value="/admin/registerlayer"/>" method="post">
                        <div class="modal-body">
                            <div class="content">
                                <div class="alert alert-warning">
                                    <span><b>Aviso - </b> Solo capas del Geoserver principal pueden ser registradas en esta seccion.</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input name="name" type="text" class="form-control" placeholder="Nombre de capa">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Layer</label>
                                            <input name="layer" type="text" class="form-control" placeholder="workspace:layers">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="${base.base_dato_id}">
                            <input type="hidden" name="type" value="shape">
                            <button type="submit" class="btn btn-success btn-fill">Guardar</button>
                            <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>                     

        <!-- Edit database details -->                    
        <div class="modal fade" id="update_base" role="dialog" aria-labelledby="update_base" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Editar</h4>
                    </div>
                    <form action="<c:url value="/admin/updatebase"/>" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input value="${base.nombre}" name="nombre" type="number" class="form-control" placeholder="Nombre de la base">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Etiqueta</label>
                                            <input value="${base.etiqueta}" name="etiqueta" type="text" class="form-control" placeholder="Etiqueta del geovisor">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="${base.base_id}">
                            <button type="submit" class="btn btn-success btn-fill">Guardar</button>
                            <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>     

        <!-- Delete dialogs -->
        <div class="modal fade" id="confirm-delete" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Confirmar Eliminar</h4>
                    </div>
                    <div class="modal-body">
                        <p>¿Confirma eliminar este elemnto?.</p>
                        <p class="debug-url"></p>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger btn-fill btn-ok">Eliminar</a>
                        <button type="button" class="btn btn-default btn-fill" data-dismiss="modal">Cancelar</button>                        
                    </div>
                </div>
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
    <script src="<c:url value="/admin/js/demo.js"/>">
    </script>
    <script type="text/javascript">
        $('#confirm-delete').on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            //$('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
        });
    </script>
</html>
