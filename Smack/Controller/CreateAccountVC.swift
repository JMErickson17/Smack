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
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    func setupView() {
        activitySpinner.isHidden = true
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        guard let email = emailTextField.text, emailTextField.text != "" else { return }
        guard let username = usernameTextField.text, usernameTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.activitySpinner.isHidden = true
                                self.activitySpinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func changeBGColorTapped(_ sender: Any) {
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        avatarColor = "[\(red), \(green), \(blue), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColor
        }
        
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
