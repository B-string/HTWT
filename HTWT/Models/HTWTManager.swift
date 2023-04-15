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
    
    private let url = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeatherForecast(parameter: LocationInformation, completion: @escaping (CurrentWeatherForecast) -> Void) {
        print(#function)
        AF.request(url, method: .get, parameters: parameter).responseDecodable(of: CurrentWeatherForecast.self) { response in
//             print(response.error!)
            guard let value = response.value else { return }
            completion(value)
        }
    }
    
    
}
