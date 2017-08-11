//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Justin Erickson on 8/11/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        guard let email = emailTextField.text, emailTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("Registered User")
            }
        }
    }
    
    @IBAction func pickAvatarTapped(_ sender: Any) {
    }
    
    @IBAction func changeBGColorTapped(_ sender: Any) {
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
