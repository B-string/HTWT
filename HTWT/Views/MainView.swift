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
        label.backgroundColor = .red
        label.text = "AREA"
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "WEATHER"
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
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
        self.backgroundColor = UIColor(red: 72, green: 202, blue: 228, alpha: 1)
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
        infoOutterStackView.backgroundColor = .darkGray
        infoOutterStackView.axis = .horizontal
        infoOutterStackView.spacing = infoOutterSVSpacing
        infoOutterStackView.alignment = .center
        infoOutterStackView.distribution = .fillEqually
        infoOutterStackView.layer.cornerRadius = 10
        infoOutterStackView.clipsToBounds = true
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
