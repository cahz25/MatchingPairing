//
//  Interactor.swift
//  CoreLayer
//
//  Created by Cesar  Hurtado on 7/12/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

protocol InteractorProtocol {
    associatedtype P
    //associatedtype R
    func execute(params: P)
}

public class InteractorAsync<Params>: InteractorProtocol {
    typealias P = Params
    //typealias R = Response

    public init() { }

    public func execute(params: Params) -> () {
        return buildUseCase(params: params)
    }

    public func buildUseCase(params: Params) {}
}
