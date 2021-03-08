//
//  AuthVK.swift
//  ClientVK
//
//  Created by DES on 06.03.2021.
//

import Foundation

protocol AuthServiceDelegate: class {
    func authorizationSucceeded()
    func authorizationFailed()
    func authorizationInitialized(viewController: UIViewController)
}

class AuthService: NSObject {
    
    private let appId = "7783753"
    private let vk: VKSdk!
    
    weak var delegate: AuthServiceDelegate?
        
    override init() {        
        vk = VKSdk.initialize(withAppId: appId)
        super.init()
        
        vk.register(self)
        vk.uiDelegate = self
    }
    
    func updateSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { (state, error) in
            if state == .authorized {
                self.delegate?.authorizationSucceeded()
            } else {
                VKSdk.authorize(scope)
            }
        }
    }
}

extension AuthService: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        delegate?.authorizationSucceeded()
    }
    
    func vkSdkUserAuthorizationFailed() {
        delegate?.authorizationFailed()
    }
}

extension AuthService: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        delegate?.authorizationInitialized(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
}
