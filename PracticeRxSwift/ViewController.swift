//
//  ViewController.swift
//  PracticeRxSwift
//
//  Created by user on 2018/08/17.
//  Copyright © 2018年 charco. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {
    
    private var list = [Repository]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        Session.send(GitHubApi.SearchRepositories(query: "rxswift")) { result in
            switch result {
            case .success(let response):
                self.list.removeAll()
                
                self.list += response.items
                self.tableView.reloadData()
                
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("onClick: %d", indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! MyCell
        
        let item = list[indexPath.row]
        
        cell.name = item.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}

final class MyCell: UITableViewCell {
    
    var name: String? {
        didSet {
            self.label?.text = self.name
        }
    }
    
    @IBOutlet weak var label: UILabel!
}


