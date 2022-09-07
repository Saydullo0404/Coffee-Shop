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
    weak var allTextField: AppTextField!
    weak var emailLabel: Label!
    weak var passwordTextField: AppTextField!
    let eyeButton = UIButton()
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .plain)
    var isPasswordHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    func initViews() {
        let emailTextField = AppTextField(text: "", placeholder: "exmpl@mail.com", fontSize: 15 )
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        let emailLabel = Label(text: "Email", textColor: .textColor, fontSize: 10, weight: .semibold, style: "")
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.bottom.equalTo(emailTextField.snp.top).offset(-6)
            make.left.equalTo(emailTextField.snp.left)
        }
        let fullNameTextField = AppTextField(text: "", placeholder: "Jason Ranti", fontSize: 15)
        view.addSubview(fullNameTextField)
        fullNameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(emailLabel.snp.top).offset(-25)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        let fullnameLabel = Label(text: "Fullname", textColor: .textColor, fontSize: 10, weight: .semibold, style: "")
        view.addSubview(fullnameLabel)
        fullnameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(fullNameTextField.snp.top).offset(-6)
            make.left.equalTo(emailLabel.snp.left)
        }
        let registerLabel = UILabel()
        registerLabel.text = "REGISTER"
        registerLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        registerLabel.textAlignment = .left
        registerLabel.textColor = .registerColor
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(fullnameLabel.snp.top).offset(-25)
            make.centerX.equalToSuperview()
        }
        let registerImage = UIImageView()
        view.addSubview(registerImage)
        registerImage.image = UIImage(named: "Register")
        registerImage.contentMode = .scaleAspectFit
        registerImage.snp.makeConstraints { make in
            make.bottom.equalTo(registerLabel.snp.top).offset(-16)
            make.height.width.equalTo(88)
            make.centerX.equalToSuperview()
        }
        let phoneNumberLabel = Label(text: "Phone Number", textColor: .textColor, fontSize: 10, weight: .semibold, style: "")
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.left.equalTo(emailLabel.snp.left)
        }
        let phoneNumberTextField = FPNTextField()
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.delegate = self
        phoneNumberTextField.layer.borderWidth = 0.1
        phoneNumberTextField.textAlignment = .left
        phoneNumberTextField.layer.cornerRadius = 10
        phoneNumberTextField.backgroundColor = .textFiewldColor
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
        }
        let passwordLabel = Label(text: "Password", textColor: .textColor, fontSize: 10, weight: .semibold, style: "")
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(25)
            make.left.equalTo(phoneNumberLabel.snp.left)
        }
        let passwordTextField = AppTextField(text: "", placeholder: "********", fontSize: 15)
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        passwordTextField.addSubview(eyeButton)
        eyeButton.setImage(UIImage(named: isPasswordHidden ? "Hide" : "Eye"), for: .normal)
        eyeButton.backgroundColor = .clear
        eyeButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        eyeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.right.equalTo(passwordTextField.snp.right).inset(13)
            make.height.width.equalTo(25)
        }
        let registerButton = UIButton()
        view.addSubview(registerButton)
        registerButton.setTitle("REGISTER", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        registerButton.backgroundColor = .buttonColor
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 10
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        let anAccount = Label(text: "Already have an account? Login", textColor: .textColor, fontSize: 5, weight: .heavy, style: "")
        view.addSubview(anAccount)
        anAccount.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    @objc func nextButton() {
        isPasswordHidden ? (passwordTextField.isSecureTextEntry = true) : (passwordTextField.isSecureTextEntry = false)
        isPasswordHidden ? ( eyeButton.setImage(UIImage(named: "Eye"), for: .normal) ) : ( eyeButton.setImage(UIImage(named: "Hide"), for: .normal) )
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

