//
//  ViewController.swift
//  KangMinSoo-practice
//
//  Created by 강민수 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var idText: String = ""
    private var passwordText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view의 배경화면을 설정했습니다.
        view.backgroundColor = .black
        
        //로그인 버튼의 모서리를 둥글게 했습니다.
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5
        
        //이메일 치는 textField의 키보드 타입을 이메일 형식으로 했습니다.
        emailTextField.keyboardType = .emailAddress
        
        //비밀번호 치는 칸이 안보이게 했습니다.
        passwordTextField.isSecureTextEntry = true
    }
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        
        resultVC.delegate = self
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
        
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        pushToResultVC()
//        self.present(resultVC, animated: true)
    }
    
    
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
    
    
}
