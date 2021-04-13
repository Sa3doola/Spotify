//
//  PlayerControlsView.swift
//  Spotify
//
//  Created by Saad Sherif on 4/13/21.
//

import Foundation
import UIKit

protocol PlayerControlsDelegate: AnyObject {
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapBackButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapNextButton(_ playerControlsView: PlayerControlsView)
}

final class PlayerControlsView: UIView {
    
    weak var delegate: PlayerControlsDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        return slider
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "This is my song"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Drake (feat. some other Artist)"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .label
        let image = UIImage(
            systemName: "backward.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,
                                                           weight: .regular)
        )
        btn.setImage(image, for: .normal)
        return btn
    }()
    
    private let nextButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .label
        let image = UIImage(
            systemName: "forward.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,
                                                           weight: .regular)
        )
        btn.setImage(image, for: .normal)
        return btn
    }()
    
    private let playPauseButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .label
        let image = UIImage(
            systemName: "pause.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,
                                                           weight: .regular)
        )
        btn.setImage(image, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        
        addSubview(volumeSlider)
        
        addSubview(backButton)
        addSubview(nextButton)
        addSubview(playPauseButton)
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        subtitleLabel.frame = CGRect(x: 0, y: nameLabel.bottom+10, width: width, height: 50)
        
        volumeSlider.frame = CGRect(x: 10, y: subtitleLabel.bottom+20, width: width-20, height: 44)
        
        let btnSize: CGFloat = 60
        
        playPauseButton.frame = CGRect(x: (width - btnSize)/2, y: volumeSlider.bottom + 30, width: btnSize, height: btnSize)
        backButton.frame = CGRect(x: playPauseButton.left-60-btnSize, y: playPauseButton.top, width: btnSize, height: btnSize)
        nextButton.frame = CGRect(x: playPauseButton.right+60, y: playPauseButton.top, width: btnSize, height: btnSize)
    }
    
    @objc private func didTapBack() {
        delegate?.playerControlsViewDidTapBackButton(self)
    }
    
    @objc private func didTapNext() {
        delegate?.playerControlsViewDidTapNextButton(self)
    }
    
    @objc private func didTapPlayPause() {
        delegate?.playerControlsViewDidTapPlayPauseButton(self)
    }
}
