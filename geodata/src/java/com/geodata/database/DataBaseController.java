/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.database;

import com.icg.entityclassutils.EntityResult;
import com.geodata.services.IEntityServices;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * DataBaseController, main application controller
 *
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 * @since 01-03-2017
 */
@Controller
@RequestMapping(value = "/database")
public class DataBaseController {

    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(Model model) {
        try {
            model.addAttribute("dbs", service.find("bh", "base_dato", new String[]{"date_create"}).getListData());

            return "geovisor/dataBase";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(Model model) {
        try {
            model.addAttribute("dbs", service.find("bh", "base_dato", new String[]{"date_create"}).getListData());

            return "geovisor/dashboard";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/{basedato}", method = RequestMethod.GET)
    public String baseDatoDetails(Model model, @PathVariable Long basedato) {
        try {
            model.addAttribute("basedato", basedato);
            Map<String, Object> db = service.get("bh", "base_dato", basedato).getObjectData();
            model.addAttribute("basedato", db);

            //cuencas reporte
            EntityResult cr = service.selectQueryForName("getcuencasreporte", basedato);
            //cuencas calibracion
            EntityResult cc = service.selectQueryForName("getcuencascalibracion", basedato);

            model.addAttribute("reporte", cr.getListData());
            model.addAttribute("calibracion", cc.getListData());

            return "geovisor/baseDatoDetails";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }


    @RequestMapping(value = "/predict", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> searchPredictDatabase(String query) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("nombre", "%" + query + "%");
            EntityResult res = service.selectQueryForName("databasegetpredict", params);
            return res.getListData();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @RequestMapping(value = "/getlayerlegend", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getLayerLegend(@RequestParam String layer) {
        try {
            Map<String, String> params = service.systemParams();

            String url1 = params.get("geoserverurl") + "?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=80&HEIGHT=20"
                    + "&LAYER=" + layer
                    + "&LEGEND_OPTIONS=forceRule:True;dx:0.2;dy:0.2;mx:0.2;my:0.2;fontStyle:bold;borderColor:0000ff;border:true;fontColor:000000;fontSize:12";

            HttpClient client = new HttpClient();
            HttpMethod method = new GetMethod(url1);
            client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();

            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf("image/png"));
            return new ResponseEntity<>(responseBody, headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/item/{id}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> itemFile(@PathVariable Long id) {
        try {
            Map<String, Object> db = service.get("bh", "base_dato", id).getObjectData();
            Map<String, String> params = service.systemParams();
            String path = params.get("serverPath") + "/balance/base_dato/" + id + "/item/" + id + ".pdf";

            InputStream in = new FileInputStream(path);

            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf(db.get("attachedtype").toString()));
            headers.set("Content-Disposition", "attachment; filename=\"" + db.get("attachedname") + "\"");

            return new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
