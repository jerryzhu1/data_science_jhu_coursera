corr <- function(directory, threshold = 0) {
        files <- list.files(directory, full.names = TRUE)
        comp <- complete(directory)
        #find qualified id
        q <- subset(comp, comp$nobs > threshold)
        id <- c(q[,1])
        result <- c()
        
        for (i in id){ 
                data <- read.csv(files[i], comment.char = "")
                a <- na.omit(data)
                corr <- cor(a$sulfate, a$nitrate)
                result <- c(result, corr)
        }
        result
}