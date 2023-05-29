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
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "WEATHER"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "TEMPERATURE"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let highTemLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "HIGH"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let lowTemLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "LOW"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let weatherTreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView
        
        return imageView
    }()
    
    private let highAndLowStackView = UIStackView()
    private let infoInnerFirstStackView = UIStackView()
    private let infoInnerSecondStackView = UIStackView()
    private let infoInnerSVSpacing: CGFloat = 10
    
    private let infoOutterStackView = UIStackView()
    private let infoOutterSVSpacing: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.635, green: 0.824, blue: 1, alpha: 1.00)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        infoOutterSTConstraints()
        infoInnerSTConstraints(st: infoInnerFirstStackView)
        infoInnerSTConstraints(st: infoInnerSecondStackView)
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
        infoOutterStackView.addArrangedSubview(infoInnerFirstStackView)
        infoOutterStackView.addArrangedSubview(infoInnerSecondStackView)
        
        infoInnerFirstStackView.addArrangedSubview(areaLabel)
        infoInnerFirstStackView.addArrangedSubview(weatherLabel)
        
        infoInnerSecondStackView.addArrangedSubview(temperatureLabel)
        infoInnerSecondStackView.addArrangedSubview(highAndLowStackView)
        
        highAndLowStackView.addArrangedSubview(highTemLabel)
        highAndLowStackView.addArrangedSubview(lowTemLabel)
        
        self.addSubview(weatherTreeImageView)
        
        setupOutterStackView()
        setupInnerStackView(st: infoInnerFirstStackView)
        setupInnerStackView(st: infoInnerSecondStackView)
        setupHighAndLowStackView()
    
    }
    
    func setupHighAndLowStackView() {
        highAndLowStackView.axis = .horizontal
        highAndLowStackView.spacing = 3
        highAndLowStackView.alignment = .fill
        highAndLowStackView.distribution = .fillEqually
    }
    
    func setupInnerStackView(st: UIStackView) {
        st.backgroundColor = .clear
        st.axis = .vertical
        st.spacing = infoInnerSVSpacing
        st.alignment = .fill
        st.distribution = .fillEqually
        st.layer.cornerRadius = 10
        st.clipsToBounds = true
    }
    
    func setupOutterStackView() {
//        infoOutterStackView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        infoOutterStackView.backgroundColor = UIColor(red: 0.635, green: 0.824, blue: 1, alpha: 0.5)
        infoOutterStackView.axis = .horizontal
        infoOutterStackView.spacing = infoOutterSVSpacing
        infoOutterStackView.alignment = .center
        infoOutterStackView.distribution = .fillEqually
        infoOutterStackView.layer.cornerRadius = 10
        infoOutterStackView.clipsToBounds = true
        
//        infoOutterStackView.layer.borderColor = UIColor.clear.cgColor
        infoOutterStackView.layer.borderColor = UIColor(red: 0.635, green: 0.824, blue: 1, alpha: 1).cgColor
        infoOutterStackView.layer.borderWidth = 1
        infoOutterStackView.layer.shadowColor = UIColor.black.cgColor
        infoOutterStackView.layer.masksToBounds = false
        infoOutterStackView.layer.shadowOffset = CGSize(width: 0, height: 0)
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
    
    func infoInnerSTConstraints(st: UIStackView) {
        st.snp.makeConstraints { make in
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
