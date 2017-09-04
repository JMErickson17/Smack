//
//  MessageCell.swift
//  Smack
//
//  Created by Justin Erickson on 9/4/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(message: Message) {
        messageBodyLabel.text = message.message
        usernameLabel.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }

}
