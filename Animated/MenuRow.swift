//
//  MenuRow.swift
//  Animated
//
//  Created by Mukul Rawat on 1/8/25.
//

import SwiftUI

struct MenuRow: View {
    @Binding var selectedMenu: SelectedMenu
    var item: MenuItem
    var body: some View {
        HStack(spacing: 14) {
            item.icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.6)
            Text(item.text)
                .customFont(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth: .infinity , alignment: .leading)
            
            
        )
        .background(Color("Background 2"))
        .onTapGesture {
            item.icon.setInput("active", value: true)
            //stop the animation after 2 secs
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                item.icon.setInput("active", value: false)
            }
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1 )) {
                selectedMenu = item.menu
                
            }
        }
    }
}

#Preview {
    MenuRow(selectedMenu: .constant(.home), item  : menuItems[0])
}
