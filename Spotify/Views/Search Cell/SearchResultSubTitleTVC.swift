//
//  SearchResultSubTitleTVC.swift
//  Spotify
//
//  Created by Saad Sherif on 3/21/21.
//

import UIKit
import SDWebImage

class SearchResultSubTitleTVC: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "SearchResultSubTitleTVC"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height-10
        iconImageView.frame = CGRect(
            x: 10,
            y: 5,
            width: imageSize,
            height: imageSize
        )
        let labelHeight: CGFloat = contentView.height/2
        titleLabel.frame = CGRect(
            x: iconImageView.right+10,
            y: 0,
            width: contentView.width-iconImageView.right-15,
            height: contentView.height
        )
        subTitleLabel.frame = CGRect(
            x: iconImageView.right+10,
            y: titleLabel.bottom+2,
            width: contentView.width-iconImageView.right-15,
            height: labelHeight
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
    }
    
    // MARK: - Helper Functions
    
    func configure(with viewModel: SearchResultSubTitleTVCVM) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        iconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }
}
