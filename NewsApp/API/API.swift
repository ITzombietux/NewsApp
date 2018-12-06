//
//  API.swift
//  NewsApp
//
//  Created by zombietux on 06/12/2018.
//  Copyright © 2018 zombietux. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//singleton pattern
private let _API_SharedInstance = API()

class API {
    static let Feed_JSON_URL:URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    class var sharedInstance: API {
        return _API_SharedInstance
    }
    
    func requestArticles() -> Void
    {
        Alamofire.request(API.Feed_JSON_URL).responseJSON { response in
            
            if let data = response.data
            {
                do {
                    let json = try JSON(data: data)
                    
                    print("JSON: \(json)")
                    
                    self.processArticles(json: json)
                }
                catch
                {
                    print("JSON error: \(error)")
                }
            }
            else
            {
                print(response.result.error)
            }
        }
    }
    
    func processArticles(json: JSON)
    {
        print(json)
    }
}


