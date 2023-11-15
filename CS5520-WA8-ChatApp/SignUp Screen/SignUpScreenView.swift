//
//  SignUpScreenView.swift
//  WA7
//
//  Created by Kai on 11/2/23.
//

import UIKit

class SignUpScreenView: UIView {
    var contentWrapper: UIScrollView!
    var labelTitle: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var textFieldPasswordCheck: UITextField!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints
        setupContentWrapper()
        setupLabelTitle()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupTextFieldPasswordCheck()
        setupButtonSignUp()
        
        initConstraints()
    }
    
    //MARK: initializing the UI elements
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setupLabelTitle() {
        labelTitle = UILabel()
        labelTitle.text = "Create Account"
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 28)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelTitle)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.keyboardType = .emailAddress
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }

    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.keyboardType = .default
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword)
    }
    func setupTextFieldPasswordCheck(){
        textFieldPasswordCheck = UITextField()
        textFieldPasswordCheck.placeholder = "Enter Password again"
        textFieldPasswordCheck.borderStyle = .roundedRect
        textFieldPasswordCheck.keyboardType = .default
        textFieldPasswordCheck.isSecureTextEntry = true
        textFieldPasswordCheck.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPasswordCheck)
    }

    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        //buttonSignUp.setTitleColor(.red, for: .normal)
//        buttonSignUp.layer.borderWidth = 1.0
//        buttonSignUp.layer.borderColor = UIColor.black.cgColor
//        buttonSignUp.layer.cornerRadius = 5.0  // Optional

        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSignUp)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        
        NSLayoutConstraint.activate([
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            //MARK: labelTitle constraints...
            labelTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            labelTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            //labelTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            //labelTitle.widthAnchor.constraint(equalToConstant: labelWidth),
            //labelTitle.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            textFieldName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 16),
            textFieldName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            //MARK: textFieldEmail constraints...
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            //textFieldEmail.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height

            //MARK: textFieldPassword constraints
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            //textFieldPassword.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            //MARK: textFieldPasswordCheck constraints
            textFieldPasswordCheck.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            textFieldPasswordCheck.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPasswordCheck.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            //textFieldPassword.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPasswordCheck.bottomAnchor, constant: 32),
            buttonSignUp.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonSignUp.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
        ])
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
