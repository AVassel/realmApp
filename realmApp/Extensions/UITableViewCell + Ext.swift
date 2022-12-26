//
//  UITableViewCell + Ext.swift
//  realmApp
//
//  Created by Anton Vassel on 26.12.2022.
//

import UIKit

extension UITableViewCell {
    func configure(with taskList: TaskList) {
        let currentTasks = taskList.tasks.filter("isComplete = false")
        var context = defaultContentConfiguration()
        
        context.text = taskList.name
        
        if taskList.tasks.isEmpty {
            context.secondaryText = "0"
            accessoryType = .none
        } else if currentTasks.isEmpty {
            context.secondaryText = nil
            accessoryType = .checkmark
        } else {
            context.secondaryText = "\(currentTasks.count)"
            accessoryType = .none
        }
        
        contentConfiguration = context
    }
}
