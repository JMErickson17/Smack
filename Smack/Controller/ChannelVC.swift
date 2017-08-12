//
//  ChannelVC.swift
//  Smack
//
//  Created by Justin Erickson on 8/10/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userAvatarImage: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userAvatarImage.image = UIImage(named: UserDataService.instance.avatarName)
            userAvatarImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            userAvatarImage.image = UIImage(named: "menuProfileIcon")
            userAvatarImage.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
        
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
}
