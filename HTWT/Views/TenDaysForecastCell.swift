//
//  TenDaysForecastCell.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/18.
//

import UIKit

class TenDaysForecastCell: UITableViewCell {
    
    private let oneDayButton = UIButton()
    private let oneDayOfTheWeekLabel = UILabel()
    private let oneTemperatureLabel = UILabel()
    private let oneWeatherImageView = UIImageView()
    private let oneLowTemperatureLabel = UILabel()
    private let oneHighTemperatureLabel = UILabel()
    
    private let twoDayButton = UIButton()
    private let twoDayOfTheWeekLabel = UILabel()
    private let twoTemperatureLabel = UILabel()
    private let twoWeatherImageView = UIImageView()
    private let twoLowTemperatureLabel = UILabel()
    private let twoHighTemperatureLabel = UILabel()
    
    private let threeDayButton = UIButton()
    private let threeDayOfTheWeekLabel = UILabel()
    private let threeTemperatureLabel = UILabel()
    private let threeWeatherImageView = UIImageView()
    private let threeLowTemperatureLabel = UILabel()
    private let threeHighTemperatureLabel = UILabel()
    
    private let fourDayButton = UIButton()
    private let fourDayOfTheWeekLabel = UILabel()
    private let fourTemperatureLabel = UILabel()
    private let fourWeatherImageView = UIImageView()
    private let fourLowTemperatureLabel = UILabel()
    private let fourHighTemperatureLabel = UILabel()
    
    private let fiveDayButton = UIButton()
    private let fiveDayOfTheWeekLabel = UILabel()
    private let fiveTemperatureLabel = UILabel()
    private let fiveWeatherImageView = UIImageView()
    private let fiveLowTemperatureLabel = UILabel()
    private let fiveHighTemperatureLabel = UILabel()
    
    private let sixDayButton = UIButton()
    private let sixDayOfTheWeekLabel = UILabel()
    private let sixTemperatureLabel = UILabel()
    private let sixWeatherImageView = UIImageView()
    private let sixLowTemperatureLabel = UILabel()
    private let sixHighTemperatureLabel = UILabel()
    
    private let sevenDayButton = UIButton()
    private let sevenDayOfTheWeekLabel = UILabel()
    private let sevenTemperatureLabel = UILabel()
    private let sevenWeatherImageView = UIImageView()
    private let sevenLowTemperatureLabel = UILabel()
    private let sevenHighTemperatureLabel = UILabel()
    
    private let eightDayButton = UIButton()
    private let eightDayOfTheWeekLabel = UILabel()
    private let eightTemperatureLabel = UILabel()
    private let eightWeatherImageView = UIImageView()
    private let eightLowTemperatureLabel = UILabel()
    private let eightHighTemperatureLabel = UILabel()
    
    private let nineDayButton = UIButton()
    private let nineDayOfTheWeekLabel = UILabel()
    private let nineTemperatureLabel = UILabel()
    private let nineWeatherImageView = UIImageView()
    private let nineLowTemperatureLabel = UILabel()
    private let nineHighTemperatureLabel = UILabel()
    
    private let tenDayButton = UIButton()
    private let tenDayOfTheWeekLabel = UILabel()
    private let tenTemperatureLabel = UILabel()
    private let tenWeatherImageView = UIImageView()
    private let tenLowTemperatureLabel = UILabel()
    private let tenHighTemperatureLabel = UILabel()
    
    
    private var dayButtons: [UIButton]?

    private let buttonsStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 2
        sv.alignment = .fill
        sv.distribution = .fillEqually
        
        return sv
    } ()
    
    private let tenDaysBackgroundView = UIView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TenDaysForecastCell")
        
        setupUI()
        setupUIConstraints()
        
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setupUI() {
        dayButtons = [
            oneDayButton, twoDayButton, threeDayButton, fourDayButton,
            fiveDayButton, sixDayButton, sevenDayButton, eightDayButton,
            nineDayButton, tenDayButton
        ]
        
        contentView.addSubview(tenDaysBackgroundView)
        tenDaysBackgroundView.addSubview(buttonsStackView)
        
        guard let dayButtons = self.dayButtons else { return }
        for dayButton in dayButtons {
            buttonsStackView.addArrangedSubview(dayButton)
        }
    }
    
    func setupUIConstraints() {
        tenDayBackgroundViewConstraints()
        buttonsStackViewConstraints()
    }
    
    func tenDayBackgroundViewConstraints() {
        tenDaysBackgroundView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(5)
        }
    }

    func buttonsStackViewConstraints() {
        buttonsStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(tenDaysBackgroundView)
            make.leading.trailing.equalTo(tenDaysBackgroundView).inset(5)
        }
    }
    
    func setupButtons() {
        guard let dayButtons = self.dayButtons else { return }
        for dayButton in dayButtons {
            dayButton.setTitle("button", for: .normal)
            dayButton.backgroundColor = .darkGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
