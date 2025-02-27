import XCTest
@testable import NoPrint

final class PrintTests: XCTestCase {
    func test1() {
        print("Hello world!")
    }
    
    func test2() {
        print("Hello world!", "a", "b", "c", separator: ",", terminator: " >> ")
        print("⚽️", "🏀", "🎾", "⚾️", separator: "👌")
        // Hello world!,a,b,c >> ⚽️👌🏀👌🎾👌⚾️
    }
}
