complete <- function(directory, id = 1:332) {
        files <- list.files(directory, full.names = TRUE)  #import data
        complete <- data.frame()
        
        for (i in id) {
                data <- read.csv(files[i], comment.char = "")
                #select complete rownumber
                a <- complete.cases(data)
                #select complete row from data
                valid <- data[a, ]
                #combine complete number in each file
                complete <- rbind(complete, c(i, nrow(valid)))
        }
        
        names(complete) <- c("id", "nobs");
        complete
}