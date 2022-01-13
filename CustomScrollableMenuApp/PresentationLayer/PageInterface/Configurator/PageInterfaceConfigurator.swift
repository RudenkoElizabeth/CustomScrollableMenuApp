//
//  PageInterfaceConfigurator.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

import UIKit

class PageInterfaceModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PageInterfaceViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PageInterfaceViewController) {

        let router = PageInterfaceRouter()

        let presenter = PageInterfacePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PageInterfaceInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
