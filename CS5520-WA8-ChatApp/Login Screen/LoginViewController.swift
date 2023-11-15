//
//  LoginViewController.swift
//  WA7
//
//  Created by Kai on 11/2/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    //MARK: initializing the Create Contact View...
    let loginScreenView = LoginScreenView()
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = loginScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Good Chat"
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        //MARK: add action to SignUP button
        loginScreenView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        //MARK: add action to LogIn button
        loginScreenView.buttonLogIn.addTarget(self, action: #selector(onButtonLogInTapped), for: .touchUpInside)
        
        //MARK: move the view up, when keyboard shows
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func onButtonSignUpTapped() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func onButtonLogInTapped() {
        // get Email
        guard let unwrappedEmail = loginScreenView.textFieldEmail.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedEmail.isEmpty else {
            return showErrorAlert(message: "Email can't be empty!")
        }
        guard isValidEmail(unwrappedEmail) else {
            return showErrorAlert(message: "Invalid Email!")
        }
        // get Password
        guard let unwrappedPassword = loginScreenView.textFieldPassword.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPassword.isEmpty else {
            showErrorAlert(message: "Password can't be empty!")
            return
        }
        
        Auth.auth().signIn(withEmail: unwrappedEmail, password: unwrappedPassword, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated...
                //MARK: can you hide the progress indicator here?
                let viewController = ViewController()
                self.navigationController?.setViewControllers([viewController], animated: true)
            }else{
                //MARK: alert that no user found or password wrong...
                self.showErrorAlert(message: String(describing: error))
            }
            
        })
        
    }
    
    
    
    //MARK: Hide Keyboard, when tap outside the keyboard
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    // MARK: keyboard Show and Hide event
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height / 6
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

    // MARK: Text field check logics
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
