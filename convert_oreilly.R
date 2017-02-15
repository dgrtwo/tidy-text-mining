library(tidyverse)
library(stringr)
library(bookdown)

# first run:
# render_book("index.Rmd", output_format = word_document2(), clean = FALSE)

book <- read_lines("_main.utf8.md")

s <- str_replace_all(book, "<a .*?>(.*)</a>", "\\1")
s <- str_replace_all(s, " +\\[@.*?\\]", "")
s <- s[!str_detect(s, "^\\<\\!\\-\\-")]
s <- tail(s, -(which(str_detect(s, "^# Intro"))[1] - 1))

outfolder <- "tidy-text-mining-3-chapters"
dir.create(outfolder, showWarnings = FALSE)
write_lines(s, file.path(outfolder, "tidy-text-mining.md"))

# hack, for now
for (f in paste0(c("02-tidy-text", "03-sentiment-analysis"), "_files")) {
  out2 <- file.path(outfolder, f)
  dir.create(out2, showWarnings = FALSE)
  system(paste0("cp -r _bookdown_files/", f, "/figure-docx ", out2))
}
