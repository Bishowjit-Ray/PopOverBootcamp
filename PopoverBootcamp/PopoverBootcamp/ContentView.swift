//
//  ContentView.swift
//  PopoverBootcamp
//
//  Created by Bishowjit Ray on 15/9/22.
//


//sheets
//animation
//transition


import SwiftUI

struct ContentView: View {
    @State var showNewScreen: Bool = false
    var body: some View {
        ZStack{
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
                
            }
            //Method 1 -- sheet
//
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            // method 2 -- transation
//            ZStack{
//                if showNewScreen{
//                    NewScreen( showNewScreen: $showNewScreen)
//                        .padding(.top,100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            
            //Method 3 -- Animation OffSet
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top,100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
    
        }
    }
}
struct NewScreen: View{
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    var body: some View{
        ZStack(alignment: .topLeading){
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button {
                //presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .padding(20)
            }

            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
  ContentView()
    //NewScreen()
    }
}
