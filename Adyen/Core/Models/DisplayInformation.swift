//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Describes a payment method display information.
public struct DisplayInformation: Equatable {

    /// The title for the payment method, adapted for displaying in a list.
    /// In the case of stored payment methods, this will include information identifying the stored payment method.
    /// For example, this could be the last 4 digits of the card number, or the used email address.
    public let title: String

    /// The subtitle for the payment method, adapted for displaying in a list.
    /// This property represents optional data that can help identify a payment method.
    /// For example, this could be the expiration date of a stored credit card.
    public let subtitle: String?

    /// The name of the logo resource.
    package let logoName: String

    /// The trailing disclosure text.
    package let disclosureText: String?

    /// The footnote if any.
    package let footnoteText: String?
    
    /// An optional custom `accessibilityLabel` to use.
    package let accessibilityLabel: String?

    /// Initializes a`DisplayInformation`.
    ///
    /// - Parameter title: The title.
    /// - Parameter subtitle: The subtitle.
    /// - Parameter logoName: The logo name.
    /// - Parameter disclosureText: The trailing disclosure text.
    /// - Parameter footnoteText: The footnote text if any.
    /// - Parameter accessibilityLabel: An optional custom `accessibilityLabel` to use.
    /// Set this if the title / subtitle might not be sufficient enough to provide a good accessibility
    public init(title: String,
                subtitle: String?,
                logoName: String,
                disclosureText: String? = nil,
                footnoteText: String? = nil,
                accessibilityLabel: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.logoName = logoName
        self.disclosureText = disclosureText
        self.footnoteText = footnoteText
        self.accessibilityLabel = accessibilityLabel
    }
}

/// Describes a payment method display information that can be customized by the merchant.
public struct MerchantCustomDisplayInformation {
    /// The title for the payment method, adapted for displaying in a list.
    public let title: String

    /// The subtitle for the payment method, adapted for displaying in a list.
    /// This property represents optional data that can help identify a payment method.
    /// For example, this could be the expiration date of a stored credit card.
    public let subtitle: String?
    
    /// Initializes an instance of `CustomDisplayInformation`.
    ///
    /// - Parameters:
    ///   - title: The payment method list title.
    ///   - subtitle: The payment method list subtitle.
    public init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
}
