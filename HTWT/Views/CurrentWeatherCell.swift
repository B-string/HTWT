//
//  CurrentWeatherCell.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/13.
//

import UIKit

class CurrentWeatherCell: UITableViewCell {
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cWeatherImageView: UIImageView!
    @IBOutlet weak var cTemperatureLabel: UILabel!
    @IBOutlet weak var hAndLTemperatureLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
