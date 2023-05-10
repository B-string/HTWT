//
//  LocationService.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/15.
//

import Foundation
import CoreLocation


class LocationService: NSObject {
    
    static let shared = LocationService()
    
    private var locationManager: CLLocationManager?
    
    private var locationInformation: [String: Double] = [:] // GPS 위도, 경도를 저장
    
    private var gridXY: [String: Double] = [:] // x, y 좌표로 변환된 위도, 경도
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
    }
    
    func setLocationInformation(lat: Double, lon: Double) {
        locationInformation["lat"] = lat
        locationInformation["lon"] = lon
    }
    
    func getLocationInformation(_ point: String) -> Double {
        return locationInformation[point] ?? 0.0
    }
    
    func getGridXY(_ point: String) -> Int {
        return Int(gridXY[point.uppercased()] ?? 0.0)
    }
    
    // MARK: - 위치 정보를 가져올 수 있는 권한을 확인
    func checkUserDeviceLocationServiceAuthorization(completion: @escaping () -> Void) {
        print(#function)
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                completion()
            }
        }

        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            guard let status = locationManager?.authorizationStatus else { return }
            authorizationStatus = status
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        checkUserCurrentLocationAuthorization(authorizationStatus)
    }
    
    func checkUserCurrentLocationAuthorization(_ status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // 사용자가 권한에 대한 설정을 선택하지 않은 상태
            
            // 권한 요청을 보내기 전에 desiredAccuracy 설정 필요
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            // 권한 요청을 보낸다.
            locationManager?.requestWhenInUseAuthorization()
                
        case .denied, .restricted:
            // 사용자가 명시적으로 권한을 거부했거나, 위치 서비스 활성화가 제한된 상태
            // 시스템 설정에서 설정값을 변경하도록 유도한다.
            // 시스템 설정으로 유도하는 커스텀 얼럿
//            showRequestLocationServiceAlert()
            print("system setting")
            
        case .authorizedWhenInUse:
            // 앱을 사용중일 때, 위치 서비스를 이용할 수 있는 상태
            // manager 인스턴스를 사용하여 사용자의 위치를 가져온다.
            // startUpdatingLocation : 지속적으로 위치정보를 가져와 업데이트한다.
            // requestLocation: 위치정보를 한번 가져온다.
            
//            locationManager.startUpdatingLocation()
            locationManager?.requestLocation()
            
        default:
            print("Default")
        }
    }
    
    
    // MARK: - 위도, 경도를 기상청 격자 정보로 변형
    func transformToGrid(mode: Int) {
        print(#function)
        guard let lat = locationInformation["lat"] else { return }
        guard let lon = locationInformation["lon"] else { return }
        
        let RE = 6371.00877 // 지구 반경(km)
        let GRID = 5.0 // 격자 간격 (km)
        let SLAT1 = 30.0 // 투영 위도1 (degree)
        let SLAT2 = 60.0 // 투영 위도2 (degree)
        let OLON = 126.0 // 기준점 경도 (degree)
        let OLAT = 38.0 // 기준점 위도 (degree)
        let XO = 43.0 // 기준점 x좌표 (GRID)
        let YO = 136.0 // 기준점 y좌표 (GRID)
        
        
        let DEGRAD = Double.pi / 180.0
        let RADDEG = 180.0 / Double.pi
        
        let re = RE / GRID
        let slat1 = SLAT1 * DEGRAD
        let slat2 = SLAT2 * DEGRAD
        let olon = OLON * DEGRAD
        let olat = OLAT * DEGRAD
        
        var sn = tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)
        sn = log(cos(slat1) / cos(slat2)) / log(sn)
        
        var sf = tan(Double.pi * 0.25 + slat1 * 0.5)
        sf = pow(sf, sn) * cos(slat1) / sn
         
        var ro = tan(Double.pi * 0.25 + olat * 0.5)
        ro = re * sf / pow(ro, sn)
        
        if mode == 0 {
            var ra = tan(Double.pi * 0.25 + lat * DEGRAD * 0.5)
            ra = re * sf / pow(ra, sn)
            var theta = lon * DEGRAD - olon
            if theta > Double.pi { theta -= 2.0 * Double.pi }
            if theta < -Double.pi { theta += 2.0 * Double.pi }
            theta *= sn
            
            gridXY["X"] = floor(ra * sin(theta) + XO + 0.5)
            gridXY["Y"] = floor(ro - ra * cos(theta) + YO + 0.5)
        } else {
            guard let xlat = gridXY["X"] else { return }
            guard let ylon = gridXY["Y"] else { return }
            let xn = xlat - XO
            let yn = ro - ylon + YO
            var ra = sqrt(xn * xn + yn * yn)
            
            if sn < 0.0 { ra = -ra }
            
            var alat = pow((re * sf / ra), (1.0 / sn))
            alat = 2.0 * atan(alat) - Double.pi * 0.5
            
            var theta = 0.0
            if abs(xn) <= 0.0 {
                theta = 0.0
            } else {
                if abs(yn) <= 0.0 {
                    theta = Double.pi * 0.5
                    if xn < 0.0 {
                        theta = -theta
                    }
                } else {
                    theta = atan2(xn, yn)
                }
            }
            let alon = theta / sn + olon
            
            locationInformation["lat"] = alat * RADDEG
            locationInformation["lon"] = alon * RADDEG
        }
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    // 사용자의 위치를 성공적으로 가져왔을 때 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 위치 정보를 배열로 입력받는데, 마지막 index값이 가장 정확하다고 한다.
        if let coordinate = locations.last?.coordinate {
            // ⭐️ 사용자 위치 정보 사용
            print("lat : \(coordinate.latitude), long: \(coordinate.longitude)")
            locationInformation["lat"] = coordinate.latitude
            locationInformation["long"] = coordinate.longitude
        }
        
        // startUpdatingLocation()을 사용하여 사용자 위치를 가져왔다면
        // 불필요한 업데이트를 방지하기 위해 stopUpdatingLocation을 호출
        //           locationManager.stopUpdatingLocation()
    }
    
    // 사용자가 GPS 사용이 불가한 지역에 있는 등 위치 정보를 가져오지 못했을 때 호출
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    
    
    // 앱에 대한 권한 설정이 변경되면 호출 (iOS 14 이상)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // 사용자 디바이스의 위치 서비스가 활성화 상태인지 확인하는 메서드 호출
        checkUserDeviceLocationServiceAuthorization {
            print("권한 확인 완료")
        }
    }
    
    
    // 앱에 대한 권한 설정이 변경되면 호출 (iOS 14 미만)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 사용자 디바이스의 위치 서비스가 활성화 상태인지 확인하는 메서드 호출
        checkUserDeviceLocationServiceAuthorization{
            print("권한 확인 완료")
        }
    }
    
}
