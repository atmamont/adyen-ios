//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import AdyenNetworking
import Foundation

@_documentation(visibility: internal)
public protocol APIRequest: Request where ErrorResponseType == APIError {}
