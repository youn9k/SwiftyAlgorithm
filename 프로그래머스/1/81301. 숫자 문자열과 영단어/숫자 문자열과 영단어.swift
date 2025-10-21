import Foundation

extension String {
    var isNumber: Bool { Int(self) != nil }
}

// 딕셔너리 ["zero": 0]
let dict: [String: Int] = [
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
]

// func solution(_ s:String) -> Int {
//     let arr = Array(s)
//     var result: [Int] = []
//     var stack: [String] = []
    
//     for i in 0..<arr.count {
//         if arr[i].isNumber {
//             result.append(Int(String(arr[i]))!)
//         } else {
//             stack.append(String(arr[i]))
//             guard let num = dict[stack.joined()] else { continue }
//             stack.removeAll()
//             result.append(num)
//         }
//     }

//     return Int(result.map { String($0) }.joined())!
// }

func solution(_ s:String) -> Int {
    let nums = [
        "zero",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine"
    ]
    var str = s
    for i in 0..<nums.count {
        str = str.replacingOccurrences(of: nums[i], with: String(i))
    }
    return Int(str)!
}