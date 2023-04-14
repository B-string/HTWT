//
//  ViewController.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - setup
    func setupTableView() {
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CurrentWeatherCell", bundle: nil),
                           forCellReuseIdentifier: "CurrentWeatherCell")
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherCell", for: indexPath) as! CurrentWeatherCell
            cell.selectionStyle = .none
            
            tableView.rowHeight = 355
            
            return cell
        default:
            let cell = UITableViewCell()
            return cell
            
        }
    }
    
    
    
}


