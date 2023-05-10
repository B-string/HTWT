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
        AF.request(server.url + server.page[0], method: .get, parameters: parameters).responseDecodable(of: ShortTermForecasts.self) { response in
//            response.request?.url
            guard let statusCode = response.request?.url else { return }
            print(statusCode)
            guard let value = response.value else { return }
            print(value)
            completion(value)
        }
    }
    
    
}
