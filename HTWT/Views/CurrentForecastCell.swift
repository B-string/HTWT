//
//  CurrentForecastCellTableViewCell.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/05/15.
//

import UIKit

class CurrentForecastCell: UITableViewCell {

    private let areaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        return label
    }()
    
    private let highTemperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    private let lowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    private let highAndLowStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 40
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.backgroundColor = .gray
        sv.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        
        return sv
    }()
    
    private let currentForecastStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .fill
        sv.backgroundColor = .darkGray
        
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "CurrentForecastCell")
        
        // 추가 순서 contentView -> currentForecastStackView -> highAndLowStackView
        setupUI()
    
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("height: \(self.contentView.bounds.height)")
        
        let cellHeightFifth = Int(self.contentView.bounds.height / 6)
        
        setConstraints(cellHeightFifth: cellHeightFifth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.contentView.addSubview(currentForecastStackView)
        currentForecastStackView.addArrangedSubview(areaLabel)
        currentForecastStackView.addArrangedSubview(weatherImageView)
        currentForecastStackView.addArrangedSubview(temperatureLabel)
        currentForecastStackView.addArrangedSubview(highAndLowStackView)
        highAndLowStackView.addArrangedSubview(highTemperatureLabel)
        highAndLowStackView.addArrangedSubview(lowTemperatureLabel)
        
        currentForecastStackView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
    func setConstraints(cellHeightFifth: Int) {
        areaLabel.snp.makeConstraints { make in
            make.top.equalTo(currentForecastStackView).offset(0)
            make.height.equalTo(cellHeightFifth)
            make.bottom.equalTo(weatherImageView.snp.top).offset(0)
        }
        
//        weatherImageView.snp.makeConstraints { make in
//            make.height.equalTo(cellHeightFifth * 4)
//        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(0)
            make.height.equalTo(cellHeightFifth)
            make.bottom.equalTo(highAndLowStackView.snp.top).offset(0)
        }

        highAndLowStackView.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(0)
            make.height.equalTo(cellHeightFifth)
            make.bottom.equalTo(currentForecastStackView).offset(0)
        }
    }
    
}
