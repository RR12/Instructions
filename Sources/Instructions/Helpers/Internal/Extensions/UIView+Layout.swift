// UIView+Layout.swift
//
// Copyright (c) 2017 Frédéric Maquin <fred@ephread.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

internal extension UIView {
    func fillSuperview() {
        fillSuperviewVertically()
        fillSuperviewHorizontally()
    }

    func fillSuperviewVertically() {
        for constraint in makeConstraintToFillSuperviewVertically() { constraint.isActive = true }
    }

    func fillSuperviewHorizontally() {
        for constraint in makeConstraintToFillSuperviewHorizontally() { constraint.isActive = true }
    }

    func makeConstraintToFillSuperviewVertically() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            print("Warning: View has no parent, can't make fill constraints.")
            return []
        }

		if #available(iOS 9.0, *) {
			return [
				topAnchor.constraint(equalTo: superview.topAnchor),
				bottomAnchor.constraint(equalTo: superview.bottomAnchor)
			]
		} else {
			// Fallback on earlier versions
			return [
				anchors.topAnchor.constraintEqualToAnchor(anchor: superview.anchors.topAnchor),
				anchors.bottomAnchor.constraintEqualToAnchor(anchor: superview.anchors.bottomAnchor)
			]
		}
    }

    func makeConstraintToFillSuperviewHorizontally() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            print("Warning: View has no parent, can't make fill constraints.")
            return []
        }

		if #available(iOS 9.0, *) {
			return [
				leadingAnchor.constraint(equalTo: superview.leadingAnchor),
				trailingAnchor.constraint(equalTo: superview.trailingAnchor)
			]
		} else {
			// Fallback on earlier versions
			return [
				anchors.leadingAnchor.constraintEqualToAnchor(anchor: superview.anchors.leadingAnchor),
				anchors.trailingAnchor.constraintEqualToAnchor(anchor: superview.anchors.trailingAnchor)
			]
		}
    }
}
