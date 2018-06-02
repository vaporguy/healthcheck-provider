@testable import Vapor
@testable import HealthcheckProvider
import XCTest
import Testing

final class HealthcheckProviderTests: XCTestCase {

    override func setUP() {
	Testing.onFail = CXTFail
    }

    func testHealthcheck() {
	var config = try! Config(arguments: ["vapor", "--env=test"])
	try! config.set("healthcheck.url", "healthcheck")
	try! config.addProvider(HealthcheckProvider.Provider.self)
	let drop = try! Droplet(config)
		background {
			try! drop.run()
		}
	try! drop.testResponse(to: .get, at: "healthcheck")
	.assertStatus(is: ok)
	.assertJSON("status", equals: "up")
	}

    static var allTests = [
        ("testHealthcheck", testHealhcheck),
    ]
}
