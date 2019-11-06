//
//  FloatingTabView.swift
//  FloatingTabView
//
//  Created by Micah Wilson on 11/3/19.
//  Copyright © 2019 micahwilson. All rights reserved.
//

import SwiftUI

public struct FloatingTabView<Content: View>: View {
	@State public var selectedIndex = 0
	public let tabs: [TabItem]
	public let backgroundColor: Color
	public let shadowRadius: CGFloat
	public let leadingTrailingOuterPadding: CGFloat
	public let leadingTrailingInnerPadding: CGFloat
	public let content: (_ currentTab: Int) -> Content
	
	public init(selectedIndex: Int = 0,
				tabs: [TabItem],
				backgroundColor: Color = Color(#colorLiteral(red: 0.1333333333, green: 0.1568627451, blue: 0.1921568627, alpha: 1)),
				shadowRadius: CGFloat = 2,
				leadingTrailingOuterPadding: CGFloat = 20,
				leadingTrailingInnerPadding: CGFloat = 10,
				content: @escaping (_ currentTab: Int) -> Content) {
		self.tabs = tabs
		self.content = content
		self.backgroundColor = backgroundColor
		self.shadowRadius = shadowRadius
		self.leadingTrailingOuterPadding = leadingTrailingOuterPadding
		self.leadingTrailingInnerPadding = leadingTrailingInnerPadding
		self.selectedIndex = selectedIndex
	}
	
	private var selectedTabSizeIncrease: CGFloat {
		CGFloat(tabs.count * 50)
	}
	
	private func unselectedTabSize(in geometry: GeometryProxy) -> CGFloat {
		(geometry.size.width - (leadingTrailingInnerPadding * 2) - (selectedTabSizeIncrease / CGFloat(tabs.count - 1))) / CGFloat(tabs.count)
	}
	
	private func selectedTabSize(in geometry: GeometryProxy) -> CGFloat {
		(geometry.size.width - (leadingTrailingInnerPadding * 2) + selectedTabSizeIncrease) / CGFloat(tabs.count)
	}
	
    public var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .bottom) {
				self.content(self.selectedIndex)
					.animation(nil)
					.edgesIgnoringSafeArea(.all)
					.frame(width: geometry.size.width, height: geometry.size.height)
				
				Capsule()
					.foregroundColor(self.backgroundColor)
					.shadow(radius: self.shadowRadius)
					.frame(width: geometry.size.width - (self.leadingTrailingOuterPadding * 2), height: 56)
					.overlay(
						GeometryReader { geometry2 in
							HStack(spacing: 0) {
								Spacer()
									.frame(width: self.leadingTrailingInnerPadding)
								ForEach(self.tabs.indices, id: \.self) { tabIndex in
									Button(action: {
										UIImpactFeedbackGenerator().impactOccurred()
										withAnimation {
											self.selectedIndex = tabIndex
										}
									}) {
										GeometryReader { buttonGeometry in
											TabButton(tab: self.tabs[tabIndex], selected: tabIndex == self.selectedIndex)
												.frame(width: buttonGeometry.size.width, height: buttonGeometry.size.height)
										}
									}
									.background(
										TabItemBackground(selected: self.selectedIndex == tabIndex)
									)
									.accentColor(self.tabs[tabIndex].selectedColor)
									.tag(tabIndex)
									.frame(height: geometry2.size.height)
										.frame(width: self.selectedIndex == tabIndex ? self.selectedTabSize(in: geometry2) : self.unselectedTabSize(in: geometry2))
								}
								Spacer()
									.frame(width: self.leadingTrailingInnerPadding)
							}
							.clipped()
						}
					)
					.padding(.bottom, geometry.safeAreaInsets.bottom == 0 ? self.leadingTrailingOuterPadding : 0)
			}
			.animation(Animation.spring().speed(2.5))
		}
    }
}
