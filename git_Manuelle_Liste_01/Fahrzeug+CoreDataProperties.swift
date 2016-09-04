//
//  Fahrzeug+CoreDataProperties.swift
//  git_Manuelle_Liste_01
//
//  Created by Stefan Jölly on 04.09.16.
//  Copyright © 2016 Stefan Jölly. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Fahrzeug {

    @NSManaged var name: String?
    @NSManaged var checked: NSNumber?
    @NSManaged var materialien: NSOrderedSet?

}
