//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Admin on 21.11.2019.
//  Copyright (c) 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    typealias RsponseTypeAlias = Newsfeed.Model.Response.ResponseType
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        switch request {
        case .getNewsfeed:
            service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response:
                    RsponseTypeAlias.presentNewsfeed(feed: feed,
                                                     revealdedPostIds: revealedPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] (user) in
                self?.presenter?.presentData(response:
                    RsponseTypeAlias.presentUserInfo(user: user))
            })
        case .revealPostIds(let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response:
                    RsponseTypeAlias.presentNewsfeed(feed: feed,
                                                     revealdedPostIds: revealedPostIds))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentFooterLoader)
            service?.getNextBatch(completion: { (revealedPostIds, feed) in
                self.presenter?.presentData(response:
                    RsponseTypeAlias.presentNewsfeed(feed: feed,
                                                     revealdedPostIds: revealedPostIds))
            })
        }
    }
}
