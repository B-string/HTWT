//
//  DetailViewController.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/05/18.
//

import UIKit

class DetailViewController: UIViewController {

    
    private let detailWeatherTableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - setup
    func setupTableView() {
        detailWeatherTableView.dataSource = self
        detailWeatherTableView.delegate = self
//        tableView.separatorStyle = .none
//        tableView.rowHeight = UITableView.automaticDimension
        detailWeatherTableView.register(CurrentForecastCell.self, forCellReuseIdentifier: "CurrentForecastCell")
        detailWeatherTableView.register(ToDayWeatherForecastCell.self, forCellReuseIdentifier: "ToDayWeatherForecastCell")
        
        detailWeatherTableView.register(TenDaysForecastCell.self, forCellReuseIdentifier: "TenDaysForecastCell")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        switch indexPath.row {
        case 0:
            print("CurrentForecastCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentForecastCell", for: indexPath) as? CurrentForecastCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
//            if let cWeatherForecast = self.cWeatherForecast {
//                cell.forecastData = cWeatherForecast
//            }
            
            return cell
        case 1:
            print("ToDayWeatherForecastCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDayWeatherForecastCell", for: indexPath) as? ToDayWeatherForecastCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            print("TenDaysForecastCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TenDaysForecastCell", for: indexPath) as? TenDaysForecastCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
            return cell
        default:
            let cell = UITableViewCell()
            return cell
            
        }
    }
    
    
    
}

extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            let height = Int(self.detailWeatherTableView.bounds.height / 2)
            return CGFloat(height)
        case 1:
            return self.detailWeatherTableView.bounds.height / 6
        case 2:
            return 400
        default:
            return 0
        }
    }
}
