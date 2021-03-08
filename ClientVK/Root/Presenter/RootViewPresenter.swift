//
//  RootViewPresenter.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import UIKit

protocol RootViewProtocol: class {
    func changeLogin()
    func changeNews()    
}

protocol RootViewPresenterProtocol: class {
    init(view: RootViewProtocol, router: RouterProtocol)
    func updateSession()
}

class RootViewPresenter: RootViewPresenterProtocol {
    
    let view: RootViewProtocol
    let auth = AuthService()
    let router: RouterProtocol
    
    required init(view: RootViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        auth.delegate = self
    }
    
    func updateSession() {
        auth.updateSession()
    }
}

extension RootViewPresenter: AuthServiceDelegate {
    func authorizationSucceeded() {
        router.showNews()
    }
    
    func authorizationFailed() {
        
    }
    
    func authorizationInitialized(viewController: UIViewController) {
        router.showViewController(viewController)
    }
}
