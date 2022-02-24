//
//  ViewController.swift
//  Multi Seleect
//
//  Created by Prabhat on 09/07/17.
//  Copyright © 2017 Prabhat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tbl: UITableView!
    var data:[Any] = []
    
    var selectedRow: NSMutableArray = []

    var statusArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 1..<11 {
            data.append(i)
        }
        statusArray = createSelectedStatusArray(data.count)
        print(statusArray)
    }
    
    func createSelectedStatusArray(_ count:NSInteger) -> NSMutableArray {
        let statusArray = NSMutableArray()
        for _ in 1...count {
            statusArray.add("0")
        }
        print(statusArray)
        return statusArray
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.delegat = self
        
        let item = data[indexPath.row] as Any
        
        cell.lbl.text = String(describing: item)
        
            let status:NSInteger = getStatusFor(indexPath)
            if status == 0 {
                cell.backgroundColor = UIColor.white
                cell.btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
                cell.lbl.textColor = UIColor.black
            } else {
                cell.backgroundColor = UIColor.blue
                cell.btn.setTitleColor(UIColor.white, for: UIControlState.normal)
                cell.lbl.textColor = UIColor.white
            }
        
        
        return cell
    }
    
    func rowSelect(cell: UITableViewCell) -> Void {
        if let row = tbl.indexPath(for: cell) {
            print(row)
            
            let status:NSInteger = getStatusFor(row)
            if status == 0 {
                statusArray.replaceObject(at: (row as NSIndexPath).row, with: "1")
                selectedRow.add(row.row)

            } else {
                statusArray.replaceObject(at: (row as NSIndexPath).row, with: "0")
                selectedRow.remove(row.row)

            }
            
            tbl.beginUpdates()
            tbl.reloadRows(at: [row], with: UITableView.RowAnimation.none)
            tbl.endUpdates()
        }
        
        print(selectedRow)
    }
    
    func getStatusFor(_ index:IndexPath) -> NSInteger {
        print(index)
        var status = NSInteger()
        status = (statusArray[(index as NSIndexPath).row] as AnyObject).intValue
        print(status)
        return status
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

