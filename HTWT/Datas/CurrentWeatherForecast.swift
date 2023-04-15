//
//  CurrentWeatherForecast.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/15.
//

import Foundation

// MARK: - location information
struct LocationInformation: Codable {
    let lat: Double
    let lon: Double
    let units: String
    let appid: String
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
        self.units = "metric"
        self.appid = "37f584f523d57af8a899834d2ca08e78"
    }
}

// MARK: - CurrentWeatherForecast
struct CurrentWeatherForecast: Codable {
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let id: Int
    let name: String
    let cod: Int
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
