//
//  LoginViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 24/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin
import TwitterKit
import FirebaseAuth
import UIKit
import Toast_Swift
class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var senhaField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        verificarUsuarioLogado()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any){
        if let email = emailField.text, let password = senhaField.text{
            Auth.auth().signIn(withEmail: email, password: password, completion:{ user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                print("Usuário logado")
                
                self.view.endEditing(true)
                
        
                //Conduzindo o usuario com o cadastro confirmado, para a tela seguinte
                var style = ToastStyle()
                style.messageColor = .white
                style.backgroundColor = .blue
                self.view.makeToast("Seja bem-vindo!", duration: 4.0, position: .bottom, style: style)
                let storyboard = UIStoryboard(name:"Main", bundle: nil)
                let signInVC = storyboard.instantiateViewController(withIdentifier: "main_2")
                self.present(signInVC, animated: true, completion:  nil)
                
            })
        }
        
        
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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

    // 13
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        emailField.resignFirstResponder()
        senhaField.resignFirstResponder()

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//
//        self.view.endEditing(true)
//
//        return true
//
//    }
 
}
