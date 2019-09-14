//
//  TableViewCell.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 15/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var identificadorMusica: UILabel!
    @IBOutlet weak var cantorMusica: UILabel!
    @IBOutlet weak var nomeDaMusica: UILabel!
    
    @IBOutlet weak var container: UIView! {
        didSet {
            // Make it card-like
            container.layer.cornerRadius = 5
           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
