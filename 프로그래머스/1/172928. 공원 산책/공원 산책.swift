import Foundation

struct Position {
    var y: Int
    var x: Int
    init(y: Int, x: Int) { self.y = y; self.x = x }
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    // let dy = [-1, 0, 1, 0]
    // let dx = [0, 1, 0, -1]
    
    var map: [[String]] = []
    var currentPos: Position = Position(y: 0, x: 0)
    var ops: [(String, Int)] = []
    
    for y in 0..<park.count {
        let row = Array(park[y]).map { String($0) }
        for x in 0..<row.count {
            if row[x] == "S" { currentPos = Position(y: y, x: x) }
        }
        map.append(row)
    }
    
    ops = routes.map { 
        ($0.components(separatedBy: " ")[0], 
         Int($0.components(separatedBy: " ")[1])!)
    }
    
    print(ops)
    
    for op in ops {
        let dir = op.0 // 이동 방향
        let dist = op.1 // 이동 칸 수
        
        var ny: Int
        var nx: Int
        
        switch dir {
        case "N":
            ny = currentPos.y - dist
            nx = currentPos.x
        case "E":
            ny = currentPos.y
            nx = currentPos.x + dist
        case "S":
            ny = currentPos.y + dist
            nx = currentPos.x
        case "W":
            ny = currentPos.y
            nx = currentPos.x - dist
        default:
            ny = currentPos.y
            nx = currentPos.x
            continue
        }
        
        // 현재 위치에서 이동 방향으로 칸 수만큼 탐색
        // 장애물도 없고, 벗어나지 않으면 현재 위치 이동
        //if isOutMap(map, currentPos, ny, nx) { break }
        if isBlocked(map, currentPos, dir, dist) { continue }
            
        // 현재 위치 이동
        currentPos = Position(y: ny, x: nx)
        print(currentPos)
    }
    
    return [currentPos.y, currentPos.x]
}

func isOutMap(_ park: [[String]], _ currentPos: Position, _ ny: Int, _ nx: Int) -> Bool {
    return currentPos.y < 0 
    || currentPos.y >= park.count 
    || currentPos.x < 0 
    || currentPos.x >= park[0].count
}

func isBlocked(_ park: [[String]], _ currentPos: Position, _ dir: String, _ dist: Int) -> Bool {
    if dist <= 0 { return false }

    let h = park.count
    let w = park.first?.count ?? 0
    
    let (dy, dx): (Int, Int)
    switch dir {
    case "N": (dy, dx) = (-1, 0)
    case "E": (dy, dx) = (0, 1)
    case "S": (dy, dx) = (1, 0)
    case "W": (dy, dx) = (0, -1)
    default:
        return true // 알 수 없는 방향이면 이동 불가로 간주
    }

    for step in 1...dist {
        let ny = currentPos.y + dy * step
        let nx = currentPos.x + dx * step

        // 1) 먼저 경계 체크
        if ny < 0 || ny >= h || nx < 0 || nx >= w {
            return true
        }
        // 2) 그 다음 장애물 체크
        if park[ny][nx] == "X" {
            return true
        }
    }

    return false
}