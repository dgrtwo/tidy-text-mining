formats = c(
  'bookdown::pdf_book', 'bookdown::epub_book', 'bookdown::gitbook'
)
# render the book to all formats
for (fmt in formats) {
  res = bookdown:::Rscript(c(
    '-e', shQuote(sprintf("bookdown::render_book('index.Rmd', '%s', quiet = TRUE)", fmt))
  ))
  if (res != 0) stop('Failed to compile the book to ', fmt)
}

