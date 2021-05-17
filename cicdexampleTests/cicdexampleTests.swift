//
//  cicdexampleTests.swift
//  cicdexampleTests
//
//  Created by Leyner Castillo on 17/05/21.
//

import XCTest
@testable import cicdexample

class cicdexampleTests: XCTestCase {

    // MARK: - Properties
    var sut: ViewController!
    var window: UIWindow!

    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: - Test setup
    func setupViewController() {
        sut = ViewController()
        loadView()
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
        sut.loadView()
        sut.viewDidLoad()
    }

    // MARK: - Tests
    func testInitState() throws {
        XCTAssertNotNil(sut.nameTextField.text)
        XCTAssertFalse(sut.actionButton.isEnabled)
        XCTAssertEqual(sut.greetingLabel.alpha, 0)
    }

    func testEnableActionButton() throws {
        sut.textField(sut.nameTextField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "A")
        XCTAssertTrue(sut.actionButton.isEnabled)
    }

    func testGreetingResult() throws {
        sut.nameTextField.text = "Marilyn"
        sut.didTapActionButton(sut.actionButton)
        XCTAssertEqual(sut.greetingLabel.text, "Have a nice day Marilyn")
        XCTAssertEqual(sut.greetingLabel.alpha, 1)
    }

}
