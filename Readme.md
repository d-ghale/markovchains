# markovchains

_Prediction of an event N based on previous (N-1) events_

Yes. That is right. I can see the future and I can read your mind. 

Actually, I can't... but Markov can.

To [try it](https://jfaleiro.shinyapps.io/markovchains/), just type a sentence in English on the first form on the top. We will provide a list of words that you might be typing next (we can indeed read your mind). You can also make a selection of the word on the form and keep typing. 

On the right you will see a distribution of the alternatives we found so far. The (_kinda_ exponential) distribution is a visual description of how certain we are about each of your possible future choices.

This is a demonstration of the use of Markov Chains for the prediction of sequenced events. This type of prediction assumes that a probability of an event ocurring at time $T = t$ is affected by previous events  occurring from $T = 0$ to $T = t-1$. 

This techinique is used on several domains like genetic sequencing, speech recognition (this notable example here) and my favorite: prediction of the next price tick in financial time series and random walks. 

If you are looking for details, the data analysis leading to this prototype is described in a [separate report](http://rpubs.com/jfaleiro/text-prediction-preliminary-analysis). You can also refer to a [set of slides](http://rpubs.com/jfaleiro/markovchains) describing the background and the overal structure of this exercise.

Have fun!