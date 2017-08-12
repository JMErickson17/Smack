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

/* -------------------- User Defaults -------------------- */

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

/* -------------------- URLs -------------------- */

let BASE_URL = "https://ios-chat-api.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"
let ADD_USER_URL = "\(BASE_URL)user/add"

/* -------------------- Headers -------------------- */

let HEADER = [ "Content-Type": "application/json; charset=utf-8" ]
