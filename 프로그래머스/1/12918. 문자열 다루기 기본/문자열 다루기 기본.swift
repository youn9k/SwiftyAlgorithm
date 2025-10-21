func solution(_ s: String) -> Bool {
    return condition1(s) && condition2(s)
}

func condition1(_ s: String) -> Bool {
    return s.count == 4 || s.count == 6
}

func condition2(_ s: String) -> Bool {
    return Int(s) != nil
}
