//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Describes an action in which the user is redirected to a URL.
public class RedirectAction: Decodable {

    public enum RedirectType: Decodable {
        case redirect
        case nativeRedirect

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let type = try? container.decode(String.self)
            switch type {
            case "nativeRedirect": self = .nativeRedirect
            case "redirect": self = .redirect
            default:
                self = .redirect
            }
        }
    }

    /// The URL to which to redirect the user.
    public let url: URL

    /// The server-generated payment data that should be submitted to the `/payments/details` endpoint.
    public let paymentData: String?

    /// Redirect type
    public let type: RedirectType

    /// Native redirect data.
    public let nativeRedirectData: String?

    /// Initializes a redirect action.
    ///
    /// - Parameters:
    ///   - url: The URL to which to redirect the user.
    ///   - paymentData: The server-generated payment data that should be submitted to the `/payments/details` endpoint.
    ///   - nativeRedirectData: Native redirect data.
    public init(
        url: URL,
        paymentData: String?,
        type: RedirectType = .redirect,
        nativeRedirectData: String? = nil
    ) {
        self.url = url
        self.paymentData = paymentData
        self.type = type
        self.nativeRedirectData = nativeRedirectData
    }

    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(URL.self, forKey: .url)
        self.paymentData = try container.decodeIfPresent(String.self, forKey: .paymentData)
        self.type = try container.decode(RedirectType.self, forKey: .type)
        self.nativeRedirectData = try container.decodeIfPresent(String.self, forKey: .nativeRedirectData)
    }

    // MARK: - Private

    private enum CodingKeys: CodingKey {
        case url
        case paymentData
        case type
        case nativeRedirectData
    }
}
