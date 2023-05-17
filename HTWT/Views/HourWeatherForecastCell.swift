//
//  HourWeatherForecastCell.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/05/17.
//

import UIKit

class HourWeatherForecastCell: UICollectionViewCell {
    
    private let hourLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.backgroundColor = .red
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
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.backgroundColor = .yellow
        return label
    }()
    
    private lazy var hourWeatherStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [hourLabel, weatherImageView, temperatureLabel])
        sv.axis = .vertical
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .fill
        sv.backgroundColor = .gray
        
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cellHeight = Int(self.contentView.bounds.height / 4)
        
        hourLabel.snp.makeConstraints { make in
            make.top.equalTo(hourWeatherStackView.snp.top).offset(0)
            make.height.equalTo(cellHeight)
            make.bottom.equalTo(weatherImageView.snp.top).offset(0)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(0)
            make.height.equalTo(cellHeight)
            make.bottom.equalTo(hourWeatherStackView.snp.bottom).offset(0)
        }
    }
    
    func setupUI() {
        self.contentView.addSubview(hourWeatherStackView)
        
        hourWeatherStackView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
    
}
