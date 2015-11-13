complete <- function(directory, id = 1:332) {
        files <- list.files(directory, full.names = TRUE)  #import data
        complete <- data.frame()
        
        for (i in id) {
                data <- read.csv(files[i], comment.char = "")
                #select complete data
                a <- na.omit(data)
                #combine complete number in each file
                complete <- rbind(complete, c(i, nrow(a)))
        }
        
        names(complete) <- c("id", "nobs");
        complete
}