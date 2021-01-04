<%-- 
    Document   : index
    Created on : Oct 25, 2017, 6:07:39 PM
    Author     : John Castillo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/assets/img/apple-icon.png"/>" />
        <link rel="icon" type="image/png" href="<c:url value="/assets/img/favicon.png"/>"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Geographic Portal Platform">
        <meta name="author" content="john Castillo Valecia">
        <title>Geodata</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value="/css/landing-page.css"/>" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
            <div class="container topnav">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand topnav" href="">Geodata Platform</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">Inicio</a>
                        </li>
                        <li>
                            <a href="#">GeoVisor</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Header -->
        <a name="about"></a>
        <div class="intro-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-message">
                            <h1>Geodata Platform</h1>
                            <h3>Custom Layer Collection Admin for INE</h3>
                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <li>
                                    <a href="<c:url value="/admin"/>" class="btn btn-default btn-lg"><span class="network-name">Entrar</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /.intro-header -->

        <!-- Page Content -->
        <a name="services"></a>
        <div class="content-section-a">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Geodata Platform</h2>
                        <p class="lead"></p>
                        <ul class="lead">
                            <li>							
                                Administra la información geográfica del sistema
                            </li>
                            <li>							
                                Gestiona las capas que serán usadas en el geovisor o portal geográfico.
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                        <div class="recuadro">
                            <img class="img-responsive" src="img/desktop.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container -->

        </div>
        <!-- /.content-section-a -->

        <div class="content-section-b">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Features</h2>
                        <p class="lead">
                            Este software cuenta con diferentes funcionalidades y características como ser:
                        <ul>
                            <li>Carga personalizada de archivos raster.</li>
                            <li>Automatización de los procesos de publicación de mapas personalizado.</li>
                            <li>Free and Open Source.</li>
                        </ul>
                        </p>	
                    </div>
                    <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                        <img class="img-responsive" src="img/geovisor.jpg" alt="">
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /.content-section-b -->

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-inline">                        
                            <li>
                                <a href="#">Inicio</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="#">GeoVisor</a>
                            </li>
                        </ul>
                        <p class="copyright text-muted small">Copyright &copy; Geodata. All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="<c:url value="/js/jquery.js"/>"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value="/js/bootstrap.min.js"/>"></script>	
    </body>
</html>

