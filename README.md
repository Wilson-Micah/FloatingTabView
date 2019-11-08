# FloatingTabView

<img src="Resources/example.gif" alt="TabView Example" width="300"/>

## Add to Project:

```swift
.package(url: "https://github.com/Wilson-Micah/FloatingTabView", .branch("master"))
```

or in the Xcode menu navigate to:

`File > Swift Packages > Add Package Dependency > https://github.com/Wilson-Micah/FloatingTabView`

## How to Use:

```swift
let homeTab = TabItem(image: .init(systemName: "house"), title: "Home", selectedColor: .orange, content: HomeView())
let feedTab = TabItem(image: .init(systemName: "flame"), title: "Feed", selectedColor: .orange, content: FeedView())
let dataTab = TabItem(image: .init(systemName: "chart.bar"), title: "Data", selectedColor: .orange, content: DataView())
let settingsTab = TabItem(image: .init(systemName: "settings"), title: "Settings", selectedColor: .orange, content: SettingsView())

/* Optional Parameters:
******************************************
*	selectedIndex: Int                   *
*	backgroundColor: Color               *
*	shadowRadius: CGFloat                *
*	leadingTrailingOuterPadding: CGFloat *
*	leadingTrailingInnerPadding: CGFloat *
******************************************
*/
let contentView = FloatingTabView(tabs: [homeTab, feedTab, dataTab, settingsTab])

window.rootViewController = UIHostingController(rootView: contentView)
```

## Nonworking Pieces:
- When using NavigationView and selecting the already selected tab the navigation stack doesn't pop to the root view.
