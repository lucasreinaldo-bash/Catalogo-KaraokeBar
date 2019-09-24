//
//  QRCodeViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 08/09/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Toast_Swift
class QRCodeViewController: UIViewController,UITextFieldDelegate {
    var  seconds: Int = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var QRView: UIImageView!
    
    
    
    
    
    
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var horaField: UIDatePicker!
    @IBOutlet weak var dataField: UIDatePicker!
    @IBOutlet weak var telefoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sobrenomeField: UITextField!
    @IBOutlet weak var nomeField: UITextField!
    @IBOutlet weak var btnGerarField: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var ref2: DatabaseReference!
        let userID = Auth.auth().currentUser?.uid

        ref2 = Database.database().reference()
        
        ref2.child("QRGerado").child("Clientes").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists(){
                print("CPF Existe")
                
               self.view.makeToast("Estamos te aguardando no nosso espaço !", duration: 5.0, position: .bottom)
                self.gerarQR()
                self.verQR()
                
                
            }
            else{
                self.view.makeToast("Preencha os dados para gerar o seu QR-Code", duration: 7.0, position: .bottom)
                print("CPF nao existe")
            }
        })
            
        { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
    }
    func gerarQR(){
        var style = ToastStyle()
        
        var ref: DatabaseReference!
        let userID = Auth.auth().currentUser?.uid
        let userName = Auth.auth().currentUser?.displayName
        let userEmail = Auth.auth().currentUser?.displayName

        ref = Database.database().reference()
        
        ref.child("Usuario").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let cpf = value?["email"] as? String ?? ""
            
//            let informacoes
            
            
            
            
            let data = cpf.data(using: .ascii, allowLossyConversion: false)
            let dat2 = userName?.data(using: .ascii, allowLossyConversion: false)

            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
            let cilImage = filter?.outputImage
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = cilImage?.transformed(by: transform)
            let img = UIImage(ciImage: transformImage!)
            
            self.QRView.image = img
            
//            self.view.makeToastActivity(.bottom)
            
//            self.view.hideAllToasts()
            ref.child("QRGerado").child("Clientes").child(userID!).child("Situacao").setValue("false")
            ref.child("QRGerado").child("Clientes").child(userID!).child("Nome").setValue(self.nomeField.text)
            ref.child("QRGerado").child("Clientes").child(userID!).child("Email").setValue(self.emailField.text)
            ref.child("QRGerado").child("Clientes").child(userID!).child("Nome").setValue(self.telefoneField.text)
        




//            ref.child("QRGerado").child("Clientes").child(userID!).setValue("true")

            self.verQR()
             self.view.makeToast("Recebemos a sua solicitação e um QR-Code foi gerado . Após entrarmos em contato e confirmamos a reserva, ele estará habilitado para garantir o acesso ao nosso espaço interno", duration: 12.0, position: .bottom)
            
        })
        { (error) in
            print(error.localizedDescription)
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
        func verQR(){
            
            
            horaField.isHidden = true
            dataField.isHidden = true
            nomeField.isHidden = true
            emailField.isHidden = true
            btnGerarField.isHidden = true
            sobrenomeField.isHidden = true
            telefoneField.isHidden = true
            text2Label.isHidden = true
            QRView.isHidden = false
        }
        func esconderQR(){
            
            horaField.isHidden = false
            dataField.isHidden = false
            nomeField.isHidden = false
            emailField.isHidden = false
            btnGerarField.isHidden = false
            sobrenomeField.isHidden = false
            telefoneField.isHidden = false
            text2Label.isHidden = false
            QRView.isHidden = true
            
            
            
            
        }
        

    @IBAction func btnGerarQR(_ sender: Any) {
        gerarQR()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        

        
        emailField.resignFirstResponder()
        telefoneField.resignFirstResponder()
        sobrenomeField.resignFirstResponder()
        nomeField.resignFirstResponder()

        

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
