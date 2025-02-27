import XCTest
@testable import NoPrint

final class PrTests: XCTestCase {
    func test1() {
        pr("Hello world!")
    }
    
    func test2() {
        pr("Hello world!", "a", "b", "c", separator: ",", terminator: " >> ")
        pr("⚽️", "🏀", "🎾", "⚾️", separator: "👌")
        // Hello world!,a,b,c >> ⚽️👌🏀👌🎾👌⚾️
    }
}
