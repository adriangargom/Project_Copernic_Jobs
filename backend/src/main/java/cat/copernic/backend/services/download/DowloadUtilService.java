package cat.copernic.backend.services.download;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import lombok.Data;
 
@Data
@Service
public class DowloadUtilService {


    private String savedFiles;

    private Path foundFile;
     
    public Resource getFileAsResource(String fileCode) throws IOException {
        Path dirPath = Paths.get(savedFiles);
         
        Files.list(dirPath).forEach(file -> {
            if (file.getFileName().toString().startsWith(fileCode)) {
                foundFile = file;
                return;
            }
        });
 
        if (foundFile != null) {
            return new UrlResource(foundFile.toUri());
        }
         
        return null;
    }
}
