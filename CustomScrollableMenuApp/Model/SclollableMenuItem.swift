//
//  SclollableMenuItem.swift
//  CustomScrollableMenuApp
//
//  Created by Elizaveta Rudenko on 19.01.2022.
//

import Foundation

enum ItemType: Int, CaseIterable {
    case item1, item2, item3, item4, item5, item6
}

struct SclollableMenuItem {
    var type: ItemType
    var title: String
}
