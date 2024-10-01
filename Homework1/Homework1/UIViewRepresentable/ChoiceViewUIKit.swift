//
//  ChoiceViewUIKit.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 20.06.2024.
//

import UIKit

final class ChoiceViewUIKit: UIView {
    // MARK: - Subviews
    private let choiceView = UIPickerView()
    
    // MARK: - Proxy to delegate
    var delegate: UIPickerViewDelegate? {
        didSet {
            choiceView.delegate = delegate
            choiceView.reloadAllComponents()
        }
    }
    var dataSource: UIPickerViewDataSource? {
        didSet {
            choiceView.dataSource = dataSource
            choiceView.reloadAllComponents()
        }
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        addSubview(choiceView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    func setSelected(_ index: Int, animated: Bool = false) {
        choiceView.selectRow(index, inComponent: 0, animated: animated)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        choiceView.frame = bounds
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let calculatedWidth = delegate?.pickerView?(choiceView, widthForComponent: 0)
        let calculatedHeight: CGFloat? = {
            guard let height = delegate?.pickerView?(choiceView, rowHeightForComponent: 0),
                  let rowsCount = dataSource?.pickerView(choiceView, numberOfRowsInComponent: 0) else {
                return nil
            }
            return height * CGFloat(rowsCount + 1)
        }()
        
        let width = min((calculatedWidth ?? .greatestFiniteMagnitude), size.width)
        let height = min((calculatedHeight ?? .greatestFiniteMagnitude), size.height)
        
        let size = CGSize(width: width, height: height)
        let sizeThatFits = choiceView.sizeThatFits(size)
        return size.intersection(sizeThatFits)
    }
}

private extension CGSize {
    func intersection(_ other: CGSize) -> CGSize {
        CGSize(width: min(width, other.width), height: min(height, other.height))
    }
}
