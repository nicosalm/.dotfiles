# -- automatically load essential packages --
suppressMessages({
  require(tidyverse)
  require(txtplot)
})

# ensure plot directory exists
plot_dir <- "~/tmp/r"
dir.create(path.expand(plot_dir), recursive = TRUE, showWarnings = FALSE)

# -- quick plotting function --
quickplot <- function(plot_expr, filename = file.path(path.expand(plot_dir), "temp_plot.pdf"), open = TRUE) {
  pdf(filename)
  eval(substitute(plot_expr))
  dev.off()

  if (open) {
    if (.Platform$OS.type == "unix") {
      system(paste("open", filename))
    } else {
      shell.exec(filename)  # for Windows
    }
  }
}

# -- environment management functions --

# clear screen
cls <- function() cat("\014")

# enhanced list objects
ll <- function() {
  obj_list <- ls(envir = .GlobalEnv)
  if (length(obj_list) == 0) {
    cat("No objects in environment\n")
    return(invisible())
  }

  # exclude our utility functions
  utility_funcs <- c("ll", "cls", "cc", "quickplot", "qp")
  obj_list <- setdiff(obj_list, utility_funcs)

  obj_info <- sapply(obj_list, function(x) {
    obj <- get(x)
    size <- format(object.size(obj), units = "auto")
    cls <- class(obj)[1]
    dim_info <- if (is.null(dim(obj))) length(obj) else paste(dim(obj), collapse = "x")
    sprintf("%-20s %-10s %-10s %s", x, cls, dim_info, size)
  })

  if (length(obj_info) == 0) {
    cat("No user objects in environment\n")
    return(invisible())
  }

  cat("Name                 Class      Dim/Len    Size\n")
  cat(paste0(obj_info, collapse = "\n"), "\n")
}

# clear console and user objects only
cc <- function() {
  cat("\014")
  # get all objects except our utility functions
  to_remove <- setdiff(ls(envir = .GlobalEnv),
                      c("ll", "cls", "cc", "quickplot", "qp"))
  rm(list = to_remove, envir = .GlobalEnv)
  cat("Environment cleared\n")
}

# -- aliases --
qp <- quickplot

# -- startup message --
.First <- function() {
  cat("Loading custom R environment...\n")
  cat("Plot directory:", path.expand(plot_dir), "\n")
  cat("Available commands:\n")
  cat("  qp()  - quick plot to PDF\n")
  cat("  ll()  - list objects with details\n")
  cat("  cls() - clear screen\n")
  cat("  cc()  - clear console and objects\n")
}
