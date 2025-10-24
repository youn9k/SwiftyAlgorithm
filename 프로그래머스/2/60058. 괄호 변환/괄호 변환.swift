import Foundation

func solution(_ p:String) -> String {
    return dfs(p)
}

func dfs(_ w: String) -> String {
    if w.isEmpty { return "" }
    var (u, v) = split(w)
    if isCorrect(u) {
        return u + dfs(v)
    } else {
        var empty = "(" + dfs(v) + ")"
        u.removeFirst()
        u.removeLast()
        let rev = u.map { $0 == "(" ? ")": "(" }.joined()
        empty.append(rev)
        return empty
    }
}

func isCorrect(_ u: String) -> Bool {
    var stack = [String]()    
    let str = Array(u).map { String($0) }
    
    for i in 0..<u.count {
        if str[i] == "(" {
            stack.append(str[i])
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.popLast()!
            }
        }
    }
    
    return true
}

func split(_ p: String) -> (String, String) {
    var stack = Array(p.reversed()).map { String($0) }
    
    var (left, right) = (0, 0)
    var (u, v) = ("", "")
    
    for i in 0..<stack.count {
        let item = stack.popLast()!
        if item == "(" {
            left += 1
            u.append(item)
        } else {
            right += 1
            u.append(item)
        }
        if left == right { 
            v = String(stack.joined().reversed())
            return (u, v)
        }
    }
    return ("", "")
}