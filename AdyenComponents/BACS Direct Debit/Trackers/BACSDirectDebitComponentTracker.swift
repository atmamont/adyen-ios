//
// Copyright (c) 2022 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(AdyenInternal) import Adyen
import Foundation

internal protocol BACSDirectDebitComponentTrackerProtocol: AnyObject {
    func fetchCheckoutAttemptId()
}

internal class BACSDirectDebitComponentTracker: BACSDirectDebitComponentTrackerProtocol {

    // MARK: - Properties

    private let paymentMethod: BACSDirectDebitPaymentMethod
    private let context: AdyenContext
    private let isDropIn: Bool

    // MARK: - Initializers

    internal init(paymentMethod: BACSDirectDebitPaymentMethod,
                  context: AdyenContext,
                  isDropIn: Bool) {
        self.paymentMethod = paymentMethod
        self.context = context
        self.isDropIn = isDropIn
    }

    // MARK: - BACSDirectDebitComponentTrackerProtocol

    internal func fetchCheckoutAttemptId() {
        let flavor: TelemetryFlavor = isDropIn ? .dropInComponent : .components(type: paymentMethod.type)
        let amount = context.payment?.amount
        let additionalFields = AdditionalAnalyticsFields(amount: amount, sessionId: AdyenAnalytics.sessionId)
        context.analyticsProvider.fetchCheckoutAttemptId(with: flavor,
                                                         additionalFields: additionalFields)
    }

}
