import Foundation

struct Process: Equatable {
    var location: Int
    var priority: Int
}

struct Queue {
    var enqueue: [Process] = []
    var dequeue: [Process] = []
    
    var queue: [Process] { dequeue + enqueue }
    
    mutating func push(_ item: Process) {
        enqueue.append(item)
    }
    
    mutating func pop() -> Process? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = Queue()
    var count = 0
    
    priorities.enumerated().forEach { 
        queue.push(Process(location: $0.offset, priority: $0.element))
    }
    
    while !queue.queue.isEmpty {
        let current = queue.pop()!
        let isExist = queue.queue.contains { $0.priority > current.priority }
        if isExist {
            queue.push(current)
        } else {
            count += 1
            if current.location == location {
                return count
            }
        }
    }
    
    return count
}