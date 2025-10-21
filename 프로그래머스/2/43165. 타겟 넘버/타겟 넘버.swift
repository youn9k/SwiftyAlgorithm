import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
   
    // DFS -> 재귀
    // BFS -> 이중포문 + 큐
    var result = 0
    // + -> + -> + -> + = target? 
    // + -> + -> + -> - = target?
    

    dfs(numbers, target, 0, 0, true, &result)
    dfs(numbers, target, 0, 0, false, &result)
    
    
    return result
}

func dfs(_ numbers: [Int], _ target: Int, _ sum: Int, _ depth: Int, _ isPlus: Bool, _ result: inout Int) {
    
    // 중단조건: depth 끝에 도달하면 target과 비교
    if depth == numbers.count - 1 { // 2 == 2
        let `final` = isPlus ? sum + numbers[depth] : sum - numbers[depth]
        if target == `final` {
            result += 1
        }
        return 
    }
    
    // depth마다 이전 결과에 현재 값을 더하기
    let sum = isPlus ? sum + numbers[depth] : sum - numbers[depth]
        
    // 진행방향 depth(0부터 numbers.count-1까지) 방향으로 진행
    dfs(numbers, target, sum, depth + 1, true, &result)
    dfs(numbers, target, sum, depth + 1, false, &result)
}

