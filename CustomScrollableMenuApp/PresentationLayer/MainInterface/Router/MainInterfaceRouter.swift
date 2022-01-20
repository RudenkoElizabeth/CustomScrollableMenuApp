//
//  MainInterfaceRouter.swift
//
//  Created by Rudenko Elizabeth on 12/01/2022.
//

import UIKit

class MainInterfaceRouter: MainInterfaceRouterInput {
    
    weak var view: MainInterfaceViewController!
    
    private var subtitleMenuView: UIViewController?
    private var subtitleMenuModuleInput: SclollableMenuModuleInput?
    
    func setupSubmodules() {
        setupMenu()
        setupPages()
    }
    
    func chngePageFor(item: ItemType) {
        subtitleMenuModuleInput?.change(item: item)
    }
    
    private func setupMenu() {
        let identifier = MainInterfaceConstants.menuIdentifier
        let viewController = UIViewController.instantiateFromStoryboard(identifier)
        subtitleMenuModuleInput = SclollableMenuModuleConfigurator()
            .configureModuleForViewInput(viewInput: viewController,
                                         menuItems: MainInterfaceConstants.items,
                                         menuItemsSize: 26,
                                         moduleOutput: self)
        view.setMenu(viewController: viewController)
    }
    
    private func setupPages() {
        MainInterfaceConstants.items.forEach { item in
            let identifier = MainInterfaceConstants.pageIdentifier
            let viewController = UIViewController.instantiateFromStoryboard(identifier)
            PageInterfaceModuleConfigurator().configureModuleForViewInput(viewInput: viewController, menuItem: item)
            view.addViewController(viewController)
        }
        
    }
}

extension MainInterfaceRouter: SclollableMenuModuleOutput {
    func action(item: ItemType) {
        view.setViewControllerFor(pageType: item)
    }
}
