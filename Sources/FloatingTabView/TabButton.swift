//
//  TabButton.swift
//  FloatingTabView
//
//  Created by Micah Wilson on 11/5/19.
//  Copyright © 2019 micahwilson. All rights reserved.
//

import SwiftUI

struct TabButton: View {
	let tab: TabItem
	let selected: Bool
	var body: some View {
		HStack(spacing: 10) {
			self.tab.image
			if selected {
			Text(self.tab.title)
				.font(.system(size: 11))
				.lineLimit(1)
//				.minimumScaleFactor(0.8)
				.transition(.opacity)
			}
		}
		.foregroundColor(selected ? tab.selectedColor : tab.defaultColor)
	}
}
