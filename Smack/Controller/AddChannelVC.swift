//
//  AddChannelVC.swift
//  Smack
//
//  Created by Justin Erickson on 9/2/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // MARK: @IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // MARK: View Setup
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: @IBActions
    @IBAction func createChannelTapped(_ sender: Any) {
        guard let channelName = nameTextField.text, nameTextField.text != "" else { return }
        guard let description = descriptionTextField.text else { return }
        SocketService.instance.addChannel(name: channelName, description: description) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeModalTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
