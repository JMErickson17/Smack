//
//  ChannelVC.swift
//  Smack
//
//  Created by Justin Erickson on 8/10/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}