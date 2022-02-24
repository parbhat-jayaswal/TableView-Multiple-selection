//
//  TableViewCell.swift
//  Multi Seleect
//
//  Created by Prabhat on 09/07/17.
//  Copyright © 2017 Prabhat. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var btn: UIButton!
    @IBOutlet var lbl: UILabel!
    
    var delegat = ViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btn(_ sender: UIButton) {
        delegat.rowSelect(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
