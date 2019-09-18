//
//  PersonManage+CoreDataProperties.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonManage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonManage> {
        return NSFetchRequest<PersonManage>(entityName: "PersonManage")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var id: Int64

}
