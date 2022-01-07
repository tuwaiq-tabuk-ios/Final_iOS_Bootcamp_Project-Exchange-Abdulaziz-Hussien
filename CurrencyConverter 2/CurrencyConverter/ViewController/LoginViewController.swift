//
//  LoginViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 13/12/2021.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    //زر نسيان كلمت السر
    @IBOutlet weak var passwordRecovery: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. setUpElements()
    
        setUpElements()
   
    }
    
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleAcshnButton(passwordRecovery
        )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        login(email: email, password: password)
    }
        
    
    
    //حفظ بينات تسجيل الدخول
func login(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                 
                UserDefaults.standard.setValue(email, forKey: "email")
                UserDefaults.standard.setValue(password, forKey: "password")
                UserDefaults.standard.synchronize()
                
                let MainViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.MainViewController) as? MainViewController
                
                self.view.window?.rootViewController = MainViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    

}
