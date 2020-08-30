//
//  UserViewModel.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Alarm : Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String = ""
    var date: Date = Date()
    var sender: String = ""
    var receiver: String = ""
//    var sound: String = ""
    
    
    
}
