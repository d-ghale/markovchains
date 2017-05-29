cat(file=stderr(), paste("server from", getwd(), "\n"))
cat(file=stderr(), paste("data: ", list.files("data"), "\n"))

cat(file=stderr(), "reading ngrams-1", "\n")
df.1 <- readRDS('data/ngrams-1.rds')

cat(file=stderr(), "reading ngrams-2", "\n")
df.2 <- readRDS('data/ngrams-2.rds')

#cat(file=stderr(), "reading ngrams-2", "\n")
#df.3 <- readRDS('data/ngrams-3.rds')

#cat(file=stderr(), "reading ngrams-4", "\n")
#df.4 <- readRDS('data/ngrams-4.rds')

#dfs <- list(df.1, df.2, df.3, df.4)
#dfs <- list(df.1, df.2, df.3)
dfs <- list(df.1, df.2)

