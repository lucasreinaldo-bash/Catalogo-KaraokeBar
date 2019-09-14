//
//  ContatoViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 19/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import ContactsUI
import FirebaseDatabase
import FirebaseAuth

class ContatoViewController: UIViewController, CNContactViewControllerDelegate{

    
    
    
    
    var counter = 0
    var timer = Timer()
    var ref: DatabaseReference!
    var id = "false"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        timer.invalidate() // just in case this button is tapped multiple times
        ref = Database.database().reference().child("Catalogo")

//         start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func timerAction() {
        counter += 1
        if (counter == 5){
            
            ref.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount > 0 {
                    
                    for post in snapshot.children.allObjects as! [DataSnapshot] {
                        let Object = post.value as? [String: AnyObject]
                        
                        self.id = Object?["situacao"] as! String
                        
                        print(self.id)
                    
                        if ( self.id == "false"){
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let resultadoController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "login") as! LoginViewController
                            
                            
                            self.present(resultadoController, animated: true, completion: nil)
                            
                            
                        }
                        if(self.id == "true"){
                            
                            self.verificarUsuarioLogado()
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let resultadoController: ThirtyViewController = storyboard.instantiateViewController(withIdentifier: "main_id") as! ThirtyViewController
                            
                            
                            self.present(resultadoController, animated: true, completion: nil)
                            
                        }
                        else {
                            print("Sem internet")
                        }
                    }
                    
                   
                }
            })
            
            
            
        }
    }
    func verificarUsuarioLogado(){
        Auth.auth().addStateDidChangeListener(_:) { (auth, user) in
            if let user = user {
                let storyboard = UIStoryboard(name:"Main", bundle: nil)
                let signInVC = storyboard.instantiateViewController(withIdentifier: "main_2")
                self.present(signInVC, animated: true, completion:  nil)
            } else {
                print("No user is signed in.")
            }
        }
    }
}
