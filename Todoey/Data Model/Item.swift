//
//  Item.swift
//  Todoey
//
//  Created by Johnny Bekkestad on 7/5/19.
//  Copyright © 2019 Johnny Bekkestad. All rights reserved.
//

import Foundation

class Item : Codable {
    
    var title: String = ""
    var selected: Bool = false
    
    init(name: String)
    {
        title = name
    }
}
