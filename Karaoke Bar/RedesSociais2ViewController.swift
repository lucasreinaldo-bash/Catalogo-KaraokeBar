//
//  RedesSociaisViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 18/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import Firebase

class RedesSociais2ViewController: UIViewController  {
    
    
    
    @IBOutlet weak var labelRedes: UILabel!
    @IBOutlet weak var labelSiga: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        //        proximaTela()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    @objc func instagram (){
        
        var urlMusica = "https://www.instagram.com/karaokebarcuritiba/"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultadoController: WebViewViewController = storyboard.instantiateViewController(withIdentifier: "WebView") as! WebViewViewController
        
        resultadoController.stringPassed = urlMusica
        
        present(resultadoController, animated: true, completion: nil)
        
    }
    @objc func facebook (){
        
        var urlMusica = "https://www.facebook.com/KaraokeBarCuritiba/"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultadoController: WebViewViewController = storyboard.instantiateViewController(withIdentifier: "WebView") as! WebViewViewController
        
        resultadoController.stringPassed = urlMusica
        
        present(resultadoController, animated: true, completion: nil)
        
    }
    
    @objc func youtube (){
        
        var urlMusica = "https://www.youtube.com/channel/UCFlEcE0q8VDv0inC-QTjk-g"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultadoController: WebViewViewController = storyboard.instantiateViewController(withIdentifier: "WebViewRedesSociais") as! WebViewViewController
        
        resultadoController.stringPassed = urlMusica
        
        present(resultadoController, animated: true, completion: nil)
        
    }
    
    
    
    func proximaTela(){
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "main_id") {
            present(destinationVC, animated: true, completion: nil)
        }
        
    }
    
    
}

