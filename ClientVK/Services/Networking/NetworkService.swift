//
//  VKApi.swift
//  ClientVK
//
//  Created by DES on 05.03.2021.
//

import Foundation

protocol NetworkServiceProtocol: class {
    func login(id: String, password: String)
    func getNews(complition: @escaping([News]) -> Void)
}

class NetworkService: NetworkServiceProtocol {
        
    func getNews(complition: @escaping ([News]) -> Void) {
        

    }    
    
    private let authUrl = "https://oauth.vk.com/authorize?scope=friends&client_id=%@&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&response_type=token&v=5.130&state="
        
    func login(id: String, password: String) {
                
        let urlString = String(format: authUrl, id);
        
        guard let url = URL(string: urlString) else { return }
        let res = URLSession.shared.dataTask(with: url)
        res.resume()
        print(res)
        
    }
}
