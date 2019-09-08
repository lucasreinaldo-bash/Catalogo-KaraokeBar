//
//  ListagemNacionalViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 11/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ListagemNacionalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var posts = [Post]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib = UINib(nibName: "ListagemNacionalViewController", bundle: nil)
//    tableView.register(nib, forCellReuseIdentifier: "A")
       
        
        var layoutGuide:UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            // Fallback on earlier versions
            layoutGuide = view.layoutMarginsGuide
        }
        
       
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
        
        
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        
    
 informacoesMusica()
    
        
    }
    func informacoesMusica() {
        
        
        Database.database().reference().child("Music").observe(.value){
            (snapshot: DataSnapshot) in
            print(snapshot.value)
            
            
            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    //                    let author = dict["author"] as? [String:Any],
                
                    let bdCantor = dict["cantor"] as? String,
                    let bdId = dict["id"] as? String,
                    let bdLetraMusica = dict["letraMusica"] as? String,
                    let bdNomeMusica = dict["nomeMusica"] as? String{
                    
                    
                    
                    //                    let timestamp = dict["timestamp"] as? Double {
                    
                    
                    let post = Post(id: bdId, cantor: bdCantor, nomeMusica: bdNomeMusica)
                    tempPosts.append(post)
                }
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        }
        }
        


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "A", for: indexPath) as! ListagemNacionalTableViewCell
        cell.set(post: posts[indexPath.row])
        return cell
    }
    func loadInformacoes(){
        
        Database.database().reference().child
    }
    
    
}
