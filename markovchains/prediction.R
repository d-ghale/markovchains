library(ngram)
library(ggplot2)

predictNextWord <- function(sentence, prefix, top=7) {
    cat(file=stderr(), sprintf("predict: sentence='%s', prefix='%s', top=%d\n", sentence, prefix, top))
    lastNWords <- function(s, n) {
        paste(tail(strsplit(sentence, split=' ')[[1]], n), collapse=' ')
    }
    sentence <- gsub('\\s+', ' ', sentence)
    words <- wordcount(sentence)
    dfsIndex <- min(words+1, length(dfs))
    df <- dfs[[dfsIndex]] # weirdness part 2, use [[]]...
    relevantSentence <- lastNWords(sentence, dfsIndex-1) 
    if (prefix != '' && relevantSentence == '') {
        re <- paste0('^', prefix)
    } else if (prefix != '' && relevantSentence != '') {
        re <- paste(paste0('^', relevantSentence), prefix)
    } else if (prefix == '' && relevantSentence != '') {
        re <- paste0('^', relevantSentence, ' ')
    } else { # prefix == '' && relevantSentence == ''
        re <- '^'
    }
    cat(file=stderr(), sprintf("relevantSentence='%s', dfsIndex=%d, re='%s'\n", relevantSentence, dfsIndex, re))
    result <- head(df[grep(re, df$ngrams),], top)
    if (nrow(result) < top & words > 0) {
        # back track with (n-1)-gram for alternative using recursion
        backTrackSentence <- lastNWords(relevantSentence, wordcount(relevantSentence) - 1)
        backTrackResults <- predictNextWord(backTrackSentence, prefix, top)
        result <- head(rbind(result, backTrackResults), top)
    }
    result
}

endsWith <- function(s, ends) {
    grepl(paste0(ends,'$'), s)
}

parseUserInput <- function(userInput) {
    cat(file=stderr(), sprintf("userInput='%s'\n",userInput))
    if (userInput == "") {
        sentence <- ""
        prefix <- ""
    } else if (endsWith(userInput, " ")) {
        sentence <- trimws(userInput, "right")
        prefix <- ''
    } else {
        # R hack, strsplit results in a list...
        words <- unlist(strsplit(userInput, ' '))
        # R hack, forcing a string type for empty userInput
        if (length(words) > 1) {
            # while the reverse of strsplit expects a sequence... ugh
            sentence <- paste(words[1:length(words)-1]) 
        } else {
            sentence <- ''
        }
        prefix <- words[length(words)]
    }
    list(sentence=sentence, prefix=prefix)
}

