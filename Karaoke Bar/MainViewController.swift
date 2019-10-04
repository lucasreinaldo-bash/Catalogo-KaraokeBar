//
//  MainViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 17/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    
//    @IBOutlet weak var btnVoltar: UIButton!
    @IBOutlet weak var container: UIView!
    var table = [Post] ()
    var ref: DatabaseReference!
    var linkMusica:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        Tableview.self.isHidden = false
        
        
        Tableview.rowHeight = UITableView.automaticDimension
        Tableview.estimatedRowHeight = 76
        
        
        ref = Database.database().reference().child("AllMusic")
        
        //Container para compor o TableView
         ref.observeSingleEvent(of: .value, with: { (snapshot)  in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                print(snapshot)
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
        let cell = Tableview.dequeueReusableCell(withIdentifier: "celula") as! TableViewCell
        
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
        var urlMusica = "https://www.letras.mus.br/"+informacoes.cantor+"/"+informacoes.nomeMusica
        linkMusica = urlMusica
        showToast(message:informacoes.cantor)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultadoController: WebViewViewController = storyboard.instantiateViewController(withIdentifier: "WebView") as! WebViewViewController
        
        resultadoController.stringPassed = urlMusica
        
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
