//
//  RootViewController.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    
    var presenter: RootViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.updateSession()
        startLoading()
    }
    
    private func startLoading() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    private func stopLoading() {
        loadingIndicator.isHidden = true
    }
}

extension RootViewController: RootViewProtocol {
    
    func changeLogin() {
        
    }
    
    func changeNews() {
        
    }
}
