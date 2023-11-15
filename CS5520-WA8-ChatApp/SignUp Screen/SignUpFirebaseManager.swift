//
//  RegisterFirebaseManager.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import Foundation
import FirebaseAuth

extension SignUpViewController{
    
    //MARK: submit button tapped action...
    @objc func onButtonSignUpTapped(){
        // sign Up
        registerNewAccount()
    }
    
    func registerNewAccount(){
        // get Name
        guard let unwrappedName = signUpScreenView.textFieldName.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedName.isEmpty else {
            showErrorAlert(message: "Name can't be empty!")
            return
        }
        // get Email
        guard let unwrappedEmail = signUpScreenView.textFieldEmail.text else {
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
        guard let unwrappedPassword = signUpScreenView.textFieldPassword.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPassword.isEmpty else {
            showErrorAlert(message: "password can't be empty!")
            return
        }
        // get PasswordCheck
        guard let unwrappedPasswordCheck = signUpScreenView.textFieldPasswordCheck.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPasswordCheck.isEmpty else {
            showErrorAlert(message: "Password can't be empty!")
            return
        }
        if unwrappedPassword != unwrappedPasswordCheck {
            return showErrorAlert(message: "Two password not match!")
        }
        
        //MARK: display the progress indicator...
        //showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        //Validations....
        Auth.auth().createUser(withEmail: unwrappedEmail, password: unwrappedPassword, completion: {result, error in
            if error == nil{
                //MARK: the user creation is successful...
                self.setNameOfTheUserInFirebaseAuth(name: unwrappedName)
            }else{
                //MARK: there is a error creating the user...
                //print(error)
                self.showErrorAlert(message: String(describing: error))
            }
        })
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                //self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                //print("Error occured: \(String(describing: error))")
                self.showErrorAlert(message: String(describing: error))
            }
        })
    }
}
