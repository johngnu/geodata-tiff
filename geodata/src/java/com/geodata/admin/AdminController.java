/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import com.icg.entityclassutils.EntityResult;
import com.icg.entityclassutils.Restriction;
import com.icg.entityclassutils.SimpleFilter;
import com.geodata.services.IEntityServices;
import it.geosolutions.geoserver.rest.GeoServerRESTPublisher;
import it.geosolutions.geoserver.rest.encoder.GSLayerEncoder;
import it.geosolutions.geoserver.rest.encoder.GSResourceEncoder;
import it.geosolutions.geoserver.rest.encoder.feature.GSFeatureTypeEncoder;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.io.FileDeleteStrategy;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * AdminController
 *
 * @since 18-11-2017
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    private IEntityServices service;
    //root file repository
    private String serverPathSufix = "/geodata/base/";

    @RequestMapping
    public String admin(Model model) {
        model.addAttribute("dbs", service.find("geodata", "base", new String[]{"nombre"}).getListData());
        return "admin/dataBase";
    }

    @RequestMapping(value = "/dbform", method = RequestMethod.GET)
    public String dbForm(Model model) {
        return "admin/dbForm";
    }

    @RequestMapping(value = "/variables", method = RequestMethod.GET)
    public String variables(Model model) {
        try {
            //variables
            model.addAttribute("var", service.find("geodata", "variable", new String[]{"register"}).getListData());
            model.addAttribute("mes", service.find("geodata", "mes", new String[]{"orden"}).getListData());

            return "admin/variables";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/parametros", method = RequestMethod.GET)
    public String parametros(Model model) {
        try {
            // Parametros
            model.addAttribute("params", service.find("logic", "param", new String[]{"param_id"}).getListData());

            return "admin/parametros";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/parametro/persist", method = POST)
    public String UpdateParam(Model model, @RequestParam Long param_id, String value) {
        try {
            EntityResult param = service.get("logic", "param", param_id);
            Map<String, Object> insertableUpdate = param.getObjectData();
            insertableUpdate.put("value", value);
            service.persist(insertableUpdate, "logic", "param");
            return "redirect:" + "/admin/parametros";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/setparamvalue", method = RequestMethod.POST)
    public String setParamValue(Model model, @RequestParam Long id, @RequestParam String value) {
        try {
            // Parametros
            EntityResult e = service.get("logic", "param", id);
            e.getObjectData().put("value", value);
            service.persist(e.getObjectData(), "logic", "param");

            return "admin/parametros";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/variable/clima/delete", method = POST)
    public String EliminarVariableClima(Model model, HttpServletRequest request, Long variable_id) {
        try {
            service.delete("geodata", "variable", variable_id);
            logger.info("Se ha eliminado la variable de clima: " + variable_id);
            return "redirect:" + "/admin/variables";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/savebasedato", method = RequestMethod.POST)
    public String saveBaseDato(Model model, @RequestParam String nombre, @RequestParam String etiqueta) {
        try {

            Map<String, Object> in = new HashMap<>();
            in.put("nombre", nombre);
            in.put("etiqueta", etiqueta);
            in.put("register", new Date());

            EntityResult er = service.persist(in, "geodata", "base");
            // FileData f = service.createDataBaseDir(base.getAttached(), service.systemParams().get("serverPath") + serverPathSufix, er.getPrimaryKey().toString());

            return "redirect:/admin";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/updatebase", method = RequestMethod.POST)
    public String updateBase(Model model, @RequestParam String nombre, @RequestParam String etiqueta, @RequestParam Long id) {
        try {
            Map<String, Object> in = service.get("geodata", "base", id).getObjectData();

            in.put("nombre", nombre);
            in.put("etiqueta", etiqueta);

            EntityResult er = service.persist(in, "geodata", "base");

            return "redirect:/admin/basedato/" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/basedato/{id}", method = RequestMethod.GET)
    public String baseDato(Model model, @PathVariable Long id) {
        try {
            EntityResult er = service.get("geodata", "base", id);
            model.addAttribute("base", er.getObjectData());

            // variables
            List<Map<String, Object>> variables = service.find("geodata", "variable", new String[]{"register"}).getListData();
            model.addAttribute("vars", variables);
            // meses
            List<Map<String, Object>> meses = service.find("geodata", "mes", new String[]{"orden"}).getListData();
            model.addAttribute("meses", meses);

            SimpleFilter sf = new SimpleFilter();
            sf.addValue("base", id);
            sf.addANDRestriction(new Restriction("base", Restriction.EQUALS));
            List<Map<String, Object>> layers = service.find("geodata", "layer", sf).getListData();
            model.addAttribute("data", layers);

            for (Map<String, Object> var : variables) {
                List<Map<String, Object>> nmeses = new ArrayList<>();
                for (Map<String, Object> mes : meses) {
                    Map<String, Object> nmes = new HashMap<>();
                    nmes.putAll(mes);
                    for (Map<String, Object> layer : layers) {
                        if (layer.get("variable").equals(var.get("variable_id")) && layer.get("mes").equals(mes.get("mes_id"))) {
                            nmes.put("layer", layer);
                        }
                    }
                    nmeses.add(nmes);
                }
                var.put("meses", nmeses);
            }
            //get reporte base file
            /*EntityResult br = service.selectQueryForName("getbasereporte", id);
            model.addAttribute("brep", br.getObjectData());
            //get calibracion base file
            EntityResult bc = service.selectQueryForName("getbasecalibracion", id);
            model.addAttribute("bcal", bc.getObjectData());

            //variables
            model.addAttribute("varcli", service.find("bh", "variable_clima", new String[]{"orden"}).getListData());
            model.addAttribute("varcal", service.find("bh", "variable_calibracion", new String[]{"orden"}).getListData());
            model.addAttribute("varrep", service.find("bh", "variable_reporte", new String[]{"orden"}).getListData());

            //get reporte files
            EntityResult ar = service.selectQueryForName("getarchivoreporte", id);
            model.addAttribute("arep", ar.getListData());
            //get calibracion files
            EntityResult ac = service.selectQueryForName("getarchivocalibracion", id);
            model.addAttribute("acal", ac.getListData());
            //get clima files
            EntityResult cl = service.selectQueryForName("getarchivoclima", id);
            model.addAttribute("acli", cl.getListData());
            //get shape files
            EntityResult sh = service.selectQueryForName("getarchivoshape", id);
            model.addAttribute("ashp", sh.getListData());*/

            return "admin/baseDetail";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/cargararchivo", method = RequestMethod.POST)
    public String cargarArchivo(Model model, BaseDatoArchivo file) {
        try {
            if (file.getFile() != null) {
                if (!file.getFile().isEmpty()) {

                    String fileDestination = serverPathSufix + file.getId() + "/";
                    Object fid = service.saveFile(file.getFile(), service.systemParams().get("serverPath") + fileDestination);

                    Map<String, Object> in = new HashMap<>();
                    in.put("base", file.getId());
                    in.put("filedata", fid);
                    in.put("state", Boolean.FALSE);
                    in.put("register", new Date());
                    in.put("variable", file.getVar());
                    in.put("mes", file.getMes());
                    in.put("message", "pending...");

                    EntityResult er = service.persist(in, "geodata", "layer");

                }
            }
            // this.endPointProcess();
            return "redirect:/admin/basedato/" + file.getId();
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/basedato/deletesource", method = RequestMethod.GET)
    public String deleteSource(Model model, @RequestParam Long base, @RequestParam Long id, @RequestParam String key) {
        try {
            EntityResult er = service.get("bh", "base_" + key, id);
            FileDeleteStrategy.FORCE.delete(new File(service.systemParams().get("serverPath") + er.getObjectData().get("file_location")));
            // Delete SHAPE DATA
            service.executeSQLStatement("delete from bh." + key + " where base_" + key + "=" + id);
            // Delete BASE FILE
            service.delete("bh", "base_" + key, id);
            // Delete view
            try {
                service.executeSQLStatement("DROP VIEW geodata.view_" + key + "_" + id);
            } catch (Exception e) {
                // If view d'not exist 
            }
            //delete geoserver layer
            this.removeLayer("vibh", "view_" + key + "_" + id);
            return "redirect:/admin/basedato/" + base;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/basedato/deletedata", method = RequestMethod.GET)
    public String deleteData(Model model, @RequestParam Long base, @RequestParam Long id, @RequestParam String key) {
        try {
            EntityResult er = service.get("bh", "archivo_" + key, id);
            FileDeleteStrategy.FORCE.delete(new File(service.systemParams().get("serverPath") + er.getObjectData().get("file_location")));
            service.executeSQLStatement("delete from bh.data_" + key + " where archivo_" + key + "=" + id);
            service.delete("bh", "archivo_" + key, id);

            return "redirect:/admin/basedato/" + base;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/basedato/deletelayer", method = RequestMethod.GET)
    public String deleteLayer(Model model, @RequestParam Long base, @RequestParam Long id, @RequestParam String key) {
        try {
            EntityResult er = service.get("bh", key, id);
            if (er.getObjectData().get("file_location") != null) {
                Map<String, String> params = service.systemParams();
                // Delete file
                FileDeleteStrategy.FORCE.delete(new File(params.get("serverPath") + er.getObjectData().get("file_location")));

                // Delete Geoserver layer
                GeoServerRESTPublisher publisher = new GeoServerRESTPublisher(params.get("geoserverREST"), params.get("geoserveruser"), params.get("geoserverpass"));
                if (er.getObjectData().get("url") != null) {
                    publisher.removeCoverageStore("vibh", er.getObjectData().get("url").toString(), true);
                }
            }

            // Delete database register
            service.delete("bh", key, id);

            return "redirect:/admin/basedato/" + base;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/basedato/deletebase", method = RequestMethod.GET)
    public String deleteBase(Model model, @RequestParam Long id) {
        try {
            FileDeleteStrategy.FORCE.delete(new File(service.systemParams().get("serverPath") + serverPathSufix + id));

            // Delete database register
            service.delete("geodata", "base", id);

            return "redirect:/admin";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/listenerclima", method = RequestMethod.GET)
    @ResponseBody
    public String listenerClima() {
        String message = "successfully";
        try {
            //load archivo base_reporte
            SimpleFilter sf = new SimpleFilter();
            sf.addValue("state", Boolean.FALSE);
            sf.addANDRestriction(new Restriction("state", Restriction.EQUALS));
            EntityResult er = service.find("geodata", "layer", sf);
            //if existe record to process
            if (er.getSize() != 0) {
                // FIFO record to process
                Map<String, Object> m = er.getListData().get(0);
                // Base
                Map<String, Object> base = service.get("geodata", "base", m.get("base")).getObjectData();
                // FileData
                Map<String, Object> fd = service.get("geodata", "filedata", m.get("filedata")).getObjectData();
                // Mes
                Map<String, Object> mes = service.get("geodata", "mes", m.get("mes")).getObjectData();
                // Variable
                Map<String, Object> var = service.get("geodata", "variable", m.get("variable")).getObjectData();
                // System params
                Map<String, String> params = service.systemParams();
                // Principal file to process
                File tiff = new File(fd.get("serverpath") + fd.get("serverfilename").toString());
                if (tiff.exists()) {
                    try {
                        // Initiate Geoserver publisher
                        GeoServerRESTPublisher publisher = new GeoServerRESTPublisher(params.get("geoserverREST"), params.get("geoserveruser"), params.get("geoserverpass"));

                        String layerName = base.get("nombre") + "_" + mes.get("code") + "_" + var.get("code");
                        boolean ok = publisher.publishGeoTIFF("clima", layerName, layerName, tiff);
                        if (!ok) {
                            message = "No se pudo publicar";
                        } else {
                            m.put("layername", "clima:" + layerName);
                            String style = (String) var.get("geoserver_style");
                            // layerEncoder
                            GSLayerEncoder layerEncoder = new GSLayerEncoder();
                            layerEncoder.setDefaultStyle("clima", style);
                            publisher.configureLayer("clima", layerName, layerEncoder);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        message = e.getMessage();
                    }
                    m.put("state", Boolean.TRUE);
                    m.put("message", message);
                    service.persist(m, "geodata", "layer");
                } else {
                    System.out.println("file tiff not found...");
                    message = "file tiff not found";
                }
            } else {
                message = "Pending not found";
            }

            return message;
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        return "Error : " + message;
    }

    @RequestMapping(value = "/createlayer", method = RequestMethod.GET)
    @ResponseBody
    public Boolean createLayerFromTable(@RequestParam String table, @RequestParam String style) throws MalformedURLException {
        // Initiate Geoserver publisher
        Map<String, String> params = service.systemParams();
        GeoServerRESTPublisher publisher = new GeoServerRESTPublisher(params.get("geoserverREST"), params.get("geoserveruser"), params.get("geoserverpass"));

        //require view o table name : view_db_10
        GSFeatureTypeEncoder fte = new GSFeatureTypeEncoder();
        fte.setProjectionPolicy(GSResourceEncoder.ProjectionPolicy.REPROJECT_TO_DECLARED);
        fte.addKeyword("KEYWORD");
        fte.setTitle(table);
        fte.setName(table);
        fte.setSRS("EPSG:4326"); //default

        final GSLayerEncoder layerEncoder = new GSLayerEncoder();
        layerEncoder.setDefaultStyle(style); // vibh default workspace

        boolean ok = publisher.publishDBLayer("vibh", "balance", fte, layerEncoder); // balance default geoserver store
        return ok;
    }

    @RequestMapping(value = "/removelayer", method = RequestMethod.GET)
    @ResponseBody
    private Boolean removeLayer(@RequestParam String ws, @RequestParam String ly) throws MalformedURLException {
        // Initiate Geoserver publisher
        Map<String, String> params = service.systemParams();
        GeoServerRESTPublisher publisher = new GeoServerRESTPublisher(params.get("geoserverREST"), params.get("geoserveruser"), params.get("geoserverpass"));

        boolean ok = publisher.removeLayer(ws, ly);
        return ok;
    }

    @RequestMapping(value = "/capas", method = RequestMethod.GET)
    public String capas(Model model) {
        try {
            //get shape files
            EntityResult sh = service.selectQueryForName("getarchivoglobal");
            model.addAttribute("shp", sh.getListData());
            return "admin/capas";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/listenercapaglobal", method = RequestMethod.GET)
    @ResponseBody
    public String listenerCapaGlobal() {
        String message = "successfully";
        try {
            // load archivo base_reporte
            SimpleFilter sf = new SimpleFilter();
            sf.addValue("state", Boolean.FALSE);
            sf.addANDRestriction(new Restriction("state", Restriction.EQUALS));
            EntityResult er = service.find("bh", "capa", sf);
            // if existe record to process
            if (er.getSize() != 0) {
                // FIFO record to process
                Map<String, Object> m = er.getListData().get(0);
                // System params
                Map<String, String> params = service.systemParams();
                // Get Original zipFile
                File zip = new File(params.get("serverPath") + m.get("file_location").toString());
                if (zip.exists()) {
                    // name for new Layer
                    String storeLayerName = "layer_global_" + m.get("capa_id");
                    try {
                        // Generate new zipFile for this layername
                        File nzip = AdminUtils.renameShapeFile(zip, storeLayerName);
                        // Initiate Geoserver publisher
                        GeoServerRESTPublisher publisher = new GeoServerRESTPublisher(params.get("geoserverREST"), params.get("geoserveruser"), params.get("geoserverpass"));
                        // Publish layer
                        boolean published = publisher.publishShp("vibh", storeLayerName, storeLayerName, nzip);
                        // Delete input temporal
                        FileUtils.deleteDirectory(new File(nzip.getParent()));
                        if (published) {
                            // Configure layer
                            final GSLayerEncoder layerEncoder = new GSLayerEncoder();
                            layerEncoder.setDefaultStyle(m.get("estilo").toString());
                            publisher.configureLayer("vibh", storeLayerName, layerEncoder);
                        } else {
                            message = "No se pudo publicar";
                        }
                    } catch (Exception e) {
                        message = e.getMessage();
                    }

                    m.put("url", "vibh:" + storeLayerName);
                    m.put("state", Boolean.TRUE);
                    m.put("message", message);
                    // update file
                    service.persist(m, "bh", "capa");
                }
            }
            return message;
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        return "Error : " + message;
    }

    public void someFunction() {
        //shortOperation(data);
        new Thread(new Runnable() {
            public void run() {
                //longOperation(data);
                try {
                    System.out.println("call reporte");
                    //execute listener
                    String url = "http://localhost:8080/vibh/admin/endpoint";
                    HttpClient client = new HttpClient();
                    HttpMethod method = new GetMethod(url);

                    client.executeMethod(method);

                    byte[] responseBody = method.getResponseBody();
                    method.releaseConnection();
                    System.out.println(new String(responseBody));
                } catch (IOException ex) {
                    java.util.logging.Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }).start();
    }
}
