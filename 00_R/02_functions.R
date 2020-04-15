# function to change defaults in qwraps2 for table display
hijack <- function (FUN, ...) {
    .FUN <- FUN
    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(.FUN)[[names(args)[i]]] <<- args[[i]]
    }))
    .FUN
}
