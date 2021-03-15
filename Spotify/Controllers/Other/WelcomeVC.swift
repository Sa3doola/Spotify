//
//  WelcomeVC.swift
//  Spotify
//
//  Created by Saad Sherif on 3/3/21.
//

import UIKit

class WelcomeVC: UIViewController {
    
    // MARK:- Properties
    
    private let signInButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Sign In with Spotify", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    // MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
    }
    
    // MARK:- Selectors
    
    @objc func didTapSignIn() {
        let vc = AuthVC()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK:- Helper Functions
    
    private func handleSignIn(success: Bool) {
        // Log user in or yell at them for error
        guard success else {
            let alert = UIAlertController(title: "Ooops",
                                          message: "Somthing went wrong with sign in.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        let mainTabBarVC = TabBarVC()
        mainTabBarVC.modalPresentationStyle = .fullScreen
        present(mainTabBarVC, animated: true)
    }
}
