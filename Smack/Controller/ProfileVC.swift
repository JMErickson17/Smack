//
//  ProfileVC.swift
//  Smack
//
//  Created by Justin Erickson on 8/12/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        let user = UserDataService.instance
        
        avatarImage.image = UIImage(named: user.avatarName)
        avatarImage.backgroundColor = user.returnUIColor(components: user.avatarColor)
        userName.text = user.name
        userEmail.text = user.email
        
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeModal))
        backgroundView.addGestureRecognizer(closeTap)
    }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalTapped(_ sender: Any) {
        closeModal()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        closeModal()
    }
}
