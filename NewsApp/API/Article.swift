//
//  Article.swift
//  NewsApp
//
//  Created by zombietux on 07/12/2018.
//  Copyright © 2018 zombietux. All rights reserved.
//

import Foundation

class Article: CustomStringConvertible {
    var id:Int = 0
    var title:String = ""
    var author: String = ""
    var content: String = ""
    var thumbnailURL: String = ""
    var articleURL: String = ""
    var excerpt: String = ""
    var creationDate:Date = Date()
    
    var description:String {
        return "Article: \(self.creationDate) --\(self.title) --\(self.articleURL)"
    }
}
