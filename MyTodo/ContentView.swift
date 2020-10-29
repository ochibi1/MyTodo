//
//  ContentView.swift
//  MyTodo
//
//  Created by Laflora on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { (index) in Text("Row \(index)")
                }
            }
            .navigationBarTitle("今日のやること", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("新規追加項目画面ができたら、遷移")
            }, label: {
                Text("追加")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
