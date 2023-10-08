//
//  ResultVC.swift
//  KangMinSoo-practice
//
//  Created by 강민수 on 2023/10/07.
//

import UIKit

class ResultVC: UIViewController {

    var delegate: GetDataProtocol?
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    var loginDataCompletion: (([String]) -> Void)?
    
    
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view의 배경화면을 설정했습니다.
        view.backgroundColor = .black
        
        //로그인 버튼의 모서리를 둥글게 했습니다.
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        
        //email설명하는 label을 2개의 줄로 표현하도록했습니다.
        emailLabel.numberOfLines = 2
        //password를 알려주는 label을 3개의 줄로 표현하도록 했습니다.
        passwordLabel.numberOfLines = 3
        
        //passwordLabel을 버튼을 눌렀을때만 보이게 하기 위해 안보이게 설정했습니다.
        passwordLabel.isHidden = true
        
        bindText()
 
    }
    
    private func bindText() {
        self.emailLabel.text = "안녕하세요 \"\(email)\"님\n환영합니다!"
        self.passwordLabel.text = "회원님의 비밀번호는\n\"\(password)\"\n입니다!"
    }
    
    @IBAction func checkButtonOutTap(_ sender: Any) {
        //누르는 동안 비밀번호를 보이게 합니다.
        passwordLabel.isHidden = true
    }

    @IBAction func checkButtonInTap(_ sender: Any) {
        //손을 떼는 순간 비밀번호를 숨깁니다.
        passwordLabel.isHidden = false
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: email, password: password)
        
        guard let loginDataCompletion else {return}
        loginDataCompletion([email, password])
        
    }

}
