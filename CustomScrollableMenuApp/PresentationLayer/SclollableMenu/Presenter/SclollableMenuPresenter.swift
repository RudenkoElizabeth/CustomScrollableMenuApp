//
//  SclollableMenuPresenter.swift
//
//  Created by Rudenko Elizabeth on 22/11/2021.
//

class SclollableMenuPresenter: SclollableMenuModuleInput, SclollableMenuViewOutput {
    
    weak var view: SclollableMenuViewInput!
    weak var moduleOutput: SclollableMenuModuleOutput!
    var menuItems = [SclollableMenuItem]()
    var menuItemsSize: Int = 16
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func getNumberOfItems() -> Int {
        menuItems.count
    }
    
    func getTitleFor(item: Int) -> String {
        menuItems[item].title
    }
    
    func action(item: Int) {
        moduleOutput.action(item: menuItems[item].type)
    }
    
    // MARK: SclollableMenuModuleInput
    func change(item: ItemType) {
        view.setSelected(item: item.rawValue)
    }
}
