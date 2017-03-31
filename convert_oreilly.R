library(tidyverse)
library(stringr)
library(bookdown)


# new branch -> change tips/notes/warnings (VERSION FOR EBOOK) -> new branch -> grayscale figures (VERSION FOR PRINT)

# first run:
# render_book("index.Rmd", output_format = word_document2(), clean = FALSE)

book <- read_lines("_main.utf8.md")

s <- str_replace_all(book, "<a .*?>(.*)</a>", "\\1")
s <- str_replace_all(s, " +\\[@.*?\\]", "")
s <- str_replace_all(s, "<strong>|<\\/strong>", "")
s <- str_replace_all(s, "\\(.*_files/figure-docx/", "\\(")
s <- str_replace_all(s, "images/", "")
s <- s[!str_detect(s, "^\\<\\!\\-\\-")]
s <- tail(s, -(which(str_detect(s, "^# Preface"))[1] - 1))

outfolder <- "text-mining-manuscript"
dir.create(outfolder, showWarnings = FALSE)
write_lines(s, file.path(outfolder, "text-mining-with-r.md"))

# hack, for now
for (f in paste0(c("01-tidy-text",
                   "02-sentiment-analysis",
                   "03-tf-idf",
                   "04-word-combinations",
                   "05-document-term-matrices",
                   "06-topic-models",
                   "07-tweet-archives",
                   "08-nasa-metadata",
                   "09-usenet"), "_files")) {
  out2 <- file.path(outfolder, f)
  dir.create(out2, showWarnings = FALSE)
  system(paste0("cp -r _bookdown_files/", f, "/figure-docx ", out2))
}

