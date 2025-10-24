func solution(_ dartResult:String) -> Int {
    let arr = Array(dartResult).map { String($0) }
    var scores: [Int] = .init(repeating: 0, count: arr.count)
    var round = 0

    for i in 0..<arr.count {
        if arr[i] == "0" && scores[round] == 1 { // 10 예외처리
            scores[round] *= 10
        } 
        else if isNumber(arr[i]) {
            scores[round] = Int(arr[i])!
        } 
        else if isBonus(arr[i]) {
            scores[round] = myPow(scores[round], powCount(arr[i]))
            if i+1 < arr.count {
                if isNumber(arr[i+1]) {
                    round += 1
                }
            }
        } 
        else if isOption(arr[i]) {
            let val = optionValue(arr[i])
            if round > 0 && arr[i] == "*" {
                scores[round-1] = scores[round-1] * val 
            }
            scores[round] = scores[round] * val
            round += 1
        }
    }
    
    return scores.reduce(0, +)
}

func myPow(_ s: Int, _ c: Int) -> Int {
    var result = 1
    for _ in 0..<c {
        result *= s
    }
    return result
}

func optionValue(_ s: String) -> Int {
    switch s {
    case "*": return 2
    case "#": return -1
    default: return 1
    }
}

func powCount(_ s: String) -> Int {
    switch s {
    case "S": return 1
    case "D": return 2
    case "T": return 3
    default: return 1
    }
}

func isNumber(_ s: String) -> Bool {
    return Int(s) != nil
}
    
func isBonus(_ s: String) -> Bool {
    return s == "S" || s == "D" || s == "T"
}

func isOption(_ s: String) -> Bool {
    return s == "*" || s == "#"
}
