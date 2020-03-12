#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

    const void * initializeFastTextObject();

    void fasttextLoadModel(const void *object, const char* path);
    void fasttextSaveModel(const void *object, const char* path);
    void fasttextTrainModel(const void *object, const char* input, const char* model,
                            const int dim, const int epoch,
                            const float lr, const int ws, const int minCount,
                            const int minn, const int maxn, const int neg,
                            const int wordNgrams, const int thread);

    int fasttextgetDimension(const void *object);

    void fasttextgetSentenceVector(const void *object, const char* sentence, float* sentenceVector);
    void fasttextgetWordVector(const void *object, const char* word, float* wordVector);

#ifdef __cplusplus
}
#endif
