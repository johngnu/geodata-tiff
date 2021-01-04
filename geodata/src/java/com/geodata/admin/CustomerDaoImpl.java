/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * CustomerDaoImpl
 *
 * @author John Castillo
 */
@Repository
public class CustomerDaoImpl extends JdbcDaoSupport {

    @Autowired
    DataSource dataSource;

    @PostConstruct
    private void initialize() {
        setDataSource(dataSource);
    }

    public void insert(List<? extends EntityStruct> ens, String key) {
        String sql = "INSERT INTO bh.data_" + key
                + " (data_" + key + "_id, base_dato, variable_" + key + ", gestion, mes, dato, codigo, archivo_" + key + ")"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter() {
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                EntityStruct en = ens.get(i);
                ps.setLong(1, en.getId());
                ps.setLong(2, en.getBase_dato());
                ps.setLong(3, en.getVariable());
                ps.setLong(4, en.getGestion());
                ps.setLong(5, en.getMes());
                if (en.getDato() != null) {
                    ps.setDouble(6, en.getDato());
                } else {
                    ps.setObject(6, null);
                }
                ps.setString(7, en.getCodigo());
                ps.setLong(8, en.getArchivo());
            }

            public int getBatchSize() {
                return ens.size();
            }
        });

    }

}
