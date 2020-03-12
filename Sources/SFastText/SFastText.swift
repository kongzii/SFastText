import Foundation
import CFastText

public class SFastText {
    fileprivate let fastTextObject: UnsafeMutableRawPointer

    public var dimension: Int {
        return Int(CFastText.fasttextgetDimension(fastTextObject)) 
    }

    public init() {
        self.fastTextObject = UnsafeMutableRawPointer(mutating: CFastText.initializeFastTextObject())
    }
    
    public convenience init(model: String) {
        self.init()
        load(from: model)
    }

    public func load(from file: String) {
        var cPath = file.cString(using: .utf8)!
        CFastText.fasttextLoadModel(fastTextObject, &cPath);    
    }

    public func save(to file: String) {
        var cPath = file.cString(using: .utf8)!
        CFastText.fasttextSaveModel(fastTextObject, &cPath);  
    }

    public func train(_ input: String, dim: Int, epoch: Int, 
                      model: String = "skipgram", 
                      lr: Float = 0.12, ws: Int = 5, minCount: Int = 1, 
                      minn: Int = 2, maxn: Int = 3, neg: Int = 15, wordNgrams: Int = 5, thread: Int = 32) {
        var cInput = input.cString(using: .utf8)!
        var cModel = model.cString(using: .utf8)!

        CFastText.fasttextTrainModel(fastTextObject, &cInput, &cModel, Int32(dim), Int32(epoch),
                                     Float(lr), Int32(ws), Int32(minCount),  Int32(minn), Int32(maxn), 
                                     Int32(neg), Int32(wordNgrams), Int32(thread))
    }
    
    public func vector(word: String) -> [Float] {
        var cWord = word.cString(using: .utf8)!
        var wordVector = [Float](repeating: 0.0, count: dimension)

        CFastText.fasttextgetWordVector(fastTextObject, &cWord, &wordVector);    

        return wordVector
    }

    public func vector(sentence: String) -> [Float] {
        var cSentence = sentence.cString(using: .utf8)!
        var sentenceVector = [Float](repeating: 0.0, count: dimension)

        CFastText.fasttextgetSentenceVector(fastTextObject, &cSentence, &sentenceVector);    

        return sentenceVector
    }

    // public func getEmbedding(itos: [Int: String]) -> Embedding<Float> {
    //     var embeddings = [Float](repeating: 0.0, count: dimension)

    //     for index in 1 ... itos.count {
    //         embeddings.append(contentsOf: [Float](self.vector(word: itos[index]))!)
    //     }

    //     let vocabularySize = 1 + itos.count

    //     var embedding = Embedding<Float>(vocabularySize: vocabularySize, embeddingSize: self.dimension)
    //     embedding.embeddings = Tensor<Float>(shape: TensorShape([vocabularySize, self.dimension]), scalars: embeddings)

    //     return embedding
    // }
}

