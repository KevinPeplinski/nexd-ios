//
//  TextField.swift
//  Nexd
//
//  Created by Tobias Schröpf on 22.03.20.
//  Copyright © 2020 Tobias Schröpf. All rights reserved.
//

import UIKit

class TextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 41, bottom: 0, right: 0)

    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        guard let size = rightView?.bounds.size else { return .zero }

        return CGRect(x: bounds.maxX - (size.width / 2),
                      y: -(size.height / 2),
                      width: size.width,
                      height: size.height)
    }

    func showNormal() {
        rightViewMode = .never
        rightView = nil
        withBottomBorder()
    }

    func showError() {
        rightViewMode = .always
        let imageView = UIImageView(image: R.image.baseline_error_black_18pt())
        imageView.tintColor = .errorTintColor
        imageView.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        rightView = imageView

        withBottomBorder(color: .errorTintColor)
    }

    func showWarning() {
        rightViewMode = .always
        let imageView = UIImageView(image: R.image.baseline_warning_black_18pt())
        imageView.tintColor = .warningTintColor
        imageView.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        rightView = imageView

        withBottomBorder(color: .warningTintColor)
    }
}
