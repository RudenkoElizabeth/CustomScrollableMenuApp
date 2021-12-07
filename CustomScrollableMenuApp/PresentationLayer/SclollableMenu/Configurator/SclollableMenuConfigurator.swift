//
//  SclollableMenuConfigurator.swift
//
//  Created by Rudenko Elizabeth on 22/11/2021.
//

import UIKit

class SclollableMenuModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController,
                                                       menuItems: [SclollableMenuItem],
                                                       menuItemsSize: Int,
                                                       moduleOutput: SclollableMenuModuleOutput) -> SclollableMenuModuleInput? {
        if let viewController = viewInput as? SclollableMenuViewController {
            return configure(viewController: viewController,
                             menuItems: menuItems,
                             menuItemsSize: menuItemsSize,
                             moduleOutput: moduleOutput)
        }
        return nil
    }
    
    private func configure(viewController: SclollableMenuViewController,
                           menuItems: [SclollableMenuItem],
                           menuItemsSize: Int,
                           moduleOutput: SclollableMenuModuleOutput) -> SclollableMenuModuleInput {
        
        let presenter = SclollableMenuPresenter()
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        presenter.menuItems = menuItems
        presenter.menuItemsSize = menuItemsSize
        
        viewController.output = presenter
        
        return presenter
    }
}
