extension String {
    func uppercasedIfEven() -> String {
        var result: [String] = []
        Array(self).enumerated().map { 
            $0.offset % 2 == 0 
            ? result.append($0.element.uppercased())
            : result.append($0.element.lowercased())
        }
        return result.joined()
    }
}

func solution(_ s:String) -> String {
    return s
    .components(separatedBy: " ") // ["try", "hello"]
    .map { $0.uppercasedIfEven() } // ["TrY", "HeLlO"]
    .joined(separator: " ")
}