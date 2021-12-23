//
//  settingsViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 21/12/2021.
//

import UIKit
import FirebaseAuth

class settingsViewController: UIViewController {
    
    
    
    
    @IBAction func exset(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let email = UserDefaults.standard.string(forKey: "email")
            if !Auth.auth().isSignIn(withEmailLink: email!) {
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: "password")
                UserDefaults.standard.synchronize()
                
                let MainViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.ViewController)
                
                self.view.window?.rootViewController = MainViewController
                self.view.window?.makeKeyAndVisible()
                
            }
        } catch {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
