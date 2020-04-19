//
//  BlessBitTests.swift
//  BlessBitTests
//
//  Created by Mac PC on 3/22/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import XCTest
@testable import BlessBit

class BlessBitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDownloadWithExpectation() {
        
        let expect = expectation(description: "Download should succeed")
        
        if URL(string: "https://httpbin.org") != nil {
            HomeDataService.instance.getHome_itemsFromAPI {
                XCTAssert(true, "success")
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test timed out. \(error?.localizedDescription)")
        }
    }
    


    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
