//
//  ViewController.swift
//  Coffee Shop
//
//  Created by Saydullo on 31/08/22.
//

import UIKit
import FlagPhoneNumber

//Salom

class ViewController: UIViewController {
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .plain)
    var isPasswordHidden = false
    lazy var registretImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Frame 1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "exmpl@mail.com"
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 14, y: 14, width: 14, height: 14))
        textField.leftViewMode = .always
        textField.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
        textField.layer.borderWidth = 0.1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.layer.borderWidth = 0.1
        return textField
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.5630589128, green: 0.5630589128, blue: 0.5630589128, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.5630589128, green: 0.5630589128, blue: 0.5630589128, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var phoneTextFieldNumber: FPNTextField = {
        let textField = FPNTextField()
        textField.placeholder = "+62 8777 2221"
        textField.layer.cornerRadius = 10
        textField.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
        textField.delegate = self
        textField.layer.borderWidth = 0.1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.layer.borderWidth = 0.1
        return textField
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.5630589128, green: 0.5630589128, blue: 0.5630589128, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "********"
        textField.layer.cornerRadius = 10
        textField.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 14, y: 14, width: 14, height: 14))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.layer.borderWidth = 0.1
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.1
        return textField
    }()
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("REGISTER", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.backgroundColor = #colorLiteral(red: 0.2578490973, green: 0.1520732045, blue: 0.04351970553, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var anAccount: UIButton = {
        let button = UIButton()
        button.setTitle("Already have an account?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Jason Ranti"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.1
        textField.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 14, y: 14, width: 14, height: 14))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.layer.borderWidth = 0.1
        return textField
    }()
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = " Fullname"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.5630589128, green: 0.5630589128, blue: 0.5630589128, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "REGISTER"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.5750287175, blue: 0.08372365683, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    lazy var  showPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: isPasswordHidden ? "Hide" : "Eye"), for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registretImage)
        view.addSubview(emailTextField)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextFieldNumber)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(anAccount)
        view.addSubview(fullNameTextField)
        view.addSubview(fullNameLabel)
        view.addSubview(registerLabel)
        view.addSubview(loginButton)
        passwordTextField.addSubview(showPasswordBtn)
        frameLayout()
    }
    func frameLayout() {
        registretImage.bottomAnchor.constraint(equalTo: registerLabel.topAnchor, constant: -16).isActive = true
        registretImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registretImage.widthAnchor.constraint(equalToConstant: 88).isActive = true
        registretImage.heightAnchor.constraint(equalToConstant: 88).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -6).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 22).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        phoneTextFieldNumber.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 6).isActive = true
        phoneTextFieldNumber.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        phoneTextFieldNumber.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        phoneTextFieldNumber.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: phoneTextFieldNumber.bottomAnchor, constant: 22).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: phoneLabel.leftAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        anAccount.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 15).isActive = true
        anAccount.heightAnchor.constraint(equalToConstant: 21).isActive = true
        anAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fullNameTextField.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -25).isActive = true
        fullNameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        fullNameTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        fullNameTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        fullNameLabel.bottomAnchor.constraint(equalTo: fullNameTextField.topAnchor, constant: -6).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: fullNameTextField.leftAnchor).isActive = true
        registerLabel.bottomAnchor.constraint(equalTo: fullNameLabel.topAnchor, constant: -28).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: anAccount.rightAnchor, constant: 5).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        loginButton.topAnchor.constraint(equalTo: anAccount.topAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: anAccount.bottomAnchor).isActive = true
        showPasswordBtn.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor).isActive = true
        showPasswordBtn.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -18).isActive = true
        showPasswordBtn.heightAnchor.constraint(equalToConstant: 15).isActive = true
        showPasswordBtn.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }
    @objc func showPassword(){
        isPasswordHidden ? (passwordTextField.isSecureTextEntry = true) : (passwordTextField.isSecureTextEntry = false)
        isPasswordHidden ? ( showPasswordBtn.setImage(UIImage(named: "Eye"), for: .normal) ) : ( showPasswordBtn.setImage(UIImage(named: "Hide"), for: .normal) )
        isPasswordHidden.toggle()
    }
}
extension ViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
    }
    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)
        present(navigationViewController, animated: true, completion: nil)
     }

}

