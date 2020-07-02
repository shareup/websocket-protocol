import XCTest

import WebSocketProtocolTests

var tests = [XCTestCaseEntry]()
tests += WebSocketProtocolTests.allTests()
XCTMain(tests)
