//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 12/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
   // var videoPlayer:AVPlayer?
    
   // var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
}

override func viewWillAppear(_ animated: Bool) {
    
   
   // setUpVideo()
}

func setUpElements() {
    
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
    
}
}

