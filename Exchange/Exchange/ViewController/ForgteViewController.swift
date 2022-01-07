//
//  forgteViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 28/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth
class ForgteViewController: UIViewController {

    
    
    @IBOutlet weak var email: UITextField!
    
    @IBAction func sendPass(_ sender: Any) {
    
        let auth = Auth.auth()
                    auth.sendPasswordReset(withEmail: email.text!) { (error) in
                        if let error = error {
                            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                      let alert = UIAlertController(title: "Succesfully", message: "A password reset email has been sent!", preferredStyle: UIAlertController.Style.alert)
                            let action = UIAlertAction(title: "Done", style: .cancel) { UIAlertAction in
                              self.navigationController?.popViewController(animated: true)
                            }
                            alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
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
