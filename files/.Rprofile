# vim: ft=r
options(showWarnCalls=TRUE, showErrorCalls=TRUE)
options(prompt="R> ", digits.secs=3, show.signif.stars=FALSE)

# stick functions into a new environment, so they don't show up in ls()
if ("profileFunctions" %in% search()) detach(profileFunctions)
profileFunctions <- new.env()
attach(profileFunctions)

# UNIX-like
assign("cd", function(d) { setwd(d) }, "profileFunctions")
assign("pwd", function() { getwd() }, "profileFunctions")
assign("printf", function(...) { writeLines(sprintf(...)) }, "profileFunctions")

assign("degrees.to.radians", function(d) { d*pi/180; }, "profileFunctions")
assign("radians.to.degrees", function(r) { r*180/pi; }, "profileFunctions")

assign("remap.range", function(x, min1, max1, min2, max2) {
    return (((max2-min2) * (x-min1)) / (max1-min1)) + min2;
}, "profileFunctions")

# modified psych::describe not requiring any additional libraries
assign("summarize", function(x, na.rm=TRUE, interp=FALSE, ranges=TRUE, trim=0.1) {
    cl <- match.call()

    valid <- function(x) { sum(!is.na(x)) }
    if (!na.rm) x <- na.omit(x)

    if (is.null(dim(x)[2])) {
        vars <- 1
        stats = matrix(rep(NA, 10), ncol = 10)
        stats[1, 1] <- valid(x)
        stats[1, 2] <- mean(x, na.rm = na.rm)
        stats[1, 10] <- sd(x, na.rm = na.rm)
        if (interp) {
            stats[1, 3] <- interp.median(x, na.rm = na.rm)
        }
        else {
            stats[1, 3] <- median(x, na.rm = na.rm)
        }
        stats[1, 9] <- mean(x, na.rm = na.rm, trim = trim)
        stats[1, 4] <- min(x, na.rm = na.rm)
        stats[1, 5] <- max(x, na.rm = na.rm)
        stats[1, 7] <- mad(x, na.rm = na.rm)
    } else {
        vars <- c(1:ncol(x))
        stats = matrix(rep(NA, ncol(x) * 10), ncol = 10)
        rownames(stats) <- colnames(x)
        stats[, 1] <- apply(x, 2, valid)
        for (i in seq_along(x)) {
            if (is.factor(x[[i]]) || is.logical(x[[i]])) {
                x[[i]] <- as.numeric(x[[i]])
                rownames(stats)[i] <- paste(rownames(stats)[i], 
                  "*", sep = "")
            }
            if (!is.numeric(unclass(x[[i]]))) 
                stop("non-numeric argument to 'summarize'")
        }
        stats[, 2] <- apply(x, 2, mean, na.rm = na.rm)
        stats[, 10] <- apply(x, 2, sd, na.rm = na.rm)
        stats[, 7] <- apply(x, 2, mad, na.rm = na.rm)
        stats[, 4] <- apply(x, 2, min, na.rm = na.rm)
        stats[, 5] <- apply(x, 2, max, na.rm = na.rm)
        stats[, 9] <- apply(x, 2, mean, na.rm = na.rm, trim = trim)
        if (interp) {
            stats[, 3] <- apply(x, 2, interp.median, na.rm = na.rm)
        } else {
            stats[, 3] <- apply(x, 2, median, na.rm = na.rm)
        }
    }

    if (ranges) {
        temp <- data.frame(n = stats[, 1],
                           mean = stats[, 2],
                           sd = stats[, 10],
                           median = stats[, 3],
                           trimmed = stats[, 9],
                           mad = stats[, 7],
                           min = stats[, 4],
                           max = stats[, 5],
                           range = stats[, 5] - stats[, 4])
    } else {
        temp <- data.frame(n = stats[, 1],
                           mean = stats[, 2],
                           sd = stats[, 10])
    }

    answer <- data.frame(var = vars, temp, se = temp$sd/sqrt(temp$n))
    return(answer)
}, "profileFunctions")


# remove the environment, but it will remain attached to the search path
rm(profileFunctions)

