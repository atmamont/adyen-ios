//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import AdyenNetworking
import UIKit

/// Adds helper functionality to any `UIViewController` instance through the `adyen` property.
@_documentation(visibility: internal)
public extension AdyenScope where Base: UIViewController {
    
    /// Enables any `UIViewController` to access its top most presented view controller, e.g `viewController.adyen.topPresenter`.
    var topPresenter: UIViewController {
        var topController: UIViewController = self.base
        while let presenter = topController.presentedViewController {
            topController = presenter
        }
        return topController
    }
    
}

@_documentation(visibility: internal)
extension UIResponder: AdyenCompatible {}

@_documentation(visibility: internal)
extension AdyenScope where Base: UIResponder {

    func updatePreferredContentSize() {
        if let consumer = base as? PreferredContentSizeConsumer {
            consumer.willUpdatePreferredContentSize()
        }
        base.next?.adyen.updatePreferredContentSize()
        if let consumer = base as? PreferredContentSizeConsumer {
            consumer.didUpdatePreferredContentSize()
        }
    }
}

@_documentation(visibility: internal)
public protocol PreferredContentSizeConsumer {

    func didUpdatePreferredContentSize()

    func willUpdatePreferredContentSize()
}
