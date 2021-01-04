/*
 * ICG SRL - International Consulting Group 2011
 */
package com.geodata.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * AdminController
 *
 * @since 18-11-2017
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
@Controller
@RequestMapping(value = "/endpoint")
public class EndPointController {

    @Autowired
    private AdminController admin;

    @RequestMapping(value = "/process", method = RequestMethod.GET)
    @ResponseBody
    public String endPointProcess() {
        String message = "successfully";
        try {
            // clima
            admin.listenerClima();

            return message;
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        return "Error : " + message;
    }

}
