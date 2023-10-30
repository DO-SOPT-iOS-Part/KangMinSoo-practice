//
//  ViewController.swift
//  3rd_seminar
//
//  Created by 강민수 on 10/28/23.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    var itemListData: [ItemListData] = [.init(image: "image1",
                                              item: "외장하드",
                                              location: "노원구 중계2.3동",
                                              price: "60,000원",
                                              isLike: false),
                                        .init(image: "image2",
                                              item: "게이밍 의자",
                                              location: "노원구 상계 8동",
                                              price: "30,000원",
                                              isLike: false),
                                        .init(image: "image3",
                                              item: "노트북 팝니다",
                                              location: "노원구 상계9동",
                                              price: "120,000원",
                                              isLike: true),
                                        .init(image: "image4",
                                              item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를 아세요?",
                                              location: "의정부시 송산2동",
                                              price: "50,000원",
                                              isLike: true),
                                        .init(image: "image1",
                                              item: "외장하드",
                                              location: "노원구 중계2.3동",
                                              price: "60,000원",
                                              isLike: false),
                                        .init(image: "image2",
                                              item: "게이밍 의자",
                                              location: "노원구 상계 8동",
                                              price: "30,000원",
                                              isLike: false),
                                        .init(image: "image3",
                                              item: "노트북 팝니다",
                                              location: "노원구 상계9동",
                                              price: "120,000원",
                                              isLike: true),
                                        .init(image: "image4",
                                              item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를 아세요?",
                                              location: "의정부시 송산2동",
                                              price: "50,000원",
                                              isLike: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        hieararchy()
        setLayout()
        setTableViewConfig()
    }
    
    private func setTableViewConfig() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureUI() {
        tableView.do {
            $0.backgroundColor = .init(red: 33.0 / 255.0,
                                       green: 33.0 / 255.0,
                                       blue: 33.0 / 255.0,
                                       alpha: 1.0)
            $0.separatorColor = .lightGray
            $0.separatorStyle = .singleLine
        }
    }
    
    func hieararchy() {
        view.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension ViewController: UITableViewDelegate {}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier,
                                                       for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.likeTapCompletion = { [weak self] state in
            guard let self else {return}
            itemListData[indexPath.row].isLike = state
        }
        cell.bindData(data: itemListData[indexPath.row])
        return cell
    }
}
