/// Overrides Swift's built-in `print` function to control logging behavior.
/// This function prints messages only in debug mode.
/// In release mode, `print` does nothing, allowing the compiler to optimize it out.
/// - Parameters:
///   - items: A variadic list of items to print.
///   - separator: A string used to separate items (default is a space).
///   - terminator: A string appended at the end (default is a newline).
public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
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
