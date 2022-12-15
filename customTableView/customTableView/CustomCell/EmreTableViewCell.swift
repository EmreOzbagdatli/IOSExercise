//
//  EmreTableViewCell.swift
//  customTableView
//
//  Created by Emre Özbağdatlı on 15.12.2022.
//

import UIKit

class EmreTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("tiklandi")
    }
    
    
}
