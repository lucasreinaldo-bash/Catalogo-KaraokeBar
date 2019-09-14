//
//  PalestrantesNacionaisViewController.swift
//  Congresso Foz ABNc 2019
//
//  Created by Lucas Santos Reinaldo on 20/03/19.
//  Copyright © 2019 INC. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PalestrantesNacionaisViewController:UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var button1: UIButton!
    func setupButton (){
        let image = UIImage(named: "retornar") as UIImage?
        button1 = UIButton.init()
        view.addSubview(button1)
        // button1.setTitle("Testando", for: .normal)
        button1.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
        button1.center.x = self.view.center.x
        button1.center.y = self.view.center.y
        button1.setImage(image, for: .normal)
        button1.addTarget(self, action: #selector(buttonInAction), for: UIControl.Event.touchUpInside)
        
        button1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Voltando para a tela de Registro
        
        
        
    }
    @objc func buttonInAction(){
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "palestrantes_id") {
            present(destinationVC, animated: true, completion: nil)
        }    }
    

//    @IBOutlet weak var tableView: UITableView!
     var tableView: UITableView!
//    var tableView:UITableView!
//    var palestrantesNacionais = [PalestrantesNacionais]()
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableView = UITableView(frame: view.bounds, style: .plain)
        let cellNib = UINib(nibName: "PalestrantesNacionaisTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "palestrantesNacionaisCell")
        view.addSubview(tableView)
        setupButton ()
        var layoutGuide:UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            // Fallback on earlier versions
            layoutGuide = view.layoutMarginsGuide
        }
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
        
       
        tableView.tableFooterView = UIView()
        tableView.reloadData()
         observePalestrantes()
         //        tableView.dataSource = self
        // Do any additional setup after loading the view.
//        carregarPalestrantes ()
//        var palestrantesNacionais = PalestrantesNacionais(imageString: "Link da Foto", nacionalidadeString: "Brasileiro", nomeString: "Dermeval Reinaldo")
//        print(palestrantesNacionais.image)
//        print(palestrantesNacionais.nome)
//        print(palestrantesNacionais.nacionalidade)
//    }
//    func carregarPalestrantes (){
//        Database.database().reference().child("PalestrantesNacionais").observe(.childAdded){(snapshot: DataSnapshot) in
////            print (snapshot.value)
//            if let dict = snapshot.value as? [ String: Any] {
//                let imageString = dict["image"] as! String
//                let nacionalidadeString = dict["nacionalidade"] as! String
//                let nomeString = dict["nome"] as! String
//                let palestrantesNacionais = PalestrantesNacionais(imageString: imageString, nacionalidadeString: nacionalidadeString, nomeString: nomeString)
//                self.palestrantesNacionais.append(palestrantesNacionais)
//                self.tableView.reloadData()
//                print(self.palestrantesNacionais)
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension PalestrantesNacionaisViewController: UITableViewDataSource{
//    func tableView (_ tableView: UITableView,
//                     numberOfRowsInSection section: Int) -> Int{
//        return palestrantesNacionais.count
//
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt
//        indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PalestrantesNacionaisCell", for: indexPath)
////        cell.backgroundColor = UIColor.red
//        cell.textLabel?.text = palestrantesNacionais[indexPath.row].nacionalidade
//        print(cell)
//        return cell
//    }
    func observePalestrantes() {
        let postsRef = Database.database().reference().child("PalestrantesNacionais")
        
        postsRef.observe(.value, with: { snapshot in
            
            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
//                    let author = dict["author"] as? [String:Any],
                    let photoURL = dict["image"] as? String,
                    let url = URL(string:photoURL),
                    let nacionalidade = dict["nacionalidade"] as? String,
                    let nome = dict["nome"] as? String{
                 
                    
                
//                    let timestamp = dict["timestamp"] as? Double {
                    
                    let userProfile = UserProfile(photoURL: url)
                    let post = Post(author: userProfile, nacionalidade:nacionalidade,nome:nome,msg:"")
                    tempPosts.append(post)
                }
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "palestrantesNacionaisCell", for: indexPath) as! PalestrantesNacionaisTableViewCell
        cell.set(post: posts[indexPath.row])
        return cell
    }
   
    
}
