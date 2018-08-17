//
//  SearchRepositoriesResponse.swift
//  PracticeRxSwift
//
//  Created by user on 2018/08/17.
//  Copyright © 2018年 charco. All rights reserved.
//

import Foundation

struct SearchRepositoriesResponse: Decodable {
    let items: [Repository]
}
