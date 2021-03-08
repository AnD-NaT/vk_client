//
//  AuthViewController.swift
//  ClientVK
//
//  Created by DES on 04.03.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {

    var presenter: AuthViewPresenterProtocol!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension AuthViewController: AuthViewProtocol {
    func loginSuccess() {
        
    }
    
    func loginError(error: Error) {
        
    }
}
