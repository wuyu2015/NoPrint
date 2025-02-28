/// A shorthand for `print`, recommended to avoid ambiguity with Swift's built-in `print`.
/// This function prints messages only in debug mode.
/// In release mode, `pr` does nothing, allowing the compiler to optimize it out.
/// - Parameters:
///   - items: A variadic list of items to print.
///   - separator: A string used to separate items (default is a space).
///   - terminator: A string appended at the end (default is a newline).
public func pr(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    if items.count == 1 {
        Swift.print(items[0], terminator: terminator)
        return
    }
    for i in 0..<items.count - 1 {
        Swift.print(items[i], terminator: separator)
    }
    Swift.print(items.last!, terminator: terminator)
    #endif
}

/// This function executes the provided closure and prints its result in debug mode.
/// In release mode, `pr` does nothing, allowing the compiler to optimize it out.
/// - Parameter closure: A closure that returns a value to be printed.
public func pr(_ closure: () -> Any) {
    #if DEBUG
    Swift.print(closure())
    #endif
}
