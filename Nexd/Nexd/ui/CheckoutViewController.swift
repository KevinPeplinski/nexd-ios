//
//  CheckoutViewController.swift
//  Nexd
//
//  Created by Tobias Schröpf on 21.03.20.
//  Copyright © 2020 Tobias Schröpf. All rights reserved.
//

import RxSwift
import SnapKit
import NexdClient
import UIKit

class CheckoutViewController: UIViewController {
    enum Style {
        static let headerHeight: CGFloat = 60
        static let rowHeight: CGFloat = 40
        static let buttonHeight: CGFloat = 52
    }

    struct Item {
        let isSelected: Bool
        let title: String
        let itemId: Int64?

        static func from(item: ShoppingListViewController.Item) -> Item {
            return Item(isSelected: item.isSelected, title: item.title, itemId: item.itemId)
        }
    }

    struct UserRequest {
        let user: User
        let items: [Item]
    }

    struct Content {
        let requests: [UserRequest]
    }

    private let disposeBag = DisposeBag()

    private var gradient = GradientView()
    private var collectionView: UICollectionView? {
        didSet {
            collectionView?.dataSource = dataSource
        }
    }
    private var completeButton = UIButton()

    private var dataSource: DefaultSectionedDataSource<CheckableCell.Item>? {
        didSet {
            collectionView?.dataSource = dataSource
        }
    }

    var content: Content? {
        didSet {
            let sections = content?.requests.map { request -> DefaultSectionedDataSource<CheckableCell.Item>.Section in
                let items = request.items.map { CheckableCell.Item(isChecked: $0.isSelected, text: $0.title) }
                return DefaultSectionedDataSource<CheckableCell.Item>.Section(reuseIdentifier: CheckableCell.reuseIdentifier,
                                                                              title: "\(request.user.firstName) \(request.user.lastName)",
                                                                              items: items)
            }

            dataSource = DefaultSectionedDataSource(sections: sections ?? [], cellBinder: { item, cell in
                if let cell = cell as? CheckableCell {
                    cell.bind(to: item)
                }
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: Style.headerHeight)
        layout.itemSize = CGSize(width: view.frame.size.width, height: Style.rowHeight)

        let list = UICollectionView(frame: .zero, collectionViewLayout: layout)
        list.backgroundColor = .clear
        list.delegate = self
        list.register(CheckableCell.self, forCellWithReuseIdentifier: CheckableCell.reuseIdentifier)
        list.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)

        title = R.string.localizable.checkout_screen_title()

        view.addSubview(gradient)
        gradient.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        completeButton.addTarget(self, action: #selector(completeButtonPressed(sender:)), for: .touchUpInside)
        completeButton.style(text: R.string.localizable.checkout_button_title_complete())
        view.addSubview(completeButton)
        completeButton.snp.makeConstraints { make in
            make.leftMargin.equalTo(8)
            make.rightMargin.equalTo(-8)
            make.height.equalTo(Style.buttonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }

        view.addSubview(list)
        list.snp.makeConstraints { make -> Void in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(completeButton.snp.top).offset(8)
        }

        collectionView = list
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension CheckoutViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, willDisplay _: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // nothing yet
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

extension CheckoutViewController {
    @objc func completeButtonPressed(sender: UIButton!) {
//        guard let content = content else { return }
//        ShoppingListService.shared.createShoppingList(requestIds: content.acceptedRequests.map { $0.id })
//            .subscribe(onSuccess: { [weak self] shoppingList in
//                log.debug("Shoppping list created: \(shoppingList)")
//                let shoppingListVC = ShoppingListViewController()
//                shoppingListVC.shoppingList = shoppingList
//                self?.navigationController?.pushViewController(shoppingListVC, animated: true)
//            }, onError: { [weak self] error in
//                log.error("Failed to create shopping list: \(error)")
//                self?.showError(title: R.string.localizable.helper_request_overview_error_title(),
//                                message: R.string.localizable.helper_request_overview_error_message())
//            })
//            .disposed(by: disposeBag)
    }
}
