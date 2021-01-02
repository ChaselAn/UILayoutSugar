//
//  LayoutSugar+UIView.swift
//  LayoutSugar
//
//  Created by 安程 on 2021/1/2.
//

import Foundation

public enum LayoutAnchorType {
    case leading(CGFloat)
    case trailing(CGFloat)
    case top(CGFloat)
    case safeTop(CGFloat)
    case bottom(CGFloat)
    case safeBottom(CGFloat)
    case width(CGFloat) // leftView.width equal to rightView.width + CGFloat
    case height(CGFloat) // leftView.height equal to rightView.height + CGFloat
    case centerY(CGFloat)
    case centerX(CGFloat)

    case lhsWidth(CGFloat) // leftView.width = CGFloat
    case lhsHeight(CGFloat)
    case rhsWidth(CGFloat) // rightView.width = CGFloat
    case rhsHeight(CGFloat)

    public static let leading = LayoutAnchorType.leading(0)
    public static let trailing = LayoutAnchorType.trailing(0)
    public static let top = LayoutAnchorType.top(0)
    public static let safeTop = LayoutAnchorType.safeTop(0)
    public static let bottom = LayoutAnchorType.bottom(0)
    public static let safeBottom = LayoutAnchorType.safeBottom(0)
    public static let width = LayoutAnchorType.width(0)
    public static let height = LayoutAnchorType.height(0)
    public static let centerY = LayoutAnchorType.centerY(0)
    public static let centerX = LayoutAnchorType.centerX(0)
}

public func <> (lhs: UIView, rhs: (UIView, [LayoutAnchorType])) {
    lhs.translatesAutoresizingMaskIntoConstraints = false
    var constraints: [NSLayoutConstraint] = []
    for type in rhs.1 {
        if case .leading(let constant) = type {
            constraints.append(lhs.leadingAnchor.constraint(equalTo: rhs.0.leadingAnchor, constant: constant))
        } else if case .trailing(let constant) = type {
            constraints.append(lhs.trailingAnchor.constraint(equalTo: rhs.0.trailingAnchor, constant: constant))
        } else if case .top(let constant) = type {
            constraints.append(lhs.topAnchor.constraint(equalTo: rhs.0.topAnchor, constant: constant))
        } else if case .safeTop(let constant) = type {
            constraints.append(lhs.topAnchor.constraint(equalTo: rhs.0.safeAreaTopAnchor, constant: constant))
        } else if case .bottom(let constant) = type {
            constraints.append(lhs.bottomAnchor.constraint(equalTo: rhs.0.bottomAnchor, constant: constant))
        } else if case .safeBottom(let constant) = type {
            constraints.append(lhs.bottomAnchor.constraint(equalTo: rhs.0.safeAreaBottomAnchor, constant: constant))
        } else if case .width(let constant) = type {
            constraints.append(lhs.widthAnchor.constraint(equalTo: rhs.0.widthAnchor, constant: constant))
        } else if case .height(let constant) = type {
            constraints.append(lhs.heightAnchor.constraint(equalTo: rhs.0.heightAnchor, constant: constant))
        } else if case .lhsWidth(let constant) = type {
            constraints.append(lhs.widthAnchor.constraint(equalToConstant: constant))
        } else if case .lhsHeight(let constant) = type {
            constraints.append(lhs.heightAnchor.constraint(equalToConstant: constant))
        } else if case .rhsWidth(let constant) = type {
            rhs.0.translatesAutoresizingMaskIntoConstraints = false
            constraints.append(rhs.0.widthAnchor.constraint(equalToConstant: constant))
        } else if case .rhsHeight(let constant) = type {
            rhs.0.translatesAutoresizingMaskIntoConstraints = false
            constraints.append(rhs.0.heightAnchor.constraint(equalToConstant: constant))
        } else if case .centerY(let constant) = type {
            constraints.append(lhs.centerYAnchor.constraint(equalTo: rhs.0.centerYAnchor, constant: constant))
        } else if case .centerX(let constant) = type {
            constraints.append(lhs.centerXAnchor.constraint(equalTo: rhs.0.centerXAnchor, constant: constant))
        }
    }
    constraints.forEach { $0.isActive = true }
}

public func <> (lhs: UIView, rhs: [LayoutAnchorType]) {
    guard let superview = lhs.superview else { fatalError() }
    lhs <> (superview, rhs)
}

public func <> (lhs: UIView, rhs: (UIView, UIEdgeInsets)) {
    lhs.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
        lhs.topAnchor.constraint(equalTo: rhs.0.topAnchor, constant: rhs.1.top),
        lhs.bottomAnchor.constraint(equalTo: rhs.0.bottomAnchor, constant: -rhs.1.bottom),
        lhs.leadingAnchor.constraint(equalTo: rhs.0.leadingAnchor, constant: rhs.1.left),
        lhs.trailingAnchor.constraint(equalTo: rhs.0.trailingAnchor, constant: -rhs.1.right)
    ]
    constraints.forEach { $0.isActive = true }
}

extension UIView {
    public var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }

    public var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
}
