//
//  CheckListController.swift
//  git_Manuelle_Liste_01
//
//  Created by Stefan Jölly on 07.09.16.
//  Copyright © 2016 Stefan Jölly. All rights reserved.
//

import UIKit

class CheckListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabellenAnsicht: UITableView!
    
    var fahrzeug: Fahrzeug?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fahrzeug = fahrzeug else {
            return 0
        }
        
        guard let materialien = fahrzeug.materialien else {
            return 0
        }
        
        return materialien.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("checkListCell", forIndexPath: indexPath)
        
        guard let fahrzeug = fahrzeug else {
            return cell
        }
        
        guard let materialien = fahrzeug.materialien else {
            return cell
        }
        
        let checkListEntry = materialien.objectAtIndex(indexPath.row) as! Checkliste
        
        //Hier kann ich nur über die Abfrage .name die "Unterliste" anzeigen lassen.
        cell.textLabel?.text = checkListEntry.material
        
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
