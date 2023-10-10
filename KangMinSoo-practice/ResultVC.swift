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
        
        //view의 배경화면을 설정했습니다 !
        view.backgroundColor = .black //배경화면의 색깔을 검정색으로 했습니다.
        
        //로그인 버튼의 모서리를 둥글게 했습니다 !
        backButton.layer.masksToBounds = true //경계 내에서만 표시되도록 합니다.
        backButton.layer.cornerRadius = 5 //코너를 둥글게 합니다. (버튼을 둥글게 만들었습니다.)
        
        //email설명하는 label을 2개의 줄로 표현하도록했습니다 !
        emailLabel.numberOfLines = 2 //안녕하세요 '유저'님 (\n) 환영합니다. 를 표현하기 위해 2줄입니다.
        //password를 알려주는 label을 3개의 줄로 표현하도록 했습니다 !
        passwordLabel.numberOfLines = 3 //회원님의 비밀번호는 (\n) '비밀번호' (\n) 입니다 ! 로 하기 위해 3줄입니다.
        
        //passwordLabel을 버튼을 눌렀을때만 보이게 하기 위해 안보이게 설정했습니다 !!
        passwordLabel.isHidden = true // 비밀번호를 나타내는 label을 숨김으로 했습니다.
        
        bindText()
 
    }
    
    private func bindText() {
        self.emailLabel.text = "안녕하세요 \"\(email)\"님\n환영합니다!" //이메일을 나타내는 label입니다.
        self.passwordLabel.text = "회원님의 비밀번호는\n\"\(password)\"\n입니다!" //비밀번호를 나타내는 label입니다.
    }
    
    @IBAction func checkButtonOutTap(_ sender: Any) { //버튼을 손에서 뗄 때
        print("touch out")
        passwordLabel.isHidden = true //버튼을 뗄때는 다시 passwordLabel을 숨김하여 안보이게 합니다.
    }

    @IBAction func checkButtonInTap(_ sender: Any) { //버튼을 누르는 중입니다.
        print("touch up inside")
        passwordLabel.isHidden = false //버튼을 누르는 동안에는 passwordLabel의 숨김을 해제하여 보이게 합니다.
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
