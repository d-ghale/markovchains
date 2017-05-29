Markov Chains
========================================================
author: J Faleiro
date: Jul 18 2016
autosize: true

Predicting Sequencing of Events using Sample Data and Markov Chains

This Case Study
========================================================

On this case study we leverage a corpus of about 100 million words, extracted from different media:

- Twitter: 160Mb, 30M words
- Blogs: 200Mb, 37M words
- News: 196Mb, 34M words

We develop a model to predict the next word you will type, in real-time, based on Markov Chains.

This model is based on the assumption that the probability of a word depends on previous words already in a sentence (a Markov assumption). Markov models are the class of probabilistic models that assume we can predict the probability of some future unit without looking too far into the past.[1]

Process
========================================================

Challenges

- Relativelly large amount of data, given the available platform for this exercise
- Required real time response, interactive utilization

Findings

- There is a substantial difference in the structure of the sentence and as a consequence sample error level depending on the source of the data. 
- Increasing N for n-grams greater than 4 did not change the sample error level.
- Increasing the sampling rate reduced substantially the sample error level. 
- For samples rates above 30% we saw degradation in performance without a noticeable change in the sample error level


Method
========================================================

- Random sampling of the original data, to about 30% of the original data
- Parsing of n-grams, and assembly of markov chains. 
- For each sentence $s$ we calculate the conditional probability of word $w$ by approximation to 

$P(w|s) = C(paste(s,w)) / C(s)$ 

where $P(A|B)$ is a conditional probability of A given B and $paste(s_1, s_2, ..., s_n)$ is a string concatenation function
- This conditional probability provides the fitness for each word given previous words already in the sentence
- Arrange each dataset for a N-gram N separatelly, and depending on the size of sentence, we select the few small items with greater fitness on that dataset
- On there are no relevant choices we back off to a $(N-1)gram$ dataset, and append the options from there
- These items are presented to the user, that can then either continue typing, or select one of the alternatives already presented.


Conclusion
========================================================
Future Work
- Add filtering for words that are not appropriate
- Look into alternatives that would consider semantics of words within a sentence as additional features

Go ahead, give it a try (the app takes about 30 seconds to load, **please be patient**)

https://jfaleiro.shinyapps.io/markovchains/

References
- [1] Speech and Language Processing, Jurafsky and Martn, (c) 2014 - https://lagunita.stanford.edu/c4x/Engineering/CS-224N/asset/slp4.pdf

