### just keep this token locally
### don't push the token to git
### i.e. do not "git add ." (folder is hidden)
### deployment should involve one token at least

# check more info here
# https://gargle.r-lib.org/articles/non-interactive-auth.html

library(googledrive)

# maybe you wanna set up the wd first, so that you know where the token is
# setwd("./shiny-survey")
# designate project-specific cache
options(gargle_oauth_cache = ".secrets")
# pop-up window: store a tokenin the specified cache
drive_auth()
# check if you do have token(s) in .secrets/
list.files(".secrets/")
