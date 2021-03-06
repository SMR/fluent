import XCTest
@testable import Fluent

class SortTests: XCTestCase {
    static let allTests = [
        ("testBasic", testBasic),
    ]

    var database: Database!
    override func setUp() {
        database = Database(MemoryDriver())
    }

    func testBasic() throws {
        let query = try Query<User>(database)
            .filter("age", .greaterThan, 17)
            .sort("name", .ascending)
            .sort("id", .descending)

        XCTAssertEqual(query.sorts.count, 2)
    }

}
