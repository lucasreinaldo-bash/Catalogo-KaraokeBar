//
//  MenuExtraViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 08/09/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import FirebaseAuth
class MenuExtraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func desconectarBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let signInVC = storyboard!.instantiateViewController(withIdentifier: "login")
            self.present(signInVC, animated: true, completion:  nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
