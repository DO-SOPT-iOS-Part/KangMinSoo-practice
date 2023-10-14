//
//  UseStackViewVC.swift
//  codeBaseLayout
//
//  Created by 강민수 on 10/14/23.
//

import UIKit

class UseStackViewVC: UIViewController {
    
    private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical //수직방향
        stackView.distribution = .fillEqually //fill Equally : subView들의 크기를 동일하게 유지하면서, stackView내부의 사이즈를 모두 채워준다.
        return stackView
    }()
    
    private var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical //수직방향
        stackView.distribution = .fillEqually //fill Equally : subView들의 크기를 동일하게 유지하면서, stackView내부의 사이즈를 모두 채워준다.
        return stackView
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    

    func setLayout() {
        view.addSubview(leftStackView)
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftStackView.topAnchor.constraint(equalTo: view.topAnchor),
                                     leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     leftStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     leftStackView.trailingAnchor.constraint(equalTo: view.centerXAnchor)])
        
        [yellowView, UIView(), blackView, UIView()].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            leftStackView.addArrangedSubview($0)
        }
        
        view.addSubview(rightStackView)
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([rightStackView.topAnchor.constraint(equalTo: view.topAnchor),
                                     rightStackView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
                                     rightStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        [UIView(), greenView, UIView(), blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            rightStackView.addArrangedSubview($0)
        }
    }
    
}
