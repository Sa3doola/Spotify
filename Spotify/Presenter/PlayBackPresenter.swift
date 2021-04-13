//
//  PlayBackPresenter.swift
//  Spotify
//
//  Created by Saad Sherif on 3/21/21.
//

import Foundation
import UIKit

final class PlayBackPresenter {
    
    static func startPlayback(
        from viewController: UIViewController,
        track: AudioTrack
    ) {
        let vc = PlayerVC()
        vc.title = track.name
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    static func startPlayback(from viewController: UIViewController,
                              tracks: [AudioTrack])
    {
        let vc = PlayerVC()
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}
