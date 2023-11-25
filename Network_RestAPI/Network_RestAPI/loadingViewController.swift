//
//  loadingViewController.swift
//  Network_RestAPI
//
//  Created by 강민수 on 11/25/23.
//

import UIKit
import SnapKit
import Then

class loadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    @objc private func startButtonTap() {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
    }
    
    @objc private func pauseButtonTap() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    private func setLayout() {
        [activityIndicator, startButton, pauseButton].forEach {
            self.view.addSubview($0)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.leading.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        pauseButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
    }
    
    private let activityIndicator = UIActivityIndicatorView().then {
        $0.color = .black
        $0.hidesWhenStopped = true
        $0.style = .medium
        $0.isHidden = true
    }
    
    private let startButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(startButtonTap),
                     for: .touchUpInside)
        $0.setTitle("시작", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let pauseButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(pauseButtonTap),
                     for: .touchUpInside)
        $0.setTitle("일시 정지", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
}
