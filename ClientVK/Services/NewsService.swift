//
//  NewsService.swift
//  ClientVK
//
//  Created by DES on 07.03.2021.
//

import UIKit

protocol NewsServiceDelegate: class {
    func updateNews(news: [News])
}

class NewsService: NSObject {
    
    func getNews(complition: @escaping (([News]?, _ error: Error?) -> Void)) {
        let parameters: [String: Any] = ["extended" : 1]
        let request = VKRequest(method: "wall.get", parameters: parameters)
        request?.execute(resultBlock: { result in
            if let json = result?.json as? [String: Any] {
                let news = self.parce(json: json)
                complition(news, nil)
            }
        }, errorBlock: { error in
            complition(nil, error)
        })
    }
    
    private func parce(json: [String: Any]) -> [News]? {
        guard let items = json["items"] as? [Any] else {
            return nil
        }
        
        var wallNews = [News]()
        
        for item in items {
            guard let value = item as? [String: Any] else {
                continue
            }
            
            let id = getId(json: value)
            let text = getText(json: value)
            let comments = getComments(json: value)
            let date = getDate(json: value)
            let likes = getLikes(json: value)
            
            let news = News(id: id, text: text, comments: comments, date: date, numberOfLikes: likes)
            wallNews.append(news)
        }
        
        return wallNews
    }
    
    private func getId(json: [String : Any]) -> String {
        return json["id"] as? String ?? ""
    }
    
    private func getText(json: [String : Any]) -> String {
        return json["text"] as? String ?? ""
    }
    
    private func getComments(json: [String : Any]) -> [String]? {
        guard let comments = json["comments"] as? [Any] else { return nil }
        for comment in comments {
            
        }
        return nil
    }
    
    private func getDate(json: [String : Any]) -> Date {
        return json["date"] as? Date ?? Date()
    }
    
    private func getLikes(json: [String : Any]) -> Int {
        return 1
    }
}
