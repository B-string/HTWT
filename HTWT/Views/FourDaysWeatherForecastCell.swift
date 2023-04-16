//
//  FourDaysWeatherForecastCell.swift
//  HTWT
//
//  Created by Seokhyeon Jeong on 2023/04/16.
//

import UIKit
import SnapKit

class FourDaysWeatherForecastCell: UITableViewCell {
    
    let collectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = {
            let flowLayout = UICollectionViewFlowLayout()
            // 스크롤 방향
            flowLayout.scrollDirection = .horizontal
            // Cell 크기 설정
            flowLayout.itemSize = CGSize(width: 60, height: 110)
            // 아이템 죄우 사이 간격 설정
            flowLayout.minimumInteritemSpacing = 1
            
            return flowLayout
        } ()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .lightGray
        return cv
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "FourDaysWeatherForecastCell")
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setupUI() {
        contentView.addSubview(collectionView)
        collectionViewConstraints()
        setupCollectionView()
    }
    
    func collectionViewConstraints () {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.left.right.equalTo(contentView)
        }
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        
    }
    
}

extension FourDaysWeatherForecastCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
