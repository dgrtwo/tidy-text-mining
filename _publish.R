# publish the book with differnet HTML styles; you should not need this script

# default formats
formats = c(
  'bookdown::pdf_book', 'bookdown::epub_book', 'bookdown::gitbook'
)

unlink('_book', recursive = TRUE)

# render the book to all formats unless they are specified via command-line args
for (fmt in formats) {
  cmd = sprintf("bookdown::render_book('index.Rmd', '%s', quiet = TRUE)", fmt)
  res = bookdown:::Rscript(c('-e', shQuote(cmd)))
  if (res != 0) stop('Failed to compile the book to ', fmt)
}

bookdown::publish_book('bookdown-demo')

x = readLines('index.Rmd')
i = 1
s = paste0('title: "A Minimal Book Example (', c('Bootstrap', 'Tufte'), ' Style)"')
for (fmt in c('html_book', 'tufte_html_book')) {
  unlink('_book', recursive = TRUE)
  file.copy('index.Rmd', '_index.Rmd')
  file.copy('_output.yml', '_output.yml2')
  writeLines(
    gsub('^title: ".*"', s[i], gsub('gitbook', fmt, x)), 'index.Rmd'
  )
  cat(
    'bookdown::', fmt, ':\n', '  css: [style.css, toc.css]\n', sep = '', file = '_output.yml',
    append = TRUE
  )
  cmd = sprintf("bookdown::render_book('index.Rmd', 'bookdown::%s', quiet = TRUE)", fmt)
  res = bookdown:::Rscript(c('-e', shQuote(cmd)))
  file.rename('_index.Rmd', 'index.Rmd')
  file.rename('_output.yml2', '_output.yml')
  if (res != 0) stop('Failed to compile the book to ', fmt)
  i = i + 1
  bookdown::publish_book(paste0('bookdown-demo', i))
}
unlink('_book', recursive = TRUE)
