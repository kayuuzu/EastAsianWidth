# EastAsianWidth

A swift implementation of [East Asian Width](http://www.unicode.org/reports/tr11/) caculator for String, according to [EastAsianWidth.txt](http://www.unicode.org/Public/9.0.0/ucd/EastAsianWidth.txt) from [UCD](http://www.unicode.org/ucd/) 9.0.

## Usage

``` swift
import EastAsianWidth
print("\u{6771}".eastAsianLength())	//"東" is Wide, so it will print 2
```

Take a look at [EastAsianWidthTests.swift](Tests/EastAsianWidthTests/EastAsianWidthTests.swift) for the other cases.
