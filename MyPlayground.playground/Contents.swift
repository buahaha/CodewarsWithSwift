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
    
    public func nodeAt(index: Int) throws -> Node<T>? {
        if index > count - 1 || index < 0 {
            throw LinkedListError.IndexOutOfBounds
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
// tested in testLinkedList unit tests

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
        XCTAssertEqual(1, try LinkedList<Int>(1, 2, 3).nodeAt(index: 0)?.value)
        XCTAssertEqual(false, LinkedList<Int>(1, 2, 3).isEmpty)
        XCTAssertEqual(true, LinkedList<Int>().isEmpty)
        XCTAssertEqual(1, LinkedList<Int>(1, 2, 3).first?.value)
        XCTAssertEqual(3, LinkedList<Int>(1, 2, 3).last?.value)
        XCTAssertEqual(2, LinkedList<Int>(1, 2, 3).remove(node: Node<Int>(value: 2)))
        XCTAssertEqual(3, LinkedList<Int>(1, 2, 3).count)
        // Strange, because I shouldn't be able to removaAll on list,
        // but Swift note me that I should use let instead of var
        let list = LinkedList<Int>(1, 2, 3)
        list.removeAll()
        XCTAssertEqual(true, list.isEmpty)
        XCTAssertThrowsError(try LinkedList<Int>(1, 2, 3).nodeAt(index: 3))
        XCTAssertEqual(3, try LinkedList<Int>(1, 2, 3).nodeAt(index: 2)?.value)
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
