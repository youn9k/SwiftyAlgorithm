import Foundation

// 정답 체스판
var correctBoard1: [[String]] = []
var correctBoard2: [[String]] = []

for _ in 0..<4 {
    correctBoard1.append(["B", "W", "B", "W", "B", "W", "B", "W"])
    correctBoard1.append(["W", "B", "W", "B", "W", "B", "W", "B"])
    correctBoard2.append(["W", "B", "W", "B", "W", "B", "W", "B"])
    correctBoard2.append(["B", "W", "B", "W", "B", "W", "B", "W"])
}

let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var board: [[String]] = []
var result = 32 // 8x8에서 전부 다 바꾸는 경우

for _ in 0..<N {
    let row = readLine()!.map{ String($0) }
    board.append(row)
}

// i, j는 8x8 의 시작지점 // k, l은 시작지점부터 8칸
for i in 0...(N - 8) {
    for j in 0...(M - 8) {
        var correctCount1 = 0 // 맞은 갯수
        var correctCount2 = 0 // 맞은 갯수
        
        for k in i..<(i + 8) {
            for l in j..<(j + 8) {
                if board[k][l] == correctBoard1[k-i][l-j] {
                    correctCount1 += 1
                }
                if board[k][l] == correctBoard2[k-i][l-j] {
                    correctCount2 += 1
                }
            }
        }
        // 작은 숫자가 곧 다시 칠해야 하는 갯수 중 최솟값
        result = min(result, (correctCount1 < correctCount2 ? correctCount1 : correctCount2))
    }
}

print(result)
