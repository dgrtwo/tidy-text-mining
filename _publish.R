# publish the book with other styles

unlink('_book', recursive = TRUE)
bookdown:::Rscript('_render.R')
bookdown::publish_book('bookdown-demo')

x = readLines('index.Rmd')
i = 1
s = paste0('title: "A Minimal Book Example (', c('Bootstrap', 'Tufte'), ' Style)"')
for (fmt in c('html_book', 'tufte_html_book')) {
  unlink('_book', recursive = TRUE)
  file.copy('index.Rmd', '_index.Rmd')
  writeLines(
    gsub('^title: ".*"', s[i], gsub('gitbook', fmt, x)), 'index.Rmd'
  )
  cmd = sprintf("bookdown::render_book('index.Rmd', 'bookdown::%s', quiet = TRUE)", fmt)
  res = bookdown:::Rscript(c('-e', shQuote(cmd)))
  file.rename('_index.Rmd', 'index.Rmd')
  if (res != 0) stop('Failed to compile the book to ', fmt)
  i = i + 1
  bookdown::publish_book(paste0('bookdown-demo', i))
}
unlink('_book', recursive = TRUE)
