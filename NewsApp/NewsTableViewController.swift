//
//  NewsTableViewController.swift
//  NewsApp
//
//  Created by zombietux on 19/11/2018.
//  Copyright © 2018 zombietux. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var articles:[Article] = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onArticlesReceived(notification:)), name: API.articlesReceiveNotification, object: nil)

        API.sharedInstance.requestArticles()
        
    }
    
    @objc func onArticlesReceived(notification:Notification)
    {
        if let articles:[Article] = notification.object as? [Article]
        {
            self.articles = articles
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        return cell
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIdentifier")
        }
        
        if let article:Article = articles[indexPath.row] {
            cell!.textLabel?.text = article.title
            cell!.detailTextLabel?.text = article.excerpt        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var detailVC = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        
//            detailVC.title = titles[indexPath.row]
//            detailVC.author = authors[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
