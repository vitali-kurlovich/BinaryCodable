import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(BinaryCodableTests.allTests),
        ]
    }
#endif
