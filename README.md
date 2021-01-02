# LayoutSugar
快速书写约束的语法糖

## 使用文档

### LayoutSugar.swift

* 此文件包含了所有的运算符的定义，可以进行基础的约束代码编写

#### <> 

```swift
// redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true 
// <==> 
redView.leadingAnchor <> view.leadingAnchor 
```

```swift
// redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
// <==>
redView.topAnchor <> view.topAnchor + 50
```

```swift
// redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
// <==> 
redView.widthAnchor <> 100
```

```swift
// redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
// <==> 
redView.heightAnchor <> redView.widthAnchor
```

```swift
/* redButton.translatesAutoresizingMaskIntoConstraints = false
	 redButton.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
	 redButton.trailingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
	 redButton.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
	 redButton.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true */
// <==> 
redButton <> redView
```

* 使用范例：

```swift
view.addSubview(redView)
redView.translatesAutoresizingMaskIntoConstraints = false
redView.leadingAnchor <> view.leadingAnchor
redView.topAnchor <> view.topAnchor + 50
redView.widthAnchor <> 100
redView.heightAnchor <> redView.widthAnchor
```

#### <>>  and <<> 

```swift
// greenLabel.leadingAnchor.constraint(greaterThanOrEqualTo: redView.trailingAnchor, constant: 10).isActive = true
// <==> 
greenLabel.leadingAnchor <>> redView.trailingAnchor + 10
```

```swift
// redLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 170).isActive = true
// <==> 
redLabel.widthAnchor <<> 170
```

#### 约束优先级

```swift
/* let constraint = redLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
   constraint.priority = .defaultHigh
   constraint.isActive = true  */
// <==>
redLabel.centerYAnchor <> (view.centerYAnchor, .defaultHigh)

// or

if #available(iOS 13.0, *) {
  	// ⚠️⚠️⚠️以下方法仅能在iOS13及以上使用，iOS13以下机型会崩溃
		let constraint = redLabel.centerYAnchor <> view.centerYAnchor
		constraint.priority = .defaultHigh
}
```

### LayoutSugar+UIView.swift

* 此文件可以帮助两个UIView更便利的建立约束

```swift
/* yellowView.translatesAutoresizingMaskIntoConstraints = false
	 yellowView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
	 yellowView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 20).isActive = true
	 yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
	 yellowView.widthAnchor.constraint(equalToConstant: 30).isActive = true  */
// <==>
yellowView <> (redView, [.top, .leading(20), .height, .leftWidth(30)])
```

```swift
/* view.addSubview(blueView)
	 blueView.translatesAutoresizingMaskIntoConstraints = false
	 blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
	 blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	 blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
	 blueView.heightAnchor.constraint(equalToConstant: 150).isActive = true */
// <==>
view.addSubview(blueView)
blueView <> [.leading, .safeBottom, .trailing(-20), .leftHeight(150)]
// <==>
view.addSubview(blueView)
blueView <> (blueView.superview!, [.leading, .safeBottom, .trailing(-20), .leftHeight(150)])
```

```swift
/* blackView.translatesAutoresizingMaskIntoConstraints = false
	 blackView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 20).isActive = true
	 blackView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -20).isActive = true
	 blackView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 20).isActive = true
	 blackView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -20).isActive = true  */
// <==>
blackView <> (blueView, UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
```

## 如何使用

1.使用cocoapods

```ruby
pod 'LayoutSugar'
```

2.或者可以直接拷贝`/LayoutSugar/LayoutSugar/Classes/`目录下的`LayoutSugar.swift`和`LayoutSugar+UIView.swift`文件到你的项目中，按需拷贝。