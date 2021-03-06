//
//  UserState.swift
//  Findee
//
//  Created by михаил on 18/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit

final class UserState {
    private init() {}
    
    static let shared = UserState()
    var log: String?
    var pas: String?
    var type: UserType?
    func getStrType()->String
    {
     if(self.type == UserType.specialist)
     {
        return "specialist"
        }
        else if(self.type == UserType.client)
     {
        return "client"
        }
        else
     {
        return "admin"
        }
    }
}
