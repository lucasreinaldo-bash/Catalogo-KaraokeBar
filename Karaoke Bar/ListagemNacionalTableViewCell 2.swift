//
//  ListagemNacionalTableViewCell.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 11/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit

class ListagemNacionalTableViewCell: UITableViewCell {

   
    @IBOutlet weak var codID: UILabel!
    @IBOutlet weak var codNome: UILabel!
    @IBOutlet weak var codMusica: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(post:Post){
        
        codMusica.text = post.id
        codNome.text = post.cantor
        codMusica.text = post.nomeMusica
    }
}
