//
//  SclollableMenuProtocols.swift
//  AnyPlay
//
//  Created by Rudenko Elizabeth on 22/11/2021.
//  Copyright © 2021 AnyPlay-iOS. All rights reserved.
//

protocol SclollableMenuViewInput: AnyObject {
    func setupInitialState()
    func setSelected(item: Int)
}

protocol SclollableMenuViewOutput {
    
    var menuItemsSize: Int { get }
    
    func viewIsReady()
    func getNumberOfItems() -> Int
    func getTitleFor(item: Int) -> String
    func action(item: Int)
}

protocol SclollableMenuModuleInput: AnyObject {
    func change(item: ItemType)
}

protocol SclollableMenuModuleOutput: AnyObject {
    func action(item: ItemType)
}
