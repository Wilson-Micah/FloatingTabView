//
//  TabItemBackground.swift
//  FloatingTabView
//
//  Created by Micah Wilson on 11/3/19.
//  Copyright © 2019 micahwilson. All rights reserved.
//

import SwiftUI

struct TabItemBackground: View {
	let selected: Bool
	var body: some View {
		GeometryReader { geometry in
			Capsule()
				.frame(width: geometry.size.width, height: 36)
				.foregroundColor(self.selected ? Color.accentColor.opacity(0.1) : Color.clear)
		}
	}
}
