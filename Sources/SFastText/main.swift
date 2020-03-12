var fs = SFastText()
fs.train("bla.txt", dim: 10, epoch: 100)
fs.save(to: "fasttext.bin")

var fs2 = SFastText(model: "fasttext.bin")

print(fs2.dimension)
print(fs2.vector(sentence: "ahoj"))
print(fs2.vector(word: "ahoj"))
print(fs2.vector(word: "ahoj"))

