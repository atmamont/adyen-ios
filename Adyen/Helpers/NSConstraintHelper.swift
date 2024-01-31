//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

/// So that any `NSLayoutConstraint` instance will inherit the `adyen` scope.
@_documentation(visibility: internal)
extension NSLayoutConstraint: AdyenCompatible {}

/// Adds helper functionality to any `NSLayoutConstraint` instance through the `adyen` property.
@_documentation(visibility: internal)
extension AdyenScope where Base: NSLayoutConstraint {

    /// Apply `priority` to this instance of `NSLayoutConstraint`
    public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        base.priority = priority
        return base
    }

}
