/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.process;

import com.geodata.services.IEntityServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Map;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;

/**
 * IndexController
 *
 * @author John Castillo
 * @since 01-06-2017
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {

    @Autowired
    private IEntityServices service;
    @Autowired
    ServletContext servletContext;

    @RequestMapping
    public String EscritorioIndex(Model model) {
        try {
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    private byte[] geoserverShot(String vbox, String layers) {
        try {
            String geoserver = service.systemParams().get("geoserverurl");

            String url = geoserver + "?&service=WMS&version=1.1.1&request=GetMap&layers=" + layers + "&styles=&format=image/png&TRANSPARENT=TRUE&srs=EPSG:900913&bbox=" + vbox + "&width=512&height=374";
            System.out.println(url);

            HttpClient client = new HttpClient();
            HttpMethod method = new GetMethod(url);

            int code = client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();

            try {
                BufferedImage image = ImageIO.read(method.getResponseBodyAsStream());
                if (image == null) {
                    System.out.println("The file could not be opened , it is not an image");
                } else {
                    return responseBody;
                }
            } catch (IOException ex) {
                System.out.println("The file could not be opened , an error occurred.");
            }
            String file = servletContext.getRealPath("/output") + "/imageerror.jpg";

            Path path = Paths.get(file);
            return Files.readAllBytes(path);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private byte[] geoserverLegend(String layer) {
        try {
            Map<String, String> params = service.systemParams();

            String url1 = params.get("geoserverurl") + "?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=30&HEIGHT=15"
                    + "&LAYER=" + layer
                    + "&LEGEND_OPTIONS=forceRule:True;dx:0.2;dy:0.2;mx:0.2;my:0.2;fontStyle:bold;borderColor:0000ff;border:false;fontColor:000000;fontSize:12";
            HttpClient client = new HttpClient();
            HttpMethod method = new GetMethod(url1);
            int code = client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();

            try {
                BufferedImage image = ImageIO.read(method.getResponseBodyAsStream());
                if (image == null) {
                    System.out.println("The file could not be opened , it is not an image");
                } else {
                    return responseBody;
                }
            } catch (IOException ex) {
                System.out.println("The file could not be opened , an error occurred.");
            }
            String file = servletContext.getRealPath("/output") + "/imageerror.jpg";

            Path path = Paths.get(file);
            return Files.readAllBytes(path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
