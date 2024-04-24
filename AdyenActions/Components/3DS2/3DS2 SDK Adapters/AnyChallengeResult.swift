//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen3DS2_Swift
import Foundation

internal protocol AnyChallengeResult {

    var transactionStatus: String { get }
}

extension ChallengeResult: AnyChallengeResult {}
