//
//  ShoppingListService.swift
//  Nexd
//
//  Created by Tobias Schröpf on 21.03.20.
//  Copyright © 2020 Tobias Schröpf. All rights reserved.
//

import Foundation
import NexdClient
import RxSwift

class HelpListsService {
    static let shared = HelpListsService()

    func createShoppingList(requestIds: [Int64]) -> Single<HelpList> {
        let dto = HelpListCreateDto(helpRequestsIds: requestIds, status: .active)
        return HelpListsAPI.helpListsControllerInsertNewHelpList(helpListCreateDto: dto)
            .asSingle()
    }

    func addRequest(withId helpRequestId: Int64, to helpListId: Int64) -> Single<HelpList> {
        return HelpListsAPI.helpListsControllerAddHelpRequestToList(helpListId: helpListId, helpRequestId: helpRequestId)
            .asSingle()
    }

    func fetchShoppingLists() -> Single<[HelpList]> {
        return HelpListsAPI.helpListsControllerGetUserLists()
            .asSingle()
    }
}
