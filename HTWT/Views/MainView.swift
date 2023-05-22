//
//  MainView.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/05/18.
//

import UIKit

class MainView: UIView {

    private let areaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "AREA"
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "WEATHER"
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "TEMPERATURE"
        return label
    }()
    
    private let weatherTreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        
        return imageView
    }()
    
    private let infoInnerStackView = UIStackView()
    private let infoInnerSVSpacing: CGFloat = 10
    private let infoOutterStackView = UIStackView()
    private let infoOutterSVSpacing: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.47, green: 0.42, blue: 0.82, alpha: 1.00)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        infoOutterSTConstraints()
        areaLabelConstraints()
        infoInnerSTConstraints()
        weatherTreeIVConstraints()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    // MARK: - setup UI
    func setupUI() {
        print(#function)
        self.addSubview(infoOutterStackView)
        infoOutterStackView.addArrangedSubview(areaLabel)
        infoOutterStackView.addArrangedSubview(infoInnerStackView)
        
        infoInnerStackView.addArrangedSubview(weatherLabel)
        infoInnerStackView.addArrangedSubview(temperatureLabel)
        
        self.addSubview(weatherTreeImageView)
        
        setupOutterStackView()
        setupInnerStackView()
    }
    
    func setupInnerStackView() {
        infoInnerStackView.backgroundColor = .gray
        infoInnerStackView.axis = .vertical
        infoInnerStackView.spacing = infoInnerSVSpacing
        infoInnerStackView.alignment = .fill
        infoInnerStackView.distribution = .fillEqually
        infoInnerStackView.layer.cornerRadius = 10
        infoInnerStackView.clipsToBounds = true
    }
    
    func setupOutterStackView() {
        infoOutterStackView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        infoOutterStackView.axis = .horizontal
        infoOutterStackView.spacing = infoOutterSVSpacing
        infoOutterStackView.alignment = .center
        infoOutterStackView.distribution = .fillEqually
        infoOutterStackView.layer.cornerRadius = 10
        infoOutterStackView.clipsToBounds = true
        
        infoOutterStackView.layer.shadowColor = UIColor.black.cgColor
        infoOutterStackView.layer.masksToBounds = false
        infoOutterStackView.layer.shadowOffset = CGSize(width: 0, height: 4)
        infoOutterStackView.layer.shadowRadius = 5
        infoOutterStackView.layer.shadowOpacity = 0.3
        
    }
    
    
    // MARK: - setup layout
    func infoOutterSTConstraints() {
        infoOutterStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(10)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(10)
            make.height.equalTo(self.bounds.height / 5)
        }
        layoutIfNeeded()
    }
    
    func areaLabelConstraints() {
        areaLabel.snp.makeConstraints { make in
            make.leading.equalTo(infoOutterStackView.snp.leading).inset(0)
            make.top.equalTo(infoOutterStackView.snp.top).inset(30)
            make.bottom.equalTo(infoOutterStackView.snp.bottom).inset(30)
            make.height.equalTo(infoOutterStackView.bounds.height / 2)
        }
    }
    
    func infoInnerSTConstraints() {
        infoInnerStackView.snp.makeConstraints { make in
            make.top.equalTo(infoOutterStackView.snp.top).inset(0)
            make.bottom.equalTo(infoOutterStackView.snp.bottom).inset(0)
        }
    }
    
    func weatherTreeIVConstraints() {
        weatherTreeImageView.snp.makeConstraints { make in
            make.top.equalTo(infoOutterStackView.snp.bottom).offset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(10)
            make.height.equalTo((self.bounds.height / 5) * 3)
        }

    }

}
