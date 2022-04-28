//
//  BelongingsData.swift
//  MyBelongings
//
//  Created by Vincentius Sutanto on 29/04/22.
//

import Foundation

struct itemData {
    var itemTitle: String?
    var itemType: Bool?
    var itemCategory: String?
    var itemDesc: String?
    
    init(title: String, type:Bool, category: String, desc: String) {
        itemTitle = title
        itemType = type
        itemCategory = category
        itemDesc = desc
    }
}
