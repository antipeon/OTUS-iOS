//
//  ChoiceViewCoordinator.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 21.06.2024.
//

import UIKit

final class ChoiceViewCoordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private let items: [String]
    private let onChoiceUpdate: (String) -> ()
    
    init(items: [String], onChoiceUpdate: @escaping (String) -> ()) {
        self.items = items
        self.onChoiceUpdate = onChoiceUpdate
    }
    
    func indexOf(_ item: String) -> Int? {
        items.firstIndex(of: item)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        items.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let view { return view }
        
        let view = UILabel()
        view.numberOfLines = 1
        view.text = items[row]
        view.font = Spec.font
        view.textColor = .black
        
        view.sizeToFit()
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        onChoiceUpdate(items[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let width = (0..<items.count).reduce(into: CGFloat.zero) { width, index in
            let title = items[index]
            let size = size(for: title)
            width = max(width, size.width)
        }
        
        return width + 48
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        let height = (0..<items.count).reduce(into: CGFloat.zero) { height, index in
            let title = items[index]
            let size = size(for: title)
            height = max(height, size.height)
        }
        
        return height + 16
    }
    
    // MARK: - Private
    private func size(for string: String) -> CGSize {
        var attrString = AttributedString(stringLiteral: string)
        attrString.font = Spec.font
        return NSAttributedString(attrString).size()
    }
    
    private enum Spec {
        static let font = UIFont.systemFont(ofSize: 18)
    }
}
