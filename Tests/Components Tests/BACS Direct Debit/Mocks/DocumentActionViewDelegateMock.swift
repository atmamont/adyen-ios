//
//  DocumentActionViewDelegateMock.swift
//  AdyenUIKitTests
//
//  Created by Eren Besel on 12/16/21.
//  Copyright © 2021 Adyen. All rights reserved.
//

@_documentation(visibility: internal) @testable import Adyen
@_documentation(visibility: internal) @testable import AdyenActions
import Foundation

internal final class DocumentActionViewDelegateMock: DocumentActionViewDelegate {
    var onDidComplete: (() -> Void)?
    
    func didComplete() {
        onDidComplete?()
    }
    
    var onMainButtonTap: ((UIView, Downloadable) -> Void)?

    func mainButtonTap(sourceView: UIView, downloadable: Downloadable) {
        onMainButtonTap?(sourceView, downloadable)
    }
}
