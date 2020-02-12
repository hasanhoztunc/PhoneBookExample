//
//  Phones.swift
//  PhoneBookWithCoreData
//
//  Created by MacOS on 11.02.2020.
//  Copyright © 2020 MacOS. All rights reserved.
//

import Foundation
import CoreData

class phones : NSManagedObject {
    @NSManaged var firstName:String
    @NSManaged var lastName:String
    @NSManaged var phoneNumber:String

}
