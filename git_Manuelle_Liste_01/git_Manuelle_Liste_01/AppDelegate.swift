//
//  AppDelegate.swift
//  git_Manuelle_Liste_01
//
//  Created by Stefan Jölly on 04.09.16.
//  Copyright © 2016 Stefan Jölly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let resourceModel = ResourceModel()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    lazy var docDir: NSURL = {
        let fileStoreUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        guard let saveUrl = fileStoreUrl.first else {
            fatalError("No such URL found")
        }
        return saveUrl
    }()
    
    func preload() {
        let preloadData = readPreload()
        for (fahrzeug, checklist) in preloadData! {
            resourceModel.loadDataFromPreload(fahrzeug, checklist)
        }
    }
    
    func readPreload() ->[String:[String]]? {
        
        guard let fileUrlToRead = NSBundle.mainBundle().URLForResource("preload", withExtension: "json") else {
            fatalError("No File to Read")
        }
        let preloadData = NSData(contentsOfURL: fileUrlToRead)
        do {
            let jsonData = try NSJSONSerialization.JSONObjectWithData(preloadData!, options: .AllowFragments)
            
            var preloadedData = [String:[String]]()
            let fahrzeugliste = jsonData["fahrzeuge"] as! NSArray
            for fahrzeugCheckliste in fahrzeugliste {
                let fahrzeug = fahrzeugCheckliste["name"] as! String
                let checkliste = fahrzeugCheckliste["checkliste"] as! [String]
                preloadedData[fahrzeug] = checkliste
            }
            return preloadedData
            
            
        } catch {
            print("Can't handl json Data")
        }
        
        return nil
    }
    
}

