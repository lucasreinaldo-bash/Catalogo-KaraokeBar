//
//  SecondViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 18/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import FirebaseDatabase
class SecondViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var btnVoltar: UIButton!
    @IBOutlet weak var container: UIView!
    var table = [Post] ()
    var ref: DatabaseReference!
    var linkMusica:String = ""
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tableview.rowHeight = UITableView.automaticDimension
        Tableview.estimatedRowHeight = 76
        
        ref = Database.database().reference().child("Musica")
        
        //Container para compor o TableView
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for post in snapshot.children.allObjects as! [DataSnapshot] {
                    let Object = post.value as? [String: AnyObject]
                    
                    let id = Object?["id"]
                    let cantor = Object?["cantor"]
                    let nomeMusica = Object?["nomeMusica"]
                    
                    let post = Post(id: id as! String , cantor: cantor as! String, nomeMusica: nomeMusica as! String)
                    
                    self.table.append(post)
                    
                    self.Tableview.reloadData()
                    
                }
            }
        })
        //        proximaTela()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    let urlArray = ["http://google.com", "https://apple.com"]
    
    
    
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let post: Post
        
        post = table[indexPath.row]
        cell.cantorMusica.text = post.cantor
        cell.identificadorMusica.text = post.id
        cell.nomeDaMusica.text = post.nomeMusica
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let informacoes: Post
        informacoes = table[indexPath.row]
       
        
        let link  = informacoes.nomeMusica.replacingOccurrences(of: " ", with: "-")
        let link2 = link.replacingOccurrences(of: "´", with: "")
        let link3 = link2.replacingOccurrences(of: "´T", with: "T")
        let link4 = link3.replacingOccurrences(of: "´N", with: "N")
        let link5 = link4.replacingOccurrences(of: "'T", with: "T")
        let link6 = link5.replacingOccurrences(of: "Ç", with: "C")
        let link7 = link6.replacingOccurrences(of: "Ã", with: "A")
        let link8 = link7.replacingOccurrences(of: "Á", with: "A")
        let link9 = link8.replacingOccurrences(of: "À", with: "A")
        let link10 = link9.replacingOccurrences(of: "É", with: "E")
        let link11 = link10.replacingOccurrences(of: "E", with: "E")
        let link12 = link11.replacingOccurrences(of: "ô", with: "O")
        let link13 = link12.replacingOccurrences(of: "Í", with: "I")
        
        let link14 = link13.replacingOccurrences(of: "N´", with: "N")
        let link15 = link14.replacingOccurrences(of: "N'", with: "N")
        let link16 = link15.replacingOccurrences(of: "Ú", with: "U")
        let link17 = link16.replacingOccurrences(of: "Ü", with: "U")
        
        
        
        let linkk  = informacoes.cantor.replacingOccurrences(of: " ", with: "-")
        
        let linkk2 = linkk.replacingOccurrences(of: "´", with: "")
        let linkk3 = linkk2.replacingOccurrences(of: "´T", with: "T")
        let linkk4 = linkk3.replacingOccurrences(of: "´N", with: "N")
        let linkk5 = linkk4.replacingOccurrences(of: "'T", with: "T")
        let linkk6 = linkk5.replacingOccurrences(of: "Ç", with: "C")
        let linkk7 = linkk6.replacingOccurrences(of: "Ã", with: "A")
        let linkk8 = linkk7.replacingOccurrences(of: "Á", with: "A")
        let linkk9 = linkk8.replacingOccurrences(of: "À", with: "A")
        let linkk10 = linkk9.replacingOccurrences(of: "É", with: "E")
        let linkk11 = linkk10.replacingOccurrences(of: "E", with: "E")
        let linkk12 = linkk11.replacingOccurrences(of: "ô", with: "O")
        let linkk13 = linkk12.replacingOccurrences(of: "Í", with: "I")
        
        let linkk14 = linkk13.replacingOccurrences(of: "N´", with: "N")
        let linkk15 = linkk14.replacingOccurrences(of: "N'", with: "N")
        let linkk16 = linkk15.replacingOccurrences(of: "Ú", with: "U")
        let linkk17 = linkk16.replacingOccurrences(of: "Ü", with: "U")
        
        
        
        var urlMusicaCantor = linkk17
        var urlMusicaCancao = link17
        
        //        linkMusica = urlMusica
        showToast(message:informacoes.cantor)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultadoController: WebViewViewController = storyboard.instantiateViewController(withIdentifier: "WebView") as! WebViewViewController
        
        resultadoController.stringPassed = urlMusicaCantor
        resultadoController.stringPassed2 = urlMusicaCancao
        
        present(resultadoController, animated: true, completion: nil)
        
        
        
        
        //            UIApplication.shared.openURL(url)
        
    }
    
    func proximaTela(){
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "main_id") {
            present(destinationVC, animated: true, completion: nil)
        }
        
    }
    func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
