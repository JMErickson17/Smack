//
//  UserDataService.swift
//  Smack
//
//  Created by Justin Erickson on 8/11/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var email = ""
    private(set) public var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func logoutUser() {
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        var red, green, blue, alpha: NSString?
        let defaultColor = UIColor.lightGray
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        scanner.scanUpToCharacters(from: comma, into: &red)
        scanner.scanUpToCharacters(from: comma, into: &green)
        scanner.scanUpToCharacters(from: comma, into: &blue)
        scanner.scanUpToCharacters(from: comma, into: &alpha)
        
        guard let redUnwapped = red else { return defaultColor }
        guard let greenUnwapped = green else { return defaultColor }
        guard let blueUnwapped = blue else { return defaultColor }
        guard let alphaUnwapped = alpha else { return defaultColor }
        
        let redFloat = CGFloat(redUnwapped.doubleValue)
        let greenFloat = CGFloat(greenUnwapped.doubleValue)
        let blueFloat = CGFloat(blueUnwapped.doubleValue)
        let alphaFloat = CGFloat(alphaUnwapped.doubleValue)
        
        let color = UIColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: alphaFloat)
        return color
    }
}
