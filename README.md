# Moved

Please check https://github.com/kongzii/fastText for the latest version.
As a fork of official fastText, the library will be able to provide the latest features more easily.

# SFastText

FastText wrapper for Swift with latest version.

# Usage

Add dependency inside Package.swift:

```
.package(url: "https://github.com/kongzii/SFastText.git", .branch("master"))
```

Use:

```
import SFastText

var fs = SFastText()
fs.train("corpus.txt", dim: 10, epoch: 100)
fs.save(to: "fasttext.bin")

var fs2 = SFastText(model: "fasttext.bin")
print(fs2.dimension)
print(fs2.vector(word: "hello"))
```

# FastTest library

## Current version

Commit `231b871` in master branch.

## Upgrading

Copy `src` directory from https://github.com/facebookresearch/fastText into `Sources/CFastText/FastText` and remove `main.cc`.