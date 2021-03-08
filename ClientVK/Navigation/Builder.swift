//
//  Builder.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import UIKit

protocol BuilderProtocol: class {
    func createRootViewController(router: RouterProtocol) -> UIViewController
    func createAuthViewController(router: RouterProtocol) -> UIViewController
    func createNewsViewController(router: RouterProtocol) -> UIViewController
    func createDetailNewsViewController(news: News, router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    func createRootViewController(router: RouterProtocol) -> UIViewController {
        let view = RootViewController()
        let presenter = RootViewPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createAuthViewController(router: RouterProtocol) -> UIViewController {
        let view = AuthViewController()
        let networkService = NetworkService()
        let presenter = AuthPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createNewsViewController(router: RouterProtocol) -> UIViewController {
        let view = NewsViewController()
        let presenter = NewsViewPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailNewsViewController(news: News, router: RouterProtocol) -> UIViewController {
        let view = DetailNewsViewController()
        let presenter = DetailNewsViewPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
