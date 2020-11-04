//
//  ContentView.swift
//  MyTodo
//
//  Created by Laflora on 2020/10/28.
//

import UIKit


class ContentView: UITableView {
    
    // テーブルを用意して、表示
    let table: UITableView = UITableView(frame: CGRect(x: 50, y: 50 , width: 200, height: 500))
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let items = ["aa", "bb", "cc", "ee"]
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}


