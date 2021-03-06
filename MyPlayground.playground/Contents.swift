//: Playground - noun: a place where people can play

var str = "Hello, playground"
print(str)
print("-----------------")

// Moves in squared strings
// http://www.codewars.com/kata/56dbe0e313c2f63be4000b25/train/swift
func verticalMirror(ofString: String) -> String {
    let splitted = ofString.split(separator: "\n")
    var verticalMirrorArrayOfStrings = [String]()
    
    for letters in splitted {
        verticalMirrorArrayOfStrings.append(String(letters.reversed()))
    }
    return String(verticalMirrorArrayOfStrings.joined(separator: "\n"))
}


func horizontalMirror(ofString: String) -> String {
    let splitted = ofString.split(separator: "\n")
    return splitted.reversed().joined(separator: "\n")
}
// End of Moves in squared strings

// Persistent Bugger
// http://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/swift
func persistence(for num: Int = 10) -> Int {
    var i = 0
    func recursivePersistence(num: Int) -> Int {
        let stringNum = String(num)
        if stringNum.count <= 1 && i == 0 {
            return 0
        } else if stringNum.contains("0") {
            return 0
        } else if stringNum.count <= 1 && i > 0 {
            return i
        } else {
            i += 1
            var y = 0
            for stringNumber in stringNum {
                let number = Int(String(stringNumber))!
                if y != 0 {
                    y *= number
                } else {
                    y = number
                }
            }
            return recursivePersistence(num: y)
        }
    }
    return recursivePersistence(num: num)
}
// Persistence for 4 is 0 because 3*9 = 27, 2*7 = 14, 1*4=4 and 4 has only one digit
// Persistence for 999 is 4 because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2
// Persistence for 39 is 3 because 4 is already a one-digit number
// End of Persistent Bugger

// Transportation on vacation
// Every day you rent the car costs $40. If you rent the car for 7 or more days, you get $50 off your total. Alternatively, if you rent the car for 3 or more days, you get $20 off your total.
// Write a code that gives out the total amount for different days(d).
func RentalCarCost(_ days: Int) -> Int {
    let everyDayCarRentalCost = 40
    let totalWithoutDiscount = days * everyDayCarRentalCost
    if days >= 7 {
        return totalWithoutDiscount - 50
    } else if days < 7 && days >= 3 {
        return totalWithoutDiscount - 20
    } else {
        return totalWithoutDiscount
    }
}
// End of Transportation on vacation

// Convert number to reversed array of digits
// http://www.codewars.com/kata/5583090cbe83f4fd8c000051/train/swift
func reverseNumber(number: Int) -> Int {
    let stringFromNumber = String(number)
    let reversedString = stringFromNumber.reversed()
    return Int(String(reversedString))!
}
// End of Convert number to reversed array of digits

// Grasshopper - Personalized Message
// http://www.codewars.com/kata/5772da22b89313a4d50012f7/train/swift
func great(_ name: String, _ owner: String) -> String {
    switch name {
    case owner:
        return "Hello boss"
    default:
        return "Hello guest"
    }
}
// End of Grasshopper - Personalized Message

// Consecutive strings
// http://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/swift
func longestConsecutiveString(stringsArray: [String], _ n: Int) -> String {
    var strings = stringsArray, k = n
    if strings.count <= 0 || strings.count < k || k <= 0 {
        return ""
    } else {
        var longestConsecutiveString = ""
        repeat {
            var removeAt = 0
            var longestString = 0
            for (i, str) in strings.enumerated() {
                if str.count > longestString {
                    longestString = str.count
                    removeAt = i
                }
            }
            longestConsecutiveString += strings.remove(at: removeAt)
            k -= 1
        } while k > 0
        return longestConsecutiveString
    }
}
// End of Consecutive strings

// Moves in squared strings (II)
// http://www.codewars.com/kata/56dbe7f113c2f63570000b86/train/swift
func mirroredString(_ str: String) -> String {
    let splittedStrings = str.split(separator: "\n")
    var reversedStrings: [String] = []
    for stringToReverse in splittedStrings {
        reversedStrings.append(String(stringToReverse.reversed()))
    }
    return reversedStrings.reversed().joined(separator: "\n")
}

func selfAndMirrored(_ str: String) -> String {
    let selfStrings = str.split(separator: "\n")
    let reversedStrings = mirroredString(str).split(separator: "\n")
    var selfStringsWithDots: [String] = []
    for s in selfStrings {
        let t = s + "...."
        selfStringsWithDots.append(String(t))
    }
    var reversedStringsWithDots: [String] = []
    for s in reversedStrings {
        let t = "...." + s
        reversedStringsWithDots.append(String(t))
    }
    let selfStrWithDots = String(selfStringsWithDots.joined(separator: "\n"))
    let reversedStrWithDots = String(reversedStringsWithDots.joined(separator: "\n"))
    return String(selfStrWithDots) + "\n" + String(reversedStrWithDots)
}
// End of Moves in squared strings (II)

// Doubly linked list from Ray Wenderlich's Swift Algorithm Club
// https://www.raywenderlich.com/144083/swift-algorithm-club-swift-linked-list-data-structure
public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?

    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    enum LinkedListError: Error {
        case IndexOutOfBounds
    }
    
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    init(_ members: T...) {
        for member in members {
            self.append(value: member)
        }
    }
    
    public var count: Int {
        if isEmpty {
            return 0
        } else {
            var i = 1
            var currentNode = head
            while currentNode?.next != nil {
                i += 1
                currentNode = currentNode?.next
            }
            return i
        }
    }
    
    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node<T>? {
        return head
    }

    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func push(value: T) {
        let newFirstNode = Node(value: value)
        let oldFirstNode = head
        oldFirstNode?.previous = newFirstNode
        newFirstNode.next = oldFirstNode
        head = newFirstNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index > count - 1 || index < 0 {
            return nil
        }
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}
// End of doubly linked list class definition

// Linked Lists - Get Nth Node
// http://www.codewars.com/kata/55befc42bfe4d13ab1000007/train/swift
// Linked Lists - Push & BuildOneTwoThree
// http://www.codewars.com/kata/55be95786abade3c71000079/train/swift
// tested in testLinkedList unit test

// Switch it Up!
// http://www.codewars.com/kata/5808dcb8f0ed42ae34000031/train/swift
func switchNumberToStringName(_ number: Int) -> String {
    switch number {
    case 0:
        return "Zero"
    case 1:
        return "One"
    case 2:
        return "Two"
    case 3:
        return "Three"
    case 4:
        return "Four"
    case 5:
        return "Five"
    case 6:
        return "Six"
    case 7:
        return "Seven"
    case 8:
        return "Eight"
    case 9:
        return "Nine"
    default:
        return ""
    }
}
// End of Switch it Up!

// Function 3 - multiplying two numbers
// http://www.codewars.com/kata/523b66342d0c301ae400003b/train/swift
func multiply(_ a: Int, _ b: Int) -> Int {
    if a == 0 || b == 0 {
        return 0
    }
    return a * b
}
// End of Function 3 - multiplying two numbers

// Dashatize it
// http://www.codewars.com/kata/58223370aef9fc03fd000071/train/swift
func dashatize(it: Int) -> String {
    var dashatized = ""
    var lastNumberWasOdd = false
    for number in String(it) {
        if number == "-" {
            continue
        } else {
            if Int(String(number))! % 2 != 0 {
                if lastNumberWasOdd {
                    dashatized += String(number) + "-"
                    lastNumberWasOdd = true
                } else {
                    dashatized += "-" + String(number) + "-"
                    lastNumberWasOdd = true
                }
            } else {
                dashatized += String(number)
                lastNumberWasOdd = false
            }
        }
    }
    if dashatized.hasSuffix("-") {
        dashatized.remove(at: String.Index(encodedOffset: dashatized.count - 1))
    }
    if dashatized.hasPrefix("-") {
        if let i = dashatized.index(of: "-") {
            dashatized.remove(at: i)
        }
    }
    return dashatized
}
// End of Dashatize it

// Playing on a chessboard
// http://www.codewars.com/kata/55ab4f980f2d576c070000f4/train/swift
public class Fraction {
    
    var numerator: Int
    var denominator: Int

    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func simplifyFraction() -> Fraction {
        let gcd = Fraction.greatestCommonDivisor(firstDenominator: self.numerator, secondDenominator: self.denominator)
        self.numerator = self.numerator / gcd
        self.denominator = self.denominator / gcd
        return self
    }
    
    static func greatestCommonDivisor(firstDenominator a: Int, secondDenominator b: Int) -> Int {
        var x = a, y = b
        while x != y {
            if x > y {
                x = x - y;
            }
            else {
                y = y - x
            }
        }
        return x
        // Recursive solution to greatest common divisor
        //        if b == 0 {
        //            return a;
        //        }
        //        else {
        //            return greatestCommonDivisor(firstDenominator: b, secondDenominator: a % b)
        //        }
    }
}
// The least common multiple (lcm) of a and b is their product divided
// by their greatest common divisor (gcd) ( i.e. lcm(a, b) = ab/gcd(a,b))
extension Fraction {
    static func + (left: Fraction, right: Fraction) -> Fraction {
        let gcd = greatestCommonDivisor(firstDenominator: left.denominator, secondDenominator: right.denominator)
        let lcm = (left.denominator * right.denominator) / gcd
        let leftNumerator = (lcm / left.denominator) * left.numerator
        let rightNumerator = (lcm / right.denominator) * right.numerator
        return Fraction(numerator: leftNumerator + rightNumerator, denominator: lcm).simplifyFraction()
    }
}
public class FractionsBoardCoinTossGame {
    var chessboard: [[Fraction]]
    
    init(xRowsOnXColumns x: Int) {
        var column: [[Fraction]] = []
        var counter = 0
        for i in 1...x {
            counter = i
            var row: [Fraction] = []
            for y in 1...x {
                row.append(Fraction(numerator: Int(y), denominator: Int(y + counter)))
            }
            column.append(row)
        }
        self.chessboard = column
        
    }
    
    func play() -> String {
        var sum: Fraction?
        for i in self.chessboard {
            for y in i {
                if sum != nil {
                    sum =  sum! + y
                    
                } else {
                    sum = y
                }
            }
        }
        if sum?.denominator == 1 {
            return sum!.numerator.description
        } else {
            return [sum!.numerator, sum!.denominator].description
        }
    }
}
// End of Playing on a chessboard

// Convert a Boolean to a String
// http://www.codewars.com/kata/551b4501ac0447318f0009cd/train/swift
func boolToString(_ boolean: Bool) -> String {
    return boolean.description
}
// End of Convert a Boolean to a String

// Even or Odd
// http://www.codewars.com/kata/53da3dbb4a5168369a0000fe/train/swift
func evenOrOdd(number: Int) -> String {
    if number % 2 == 0 || number == 0 {
        return "Even"
    } else {
        return "Odd"
    }
}
// End of Even or Odd

// Opposite number
// http://www.codewars.com/kata/56dec885c54a926dcd001095/train/swift
func opposite(number: Int) -> Int {
    return -number
}
// End of Opposite number

// Easy Diagonal
// http://www.codewars.com/kata/559b8e46fa060b2c6a0000bf/train/swift
// I do not follow exact specification, because I think that it is
// counter-intuitive to call this function with nthDiagonal: 0 and rows: 0
func pascalTriangleDiagonalSum(nthDiagonal: Int, rows: Int) -> Int {
    var triangle: [[Int]] = []
    for i in 1...nthDiagonal {
        var diagonal: [Int] = []
        if i == 1 {
            for _ in 0..<rows {
                diagonal.append(1)
            }
        } else {
            for y in 0..<rows {
                if y == 0 {
                    diagonal.append(1)
                } else {
                    // i = 2
                    diagonal.append(diagonal[y-1] + triangle[i-2][y])
                }
            }
        }
        triangle.append(diagonal)
    }
    var sum: Int = 0
    for elem in triangle[nthDiagonal-1] {
        sum += elem
    }
    return sum
}
// End of Easy Diagonal

// TDD/BDD section
// Unit Tests
import XCTest

class MyPlaygroundTests: XCTestCase {
    func testReversingNumbers() {
        XCTAssertEqual(293847, reverseNumber(number: 748392))
        XCTAssertEqual(1, reverseNumber(number: 100))
    }
    
    func testCarRentalOnVacationCost() {
        XCTAssertEqual(40, RentalCarCost(1))
        XCTAssertEqual(100, RentalCarCost(3))
        XCTAssertEqual(510, RentalCarCost(14))
        XCTAssertEqual(14550, RentalCarCost(365))
    }
    
    func testPersistence() {
        XCTAssertEqual(0, persistence(for: 4))
        XCTAssertEqual(0, persistence(for: 4))
        XCTAssertEqual(4, persistence(for: 999))
        XCTAssertEqual(3, persistence(for: 39))
    }
    
    func testVerticalStringMirror() {
        XCTAssertEqual("dcba\nhgfe\nlkji\nponm", verticalMirror(ofString: "abcd\nefgh\nijkl\nmnop"))
    }
    
    func testHorizontalStringMirror() {
        XCTAssertEqual("mnop\nijkl\nefgh\nabcd", horizontalMirror(ofString: "abcd\nefgh\nijkl\nmnop"))
    }
    
    func testGreeter() {
        XCTAssertEqual(great("Daniel", "Daniel"), "Hello boss")
        XCTAssertEqual(great("Greg", "Daniel"), "Hello guest")
    }
    
    func testLongestConsecutiveString() {
        XCTAssertEqual("abigailtheta", longestConsecutiveString(stringsArray: ["zone", "abigail", "theta", "form", "libe", "zas"], 2))
        XCTAssertEqual("oocccffuucccjjjkkkjyyyeehh", longestConsecutiveString(stringsArray: ["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1))
        XCTAssertEqual("", longestConsecutiveString(stringsArray: [], 3))
        XCTAssertEqual("wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck", longestConsecutiveString(stringsArray: ["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2))
        XCTAssertEqual("", longestConsecutiveString(stringsArray: ["lol", "wtf"], 0))
    }
    
    func testMirroredString() {
        XCTAssertEqual("LyfUVC\nGUFjWk\nABpfre\nJMmPrD\ntcVYqC\nooujif", mirroredString("fijuoo\nCqYVct\nDrPmMJ\nerfpBA\nkWjFUG\nCVUfyL"))
        XCTAssertEqual("BClf\nhkXz\nMfoc\nvKkr", mirroredString("rkKv\ncofM\nzXkh\nflCB"))
        XCTAssertEqual("tCey\ngbSC\nvhVJ\ntHVl", mirroredString("lVHt\nJVhv\nCSbg\nyeCt"))
        XCTAssertEqual("qowo\nGULW\neFmt\noxMQ", mirroredString("QMxo\ntmFe\nWLUG\nowoq"))
    }
    
    func testSelfAndMirrored() {
        XCTAssertEqual("xZBV....\njsbS....\nJcpN....\nfVnP....\n....PnVf\n....NpcJ\n....Sbsj\n....VBZx", selfAndMirrored("xZBV\njsbS\nJcpN\nfVnP"))
        XCTAssertEqual("uLcq....\nJkuL....\nYirX....\nnwMB....\n....BMwn\n....XriY\n....LukJ\n....qcLu", selfAndMirrored("uLcq\nJkuL\nYirX\nnwMB"))
        XCTAssertEqual("lVHt....\nJVhv....\nCSbg....\nyeCt....\n....tCey\n....gbSC\n....vhVJ\n....tHVl", selfAndMirrored("lVHt\nJVhv\nCSbg\nyeCt"))
        XCTAssertEqual("QMxo....\ntmFe....\nWLUG....\nowoq....\n....qowo\n....GULW\n....eFmt\n....oxMQ", selfAndMirrored("QMxo\ntmFe\nWLUG\nowoq"))
    }
    
    func testLinkedList() {
        XCTAssertEqual("[1, 2, 3]", LinkedList<Int>(1, 2, 3).description)
        XCTAssertEqual(1,LinkedList<Int>(1, 2, 3).nodeAt(index: 0)?.value)
        XCTAssertEqual(false, LinkedList<Int>(1, 2, 3).isEmpty)
        XCTAssertEqual(true, LinkedList<Int>().isEmpty)
        XCTAssertEqual(1, LinkedList<Int>(1, 2, 3).first?.value)
        XCTAssertEqual(3, LinkedList<Int>(1, 2, 3).last?.value)
        XCTAssertEqual(2, LinkedList<Int>(1, 2, 3).remove(node: Node<Int>(value: 2)))
        XCTAssertEqual(3, LinkedList<Int>(1, 2, 3).count)
        // Strange, because I shouldn't be able to removaAll or push on the list,
        // but Swift note me that I should use let instead of var
        let list = LinkedList<Int>(1, 2, 3)
        list.removeAll()
        XCTAssertEqual(true, list.isEmpty)
        XCTAssertEqual(nil, LinkedList<Int>(1).nodeAt(index: 1)?.value)
        XCTAssertEqual(3, LinkedList<Int>(1, 2, 3).nodeAt(index: 2)?.value)
        let anotherList = LinkedList<Int>(3, 4, 5)
        anotherList.push(value: 2)
        XCTAssertEqual(2, anotherList.first?.value)
        XCTAssertEqual(3, anotherList.nodeAt(index: 1)?.value)
    }
    
    func testSwitchNumberToStringName() {
        XCTAssertEqual("Zero", switchNumberToStringName(0))
        XCTAssertEqual("One", switchNumberToStringName(1))
        XCTAssertEqual("Two", switchNumberToStringName(2))
        XCTAssertEqual("Three", switchNumberToStringName(3))
        XCTAssertEqual("Four", switchNumberToStringName(4))
        XCTAssertEqual("Five", switchNumberToStringName(5))
        XCTAssertEqual("Six", switchNumberToStringName(6))
        XCTAssertEqual("Seven", switchNumberToStringName(7))
        XCTAssertEqual("Eight", switchNumberToStringName(8))
        XCTAssertEqual("Nine", switchNumberToStringName(9))
    }
    
    func testMultiply() {
        XCTAssertEqual(9, multiply(3, 3))
        XCTAssertEqual(12, multiply(6, 2))
        XCTAssertEqual(0, multiply(0, 100))
        XCTAssertEqual(-300, multiply(-50, 6))
    }
    
    func testDashatize() {
        XCTAssertEqual(dashatize(it: 274),"2-7-4", "Should return 2-7-4")
        XCTAssertEqual(dashatize(it: 5311),"5-3-1-1", "Should return 5-3-1-1")
        XCTAssertEqual(dashatize(it: 86320),"86-3-20", "Should return 86-3-20")
        XCTAssertEqual(dashatize(it: 974302),"9-7-4-3-02", "Should return 9-7-4-3-02")
        
        XCTAssertEqual(dashatize(it: 0),"0", "Should return 0")
        XCTAssertEqual(dashatize(it: -1),"1", "Should return 1")
        XCTAssertEqual(dashatize(it: -28369),"28-3-6-9", "Should return 28-3-6-9")
    }
    
    func testGreatestCommonDivisor() {
        XCTAssertEqual(Fraction.greatestCommonDivisor(firstDenominator: 1071, secondDenominator: 462), 21)
    }
    
    func testSimplifyFraction() {
        XCTAssertEqual(Fraction(numerator: 4, denominator: 8).simplifyFraction().denominator, 2)
        XCTAssertEqual(Fraction(numerator: 4, denominator: 8).simplifyFraction().numerator, 1)
    }
    
    func testFractionAddition() {
        XCTAssertEqual((Fraction(numerator: 1, denominator: 2) + Fraction(numerator: 3, denominator: 4)).numerator, 5)
        XCTAssertEqual((Fraction(numerator: 1, denominator: 2) + Fraction(numerator: 3, denominator: 4)).denominator, 4)
    }
    
    func testFractionsBoardCoinTossGame() {
        XCTAssertEqual(FractionsBoardCoinTossGame(xRowsOnXColumns: 2).play(), "2")
        XCTAssertEqual(FractionsBoardCoinTossGame(xRowsOnXColumns: 3).play(), "[9, 2]")
        
    }
    
    func testBoolToString() {
        XCTAssertEqual(boolToString(true), "true")
        XCTAssertEqual(boolToString(false), "false")
    }
    
    func testEvenOrOdd() {
        XCTAssertEqual(evenOrOdd(number: 1), "Odd")
        XCTAssertEqual(evenOrOdd(number: 12), "Even")
        XCTAssertEqual(evenOrOdd(number: 27), "Odd")
        XCTAssertEqual(evenOrOdd(number: 100), "Even")
        XCTAssertEqual(evenOrOdd(number: 0), "Even")
        XCTAssertEqual(evenOrOdd(number: -10), "Even")
    }
    
    func testOpposite() {
        XCTAssertEqual(opposite(number: 1), -1)
        XCTAssertEqual(opposite(number: -20), 20)
    }
    
    func testPascalTriangleDiagonalSum() {
        XCTAssertEqual(pascalTriangleDiagonalSum(nthDiagonal: 3, rows: 3), 10)
        XCTAssertEqual(pascalTriangleDiagonalSum(nthDiagonal: 1, rows: 100), 100)
        XCTAssertEqual(pascalTriangleDiagonalSum(nthDiagonal: 5, rows: 2), 6)
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
MyPlaygroundTests.defaultTestSuite.run()
// End of testing
