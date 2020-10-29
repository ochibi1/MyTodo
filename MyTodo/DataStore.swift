//
//  DataStore.swift
//  MyTodo
//
//  Created by Laflora on 2020/10/29.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
