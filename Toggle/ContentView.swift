//
//  ContentView.swift
//  Toggle
//
//  Created by Rahul Sharma on 8/19/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        
        VStack {
            if !isOn {
                Spacer()
            }
            Circle()
                .fill(Color.white)
                .frame(width: 160, height: 160)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < 0 {
                                self.isOn = true
                            } else {
                                self.isOn = false
                            }
                    }
                )
                .onTapGesture {
                    self.isOn.toggle()
            }
            if isOn {
                Spacer()
            }
        }
        .frame(width: 160, height: 330)
        .padding(16.0)
        .background(isOn ? Color.green : Color.red)
        .animation(.easeInOut)
        .cornerRadius(90.0)
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
