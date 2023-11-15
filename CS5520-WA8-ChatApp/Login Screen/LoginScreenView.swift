//
//  LoginScreenView.swift
//  WA7
//
//  Created by Kai on 11/2/23.
//

import UIKit

class LoginScreenView: UIView {
    var contentWrapper: UIScrollView!
    var labelTitle: UILabel!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var buttonLogIn: UIButton!
    var labelSignUp: UILabel!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints
        setupContentWrapper()
        setupLabelTitle()
        setupLabelEmail()
        setupTextFieldEmail()
        setupLabelPassword()
        setupTextFieldPassword()
        setupButtonLogIn()
        setupLabelSignUp()
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
        labelTitle.text = "Login"
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 28)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelTitle)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email: "
        labelEmail.textAlignment = .left
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }

    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupLabelPassword() {
        labelPassword = UILabel()
        labelPassword.text = "Password: "
        labelPassword.textAlignment = .left
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPassword)
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

    func setupButtonLogIn() {
        buttonLogIn = UIButton(type: .system)
        buttonLogIn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogIn.setTitle("Log In", for: .normal)
        //buttonLogIn.setTitleColor(.red, for: .normal)
//        buttonLogIn.layer.borderWidth = 1.0
//        buttonLogIn.layer.borderColor = UIColor.black.cgColor
//        buttonLogIn.layer.cornerRadius = 5.0  // Optional

        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonLogIn)
    }
    func setupLabelSignUp() {
        labelSignUp = UILabel()
        labelSignUp.text = "Haven't have a account?"
        labelSignUp.textAlignment = .left
        labelSignUp.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSignUp)
    }
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignUp.setTitle("Sign Up", for: .normal)
//        buttonSignUp.layer.borderWidth = 1.0
//        buttonSignUp.layer.borderColor = UIColor.black.cgColor
//        buttonSignUp.layer.cornerRadius = 5.0  // Optional
        //buttonSignUp.setTitleColor(.red, for: .normal)
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
            
            //MARK: labelEmail constraints...
            labelEmail.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 64),
            labelEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            //labelEmail.widthAnchor.constraint(equalToConstant: labelWidth),
            //labelEmail.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            //MARK: textFieldEmail constraints...
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            //textFieldEmail.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            //MARK: labelPassword constraints...
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelPassword.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            //labelPassword.widthAnchor.constraint(equalToConstant: labelWidth),
            //labelPassword.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            //MARK: textFieldPassword constraints...
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            //textFieldPassword.heightAnchor.constraint(equalToConstant: fieldHeight), // Set height
            
            
            buttonLogIn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
            buttonLogIn.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelSignUp.topAnchor.constraint(equalTo: buttonLogIn.bottomAnchor, constant: 32),
            labelSignUp.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: -32),
            
            buttonSignUp.topAnchor.constraint(equalTo: buttonLogIn.bottomAnchor, constant: 32),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelSignUp.trailingAnchor, constant: 16),
            buttonSignUp.centerYAnchor.constraint(equalTo: labelSignUp.centerYAnchor),
            buttonSignUp.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
        ])
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
