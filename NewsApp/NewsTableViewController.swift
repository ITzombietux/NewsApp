//
//  NewsTableViewController.swift
//  NewsApp
//
//  Created by zombietux on 19/11/2018.
//  Copyright © 2018 zombietux. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var titles:[String] = [
        "New York Lakers Score Again!",
        "Apple Presents New iWatch",
        "Deeplink.me Wants To Break Open App Discovery",
        "Silly Cat Attempts Jump And Hits Air",
        "New MacBook Air So Thin People Can't See It",
        "Higgs-Boson Finally Discovered In Scientists Coat"
    ]
    
    var authors:[String] = [
        "Bob",
        "Alice",
        "Reinder",
        "zombietux",
        "Ford",
        "Zaphod"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        return cell
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIdentifier")
        }
        
        cell!.textLabel?.text = titles[indexPath.row]
        cell!.detailTextLabel?.text = authors[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var detailVC = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
