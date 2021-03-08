//
//  Router.swift
//  ClientVK
//
//  Created by DES on 06.03.2021.
//

import UIKit

protocol RouterProtocol: class {
    init(navigationController: UINavigationController, builder: Builder)
    func showAuth()
    func showNews()
    func showViewController(_ viewController: UIViewController)
    func showDetailNews(news: News)
    func popToRoot()
}

class Router: RouterProtocol {
    
    let navigationController: UINavigationController!
    let builder: Builder!
    
    required init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
        
        let viewController = builder.createRootViewController(router: self)
        navigationController.viewControllers = [viewController]
    }
        
    func showAuth() {
        let viewController = builder.createAuthViewController(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNews() {
        let viewController = builder.createNewsViewController(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showViewController(_ viewController: UIViewController) {
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetailNews(news: News) {
        
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
