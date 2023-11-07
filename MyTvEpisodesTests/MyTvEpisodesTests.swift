
import XCTest
@testable import MyTvEpisodes
class MyTvEpisodesTests: XCTestCase {
    func testFetchData() {
        let fetchdataVMObj = fetchdataVM()
        let expectation = XCTestExpectation(description: "Fetch data expectation")
        
        fetchdataVMObj.fetchData { episodeList in
            XCTAssertFalse(episodeList.isEmpty, "Fetched episode list should not be empty")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }

    
    func testFetchDataJSONDecoding() {
        
        let expectation = XCTestExpectation(description: "Fetch data expectation")
        let testURL = URL(string: "https://api.tvmaze.com/shows")!
        
        // fetch data from the test URL
        let dataTask = URLSession.shared.dataTask(with: testURL) { data, _, error in
            if let error = error {
                XCTFail("Error occurred while fetching test data: \(error)")
                expectation.fulfill()
                return
            }
            
            guard let data = data else {
                XCTFail("No data received from the test URL")
                expectation.fulfill()
                return
            }
            do {
                let decoder = JSONDecoder()
                let episodeList = try decoder.decode([TopTenData].self, from: data)
                 XCTAssertFalse(episodeList.isEmpty, "Fetched episode list should not be empty")
                expectation.fulfill()
            } catch {
                XCTFail("Error occurred while decoding JSON into Swift: \(error)")
                expectation.fulfill()
            }
        }
        
        dataTask.resume()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchDataNetworkFailure() {
        let fetchdataVMObj = fetchdataVM()
        let expectation = XCTestExpectation(description: "Network failure expectation")
        var completionHandlerCalled = false
        fetchdataVMObj.fetchData { episodeList in
            
            completionHandlerCalled = true
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertTrue(completionHandlerCalled, "Completion handler should not be called for a network failure")
    }
    
    
}
