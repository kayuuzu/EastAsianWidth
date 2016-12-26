extension String {
	private func width(of char: UInt32, ambiguous: Int) -> Int {
        if (char >= 0x0020 && char <= 0x007E) {
            return 1    //Narrow
        } 

        if char == 0x3000 ||
           (char >= 0xFF01 && char <= 0xFF60) ||
           (char >= 0xFFE0 && char <= 0xFFE6) {
            return 2    //Fullwidth
        }

        if char == 0x20A9 ||
           (char >= 0xFF61 && char <= 0xFFBE) ||
           (char >= 0xFFC2 && char <= 0xFFC7) ||
           (char >= 0xFFCA && char <= 0xFFCF) ||
           (char >= 0xFFD2 && char <= 0xFFD7) ||
           (char >= 0xFFDA && char <= 0xFFDC) ||
           (char >= 0xFFE8 && char <= 0xFFEE) {
            return 1    //Halfwidth
        }

        if (char >= 0x1100 && char <= 0x115F) ||
           (char >= 0x231A && char <= 0x231B) ||
           (char >= 0x2329 && char <= 0x232A) ||
           (char >= 0x23E9 && char <= 0x23EC) ||
           char == 0x23F0 ||
           char == 0x23F3 ||
           (char >= 0x25FD && char <= 0x25FE) ||
           (char >= 0x2614 && char <= 0x2615) ||
           (char >= 0x2648 && char <= 0x2653) ||
           char == 0x267F ||
           char == 0x2693 ||
           char == 0x26A1 ||
           (char >= 0x26AA && char <= 0x26AB) ||
           (char >= 0x26BD && char <= 0x26BE) ||
           (char >= 0x26C4 && char <= 0x26C5) ||
           char == 0x26CE ||
           char == 0x26D4 ||
           char == 0x26EA ||
           (char >= 0x26F2 && char <= 0x26F3) ||
           char == 0x26F5 ||
           char == 0x26FA ||
           char == 0x26FD ||
           char == 0x2705 ||
           (char >= 0x270A && char <= 0x270B) ||
           char == 0x2728 ||
           char == 0x274C ||
           char == 0x274E ||
           (char >= 0x2753 && char <= 0x2755) ||
           char == 0x2757 ||
           (char >= 0x2795 && char <= 0x2797) ||
           char == 0x27B0 ||
           char == 0x27BF ||
           (char >= 0x2B1B && char <= 0x2B1C) ||
           char == 0x2B50 ||
           char == 0x2B55 ||
           (char >= 0x2E80 && char <= 0x2E99) ||
           (char >= 0x2E9B && char <= 0x2EF3) ||
           (char >= 0x2F00 && char <= 0x2FD5) ||
           (char >= 0x2FF0 && char <= 0x2FFB) ||
           (char >= 0x3001 && char <= 0x303E) ||
           (char >= 0x3041 && char <= 0x3096) ||
           (char >= 0x3099 && char <= 0x30FF) ||
           (char >= 0x3105 && char <= 0x312D) ||
           (char >= 0x3131 && char <= 0x318E) ||
           (char >= 0x3190 && char <= 0x31BA) ||
           (char >= 0x31C0 && char <= 0x31E3) ||
           (char >= 0x31F0 && char <= 0x321E) ||
           (char >= 0x3220 && char <= 0x3247) ||
           (char >= 0x3250 && char <= 0x32FE) ||
           (char >= 0x3300 && char <= 0x4DBF) ||
           (char >= 0x4E00 && char <= 0xA48C) ||
           (char >= 0xA490 && char <= 0xA4C6) ||
           (char >= 0xA960 && char <= 0xA97C) ||
           (char >= 0xAC00 && char <= 0xD7A3) ||
           (char >= 0xF900 && char <= 0xFAFF) ||
           (char >= 0xFE10 && char <= 0xFE19) ||
           (char >= 0xFE30 && char <= 0xFE52) ||
           (char >= 0xFE54 && char <= 0xFE66) ||
           (char >= 0xFE68 && char <= 0xFE6B) ||
           char == 0x16FE0 ||
           (char >= 0x17000 && char <= 0x187EC) ||
           (char >= 0x18800 && char <= 0x18AF2) ||
           (char >= 0x1B000 && char <= 0x1B001) ||
           char == 0x1F004 ||
           char == 0x1F0CF ||
           char == 0x1F18E ||
           (char >= 0x1F191 && char <= 0x1F19A) ||
           (char >= 0x1F200 && char <= 0x1F202) ||
           (char >= 0x1F210 && char <= 0x1F23B) ||
           (char >= 0x1F240 && char <= 0x1F248) ||
           (char >= 0x1F250 && char <= 0x1F251) ||
           (char >= 0x1F300 && char <= 0x1F320) ||
           (char >= 0x1F32D && char <= 0x1F335) ||
           (char >= 0x1F337 && char <= 0x1F37C) ||
           (char >= 0x1F37E && char <= 0x1F393) ||
           (char >= 0x1F3A0 && char <= 0x1F3CA) ||
           (char >= 0x1F3CF && char <= 0x1F3D3) ||
           (char >= 0x1F3E0 && char <= 0x1F3F0) ||
           char == 0x1F3F4 ||
           (char >= 0x1F3F8 && char <= 0x1F43E) ||
           char == 0x1F440 ||
           (char >= 0x1F442 && char <= 0x1F4FC) ||
           (char >= 0x1F4FF && char <= 0x1F53D) ||
           (char >= 0x1F54B && char <= 0x1F54E) ||
           (char >= 0x1F550 && char <= 0x1F567) ||
           char == 0x1F57A ||
           (char >= 0x1F595 && char <= 0x1F596) ||
           char == 0x1F5A4 ||
           (char >= 0x1F5FB && char <= 0x1F64F) ||
           (char >= 0x1F680 && char <= 0x1F6C5) ||
           char == 0x1F6CC ||
           (char >= 0x1F6D0 && char <= 0x1F6D2) ||
           (char >= 0x1F6EB && char <= 0x1F6EC) ||
           (char >= 0x1F6F4 && char <= 0x1F6F6) ||
           (char >= 0x1F910 && char <= 0x1F91E) ||
           (char >= 0x1F920 && char <= 0x1F927) ||
           char == 0x1F930 ||
           (char >= 0x1F933 && char <= 0x1F93E) ||
           (char >= 0x1F940 && char <= 0x1F94B) ||
           (char >= 0x1F950 && char <= 0x1F95E) ||
           (char >= 0x1F980 && char <= 0x1F991) ||
           char == 0x1F9C0 ||
           (char >= 0x20000 && char <= 0x2FFFD) ||
           (char >= 0x30000 && char <= 0x3FFFD) {
        	return 2    //Wide
        }
        
        if (char >= 0x00A2 && char <= 0x00A3) ||
           (char >= 0x00A5 && char <= 0x00A6) ||
           char == 0x00AC ||
           char == 0x00AF ||
           (char >= 0x27E6 && char <= 0x27ED) ||
           (char >= 0x2985 && char <= 0x2986) {
            return 1    //Narrow
        }
        
        if char == 0x00A1 ||
           char == 0x00A4 ||
           (char >= 0x00A7 && char <= 0x00A8) ||
           char == 0x00AA ||
           (char >= 0x00AD && char <= 0x00AE) ||
           (char >= 0x00B0 && char <= 0x00B4) ||
           (char >= 0x00B6 && char <= 0x00BA) ||
           (char >= 0x00BC && char <= 0x00BF) ||
           char == 0x00C6 ||
           char == 0x00D0 ||
           (char >= 0x00D7 && char <= 0x00D8) ||
           (char >= 0x00DE && char <= 0x00E1) ||
           char == 0x00E6 ||
           (char >= 0x00E8 && char <= 0x00EA) ||
           (char >= 0x00EC && char <= 0x00ED) ||
           char == 0x00F0 ||
           (char >= 0x00F2 && char <= 0x00F3) ||
           (char >= 0x00F7 && char <= 0x00FA) ||
           char == 0x00FC ||
           char == 0x00FE ||
           char == 0x0101 ||
           char == 0x0111 ||
           char == 0x0113 ||
           char == 0x011B ||
           (char >= 0x0126 && char <= 0x0127) ||
           char == 0x012B ||
           (char >= 0x0131 && char <= 0x0133) ||
           char == 0x0138 ||
           (char >= 0x013F && char <= 0x0142) ||
           char == 0x0144 ||
           (char >= 0x0148 && char <= 0x014B) ||
           char == 0x014D ||
           (char >= 0x0152 && char <= 0x0153) ||
           (char >= 0x0166 && char <= 0x0167) ||
           char == 0x016B ||
           char == 0x01CE ||
           char == 0x01D0 ||
           char == 0x01D2 ||
           char == 0x01D4 ||
           char == 0x01D6 ||
           char == 0x01D8 ||
           char == 0x01DA ||
           char == 0x01DC ||
           char == 0x0251 ||
           char == 0x0261 ||
           char == 0x02C4 ||
           char == 0x02C7 ||
           (char >= 0x02C9 && char <= 0x02CB) ||
           char == 0x02CD ||
           char == 0x02D0 ||
           (char >= 0x02D8 && char <= 0x02DB) ||
           char == 0x02DD ||
           char == 0x02DF ||
           (char >= 0x0300 && char <= 0x036F) ||
           (char >= 0x0391 && char <= 0x03A1) ||
           (char >= 0x03A3 && char <= 0x03A9) ||
           (char >= 0x03B1 && char <= 0x03C1) ||
           (char >= 0x03C3 && char <= 0x03C9) ||
           char == 0x0401 ||
           (char >= 0x0410 && char <= 0x044F) ||
           char == 0x0451 ||
           char == 0x2010 ||
           (char >= 0x2013 && char <= 0x2016) ||
           (char >= 0x2018 && char <= 0x2019) ||
           (char >= 0x201C && char <= 0x201D) ||
           (char >= 0x2020 && char <= 0x2022) ||
           (char >= 0x2024 && char <= 0x2027) ||
           char == 0x2030 ||
           (char >= 0x2032 && char <= 0x2033) ||
           char == 0x2035 ||
           char == 0x203B ||
           char == 0x203E ||
           char == 0x2074 ||
           char == 0x207F ||
           (char >= 0x2081 && char <= 0x2084) ||
           char == 0x20AC ||
           char == 0x2103 ||
           char == 0x2105 ||
           char == 0x2109 ||
           char == 0x2113 ||
           char == 0x2116 ||
           (char >= 0x2121 && char <= 0x2122) ||
           char == 0x2126 ||
           char == 0x212B ||
           (char >= 0x2153 && char <= 0x2154) ||
           (char >= 0x215B && char <= 0x215E) ||
           (char >= 0x2160 && char <= 0x216B) ||
           (char >= 0x2170 && char <= 0x2179) ||
           char == 0x2189 ||
           (char >= 0x2190 && char <= 0x2199) ||
           (char >= 0x21B8 && char <= 0x21B9) ||
           char == 0x21D2 ||
           char == 0x21D4 ||
           char == 0x21E7 ||
           char == 0x2200 ||
           (char >= 0x2202 && char <= 0x2203) ||
           (char >= 0x2207 && char <= 0x2208) ||
           char == 0x220B ||
           char == 0x220F ||
           char == 0x2211 ||
           char == 0x2215 ||
           char == 0x221A ||
           (char >= 0x221D && char <= 0x2220) ||
           char == 0x2223 ||
           char == 0x2225 ||
           (char >= 0x2227 && char <= 0x222C) ||
           char == 0x222E ||
           (char >= 0x2234 && char <= 0x2237) ||
           (char >= 0x223C && char <= 0x223D) ||
           char == 0x2248 ||
           char == 0x224C ||
           char == 0x2252 ||
           (char >= 0x2260 && char <= 0x2261) ||
           (char >= 0x2264 && char <= 0x2267) ||
           (char >= 0x226A && char <= 0x226B) ||
           (char >= 0x226E && char <= 0x226F) ||
           (char >= 0x2282 && char <= 0x2283) ||
           (char >= 0x2286 && char <= 0x2287) ||
           char == 0x2295 ||
           char == 0x2299 ||
           char == 0x22A5 ||
           char == 0x22BF ||
           char == 0x2312 ||
           (char >= 0x2460 && char <= 0x24E9) ||
           (char >= 0x24EB && char <= 0x254B) ||
           (char >= 0x2550 && char <= 0x2573) ||
           (char >= 0x2580 && char <= 0x258F) ||
           (char >= 0x2592 && char <= 0x2595) ||
           (char >= 0x25A0 && char <= 0x25A1) ||
           (char >= 0x25A3 && char <= 0x25A9) ||
           (char >= 0x25B2 && char <= 0x25B3) ||
           (char >= 0x25B6 && char <= 0x25B7) ||
           (char >= 0x25BC && char <= 0x25BD) ||
           (char >= 0x25C0 && char <= 0x25C1) ||
           (char >= 0x25C6 && char <= 0x25C8) ||
           char == 0x25CB ||
           (char >= 0x25CE && char <= 0x25D1) ||
           (char >= 0x25E2 && char <= 0x25E5) ||
           char == 0x25EF ||
           (char >= 0x2605 && char <= 0x2606) ||
           char == 0x2609 ||
           (char >= 0x260E && char <= 0x260F) ||
           char == 0x261C ||
           char == 0x261E ||
           char == 0x2640 ||
           char == 0x2642 ||
           (char >= 0x2660 && char <= 0x2661) ||
           (char >= 0x2663 && char <= 0x2665) ||
           (char >= 0x2667 && char <= 0x266A) ||
           (char >= 0x266C && char <= 0x266D) ||
           char == 0x266F ||
           (char >= 0x269E && char <= 0x269F) ||
           char == 0x26BF ||
           (char >= 0x26C6 && char <= 0x26CD) ||
           (char >= 0x26CF && char <= 0x26D3) ||
           (char >= 0x26D5 && char <= 0x26E1) ||
           char == 0x26E3 ||
           (char >= 0x26E8 && char <= 0x26E9) ||
           (char >= 0x26EB && char <= 0x26F1) ||
           char == 0x26F4 ||
           (char >= 0x26F6 && char <= 0x26F9) ||
           (char >= 0x26FB && char <= 0x26FC) ||
           (char >= 0x26FE && char <= 0x26FF) ||
           char == 0x273D ||
           (char >= 0x2776 && char <= 0x277F) ||
           (char >= 0x2B56 && char <= 0x2B59) ||
           (char >= 0x3248 && char <= 0x324F) ||
           (char >= 0xE000 && char <= 0xF8FF) ||
           (char >= 0xFE00 && char <= 0xFE0F) ||
           char == 0xFFFD ||
           (char >= 0x1F100 && char <= 0x1F10A) ||
           (char >= 0x1F110 && char <= 0x1F12D) ||
           (char >= 0x1F130 && char <= 0x1F169) ||
           (char >= 0x1F170 && char <= 0x1F18D) ||
           (char >= 0x1F18F && char <= 0x1F190) ||
           (char >= 0x1F19B && char <= 0x1F1AC) ||
           (char >= 0xE0100 && char <= 0xE01EF) ||
           (char >= 0xF0000 && char <= 0xFFFFD) ||
           (char >= 0x100000 && char <= 0x10FFFD) {
            return ambiguous    //Ambiguous
        }

        return 1    //Neutral
    }

    func eastAsianLength(ambiguousWidth: Int = 2) -> Int {
        //return self.unicodeScalars.map({width(of: $0.value, ambiguous: ambiguousWidth)}).reduce(0, +)
        var len = 0
        for c in self.unicodeScalars {
            len += width(of: c.value, ambiguous: ambiguousWidth)
        }
        return len
    }
}


