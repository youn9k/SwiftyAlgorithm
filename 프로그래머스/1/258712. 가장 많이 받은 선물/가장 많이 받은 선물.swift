import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var dict: [String: [String: Int]] = [:] // 선물 표 (준사람: 받은사람)
    var dict2: [String: Int] = [:] // 선물 지수 (사람: 지수)
    var bonusDict: [String: Int] = [:] // 다음달 선물 갯수(사람: 갯수)
    
    for freind in friends {
        var list = dict[freind] ?? [:]
        for f in friends where f != freind { list[f] = 0 }
        dict[freind] = list
        dict2[freind] = 0
        bonusDict[freind] = 0
    }
    
    for gift in gifts {
        let ab = gift.components(separatedBy: " ")
        let (a, b) = (ab[0], ab[1])
        dict[a]![b]! += 1
        dict2[a]! += 1
        dict2[b]! -= 1
    }
    
    for me in friends {
        let list = dict[me]!
        for f in list {
            let myCount = dict[f.key]![me]!
            let fCount = f.value
            
            // 주고 받은 적이 없거나, 같으면 선물 지수 비교
            if (myCount == 0 && fCount == 0) || (myCount == fCount) {
                // 지수가 같으면 무효
                if dict2[me] == dict2[f.key] { continue }

                // 지수가 높은 사람한테 보너스
                if dict2[me]! > dict2[f.key]! {
                    bonusDict[me]! += 1
                }
            } 
            // 더 적게 받은(더 많이 준) 사람한테 보너스
            if myCount < fCount {
                bonusDict[me]! += 1    
            }
        }    
    }
    
    return bonusDict.values.sorted(by: >).first!
}