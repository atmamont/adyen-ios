//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

@_spi(AdyenInternal)
public final class ImageLoaderProvider {
    
    @AdyenDependency(\.imageLoader) private static var underlyingImageLoader
    
    public static func imageLoader() -> ImageLoading {
        underlyingImageLoader
    }
}
