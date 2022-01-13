//
//  MainInterfaceConstants.swift
//  CustomScrollableMenuApp
//
//  Created by Elizaveta Rudenko on 12.01.2022.
//

import Foundation

class MainInterfaceConstants {
    enum PageType: Int, CaseIterable {
        case item1, item2, item3, item4, item5, item6
    }
    static let submenuTitles: [PageType: String] = [
        .item1: "Menu item 1",
        .item2: "Menu item 2",
        .item3: "Menu item 3",
        .item4: "Menu item 4",
        .item5: "Menu item 5",
        .item6: "Menu item 6"
    ]
}
