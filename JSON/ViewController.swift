//
//  ViewController.swift
//  JSON
//
//  Created by CB on 28/01/2016.
//  Copyright © 2016 streetartcritic.com. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UITableViewController {
    var NumberofRows = 0
    var NamesArray = [String]()
    var AgeArray = [String]()
    
    //Adding in the code
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        parseJSON()
    }
    
    
    func parseJSON() {
        
   //   let path = NSBundle.mainBundle().pathForResource("jsonFile2", ofType: "json") as String!
        let path = "/Users/cb/Documents/dev/GitHub/JSON/JSON/jsonFile2"
        
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var Name = readableJSON["People"]["person1"]["Age"]
        
        NumberofRows = readableJSON["People"].count
        
        for i in 1...NumberofRows {
            var Person = "Person"
            Person += "\(i)"
            var Name = readableJSON["People"][Person]["Name"].string as String!
            var Age = readableJSON["People"][Person]["Age"].string as String!
            NamesArray.append(Name)
            AgeArray.append(Age)
        }
        
        
        NSLog("\(Name)")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NumberofRows
        
    }
    
    func callWordPressAPI() {
        
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if NamesArray.count != 0 {
            cell.textLabel?.text = NamesArray[indexPath.row]
        }
        
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

