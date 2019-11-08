# FloatingTabView

<img src="Resources/example.gif" alt="TabView Example" width="300"/>

## Add to Project:

```swift
.package(url: "https://github.com/Wilson-Micah/FloatingTabView", .branch("master"))
```

or in the Xcode menu navigation to:

`File > Swift Packages > Add Package Dependency > https://github.com/Wilson-Micah/FloatingTabView`

## How to Use:

```swift
let contentView = FloatingTabView(tabs: [
		.init(image: .init(systemName: "house"), title: "Home", selectedColor: Color.orange, content: 
			Text("Home View")
		),
		.init(image: .init(systemName: "flame"), title: "Flame", selectedColor: Color.orange, content:
			Text("Flame View")
		),
		.init(image: .init(systemName: "chart.bar"), title: "Graph", selectedColor: Color.orange, content:
			Text("Graph View")
		),
		.init(image: .init(systemName: "gear"), title: "Settings", selectedColor: Color.orange, content:
			Text("Flame View")
		),
	])
	
window.rootViewController = UIHostingController(rootView: contentView)
```

## Nonworking Pieces:
- When using NavigationView:
	- When using a NavigationView state is lost when switching tabs.
	- When selecting the already selected tab the navigation stack doesn't pop to the root view.