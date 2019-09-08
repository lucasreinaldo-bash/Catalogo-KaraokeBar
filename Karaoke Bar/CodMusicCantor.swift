//
//  CodMusicCantor.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 13/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit

class CodMusicCantor: UITableViewCell {

    @IBOutlet var codMusica: UILabel!
    @IBOutlet var codCantorBanda: UILabel!
    @IBOutlet var codNomeMusica: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
