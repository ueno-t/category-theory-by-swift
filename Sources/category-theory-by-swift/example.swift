
// 恒等射
func id<A> (_ a: A) -> A {
    return a
}

// 関数の合成
infix operator ∘ : CompositionPrecedence

precedencegroup CompositionPrecedence {
    associativity: left
    higherThan: TernaryPrecedence
}

public func ∘<T, U, V>(g: @escaping (U) -> V, f: @escaping (T) -> U) -> ((T) -> V) {
    return { g(f($0)) }
}

let count: (String) -> Int = { $0.count }
let isEven: (Int) -> Bool = { $0 % 2 == 0 }

func arrFirst<A>(_ arr: Array<A>) -> Optional<A> {
    return arr.first
}

func main() {
    print(["Hello"].map(isEven ∘ count) == ["Hello"].map(count).map(isEven))
    print(arrFirst([1,2,3].map(String.init)) == arrFirst([1,2,3]).map(String.init))
}