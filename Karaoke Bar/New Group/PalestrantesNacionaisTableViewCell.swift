//
//  PalestrantesNacionaisTableViewCell.swift
//  Congresso Foz ABNc 2019
//
//  Created by Lucas Santos Reinaldo on 21/03/19.
//  Copyright © 2019 INC. All rights reserved.
//

import UIKit

class PalestrantesNacionaisTableViewCell: UITableViewCell {

    
    
    
   
    @IBOutlet weak var nacionalidadeLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var imagePais: UIImageView!
    @IBOutlet weak var msgPalestrante: UILabel!
    //     @IBOutlet weak var msgPalestrante: UILabel!
//    @IBOutlet weak var nacionalidadeLabel: UILabel!
//    @IBOutlet weak var nomeLabel: UILabel!
//    @IBOutlet weak var imagePais: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        Metodo para arrendondar a imagem
//        imagePais.layer.cornerRadius = imagePais.bounds.height / 2
//        imagePais.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(post:Post){
        ImageService.getImage(withURL: post.author.photoURL) { image in
            self.imagePais.image = image
        }
        nomeLabel.text = post.nome
        nacionalidadeLabel.text = post.nacionalidade
        msgPalestrante.text = post.msg
    }
    
}
