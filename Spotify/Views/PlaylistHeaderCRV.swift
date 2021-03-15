//
//  PlaylistHeaderCRV.swift
//  Spotify
//
//  Created by Saad Sherif on 3/15/21.
//

import SDWebImage
import UIKit

protocol PlaylistHeaderCRVDelegate: AnyObject {
    func PlaylistHeaderCRVDidTapPlay(_ header: PlaylistHeaderCRV)
}

class PlaylistHeaderCRV: UICollectionReusableView {
    static let identifier = "PlaylistHeaderCRV"
    
    weak var delegate: PlaylistHeaderCRVDelegate?
    
    private let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 22, weight: .semibold)
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = .systemFont(ofSize: 18, weight: .regular)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let ownerLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = .systemFont(ofSize: 18, weight: .light)
        return lbl
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "photo")
        return image
    }()
    
    private let playButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        btn.setImage(image, for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 30
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(ownerLabel)
        addSubview(imageView)
        addSubview(playButton)
        playButton.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = height/1.8
        imageView.frame = CGRect(x: (width-imageSize)/2, y: 20, width: imageSize, height: imageSize)
        nameLabel.frame = CGRect(x: 10, y: imageView.bottom, width: width-20, height: 44)
        descriptionLabel.frame = CGRect(x: 10, y: nameLabel.bottom, width: width-20, height: 44)
        ownerLabel.frame = CGRect(x: 10, y: descriptionLabel.bottom, width: width-20, height: 44)
        playButton.frame = CGRect(x: width-80, y: height-80, width: 60, height: 60)
    }
    
    func configure(with viewModel: PlaylistHeaderViewModel) {
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.descrirption
        imageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
    
    @objc private func didTapPlayAll() {
        delegate?.PlaylistHeaderCRVDidTapPlay(self)
    }
}
