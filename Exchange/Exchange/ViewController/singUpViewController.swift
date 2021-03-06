//
//  singUpViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 13/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class singUpViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var singUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var password2: UITextField!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    setUpElements()
  }
  
  
  
  // MARK: - IBActions
  
  @IBAction func singUpTapped(_ sender: Any) {
    let error = validateFields()
    
    if error != nil {
      
      // There's something wrong with the fields, show error message
      showError(error!)
    }
    else {
      
      // Create cleaned versions of the data
      let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // Create the user
      Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        
        // Check for errors
        if err != nil {
          
          // There was an error creating the user
          self.showError("Error creating user")
        }
        else {
          
          //تخزين الاسم الاول وثني   // User was created successfully, now store the first name and last name
          let db = Firestore.firestore()
          
          db.collection("users").document(result!.user.uid).setData(["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
            
            if error != nil {
              // Show error message
              self.showError("Error saving user data")
            }
          }
          
          // Transition to the home screen
          self.transitionToHome()
        }
      }
    }
  }
  
  
  func setUpElements() {
    // Hide the error label
    errorLabel.alpha = 0
    
    // Style the elements
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(singUpButton)
    Utilities.styleTextField(password2)
  }
  
  // MARK: - func
  func validateFields() -> String? {
    // Check that all fields are filled in
    if (firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        password2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") &&
        passwordTextField.text == password2.text{
      
      return "Please fill in all fields."
    }
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
     
    if Utilities.isPasswordValid(cleanedPassword) == false {
      // Password isn't secure enough
     
      return "Please make sure your password is at least 8 characters, contains a special character and a number."
    }
//    if  (password2 == passwordTextField) == true{
    
   // }
    
    return nil
  }
  
  
  func showError(_ message:String) {
    
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func transitionToHome() {
    
    let homeViewController
      = storyboard?
      .instantiateViewController(
        identifier: Constants.Storyboard.MainViewController
      ) as? MainViewController
    
    view.window?.rootViewController = homeViewController
    view.window?.makeKeyAndVisible()
  }
  
}




