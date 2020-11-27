//
//  MainViewController.swift
//  Daymetric
//
//  Created by Максим Соловьёв on 26.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let appLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Day Finder"
        label.textAlignment = .center
        label.font = UIFont(name: "Copperplate", size: 60)
        return label
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        label.font = UIFont(name: "Copperplate", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Month"
        label.font = UIFont(name: "Copperplate", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Year"
        label.font = UIFont(name: "Copperplate", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let monthTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let yearTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Here you will see the day of the week"
        label.textAlignment = .center
        label.font = UIFont(name: "Copperplate", size: 16)
        label.backgroundColor = .white
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let finderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.5212921507, green: 0.7639334727, blue: 1, alpha: 1)
        button.setTitle("FIND", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7748903036, green: 0.897341907, blue: 1, alpha: 1)
        finderButton.addTarget(self, action: #selector(didTapFinderButton), for: .touchUpInside)
        setupConstraints()
    }
    
    @objc func didTapFinderButton() {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateFormatter.string(from: date)
        infoLabel.text = weekday
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func setupConstraints() {
        
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        view.addSubview(mainView)
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(appLabel)
        appLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        appLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        appLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        appLabel.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: -60).isActive = true
        
        mainView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 4).isActive = true
        
        mainView.addSubview(dateTextField)
        dateTextField.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateTextField.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 8).isActive = true
        dateTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -4).isActive = true
        
        mainView.addSubview(monthLabel)
        monthLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        monthLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 4).isActive = true
        
        mainView.addSubview(monthTextField)
        monthTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20).isActive = true
        monthTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        monthTextField.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 8).isActive = true
        monthTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -4).isActive = true
        
        mainView.addSubview(yearLabel)
        yearLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 20).isActive = true
        yearLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yearLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        yearLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 4).isActive = true
        
        mainView.addSubview(yearTextField)
        yearTextField.topAnchor.constraint(equalTo: monthTextField.bottomAnchor, constant: 20).isActive = true
        yearTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yearTextField.leadingAnchor.constraint(equalTo: yearLabel.trailingAnchor, constant: 8).isActive = true
        yearTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -4).isActive = true
        
        view.addSubview(infoLabel)
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        infoLabel.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(finderButton)
        finderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        finderButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        finderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finderButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    
}
