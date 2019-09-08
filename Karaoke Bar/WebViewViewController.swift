//
//  WebViewViewController.swift
//  Karaoke Bar
//
//  Created by Lucas Reinaldo on 17/08/19.
//  Copyright © 2019 Vostore. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController:  UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    @IBOutlet weak var webViewContainer: UIView!
    //    var siteURL = "www.google.com.br"
    var stringPassed:String = ""
    var stringPassed2:String = ""

    
  
   
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

//        var map={"â":"a","Â":"A","à":"a","À":"A","á":"a","Á":"A","ã":"a","Ã":"A","ê":"e","Ê":"E","è":"e","È":"E","é":"e","É":"E","î":"i","Î":"I","ì":"i","Ì":"I","í":"i","Í":"I","õ":"o","Õ":"O","ô":"o","Ô":"O","ò":"o","Ò":"O","ó":"o","Ó":"O","ü":"u","Ü":"U","û":"u","Û":"U","ú":"u","Ú":"U","ù":"u","Ù":"U","ç":"c","Ç":"C"};

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
        let link16 = link15.replacingOccurrences(of: "N'", with: "N")
        let link17 = link16.replacingOccurrences(of: "Ú", with: "U")
        let link18 = link17.replacingOccurrences(of: "Ü", with: "U")
        let link19 = link18.replacingOccurrences(of: "ª", with: "A")
        let link20 = link19.replacingOccurrences(of: "Ñ", with: "N")
        let link21 = link20.replacingOccurrences(of: "Ü", with: "U")
        let link22 = link21.replacingOccurrences(of: "È", with: "E")
        let link23 = link22.replacingOccurrences(of: "Ë", with: "E")
        let link24 = link23.replacingOccurrences(of: "Ē", with: "E")
        let link25 = link24.replacingOccurrences(of: "Ė", with: "E")
        let link26 = link25.replacingOccurrences(of: "Í", with: "I")
        let link27 = link26.replacingOccurrences(of: "Î", with: "I")
        let link28 = link27.replacingOccurrences(of: "Ì", with: "I")
        let link29 = link28.replacingOccurrences(of: "Ï", with: "I")
        let link30 = link29.replacingOccurrences(of: "Ī", with: "I")
        let link31 = link30.replacingOccurrences(of: "Ó", with: "O")
        let link32 = link31.replacingOccurrences(of: "Õ", with: "O")
        let link33 = link32.replacingOccurrences(of: "Ò", with: "O")
        let link34 = link33.replacingOccurrences(of: "º", with: "O")
        let link35 = link34.replacingOccurrences(of: "Ö", with: "O")
        let link36 = link35.replacingOccurrences(of: "Ō", with: "O")
        let link37 = link36.replacingOccurrences(of: "Ü", with: "U")
        let link38 = link37.replacingOccurrences(of: "Ú", with: "U")
        let link39 = link38.replacingOccurrences(of: "Ù", with: "U")
        let link40 = link39.replacingOccurrences(of: "Û", with: "U")
        let link41 = link40.replacingOccurrences(of: "Ū", with: "U")
        let link42 = link41.replacingOccurrences(of: ".", with: "")
        let link43 = link42.replacingOccurrences(of: ":", with: "")
        let link44 = link43.replacingOccurrences(of: "\"", with: "")
        let link45 = link44.replacingOccurrences(of: "{", with: "")
        let link46 = link45.replacingOccurrences(of: "}", with: "")
        let link47 = link46.replacingOccurrences(of: "]", with: "")
        let link48 = link47.replacingOccurrences(of: "[", with: "")
        let link49 = link48.replacingOccurrences(of: ":", with: "")
        let link50 = link49.replacingOccurrences(of: "|", with: "")
        let link51 = link50.replacingOccurrences(of: "*", with: "")
        let link52 = link51.replacingOccurrences(of: "!", with: "")
        let link53 = link52.replacingOccurrences(of: "?", with: "")
        let link54 = link53.replacingOccurrences(of: "@", with: "")
        let link55 = link54.replacingOccurrences(of: "#", with: "")
        let link56 = link55.replacingOccurrences(of: "%", with: "")
        let link57 = link56.replacingOccurrences(of: "^", with: "")
        let link58 = link57.replacingOccurrences(of: "+", with: "")
        let link59 = link58.replacingOccurrences(of: "ROCK'N'ROLL", with: "ROCKN-ROLL")
        let link60 = link59.replacingOccurrences(of: "'", with: "")
        let link61 = link60.replacingOccurrences(of: "~", with: "")
        
        stringPassed = link61
       
            let linkk  = stringPassed2.replacingOccurrences(of: " ", with: "-")
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
            let linkk15 = linkk14.replacingOccurrences(of: "Ê", with: "E")
            let linkk16 = linkk15.replacingOccurrences(of: "N'", with: "N")
            let linkk17 = linkk16.replacingOccurrences(of: "Ú", with: "U")
            let linkk18 = linkk17.replacingOccurrences(of: "Ü", with: "U")
            let linkk19 = linkk18.replacingOccurrences(of: "ª", with: "A")
            let linkk20 = linkk19.replacingOccurrences(of: "Ñ", with: "N")
            let linkk21 = linkk20.replacingOccurrences(of: "Ü", with: "U")
            let linkk22 = linkk21.replacingOccurrences(of: "È", with: "E")
            let linkk23 = linkk22.replacingOccurrences(of: "Ë", with: "E")
            let linkk24 = linkk23.replacingOccurrences(of: "Ē", with: "E")
            let linkk25 = linkk24.replacingOccurrences(of: "Ė", with: "E")
            let linkk26 = linkk25.replacingOccurrences(of: "Í", with: "I")
            let linkk27 = linkk26.replacingOccurrences(of: "Î", with: "I")
            let linkk28 = linkk27.replacingOccurrences(of: "Ì", with: "I")
            let linkk29 = linkk28.replacingOccurrences(of: "Ï", with: "I")
            let linkk30 = linkk29.replacingOccurrences(of: "Ī", with: "I")
            let linkk31 = linkk30.replacingOccurrences(of: "Ó", with: "O")
            let linkk32 = linkk31.replacingOccurrences(of: "Õ", with: "O")
            let linkk33 = linkk32.replacingOccurrences(of: "Ò", with: "O")
            let linkk34 = linkk33.replacingOccurrences(of: "º", with: "O")
            let linkk35 = linkk34.replacingOccurrences(of: "Ö", with: "O")
            let linkk36 = linkk35.replacingOccurrences(of: "Ō", with: "O")
            let linkk37 = linkk36.replacingOccurrences(of: "Ü", with: "U")
            let linkk38 = linkk37.replacingOccurrences(of: "Ú", with: "U")
            let linkk39 = linkk38.replacingOccurrences(of: "Ù", with: "U")
            let linkk40 = linkk39.replacingOccurrences(of: "Û", with: "U")
            let linkk41 = linkk40.replacingOccurrences(of: "Ū", with: "U")
            let linkk42 = linkk41.replacingOccurrences(of: ".", with: "")
            let linkk43 = linkk42.replacingOccurrences(of: ":", with: "")
            let linkk44 = linkk43.replacingOccurrences(of: "\"", with: "")
            let linkk45 = linkk44.replacingOccurrences(of: "{", with: "")
            let linkk46 = linkk45.replacingOccurrences(of: "}", with: "")
            let linkk47 = linkk46.replacingOccurrences(of: "]", with: "")
            let linkk48 = linkk47.replacingOccurrences(of: "[", with: "")
            let linkk49 = linkk48.replacingOccurrences(of: ":", with: "")
            let linkk50 = linkk49.replacingOccurrences(of: "|", with: "")
            let linkk51 = linkk50.replacingOccurrences(of: "*", with: "")
            let linkk52 = linkk51.replacingOccurrences(of: "!", with: "")
            let linkk53 = linkk52.replacingOccurrences(of: "?", with: "")
            let linkk54 = linkk53.replacingOccurrences(of: "@", with: "")
            let linkk55 = linkk54.replacingOccurrences(of: "#", with: "")
            let linkk56 = linkk55.replacingOccurrences(of: "%", with: "")
            let linkk57 = linkk56.replacingOccurrences(of: "^", with: "")
            let linkk58 = linkk57.replacingOccurrences(of: "+", with: "")
            let linkk59 = linkk58.replacingOccurrences(of: "ROCK'N'ROLL", with: "ROCKN-ROLL")
            let linkk60 = linkk59.replacingOccurrences(of: "'", with: "")
            let linkk61 = linkk60.replacingOccurrences(of: "~", with: "")
            
            stringPassed2 = linkk61
        
    


//        let valuePadrao =  URL = "https://www.letras.mus.br/"
        
        
        let url = URL(string: "https://www.letras.mus.br/"+stringPassed+"/"+stringPassed2)!
        print(url)
        webView.load(URLRequest(url: url))!
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
 

    
    
}

