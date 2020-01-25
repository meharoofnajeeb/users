//
//  UsersListVC.swift
//  Users
//
//  Created by Meharoof Najeeb on 25/01/2020.
//  Copyright © 2020 Meharoof Najeeb. All rights reserved.
//

import UIKit

class UsersListVC: UIViewController {
    
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var usersListTV: UITableView!
    
    var usersList: [UserModel] = [UserModel(id: 1, name: "Shiro"), UserModel(id: 2, name: "Line"), UserModel(id: 3, name: "Wakaba"), UserModel(id: 4, name: "Rin")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usersListTV.tableFooterView = UIView()
        usersListTV.reloadData()
    }
    
    // MARK: - IBActions

    @IBAction func sortTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sortBtn.isSelected {
            self.usersList = self.usersList.sorted { $0.id < $1.id }
        } else {
            self.usersList = self.usersList.sorted { $0.name < $1.name }
        }
        self.usersListTV.reloadData()
    }
    
}

extension UsersListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let userModel = usersList[indexPath.row]
        
        if sortBtn.isSelected {
            cell.textLabel?.text = "ID: \(userModel.id), NAME: \(userModel.name)"
        } else {
            cell.textLabel?.text = "NAME: \(userModel.name), ID: \(userModel.id)"
        }
        
        return cell
    }
}

struct UserModel {
    var id: Int
    var name: String
}
