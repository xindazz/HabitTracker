//
//  FBKeys.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation
enum FBKeys {
    
    enum CollectionPath {
        static let users = "users"
        static let alarms = "alarms"
    }
    
    enum User {
        static let uid = "uid"
        static let name = "name"
        static let email = "email"
        static let haveNewAlarm = "haveNewAlarm"
        static let alarmsByMe = "alarmsByMe"
        static let alarmsForMe = "alarmsForMe"
        
        // Add app specific keys here
    }
}
