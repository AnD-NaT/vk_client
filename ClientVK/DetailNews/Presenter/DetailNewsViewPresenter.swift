//
//  DetailNewsViewPresenter.swift
//  ClientVK
//
//  Created by DES on 08.03.2021.
//

import UIKit

protocol DetailNewsViewProtocol: class {
    
}

protocol DetailNewsPresenterProtocol: class {
    init(view: DetailNewsViewProtocol, router: RouterProtocol)
}

class DetailNewsViewPresenter: DetailNewsPresenterProtocol {
    
    let view: DetailNewsViewProtocol!
    let router: RouterProtocol!
    
    required init(view: DetailNewsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}
