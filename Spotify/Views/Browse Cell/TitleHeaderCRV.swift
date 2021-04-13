//
//  TitleHeaderCRV.swift
//  Spotify
//
//  Created by Saad Sherif on 3/21/21.
//

import UIKit

class TitleHeaderCRV: UICollectionReusableView {
    static let identifier = "TitleHeaderCRV"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 10, y: 0, width: width-30, height: height)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
