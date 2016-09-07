//
//  ViewController.swift
//  git_Manuelle_Liste_01
//
//  Created by Stefan Jölly on 04.09.16.
//  Copyright © 2016 Stefan Jölly. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabellenAnsicht: UITableView!
    
    var fahrzeug = [Fahrzeug]?()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fahrzeug = fahrzeug else {
            return 0
        }
        return fahrzeug.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("fahrzeugCell")
        
        if fahrzeug != nil {
            cell!.textLabel!.text = fahrzeug![indexPath.row].name
        }
        
        return cell!
    }
    
    

}

