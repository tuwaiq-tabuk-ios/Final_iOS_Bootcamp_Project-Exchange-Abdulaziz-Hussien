//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 12/12/2021.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    
    
   // var videoPlayer:AVPlayer?
    
   // var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let email = UserDefaults.standard.string(forKey: "email")
    let password = UserDefaults.standard.string(forKey: "password")
      
      if (email != nil) && (password != nil) {
          login(email: email!, password: password!)
        signUpButton.isHidden = true
        loginButton.isHidden = true
      }else {
        setUpElements()
        signUpButton.isHidden = false
        loginButton.isHidden = false
      }
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
        
    }

func setUpElements() {
    
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
    
}
    
    func login(email:String, password:String) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
//                    self.errorLabel.text = error!.localizedDescription
//                    self.errorLabel.alpha = 1
                    print("error \(error!.localizedDescription)")
                }
                else {
                    
                    UserDefaults.standard.setValue(email, forKey: "email")
                    UserDefaults.standard.setValue(password, forKey: "password")
                    UserDefaults.standard.synchronize()
                    
                    let MainViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.MainViewController)
                    
                    self.view.window?.rootViewController = MainViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    
}

