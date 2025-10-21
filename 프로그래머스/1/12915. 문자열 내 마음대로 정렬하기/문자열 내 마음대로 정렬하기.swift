func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted { (prev, next) in
        let (prevArr, nextArr) = (Array(prev), Array(next))
        return prevArr[n] == nextArr[n] 
                ? prev < next
                : prevArr[n] < nextArr[n]
    }
}