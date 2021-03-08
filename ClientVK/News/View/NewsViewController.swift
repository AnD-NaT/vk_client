//
//  NewsViewController.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: NewsViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetup()
        presenter.newsUpdate()
    }
    
    private func tableViewSetup() {
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectNews(withIndex: indexPath.row)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.newsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        let news = presenter.getNews(forIndex: indexPath.item)
        cell?.setNews(news)
        return cell ?? UITableViewCell()
    }
}

extension NewsViewController: NewsViewProtocol {
    func onUpdate(news: [News]) {
        tableView.reloadData()
    }
}
