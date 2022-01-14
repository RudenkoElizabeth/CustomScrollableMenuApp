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
    }
    
    private func setupMenu() {
        let identifier = MainInterfaceConstants.menuIdentifier
        let viewController = UIViewController.instantiateFromStoryboard(identifier)
        let submenuItems: [SclollableMenuItem] = {
            var items = [SclollableMenuItem]()
            MainInterfaceConstants.PageType.allCases.forEach {
                let item = SclollableMenuItem(type: $0.rawValue,
                                              title: MainInterfaceConstants.submenuTitles[$0]!)
                items.append(item)
            }
            return items
        }()
        subtitleMenuModuleInput = SclollableMenuModuleConfigurator()
            .configureModuleForViewInput(viewInput: viewController,
                                         menuItems: submenuItems,
                                         menuItemsSize: 26,
                                         moduleOutput: self)
        view.setMenu(viewController: viewController)
    }
}

extension MainInterfaceRouter: SclollableMenuModuleOutput {
    func action(item: Int) {
        print("item \(item)")
    }
}
