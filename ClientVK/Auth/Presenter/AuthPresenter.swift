//
//  AuthPresenter.swift
//  ClientVK
//
//  Created by DES on 04.03.2021.
//

import Foundation

protocol AuthViewProtocol: class {
    func loginSuccess()
    func loginError(error: Error)
}

protocol AuthViewPresenterProtocol: class {
    init(view: AuthViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
}

class AuthPresenter: AuthViewPresenterProtocol {
    
    let view: AuthViewProtocol
    let api: NetworkServiceProtocol
    let router: RouterProtocol
    
    private var auth = AuthService()
    
    required init(view: AuthViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.api = networkService
        self.router = router
        
        auth.delegate = self
        auth.updateSession()
    }
}

extension AuthPresenter: AuthServiceDelegate {
    func authorizationInitialized(viewController: UIViewController) {
        router.showViewController(viewController)
    }
    
    func authorizationSucceeded() {
        router.showNews()
    }
    
    func authorizationFailed() {
        
    }
}
