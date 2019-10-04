//
//  FacebookViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 30/09/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import WebKit

class InstagramViewController: UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!
    @IBOutlet weak var webViewContainer: UIView!
    //    var siteURL = "www.google.com.br"
    var stringPassed:String = ""
    
    
    
    //    @IBOutlet weak var btnVoltar: UIButton!
    
    //    var button1: UIButton!
    //    func setupButton (){
    //        let image = UIImage(named: "retornar") as UIImage?
    //        button1 = UIButton.init()
    //        view.addSubview(button1)
    //        // button1.setTitle("Testando", for: .normal)
    //        button1.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
    //        button1.center  = CGPoint(x:190, y:581)
    //        button1.setImage(image, for: .normal)
    //        button1.addTarget(self, action: #selector(buttonInAction), for: UIControl.Event.touchUpInside)
    //
    //        button1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //
    //        // Voltando para a tela de Registro
    //
    //
    //
    //    }
    @objc func buttonInAction(){
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "main_id") {
            present(destinationVC, animated: true, completion: nil)
        }    }
    
    
    @IBAction func dismiss_onClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func loadView() {
        super.loadView()
        //        let webConfiguration = WKWebViewConfiguration()
        //        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        //        webView.navigationDelegate = self
        //
        ////        exibicaoWebView.addSubview(webView)
        //        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        print (stringPassed)
        
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.webViewContainer.frame.size.height))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webViewContainer.addSubview(webView)
        webView.topAnchor.constraint(equalTo: webViewContainer.topAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: webViewContainer.rightAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: webViewContainer.leftAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: webViewContainer.heightAnchor).isActive = true
        webView.navigationDelegate = self
        
        
        // Método para retirar os espacos e brancos e caracteres indevidos da URL
        let link  = stringPassed.replacingOccurrences(of: " ", with: "-")
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
        let link15 = link14.replacingOccurrences(of: "Ê", with: "E")
        
        //        let valuePadrao =  URL = "https://www.letras.mus.br/"
        let url = URL(string: "https://www.instagram.com/karaokebarcuritiba/")!
        webView.load(URLRequest(url: url))!
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    
}
