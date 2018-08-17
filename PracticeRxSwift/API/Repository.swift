//
//  Repository.swift
//  PracticeRxSwift
//
//  Created by user on 2018/08/17.
//  Copyright © 2018年 charco. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let fullName: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
    }
}
