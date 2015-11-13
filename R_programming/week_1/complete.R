complete <- function(directory, id = 1:332) {
        files <- list.files(directory, full.names = TRUE) #import data
        complete = data.frame()
        
        for (i in id) {
                data <- read.csv(files[i], comment.char = "")
                #find complete row number
                a <- !is.na(data[2])
                b <- !is.na(data[3])
                c <- a & b
                t <- sum(c)
                l_1 <-  data.frame(i, t)
                complete <- rbind(complete, l_1)
        }
        
        names(complete) <- c("id", "nobs");
        complete
}