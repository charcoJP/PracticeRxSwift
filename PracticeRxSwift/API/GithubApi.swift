//
//  GithubApi.swift
//  PracticeRxSwift
//
//  Created by user on 2018/08/17.
//  Copyright © 2018年 charco. All rights reserved.
//

import APIKit

final class GitHubApi {
    private init() {}
    
    struct SearchRepositories: GitHubRequest {
        typealias Response = SearchRepositoriesResponse
        
        let method: HTTPMethod = .get
        let path: String = "/search/repositories"
        var parameters: Any? {
            return ["q": query, "page": 1]
        }
        
        let query: String
    }
}
