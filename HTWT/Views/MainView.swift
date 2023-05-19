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
        
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        
        return label
    }()
    
    private let weatherTreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setupUI() {
        self.addSubview(areaLabel)
        self.addSubview(weatherLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(weatherTreeImageView)
        
    }

}
