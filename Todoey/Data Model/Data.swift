//
//  Data.swift
//  Todoey
//
//  Created by Johnny Bekkestad on 7/14/19.
//  Copyright © 2019 Johnny Bekkestad. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age : Int = 0
}
