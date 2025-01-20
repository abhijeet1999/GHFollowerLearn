//
//  SearchVC.swift
//  GHFollower
//
//  Created by Abhijeet Cherungottil on 1/13/25.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextfield = GFTextField()
    let callToActionButton = GFButton(background: UIColor.green, title: "Get follower")
    var isUsernameEntered: Bool {
        return !usernameTextfield.text!.isEmpty
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    func createDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func  configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
        
        ])
        
    }
    
    func configureTextField() {
        view.addSubview(usernameTextfield)
        usernameTextfield.delegate = self
        
        NSLayoutConstraint.activate([
        
            usernameTextfield.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.backgroundColor = .systemGreen
        callToActionButton.addTarget(self, action: #selector(pushfollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
                    ])
        
    }
    
    @objc 
    func pushfollowerListVC() {
        
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", messagge: "Pleasr enter a usrname , we need to know who to look for", buttonTitle: "OK")
            return}
        
        let followerListVC = FollowerListViewController()
        followerListVC.username = usernameTextfield.text
        followerListVC.title = usernameTextfield.text
        
        navigationController?.pushViewController(followerListVC, animated: true)
        
    }
    


}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushfollowerListVC()
        return true
    }
    
}
