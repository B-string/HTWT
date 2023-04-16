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
    
    private var locationInformation: [String: Double] = [:]
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
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
    
    func getLocationInformation() -> [String: Double] {
        return locationInformation
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