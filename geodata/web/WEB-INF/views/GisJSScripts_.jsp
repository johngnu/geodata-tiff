<%-- 
    Document   : GisJS 3 Scripts View
    Created on : 17-01-2017, 02:30:51 PM
    Author     : Johns Castillo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!-- GIS UI libraries 2015 --> 
<!--<link rel="stylesheet" href="/openlayers-2.12/theme/default/style.css" type="text/css">-->
<script src="/openlayers-2.12/OpenLayers.js"></script>
<script type="text/javascript">
    Ext = new Object();
</script>    
<script type="text/javascript" src="<c:url value="/layers/geoserverlocation"/>"></script>
<script type="text/javascript">
    /**
     * Principal GIS Server params config
     * Santa FE, 2017
     */
    Ext.geoProjection = "EPSG:4326";

    Ext.geoBounds = new OpenLayers.Bounds(
            -8128496.9907945, -2675785.1418022,
            -5675174.1312949, -1208194.1989312
            );
    Ext.geoOptions = {
        maxExtent: Ext.geoBounds,
        maxResolution: 2445.9849047851562,
        displayProjection: new OpenLayers.Projection("EPSG:4326"),
        units: 'm'
    };

    Ext.localProxy = '/http_proxy/proxy?url=';

    var domain = new Object();
    domain.objects = {
        proxy: Ext.localProxy,
        geoserverUrl: Ext.geoserverUrl,
        options: Ext.geoOptions,
        projection: Ext.geoProjection,
        featureFromText: function (the_geom, attrs) {
            var feature = new OpenLayers.Feature.Vector(OpenLayers.Geometry.fromWKT(the_geom));
            return feature;
        },
        selectFeature: function (map, feature, zoomto) {
            var geographic = new OpenLayers.Projection("EPSG:4326");
            var mercator = new OpenLayers.Projection("EPSG:900913");
            feature.geometry.transform(geographic, mercator);
            this.objectselected.removeAllFeatures();
            this.objectselected.addFeatures([feature]);
            if (zoomto) {
                map.zoomToExtent(feature.geometry.getBounds());
            }
        }
    };
</script> 