//
//  NewsViewPresenter.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import UIKit

protocol NewsViewProtocol: class {
    func onUpdate(news: [News])
}

protocol NewsViewPresenterProtocol: class {
    init(view: NewsViewProtocol, router: RouterProtocol)
    func newsUpdate()
    func newsCount() -> Int
    func getNews(forIndex index: Int) -> News
    func selectNews(withIndex index: Int)
}

class NewsViewPresenter: NewsViewPresenterProtocol {
        
    let view: NewsViewProtocol!
    let service = NewsService()
    let router: RouterProtocol!
    
    private(set) var news = [News]()
    
    required init(view: NewsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func newsUpdate() {
        service.getNews { (news, error)  in
            if let news = news {
                self.news = news
                DispatchQueue.main.async {
                    self.view.onUpdate(news: news)
                }
            }
        }
    }
    
    func newsCount() -> Int {
        return news.count
    }
    
    func getNews(forIndex index: Int) -> News {
        return news[index]
    }
    
    func selectNews(withIndex index: Int) {
        let selectedNews = news[index]
        router.showDetailNews(news: selectedNews)
    }
}
