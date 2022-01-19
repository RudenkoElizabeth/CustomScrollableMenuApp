//
//  PageInterfaceConfigurator.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

import UIKit

class PageInterfaceModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController,
                                                       pageType: ItemType) {
        if let viewController = viewInput as? PageInterfaceViewController {
            configure(viewController: viewController, pageType: pageType)
        }
    }
    
    private func configure(viewController: PageInterfaceViewController,
                           pageType: ItemType) {
        
        let router = PageInterfaceRouter()
        
        let presenter = PageInterfacePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.pageType = pageType
        
        let interactor = PageInterfaceInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
