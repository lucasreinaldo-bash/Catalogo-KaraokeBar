//
//  RegistroViewController.swift
//  Congresso Foz ABNc 2019
//
//  Created by Lucas Santos Reinaldo on 15/03/19.
//  Copyright © 2019 INC. All rights reserved.
//


//Bibliotecas necessarias
import UIKit
import Firebase
import Toast_Swift
import FirebaseAuth

class RegistroViewController: UIViewController {
    
    //Instanciando os campos de entrada de texto
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    @IBOutlet weak var btnProximo: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configurando Toast
        view.endEditing(true)
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .blue
        
        
        //        verificarUsuario()
        //         btnProximo.isEnabled = false
        handleTextField()
        // Do any additional setup after loading the view.
        //FirebaseApp.configure()
        
//        verificarUsuarioLogado()
        
        
        
    }
    
    //    Metodo para demitir o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
 
    func handleTextField(){
        nomeTextField.addTarget(self, action: #selector(RegistroViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        emailTextField.addTarget(self, action: #selector(RegistroViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        
    }
    
    @objc func textFieldDidChange(){
        guard let username = nomeTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty, let sobrenome = sobrenomeTextField.text, !sobrenome.isEmpty, let senha = senhaTextField.text,  !senha.isEmpty else{
            btnProximo.isEnabled = false
            var style = ToastStyle()
            style.messageColor = .white
            style.backgroundColor = .blue
            self.view.makeToast("Preencha todos os campos !", duration: 3.0, position: .bottom, style: style)
            return
        }
        btnProximo.isEnabled = true
    }
    //Verificar usuario logado
    
    //    func verificarUsuario(){
    //        if (Auth.auth().currentUser != nil) {
    //            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer) in
    //                self.performSegue(withIdentifier: "main_id", sender: nil)
    //            })
    //
    //        }
    //
    //    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
 
    
    @IBAction func registroBtn(_ sender: Any) {
        //        let email = "deusnocomando@gmail.com.br"
        
        //Instanciando o Firebase Database
        
        //        print(ref.description())
        
        
        //        Demitindo teclado logo apos clicar no botao proximo
        view.endEditing(true)
        //Realizando o cadastro + a autenticacao atraves do Firebase
        Auth.auth().createUser(withEmail: emailTextField.text!, password: senhaTextField.text!, completion: { (authResult, error) in
            if error == nil {
                print(error?.localizedDescription)
            }
            let ref = Database.database().reference()
            let usersReference = ref.child("Usuario")
            let uid = authResult?.user.uid
            let newUserReference = usersReference.child(uid!)
            newUserReference.setValue(["nome": self.nomeTextField.text! + " " + self.sobrenomeTextField.text!,"email": self.emailTextField.text!,"qrGerado":"false","diaAgendado": "20 de Setembro de 2019","horarioAgendado":"20:00","mesaAgendada":"10"])
            
            var mensagemBoasVindas = "Seja bem-vindo " + self.nomeTextField.text!
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
