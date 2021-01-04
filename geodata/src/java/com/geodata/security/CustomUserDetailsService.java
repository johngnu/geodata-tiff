/*
 * ICG SRL - International Consulting Group 2011
 */
package com.geodata.security;

import com.geodata.services.IEntityServices;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;

/**
 * CustomUserDetailsService
 *
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 * @since 01-03-2011
 */
@Service
public class CustomUserDetailsService {

    @Autowired
    IEntityServices service;

    public CustomUserDetails loadUserByUsername(String username, String literalkey) throws UsernameNotFoundException {
        Usuario user = null;
        if (username.equals("admin")) {
            user = this.getDefaultUser();
        } else {

        }

        if (user == null) {
            System.out.println("vibh __ user not found");
            Map<String, Object> in = new HashMap<>();
            in.put("dateaccess", new Date());
            in.put("success", Boolean.FALSE);
            in.put("attrs", "{username:" + username + "}");
            throw new UsernameNotFoundException("user not found");
        } else {
            //set access switches
            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;

            CustomUserDetails userDetail = new CustomUserDetails(
                    username,
                    user.getClave(),
                    user.getActivo(),
                    accountNonExpired,
                    accountNonLocked,
                    credentialsNonExpired,
                    null);

            Map<String, Object> params = new HashMap<>();
            params.put("user", user.getUsuario_id());

            userDetail.setApellido(user.getApellidos());
            userDetail.setId(user.getUsuario_id());

            return userDetail;
        }
    }

    private Usuario getDefaultUser() {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        return (Usuario) ctx.getBean("defaultuser");
    }

}
