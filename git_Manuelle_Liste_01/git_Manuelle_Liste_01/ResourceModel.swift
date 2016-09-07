//
//  ResourceModel.swift
//  git_Manuelle_Liste_01
//
//  Created by Stefan Jölly on 04.09.16.
//  Copyright © 2016 Stefan Jölly. All rights reserved.
//

import UIKit
import CoreData

class ResourceModel {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = NSBundle.mainBundle().URLForResource("FZUebernahme", withExtension: "momd")
        guard let saveModelUrl = modelUrl else {
            fatalError("No save ModelURL found")
        }
        let mgdObjectModel = NSManagedObjectModel(contentsOfURL: saveModelUrl)
        return mgdObjectModel!
    }()
    
    private lazy var persistenStoreCoordinator: NSPersistentStoreCoordinator = {
        let mgdObjMod = self.managedObjectModel
        let psCUrl = self.appDelegate.docDir.URLByAppendingPathComponent("FZUebernahme.sqlite")
        let psCoordinator = NSPersistentStoreCoordinator(managedObjectModel: mgdObjMod)
        do {
            try psCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL:psCUrl, options: nil)
        } catch {
            print("no Persistant Store found")
        }
        return psCoordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let mgdObjContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        mgdObjContext.persistentStoreCoordinator = self.persistenStoreCoordinator
        return mgdObjContext
    }()
    
    func saveContext() {
        self.managedObjectContext.hasChanges
        do {
            try self.managedObjectContext.save()
        } catch {
            fatalError("Can't save")
        }
    }
    
    func loadDataFromPreload(fahrzeug: String, _ checklist: [String]) {
        let newFahrzeug = NSEntityDescription.insertNewObjectForEntityForName("Fahrzeug", inManagedObjectContext: self.managedObjectContext) as? Fahrzeug
        newFahrzeug?.name = fahrzeug
        saveContext()
        
        var tmpCheckliste = [Checkliste]()
        for newChecklisteEntry in checklist {
            let newChkEntry = NSEntityDescription.insertNewObjectForEntityForName("Checkliste", inManagedObjectContext: self.managedObjectContext) as? Checkliste
            newChkEntry?.material = newChecklisteEntry
            newChkEntry?.fahrzeug = newFahrzeug
            tmpCheckliste.append(newChkEntry!)
        }
        }
        
}
