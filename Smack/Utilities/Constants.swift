//
//  Constants.swift
//  Smack
//
//  Created by Justin Erickson on 8/11/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

/* -------------------- Segues -------------------- */

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

/* -------------------- Cells -------------------- */

let AVATAR_CELL = "avatarCell"
let NUMBER_OF_AVATARS = 28

/* -------------------- User Defaults -------------------- */

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

/* -------------------- Colors -------------------- */

let smackPurplePlaceholder = #colorLiteral(red: 0.3976354599, green: 0.5083267093, blue: 0.8185241222, alpha: 0.5)

/* -------------------- Notifications -------------------- */

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

/* -------------------- URLs -------------------- */

let BASE_URL = "https://ios-chat-api.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"
let ADD_USER_URL = "\(BASE_URL)user/add"
let USER_BY_EMAIL_URL = "\(BASE_URL)user/byEmail/"
let GET_CHANNELS_URL = "\(BASE_URL)channel"
let GET_MESSAGES_URL = "\(BASE_URL)message/byChannel/"

/* -------------------- Headers -------------------- */

let HEADER = [ "Content-Type": "application/json; charset=utf-8" ]
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
