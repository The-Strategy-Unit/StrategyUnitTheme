local({
  .__su_theme_dev__. <- new.env()

  # This function is used to bump the version number.
  #
  # - If the branch is anything other than master, then which can only be NULL (or
  # dev).
  # - If the branch is master, which can be either patch, minor, major, or NULL
  # (If it is NULL it will default to patch)
  #
  # It will commit the change to the file "DESCRIPTION" with a message of
  #   "Increment version number"
  #
  # If the previous commit is "Increment version number" then the function will
  # abort.
  .__su_theme_dev__.$bumpVersion <- function(which = NULL) {
    commitMessage <- "Increment version number"

    # if the previous commit was an Increment, then stop
    if (git2r::commits()[[1]]$summary == commitMessage) {
      cat("Previous commit was version bump: aborting\n")
      return(invisible())
    }

    # check to see if current branch is master or not
    is_master_head <- git2r::is_head(git2r::branches()$master)

    # if nothing has been provided for
    if (is.null(which)) {
      which <- ifelse(is_master_head, "patch", "dev")
    }

    which <- match.arg(which, c("patch", "minor", "major", "dev"))

    if (is_master_head && which == "dev") {
      stop("cannot bump dev version on master")
    }
    if (!is_master_head && which != "dev") {
      stop("can only bump dev number on a non-master branch")
    }

    usethis::use_version(which)

    if (!interactive()) {
      repo <- git2r::repository()
      git2r::add(repo, "DESCRIPTION")
      git2r::commit(repo, commitMessage)
    }
  }

  attach(.__su_theme_dev__.)

  invisible(NA)
})
