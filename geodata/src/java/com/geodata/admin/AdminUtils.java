/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import diewald_shapeFile.files.dbf.DBF_Field;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

/**
 * AdminUtils
 *
 * @since 18-11-2017
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
public class AdminUtils {

    public static File renameShapeFile(File zip, String newNameShp) throws ZipException, IOException, Exception {
        // Initiate ZipFile object with the path/name of the zip file.
        ZipFile zipFile = new ZipFile(zip);
        // Extracts all files to the path specified
        String temporal = zip.getParent() + "/_temp_" + System.currentTimeMillis();
        zipFile.extractAll(temporal);
        // Find if .shp exist
        File[] shape = AdminUtils.getFileList(temporal);
        if (shape.length == 1) {
            String rootName = FilenameUtils.removeExtension(shape[0].getName());
            File folder = new File(temporal);
            File[] listOfFiles = folder.listFiles();
            ArrayList<File> filesToAdd = new ArrayList<>();
            for (File f : listOfFiles) {
                String fileNameWithOutExt = FilenameUtils.removeExtension(f.getName());
                String fileExt = FilenameUtils.getExtension(f.getName());
                String dir = FilenameUtils.getFullPath(f.getAbsolutePath());

                File nf = new File(dir + fileNameWithOutExt.replaceFirst(rootName, newNameShp) + "." + fileExt);
                FileUtils.moveFile(f, nf);
                filesToAdd.add(nf);
            }

            // Initiate ZipFile object with the path/name of the zip file.
            ZipFile zipOutput = new ZipFile(temporal + "/" + newNameShp + ".zip");

            // ZipParameters
            ZipParameters parameters = new ZipParameters();
            parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE); // set compression method to deflate compression

            // Set the compression level. This value has to be in between 0 to 9
            // Several predefined compression levels are available
            // DEFLATE_LEVEL_FASTEST - Lowest compression level but higher speed of compression
            // DEFLATE_LEVEL_FAST - Low compression level but higher speed of compression
            // DEFLATE_LEVEL_NORMAL - Optimal balance between compression level/speed
            // DEFLATE_LEVEL_MAXIMUM - High compression level with a compromise of speed
            // DEFLATE_LEVEL_ULTRA - Highest compression level but low speed
            parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);

            // Now add files to the zip file
            // Note: To add a single file, the method addFile can be used
            // Note: If the zip file already exists and if this zip file is a split file
            // then this method throws an exception as Zip Format Specification does not 
            // allow updating split zip files
            zipOutput.addFiles(filesToAdd, parameters);

            return zipOutput.getFile();
        } else {
            throw new Exception("No contiene .shp valido");
        }
    }

    /**
     * Find shape files .shp
     *
     * @param dirPath
     * @return
     */
    public static File[] getFileList(String dirPath) {
        File dir = new File(dirPath);

        File[] fileList = dir.listFiles(new FilenameFilter() {
            public boolean accept(File dir, String name) {
                return name.endsWith(".shp");
            }
        });
        return fileList;
    }

    public static String getNombreField(DBF_Field[] fields) {
        for (DBF_Field f : fields) {
            if (f.getName().toUpperCase().equals("NOMBRE")) {
                return f.getName();
            }
        }
        return null;
    }

    public static String getCodigoField(DBF_Field[] fields) {
        for (DBF_Field f : fields) {
            if (f.getName().toUpperCase().equals("CODIGO")) {
                return f.getName();
            }
        }
        return null;
    }
}
