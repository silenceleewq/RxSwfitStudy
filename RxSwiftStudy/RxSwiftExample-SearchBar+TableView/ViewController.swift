//
//  ViewController.swift
//  RxSwiftExample-SearchBar+TableView
//
//  Created by lirenqiang on 2016/12/9.
//  Copyright © 2016年 Ninja. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableViewCell!
    @IBOutlet weak var searchBar: UISearchBar!
    var shownCities = [String]() //Data source for UITableView
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // our mocked API data source 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: - tableView datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }

}

