//
//  settingsViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 21/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class settingsViewController: UIViewController {
    
    @IBOutlet weak var firstNameData: UITextField!
    
    
    @IBOutlet weak var lastNameData: UITextField!
    
    @IBOutlet weak var emailData: UITextField!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let db = Firestore.firestore()
        
        if let user = Auth.auth().currentUser {
            let id = user.uid
            db.collection("users").document(id).getDocument(completion: { (result,error) in
                //حفظ بينات الدخول
                if error != nil {
                    print("~~ Error: \(error?.localizedDescription)")
                }
                else {
                    if let data = result?.data() {
                        self.firstNameData.text = data["firstname"] as! String
                        self.lastNameData.text = data["lastname"] as! String

                    }
                }
            })
//            print("~~ \()")
            emailData.text = user.email
            Utilities.styleTextField(firstNameData)
            Utilities.styleTextField(lastNameData)
            Utilities.styleTextField(emailData)
            
            
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

}
