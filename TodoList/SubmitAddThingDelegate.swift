//
//  SubmitAddThingDelegate.swift
//  TodoList
//
//  Created by Chao-I Chen on 1/23/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import Foundation

protocol SubmitAddThingDelegate: class {
    func itemSubmit(by controller: AddThingViewController, with text: String, with note: String, and date: Date)
}
