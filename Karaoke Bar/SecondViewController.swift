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
    
    
    //Alfabeto
    @IBOutlet weak var A: UIButton!
    
    
    @IBOutlet weak var btnVoltar: UIButton!
    @IBOutlet weak var container: UIView!
    var table = [Post] ()
    var ref: DatabaseReference!
    var linkMusica:String = ""
    
    //VARIAVEL PARA FAZER A ORDENACAO POR LETRA/NUMERO
    var letraNumero: String = "A"
    
    //QUERY DO FIREBASE USADO PARA ORDENAR
    var query: DatabaseQuery!

    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tableview.rowHeight = UITableView.automaticDimension
        Tableview.estimatedRowHeight = 76
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)

        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    
    
    //Alfabeto
    @IBAction func A(_ sender: Any) {
        
        letraNumero = "A"
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func B(_ sender: Any) {
        
        letraNumero = "B"
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func C(_ sender: Any) {
        
        letraNumero = "C"
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func D(_ sender: Any) {
        
        letraNumero = "D"
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func E(_ sender: Any) {
        
        letraNumero = "E"
        
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func F(_ sender: Any) {
        
        letraNumero = "F"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func G(_ sender: Any) {
        
        letraNumero = "G"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func H(_ sender: Any) {
        
        letraNumero = "H"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func I(_ sender: Any) {
        
        letraNumero = "I"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func J(_ sender: Any) {
        
        letraNumero = "J"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func K(_ sender: Any) {
        
        letraNumero = "K"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func L(_ sender: Any) {
        
        letraNumero = "L"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func M(_ sender: Any) {
        
        letraNumero = "M"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func N(_ sender: Any) {
        
        letraNumero = "N"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func O(_ sender: Any) {
        
        letraNumero = "O"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func P(_ sender: Any) {
        
        letraNumero = "P"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func Q(_ sender: Any) {
        
        letraNumero = "Q"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func R(_ sender: Any) {
        
        letraNumero = "R"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func S(_ sender: Any) {
        
        letraNumero = "S"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func T(_ sender: Any) {
        
        letraNumero = "T"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func U(_ sender: Any) {
        
        letraNumero = "U"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func V(_ sender: Any) {
        
        letraNumero = "V"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func W(_ sender: Any) {
        
        letraNumero = "W"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func X(_ sender: Any) {
        
        letraNumero = "X"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func Y(_ sender: Any) {
        
        letraNumero = "Y"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func Z(_ sender: Any) {
        
        letraNumero = "Z"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func zero(_ sender: Any) {
        
        letraNumero = "0"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func um(_ sender: Any) {
        
        letraNumero = "1"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func dois(_ sender: Any) {
        
        letraNumero = "2"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func tres(_ sender: Any) {
        
        letraNumero = "3"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func quatro(_ sender: Any) {
        
        letraNumero = "4"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func cinco(_ sender: Any) {
        
        letraNumero = "5"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func seis(_ sender: Any) {
        
        letraNumero = "6"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func sete(_ sender: Any) {
        
        letraNumero = "7"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func oito(_ sender: Any) {
        
        letraNumero = "8"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
    }
    @IBAction func nove(_ sender: Any) {
        
        letraNumero = "9"
        ref = Database.database().reference().child("Musica")
        query = ref.queryOrdered(byChild: "cantor").queryStarting(atValue: letraNumero)
        
        //Container para compor o TableView
        
        query.observe(DataEventType.value, with: {(snapshot) in
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
