//
//  LoginViewController.swift
//  Daymetric
//
//  Created by Максим Соловьёв on 26.11.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    let iconApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LET'S GO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        setupConstraints()
    }
    
    @objc func didTapLoginButton() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
    func setupConstraints() {
        
        view.addSubview(mainView)
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainView.addSubview(iconApp)
        iconApp.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        iconApp.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        iconApp.heightAnchor.constraint(equalToConstant: 300).isActive = true
        iconApp.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        mainView.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: iconApp.bottomAnchor, constant: 10).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
