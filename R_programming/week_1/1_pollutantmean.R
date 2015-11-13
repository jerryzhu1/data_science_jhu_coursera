pollutantmean <- function(directory, pollutant, id = 1:332) {
        files <- list.files(directory, full.names = TRUE)
        data_1 <- c()
        
        for (i in id) {
                data <- read.csv(files[i], comment.char = "")
                if(pollutant == "sulfate")
                        {
                        data_pol <- c(data[, 2])
                        }
                else if(pollutant == "nitrate")
                        {
                        data_pol <- c(data[, 3])
                        }
                
                data_1 <- c(data_1, data_pol)
        }
        output = mean(data_1, na.rm = TRUE)  
        output
}

        