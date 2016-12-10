//
//  ViewController.swift
//  RxSwiftExample-SearchBar+TableView
//
//  Created by lirenqiang on 2016/12/9.
//  Copyright © 2016年 Ninja. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var shownCities = [String]() //Data source for UITableView
    
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // our mocked API data source
    let disposeBag = DisposeBag()  // Bag of disposables to release them when view is being deallocated (protect against retain cycle)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        searchBar
            .rx_text // Observable property thanks to RxCocoa
            .throttle(0.5, scheduler: MainScheduler.instance) // wait 0.5 for changes
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter{ $0.characters.count > 0}// if  the new value is really new, filter for non-empty query.
            .subscribeNext { [unowned self] (query) in // Here we will be notified of every new value
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                self.tableView.reloadData() // And reload table view data.
            }
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
//MARK: - tableView datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return shownCities.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }

}

