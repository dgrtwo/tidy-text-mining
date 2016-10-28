# Introduction {#intro}

If you work in analytics or data science, like we do, you are familiar with the fact that data is being generated all the time at ever faster rates. (You may even be a little weary of people pontificating about this fact.) Analysts are often trained to handle tabular or rectangular data that is mostly numeric, but much of the data proliferating today is unstructured and typically text-heavy. Many of us who work in analytic fields are not trained in even simple interpretation of natural language.

We developed a new R package, [tidytext](https://github.com/juliasilge/tidytext) [@R-tidytext], because we were familiar with many methods for data wrangling and visualiation, but couldn't easily apply these same methods to text. We found that using tidy data principles can make many text mining tasks easier, more effective, and consistent with tools already in wide use. By treating text as data frames of words, we can manipulate, summarize, and visualize the characteristics of text easily and integrate natural language processing into effective workflows we were already using.

The tools provided by the tidytext package are relatively simple; what is important is the possible applications. Thus, this book provides compelling examples of real text mining problems.

## What is tidy text?

As described by Hadley Wickham [@tidydata], tidy data has a specific structure:

* each variable is a column
* each observation is a row
* each type of observational unit is a table

We thus define the tidy text format as being **a table with one-term-per-row.** This is in contrast to the ways text is often stored in current analyses, as raw strings or perhaps a specialized format like a document-term matrix. For tidy text mining, the **term** that is stored in each row can be, mostly commonly, a single word, or perhaps an n-gram, a sentence, or another unit of text of interest for a certain analysis. In the tidytext package, we provide functionality to tokenize by commonly used units of text like these and convert to a one-term-per-row format.

Tidy data sets allow manipulation with a standard set of "tidy" tools, including popular packages such as dplyr [@R-dplyr], tidyr [@R-tidyr], ggplot2 [@R-ggplot2], and broom [@R-broom]. By keeping the input and output in tidy tables, users can transition fluidly between these tools. We've found these tidy tools extend naturally to many text analyses and explorations. 

At the same time, the tidytext package doesn't expect a user to keep text data in a tidy form at all times during an analysis. The package includes functions to `tidy` objects (see the broom package [@R-broom]) from popular text mining R packages such as tm [@tm] and quanteda [@R-quanteda]. This allows, for example, a workflow with easy reading, filtering, and processing to be done using dplyr and other tidy tools, after which the data can be converted into a document-term matrix for machine learning applications. The models can then be re-converted into a tidy form for interpretation and visualization with ggplot2.

## About this book

This book is focused on practical software examples and data explorations. There are few equations, but a great deal of code. We especially focus on generating real insights from the literature, news, and social media that we analyze.

We don't assume any previous knowledge of text mining; professional linguists and text analysts will likely find our examples elementary, though we are confident they can build on the framework for their own analyses.

We do assume that the reader is at least slightly familiar with dplyr, ggplot2, and the `%>%` "pipe" operator in R, and is interested in applying these tools to text data. For users who don't have this background, we recommend books such as [R for Data Science](http://r4ds.had.co.nz/). We believe that with a basic background and interest in tidy data, even a user early in their R career can understand and apply our examples.

## Outline

We start by introducing the tidy text format, and some of the ways dplyr, tidyr, and tidytext allow informative analyses of this structure.

* **Chapter 2** outlines the tidy text format and the `unnest_tokens` function. It also introduces the gutenbergr and janeaustenr packages, which provide useful literary text datasets that we'll use throughout this book.
* **Chapter 3** shows how to perform sentiment analysis on a tidy text dataset, using the `sentiments` dataset from tidytext and `inner_join` from dplyr.
* **Chapter 4** describes the tf-idf statistic (term frequency times inverse document frequency), a quantity used for identifying terms that are especially important to a particular document.
* **Chapter 5** introduces n-grams and how to analyze word networks in text using the widyr package.

Text won't be tidy at all stages of an analysis, and it is important to be able to convert back and forth from a tidy format.

* **Chapter 6** introduces methods for tidying document-term matrices and corpus objects from the tm and quanteda packages, as well as for casting tidy text datasets into those formats.
* **Chapter 7** explores the concept of topic modeling, and uses the `tidy` method for interpreting and visualizing the output of the topicmodels package. 

We conclude with several tidy text analyses that bring together multiple text mining approaches we've learned.

* **Chapter 8** demonstrates an application of a tidy text analysis by analyzing the authors' own Twitter archives. How do Dave's and Julia's tweeting habits compare?
* **Chapter 9** explores metadata from over 32,000 NASA datasets by looking at how keywords from the datasets are connected to title and description fields.
* **Chapter 10** analyzes a dataset of Usenet messages from a diverse set of newsgroups (focused on topics like politics, hockey, technology, atheism, and more) to understand patterns across the groups.

## Topics this book does not cover

This book serves as an introduction to a framework along with a collection of examples, but it is far from a complete exploration of natural language processing. The [CRAN Task View on Natural Language Processing](https://cran.r-project.org/web/views/NaturalLanguageProcessing.html) provides details on more ways to use R for computational linguistics. There are several areas that you may want to explore in more detail according to your needs.

* **Supervised classification and prediction:** Machine learning on text is a vast topic that could easily fill its own volume. We introduce one method of unsupervised clustering (topic modeling through latent Dirichlet allocation) in [Chapter 7](#topicmodeling) but many more machine learning algorithms can be used in dealing with text.
* **More complex tokenization:** We hand tokenization off to the tokenizers package [@R-tokenizers], which itself wraps a variety of tokenizers with a consistent interface, but many others exist for specific applications.
* **Languages other than English:** Some of our users have had success applying tidytext to their text mining needs for languages other than English but we are not covering those issues in this book.

We feel that the tidy data philosphy is a powerful tool to make handling data easier and more effective, and this is no less true when it comes to handling text. We also believe that the tools provided by tidy data principles and specifically tidy text mining are well suited to extensions beyond the examples we provide here.

## Acknowledgements

We are so thankful for the contributions, help, and perspective of people who have moved us forward in this project. There are several people and organizations we would like to thank in particular. We would like to thank Gabriela de Queiroz for her contributions to the package while we were at the unconference where we began work on the tidytext package, Lincoln Mullen for his work on the [tokenizers](https://github.com/ropensci/tokenizers) package, Kenneth Benoit for his work on the [quanteda](https://github.com/kbenoit/quanteda) package, and Hadley Wickham for his work in framing tidy data principles and building tidy tools. We would also like to thank [rOpenSci](https://ropensci.org/), which hosted us at the unconference where we began work, and the [NASA Datanauts](https://open.nasa.gov/explore/datanauts/) program, for the opportunities and support they have provided Julia during her time with them. 
