//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    var queue: CalculatorItemQueue = CalculatorItemQueue()
    
    func test_QueueList는_초기에_empty값을_갖는다() {
        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()).isEmpty, true)
    }
    
    func test_QueueList_enqueue_정상동작한다() {
        queue.enqueue(number: 1.0)
        
        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), ["1.0"])
    }
    
    func test_QueueList는_순서를_갖지않는다() {
        queue.enqueue(number: 2.0)
        queue.enqueue(number: 1.0)

        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), ["2.0","1.0"])
    }
    
    func test_QueueList_Enqueue에_opreratorItem을_넣으면_정상동작한다() {
        queue.enqueue(operatorItem: Operator.add)

        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), ["+"])
    }

    func test_QueueList_Enqueue_OperatorItem과NumberItem을_넣으면_정상동작한다() {
        queue.enqueue(operatorItem: .add)
        queue.enqueue(operatorItem: .divide)
        queue.enqueue(number: 2)

        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), ["+","/","2.0"])
    }
    
    func test_QueueList에_Dequeue_정상동작한다() {
        queue.enqueue(number: 1)
        
        let removedItem = queue.dequeue()

        XCTAssertEqual(convertItem(item: removedItem), "1.0")
    }
    
    func test_QueueList에_Dequeue_하고_남은item_계속들어있다() {
        queue.enqueue(number: 2)
        queue.enqueue(number: 1)
        queue.enqueue(number: 3)
        
        let firstRemovedItem = queue.dequeue()
        let secodeRemovedItem = queue.dequeue()

        XCTAssertEqual(convertItem(item: firstRemovedItem), "2.0")
        XCTAssertEqual(convertItem(item: secodeRemovedItem), "1.0")
        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), ["3.0"])
    }

    func test_빈QueueList_Dequeue_nil을_반환한다() {
        let item = queue.dequeue()

        XCTAssertEqual(convertItem(item: item), nil)
    }
    
    func test_QueueList_안의_데이터를_모두_지운다() {
        queue.enqueue(operatorItem: .add)
        queue.enqueue(operatorItem: .divide)
        queue.enqueue(number: 1)
        queue.enqueue(number: 2)
        
        queue.clearQueue()

        XCTAssertEqual(convertList(list: queue.getQueueList().searchAll()), [])
    }

    func test_여러개의_QueueList_생성한다() {
        var calculatorQueue: CalculatorItemQueue = CalculatorItemQueue()
        var preparedCalculatorQueue: CalculatorItemQueue = CalculatorItemQueue()

        calculatorQueue.enqueue(operatorItem: .add)
        preparedCalculatorQueue.enqueue(number: 3)

        XCTAssertEqual(convertList(list: calculatorQueue.getQueueList().searchAll()), ["+"])
        XCTAssertEqual(convertList(list: preparedCalculatorQueue.getQueueList().searchAll()), ["3.0"])
    }
}

extension CalculatorItemQueueTests {
    func convertList(list: [CalculateItem?]) -> [String?] {
        var compareList: [String?] = []
        
        for item in list {
            compareList.append(convertItem(item: item))
        }
        return compareList
    }
    
    func convertItem(item: CalculateItem?) -> String? {
        guard let item = item else {
            return nil
        }
        
        if let number = item as? Double {
            return String(number)
        }
        if let operatorItem = item as? Operator {
            return String(operatorItem.rawValue)
        }
        return nil
    }
}

fileprivate extension LinkedList {
    func searchAll() -> [CalculateItem?] {
        var searchedList: [CalculateItem?] = []
        
        if front() == nil {
            return []
        }
        
        var node = front()
        searchedList.append(node?.data)
        
        while node?.next != nil {
            node = node?.next
            searchedList.append(node?.data)
        }
        return searchedList
    }
}
