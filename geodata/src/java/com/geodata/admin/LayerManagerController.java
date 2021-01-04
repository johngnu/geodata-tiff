/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import com.icg.entityclassutils.EntityResult;
import com.geodata.services.IEntityServices;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * LayerManagerController
 *
 * @since 18-11-2017
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
@Controller
@RequestMapping(value = "/layers")
public class LayerManagerController {

    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/geoserverlocation", method = RequestMethod.GET)
    public String geoserverLocation(Model model) {
        Map<String, Object> params = this.systemParams();

        if (params.get("geoserverurl") == null) {
            model.addAttribute("geoserver", "http://localhost:8090/geoserver/clima/wms");
        } else {
            model.addAttribute("geoserver", params.get("geoserverurl"));
        }
        return "geoserverLocation";
    }

    private Map<String, Object> systemParams() {
        Map<String, Object> ps = new HashMap<>();
        EntityResult er = service.find("logic", "param");
        for (Map<String, Object> e : er.getListData()) {
            ps.put(e.get("key").toString(), e.get("value"));
        }
        return ps;
    }
}
