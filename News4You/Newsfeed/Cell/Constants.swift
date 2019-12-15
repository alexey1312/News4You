//
//  Constants.swift
//  VKNewsFeed
//
//  Created by Admin on 30.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

struct Constants {
    //cardView
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    //topView
    static let topViewHeight: CGFloat = 40
    static let nameLabelFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let dateLabelFont = UIFont.systemFont(ofSize: 12, weight: .regular)

    //postLabel
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let moreTextButtonLabelFont = UIFont.systemFont(ofSize: 15, weight: .medium)

    //bottomView
    static let bottomViewHeight: CGFloat = 40
    static let bottomViewViewWidth: CGFloat = 80
    static let bottomViewViewsIconSize: CGFloat = 20
    static let bottomViewViewsLabelFont = UIFont.systemFont(ofSize: 15, weight: .medium)

    //moreBotton
    static let minifiedPostLimitLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6

    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
}
