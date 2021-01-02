import Foundation

// MARk: <>
infix operator <>: AdditionPrecedence
@discardableResult
public func <> (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <> (layout: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    let const = layout.constraint(equalToConstant: constant)
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutDimension, rhs: (NSLayoutDimension, CGFloat)) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs.0, multiplier: rhs.1)
    const.isActive = true
    return const
}

// MARk: <> with Priority
@discardableResult
public func <> (lhs: NSLayoutXAxisAnchor, rhs: (NSLayoutXAxisAnchor, UILayoutPriority)) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs.0)
    const.priority = rhs.1
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutDimension, rhs: (NSLayoutDimension, UILayoutPriority)) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs.0)
    const.priority = rhs.1
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutYAxisAnchor, rhs: (NSLayoutYAxisAnchor, UILayoutPriority)) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs.0)
    const.priority = rhs.1
    const.isActive = true
    return const
}

@discardableResult
public func <> (layout: NSLayoutDimension, rhs: (CGFloat, UILayoutPriority)) -> NSLayoutConstraint {
    let const = layout.constraint(equalToConstant: rhs.0)
    const.priority = rhs.1
    const.isActive = true
    return const
}

@discardableResult
public func <> (lhs: NSLayoutDimension, rhs: (NSLayoutDimension, CGFloat, UILayoutPriority)) -> NSLayoutConstraint {
    let const = lhs.constraint(equalTo: rhs.0, multiplier: rhs.1)
    const.priority = rhs.2
    const.isActive = true
    return const
}

public func <> (lhs: UIView, rhs: UIView) {
    lhs.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
        lhs.topAnchor.constraint(equalTo: rhs.topAnchor),
        lhs.bottomAnchor.constraint(equalTo: rhs.bottomAnchor),
        lhs.leadingAnchor.constraint(equalTo: rhs.leadingAnchor),
        lhs.trailingAnchor.constraint(equalTo: rhs.trailingAnchor)
    ]
    constraints.forEach { $0.isActive = true }
}

// MARk: + or -
@discardableResult
public func + (constraint: NSLayoutConstraint, constant: CGFloat) -> NSLayoutConstraint {
    constraint.constant += constant
    return constraint
}

@discardableResult
public func - (constraint: NSLayoutConstraint, constant: CGFloat) -> NSLayoutConstraint {
    constraint.constant -= constant
    return constraint
}

// MARk: <<> or <>>
infix operator <<>: MultiplicationPrecedence
@discardableResult
public func <<> (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(lessThanOrEqualTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <<> (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(lessThanOrEqualTo: rhs)
    const.isActive = true
    return const
}

infix operator <>>: MultiplicationPrecedence
@discardableResult
public func <>> (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(greaterThanOrEqualTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <>> (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let const = lhs.constraint(greaterThanOrEqualTo: rhs)
    const.isActive = true
    return const
}

@discardableResult
public func <>> (lhs: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    let const = lhs.constraint(greaterThanOrEqualToConstant: constant)
    const.isActive = true
    return const
}

@discardableResult
public func <<> (lhs: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    let const = lhs.constraint(lessThanOrEqualToConstant: constant)
    const.isActive = true
    return const
}

@discardableResult
public func <>> (lhs: NSLayoutDimension, rhs: (NSLayoutDimension, CGFloat)) -> NSLayoutConstraint {
    let const = lhs.constraint(greaterThanOrEqualTo: rhs.0, multiplier: rhs.1)
    const.isActive = true
    return const
}

@discardableResult
public func <<> (lhs: NSLayoutDimension, rhs: (NSLayoutDimension, CGFloat)) -> NSLayoutConstraint {
    let const = lhs.constraint(lessThanOrEqualTo: rhs.0, multiplier: rhs.1)
    const.isActive = true
    return const
}
