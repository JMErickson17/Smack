//
//  ChannelCell.swift
//  Smack
//
//  Created by Justin Erickson on 9/2/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    func configureCell(channel: Channel) {
        let title = channel.name ?? ""
        self.channelNameLabel.text = "#\(title)"
        channelNameLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        let unreadChannels = MessageService.instance.unreadChannels
        for id in unreadChannels {
            if id == channel.id {
                channelNameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
            }
        }
    }
}
