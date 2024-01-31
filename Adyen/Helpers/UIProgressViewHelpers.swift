//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

@_documentation(visibility: internal)
extension UIProgressView {
    
    public convenience init(style: ProgressViewStyle) {
        self.init()
        
        backgroundColor = style.backgroundColor
        progressTintColor = style.progressTintColor
        trackTintColor = style.trackTintColor
    }
}
