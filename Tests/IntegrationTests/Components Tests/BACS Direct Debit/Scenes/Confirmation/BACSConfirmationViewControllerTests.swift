//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(AdyenInternal) @testable import Adyen
@testable import AdyenComponents
import XCTest

class BACSConfirmationViewControllerTests: XCTestCase {

    var presenter: BACSConfirmationPresenterProtocolMock!
    var sut: BACSConfirmationViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let styleProvider = FormComponentStyle()
        presenter = BACSConfirmationPresenterProtocolMock()
        sut = BACSConfirmationViewController(
            title: "BACS Direct Debit",
            scrollEnabled: true,
            styleProvider: styleProvider
        )
        sut.presenter = presenter
        
    }

    override func tearDownWithError() throws {
        presenter = nil
        sut = nil
        try super.tearDownWithError()
    }

    func testViewDidLoadShouldCallPresenterViewDidLoad() throws {
        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(presenter.viewDidLoadCalled)
    }

    func testSetUsetInteractionWhenSetToFalseShouldDisableViewUserInteraction() throws {
        // When
        sut.setUserInteraction(enabled: false)

        // Then
        XCTAssertFalse(sut.view.isUserInteractionEnabled)
    }

    func testSetUsetInteractionWhenSetToTrueShouldEnableViewUserInteraction() throws {
        // When
        sut.setUserInteraction(enabled: true)

        // Then
        XCTAssertTrue(sut.view.isUserInteractionEnabled)
    }
}
