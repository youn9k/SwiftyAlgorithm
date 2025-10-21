import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let tArr = Array(t)
    let pInt = Int(p)!
    var result = 0
    
    for i in 0...(tArr.count - p.count) {
        let str = tArr[i..<i+p.count]
        let num = Int(String(str))!
        
        if num <= pInt { result += 1 }
    }
    
    return result
}