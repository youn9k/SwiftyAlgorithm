import Foundation

func solution(_ s:String) -> Int {
    var result = 0
    let str = Array(s)
    var countDict: [String: Int] = [:]
    
    var x: String = ""
    
    for i in 0..<str.count {
        if countDict[x] == nil {
            x = String(str[i])
            countDict[x] = 1
        } else {
             let other = String(str[i])
            if other == x {
                countDict[x] = (countDict[x] ?? 0) + 1    
            } else {
                countDict["other"] = (countDict["other"] ?? 0) + 1
            }
            
            if countDict[x] == countDict["other"] {
                result += 1
                x = ""
                countDict[x] = nil
                countDict["other"] = nil
            }
        }
        // print(countDict, result)
    }
    if countDict[x] != nil {
        result += 1
    }
    
    return result
}