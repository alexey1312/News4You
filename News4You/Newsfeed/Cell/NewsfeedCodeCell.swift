//
//  NeewsfeedCodeCell.swift
//  VKNewsFeed
//
//  Created by Admin on 30.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit
import Rswift

protocol NewsfeedCodeCellDelegate: class {
    func revealPost(for cell: NewsfeedCodeCell)
}

final class NewsfeedCodeCell: UITableViewCell {

    static let reuseId = "NeewsfeedCodeCell"

    weak var delegate: NewsfeedCodeCellDelegate?

    // MARK: Set layer

    //firest layer
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false  //allow compiler to pin View
        return view
    }()

    //second layer
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let postLabel: UITextView = {
       let textView = UITextView()
        textView.font = Constants.postLabelFont
        textView.isScrollEnabled = false
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.tintColor = #colorLiteral(red: 0.3098039216, green: 0.6117647059, blue: 0.8784313725, alpha: 1)

        let padding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets.init(top: 0,
                                                        left: -padding,
                                                        bottom: 0,
                                                        right: -padding)
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        return textView
    }()

    let moreTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(#colorLiteral(red: 0.4012392163, green: 0.6231879592, blue: 0.8316264749, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.setTitle("Expand text...", for: .normal)
        return button
    }()

    let galleryCollectionView = GalleryCollectionView()

    var postImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8234507442, green: 0.3115251064, blue: 0.3296223879, alpha: 1)
        return imageView
    }()

    let bottomView: UIView = {
        let view = UIView()
        return view
    }()

    //third layer on topView
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.nameLabelFont
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.227329582, green: 0.2323184013, blue: 0.2370472848, alpha: 1)
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.dateLabelFont
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        return label
    }()

    //third layer on bottomView
    let likesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false  //allow compiler to pin View
        return view
    }()

    let commentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false  //allow compiler to pin View
        return view
    }()

    let sharesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false  //allow compiler to pin View
        return view
    }()

    let viewsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false  //allow compiler to pin View
        return view
    }()

    //fourth layer on bottomView
    let likesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.like()
        return imageView
    }()

    let commentsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.comment()
        return imageView
    }()

    let sharesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.share()
        return imageView
    }()

    let viewsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.eye()
        return imageView
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = Constants.bottomViewViewsLabelFont
        label.lineBreakMode = .byClipping
        return label
    }()

    let commentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = Constants.bottomViewViewsLabelFont
        label.lineBreakMode = .byClipping
        return label
    }()

    let sharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = Constants.bottomViewViewsLabelFont
        label.lineBreakMode = .byClipping
        return label
    }()

    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5768421292, green: 0.6187390685, blue: 0.664434731, alpha: 1)
        label.font = Constants.bottomViewViewsLabelFont
        label.lineBreakMode = .byClipping
        return label
    }()

    // MARK: init view

    //Cell for use once
    override func prepareForReuse() {
        iconImageView.set(imageURL: nil)
        postImageView.set(imageURL: nil)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        iconImageView.layer.cornerRadius = Constants.topViewHeight / 2
        iconImageView.clipsToBounds = true

        backgroundColor = .clear
        selectionStyle = .none

        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true

        moreTextButton.addTarget(self, action: #selector(moreTextButtonTouch), for: .touchUpInside)

        //first layer
        overlayFirstLayer()
        //second layer
        overlaySecondLayer()
        //third layer
        overlayThirdLayerOnTopView()
        overlayThirdLayerOnBottomView()
        //fourth layer
        overlayFourthLayerOnBottomViewViews()
    }

    @objc func moreTextButtonTouch() {
        delegate?.revealPost(for: self)
    }

    // MARK: set data

    func set(viewModel: FeedCellViewModel) {

        iconImageView.set(imageURL: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views

        postLabel.frame = viewModel.sizes.postLabelFrame

        bottomView.frame = viewModel.sizes.bottomViewFrame
        moreTextButton.frame = viewModel.sizes.moreTextButtonFrame

        if let photoAttachment = viewModel.photoAttachements.first, viewModel.photoAttachements.count == 1 {
            postImageView.isHidden = false
            galleryCollectionView.isHidden = true
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.frame = viewModel.sizes.attachmentFrame
        } else if viewModel.photoAttachements.count > 1 {
            postImageView.isHidden = true
            galleryCollectionView.isHidden = false
            galleryCollectionView.frame = viewModel.sizes.attachmentFrame
            galleryCollectionView.set(photos: viewModel.photoAttachements)
        } else {
            postImageView.isHidden = true
            galleryCollectionView.isHidden = true
        }
    }

    // MARK: add constraints

    private func overlayFourthLayerOnBottomViewViews() {
        // likesView constraints
        likesView.addSubview(likesImage)
        likesView.addSubview(likesLabel)

        // commentsView constraints
        commentsView.addSubview(commentsImage)
        commentsView.addSubview(commentsLabel)

        // sharesView constraints
        sharesView.addSubview(sharesImage)
        sharesView.addSubview(sharesLabel)

        // viewsView constraints
        viewsView.addSubview(viewsImage)
        viewsView.addSubview(viewsLabel)

        // helpInFourthLayer constraints
        helpInFourthLayer(view: likesView, imageView: likesImage, label: likesLabel)
        helpInFourthLayer(view: commentsView, imageView: commentsImage, label: commentsLabel)
        helpInFourthLayer(view: sharesView, imageView: sharesImage, label: sharesLabel)
        helpInFourthLayer(view: viewsView, imageView: viewsImage, label: viewsLabel)
    }

    private func helpInFourthLayer(view: UIView, imageView: UIImageView, label: UILabel) {

        // imageView constraints
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true

        // label constraints
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func overlayThirdLayerOnBottomView() {
        bottomView.addSubview(likesView)
        bottomView.addSubview(commentsView)
        bottomView.addSubview(sharesView)
        bottomView.addSubview(viewsView)

        //likesView constraints
        likesView.anchor(top: bottomView.topAnchor,
                         leading: bottomView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 777, right: 777),
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewHeight))

        //commentsView constraints
        commentsView.anchor(top: bottomView.topAnchor,
                            leading: likesView.trailingAnchor,
                            bottom: nil,
                            trailing: nil,
                            size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewHeight))

        //sharesView constraints
        sharesView.anchor(top: bottomView.topAnchor,
                          leading: commentsView.trailingAnchor,
                          bottom: nil,
                          trailing: nil,
                          size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewHeight))

        //viewsView constraints
        viewsView.anchor(top: bottomView.topAnchor,
                         leading: nil,
                         bottom: nil,
                         trailing: bottomView.trailingAnchor,
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewHeight))

    }

    private func overlayThirdLayerOnTopView() {
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)

        //iconImageView constraints
        iconImageView.anchor(top: topView.topAnchor,
                             leading: topView.leadingAnchor,
                             bottom: nil,
                             trailing: nil,
                             size: CGSize(width: Constants.topViewHeight, height: Constants.topViewHeight))

        //nameLabel constraints
        nameLabel.anchor(top: topView.topAnchor,
                         leading: topView.leadingAnchor,
                         bottom: nil,
                         trailing: topView.trailingAnchor,
                         padding: UIEdgeInsets(top: 2, left: Constants.topViewHeight + 8, bottom: 777, right: 8),
                         size: CGSize(width: 777, height: Constants.topViewHeight / 2 - 5))

        //dateLabel constraints
        dateLabel.anchor(top: nil,
                         leading: topView.leadingAnchor,
                         bottom: topView.bottomAnchor,
                         trailing: topView.trailingAnchor,
                         padding: UIEdgeInsets(top: 777, left: Constants.topViewHeight + 8, bottom: 2, right: 8),
                         size: CGSize(width: 777, height: Constants.topViewHeight / 2 - 5))
    }

    private func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(moreTextButton)
        cardView.addSubview(postImageView)
        cardView.addSubview(galleryCollectionView)
        cardView.addSubview(bottomView)

        //topView constraints
        topView.anchor(top: cardView.topAnchor ,
                       leading: cardView.leadingAnchor,
                       bottom: nil,
                       trailing: cardView.trailingAnchor,
                       padding: UIEdgeInsets(top: 8, left: 8, bottom: 777, right: 8),
                       size: CGSize(width: 0, height: Constants.topViewHeight))

        //moreTextButton constraints
        moreTextButton.anchor(top: cardView.topAnchor ,
                              leading: cardView.leadingAnchor,
                              bottom: nil,
                              trailing: cardView.trailingAnchor,
                              padding: UIEdgeInsets(top: 8, left: 8, bottom: 777, right: 8),
                              size: CGSize(width: 0, height: Constants.topViewHeight))
    }

    private func overlayFirstLayer() {

        addSubview(cardView)
        cardView.fillSuperview(padding: Constants.cardInsets)

        //cardView constraints
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
