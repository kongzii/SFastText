#include "include/CFastText.hpp"
#include "FastText/fasttext.h"
#include <string>
#include <sstream>
#include <iostream>


const void * initializeFastTextObject() {
    auto ft = new fasttext::FastText();
    return (void *)ft;
}

void fasttextLoadModel(const void *object, const char* path) {
    auto ft = (fasttext::FastText *)object;
    ft->loadModel(path);
}

void fasttextSaveModel(const void *object, const char* path) {
    auto ft = (fasttext::FastText *)object;
    ft->saveModel(path);
}

void fasttextTrainModel(const void *object, const char* input, const char* model,
                        const int dim, const int epoch,
                        const float lr, const int ws, const int minCount,
                        const int minn, const int maxn, const int neg,
                        const int wordNgrams, const int thread) {
    auto ft = (fasttext::FastText *)object;
    auto args = fasttext::Args();
    auto modelstring = std::string(model);
    
    args.input = std::string(input);

    if (modelstring == "skipgram") {
        args.model = fasttext::model_name::sg;
    } else if (modelstring == "cbow") {
        args.model = fasttext::model_name::cbow;
    }

    args.dim = dim;
    args.epoch = epoch;
    args.lr = lr;
    args.ws = ws;
    args.minCount = minCount;
    args.minn = epoch;
    args.maxn = maxn;
    args.neg = neg;
    args.wordNgrams = wordNgrams;
    args.thread = thread;

    ft->train(args);
}

int fasttextgetDimension(const void *object) {
    auto ft = (fasttext::FastText *)object;
    return ft->getDimension();
}

void fasttextgetSentenceVector(const void *object, const char* sentence, float* sentenceVector) {
    auto ft = (fasttext::FastText *)object;
    fasttext::Vector svec(ft->getDimension());
    std::string mystring(sentence);
    std::istringstream is(mystring);

    ft->getSentenceVector(is, svec);

    for (int i=0; i<svec.size(); i++) {
        sentenceVector[i] = (float)svec[i];
    }
}

void fasttextgetWordVector(const void *object, const char* word, float* wordVector) {
    auto ft = (fasttext::FastText *)object;
    fasttext::Vector svec(ft->getDimension());
    std::string wordstring(word);

    ft->getWordVector(svec, wordstring);

    for (int i=0; i<svec.size(); i++) {
        wordVector[i] = (float)svec[i];
    }
}
