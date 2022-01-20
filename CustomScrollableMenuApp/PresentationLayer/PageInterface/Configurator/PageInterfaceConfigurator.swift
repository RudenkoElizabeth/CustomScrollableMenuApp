//
//  PageInterfaceConfigurator.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

import UIKit

class PageInterfaceModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController,
                                                       menuItem: SclollableMenuItem) {
        if let viewController = viewInput as? PageInterfaceViewController {
            configure(viewController: viewController, menuItem: menuItem)
        }
    }
    
    private func configure(viewController: PageInterfaceViewController,
                           menuItem: SclollableMenuItem) {
        
        let router = PageInterfaceRouter()
        
        let presenter = PageInterfacePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.menuItem = menuItem
        
        let interactor = PageInterfaceInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
