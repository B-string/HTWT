//
//  HTWTManager.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/14.
//

import Foundation
import Alamofire

class HTWTManager {
    
    static let shared = HTWTManager()
    private let server = Server()
    
    func getShortTermForecast(parameters: [String: Int], completion: @escaping (ShortTermForecasts) -> Void) {
        print(parameters)
        
        let requestUrl = server.url + server.page[0]

        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: ShortTermForecasts.self) { response in
//            response.request?.url
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            guard let value = response.value else { return }
            print(value)
            completion(value)
        }
    }
    
    func getMidTermTemperature(parameters: [String: String], completion: @escaping (MidTermTemperature) -> Void) {
        print(parameters)
        
        let requestUrl = server.url + server.page[1]
        
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: MidTermTemperature.self) { response in
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            guard let value = response.value else { return }
            print(value)
            completion(value)
        }
    }
    
    func getMidTermOutlook(parameters: [String: Int], completion: @escaping (MidTermOutlook) -> Void) {
        print(parameters)
        
        let requestUrl = server.url + server.page[2]
        
        print(requestUrl)
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: MidTermOutlook.self) { response in
            print(response)
            guard let url = response.request?.url else { return }
            print(url)
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            guard let value = response.value else { return }
            print(value)
            completion(value)
        }
    }
}


