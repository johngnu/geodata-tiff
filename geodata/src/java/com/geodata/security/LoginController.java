/*
 * ICG SRL - International Consulting Group 2011
 */
package com.geodata.security;

import com.geodata.services.IEntityServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController
 *
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 * @since 01-03-2011
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    IEntityServices service;

    @RequestMapping(value = "/loginpage", method = RequestMethod.GET)
    public String getLoginPage(Model model, @RequestParam(value = "error", required = false) boolean key) {
        System.out.println("vibh loginpage open: " + key);
        if (key) {
            model.addAttribute("key", key);
        }
        return "login/login";
    }
}
