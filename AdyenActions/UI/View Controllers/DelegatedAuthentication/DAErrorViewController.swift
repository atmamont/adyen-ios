//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(AdyenInternal) import Adyen
import UIKit

@available(iOS 16.0, *)
internal final class DAErrorViewController: UIViewController {

    internal enum Screen {
        case authenticationFailed(localizationParameters: LocalizationParameters?)
        case registrationFailed(localizationParameters: LocalizationParameters?)
        
        internal var title: String {
            switch self {
            case .authenticationFailed(let localizationParameters):
                localizedString(.threeds2DAApprovalErrorTitle, localizationParameters)
            case .registrationFailed(let localizationParameters):
                localizedString(.threeds2DARegistrationErrorTitle, localizationParameters)
            }
        }
        
        internal var image: UIImage? {
            switch self {
            case .authenticationFailed:
                UIImage(named: "feedback", in: Bundle.actionsInternalResources, compatibleWith: nil)
            case .registrationFailed:
                UIImage(systemName: "checkmark.circle",
                        withConfiguration: UIImage.SymbolConfiguration(weight: .ultraLight))?
                    .withTintColor(.systemGreen,
                                   renderingMode: .alwaysOriginal)
            }
        }
        
        internal var message: String {
            switch self {
            case .authenticationFailed(let localizationParameters):
                return localizedString(.threeds2DAApprovalErrorMessage, localizationParameters)
            case .registrationFailed(let localizationParameters):
                return localizedString(.threeds2DARegistrationErrorMessage, localizationParameters)
            }
        }
        
        internal func captionMessage(timeInterval: TimeInterval) -> String {
            switch self {
            case .authenticationFailed(let localizationParameters):
                String(format: localizedString(.threeds2DAApprovalErrorTimerText, localizationParameters), 
                       timeInterval.adyen.timeLeftString() ?? "0")
            case .registrationFailed(let localizationParameters):
                String(format: localizedString(.threeds2DARegistrationTimerText, localizationParameters), 
                       timeInterval.adyen.timeLeftString() ?? "0")
            }
        }
        
        internal var buttonTitle: String? {
            switch self {
            case .authenticationFailed(let localizationParameters):
                return localizedString(.threeds2DAApprovalErrorButtonTitle, localizationParameters)
            case .registrationFailed(let localizationParameters):
                return localizedString(.threeds2DAApprovalErrorButtonTitle, localizationParameters)
            }
        }
    }

    private lazy var errorView: DelegatedAuthenticationErrorView = .init(style: style)
    private let style: DelegatedAuthenticationComponentStyle
    internal typealias Handler = () -> Void
    private let continueHandler: Handler
    private let screen: Screen    
    
    // MARK: - Init

    internal init(style: DelegatedAuthenticationComponentStyle,
                  screen: Screen,
                  completion: @escaping () -> Void) {
        self.style = style
        self.screen = screen
        self.continueHandler = completion

        super.init(nibName: nil, bundle: Bundle(for: DAErrorViewController.self))
        errorView.delegate = self
    }
    
    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        configureErrorView()
        view.backgroundColor = style.backgroundColor
        configureErrorView()
        isModalInPresentation = true
    }
        
    // MARK: - Configuration
    
    private func configureErrorView() {
        errorView.titleLabel.text = screen.title
        errorView.descriptionLabel.text = screen.message
        if let buttonTitle =  screen.buttonTitle {
            errorView.firstButton.title = buttonTitle
        } else {
            errorView.buttonsStackView.isHidden = true
        }
        errorView.image.image = screen.image
    }
    
    private func buildUI() {
        view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.adyen.anchor(inside: view.safeAreaLayoutGuide)
    }

    override internal var preferredContentSize: CGSize {
        get {
            UIView.layoutFittingExpandedSize
        }

        // swiftlint:disable:next unused_setter_value
        set { AdyenAssertion.assertionFailure(message: """
        PreferredContentSize is overridden for this view controller.
        getter - returns minimum possible content size.
        setter - no implemented.
        """) }
    }
}

@available(iOS 16.0, *)
extension DAErrorViewController: DelegatedAuthenticationErrorViewDelegate {
    internal func firstButtonTapped() {
        errorView.firstButton.showsActivityIndicator = true
        continueHandler()
    }
}
