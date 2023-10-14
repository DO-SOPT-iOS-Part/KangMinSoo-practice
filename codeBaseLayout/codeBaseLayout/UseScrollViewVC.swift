//
//  UseScrollViewVC.swift
//  codeBaseLayout
//
//  Created by 강민수 on 10/14/23.
//

import UIKit

class UseScrollViewVC: UIViewController {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
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
//        setLayout()
        setLayoutWithStackView()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        
        [greenView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     greenView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     greenView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     greenView.heightAnchor.constraint(equalToConstant: 800)])
        
        NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: self.greenView.bottomAnchor),
                                     blueView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     blueView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     blueView.heightAnchor.constraint(equalToConstant: 800),
                                     blueView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])
    }
    
    private func setLayoutWithStackView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        
        
        
        [leftStackView, rightStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([leftStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     leftStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     leftStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     leftStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        NSLayoutConstraint.activate([rightStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     rightStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     rightStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     rightStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        [yellowView, blackView].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            $0.translatesAutoresizingMaskIntoConstraints = false
            leftStackView.addArrangedSubview($0)
        }
        
        [greenView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            rightStackView.addArrangedSubview($0)
        }
        
    }
}
