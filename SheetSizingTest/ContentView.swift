//
//  ContentView.swift
//  SheetSizingTest
//
//  Created by Donald Anderson on 27/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State var presentingFormSheetView = false
    @State var presentingPageSheetView = false
    @State var presentingCustomSheetView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                presentingFormSheetView.toggle()
            } label: {
                Text("Present Form Sheet")
            }
            .sheet(isPresented: $presentingFormSheetView) {
                Text("Sheet using .form presentation sizing")
                    .presentationSizing(.form)
            }
            
            Spacer()
            
            Button {
                presentingPageSheetView.toggle()
            } label: {
                Text("Present Page Sheet")
            }
            .sheet(isPresented: $presentingPageSheetView) {
                Text("Sheet using .page presentation sizing")
                    .presentationSizing(.page)
            }
            
            Spacer()
            
            Button {
                presentingCustomSheetView.toggle()
            } label: {
                Text("Present Custom Sheet")
            }
            .sheet(isPresented: $presentingCustomSheetView) {
                Text("Sheet using .custom presentation sizing")
                    .presentationSizing(.custom)
            }
            Spacer()
        }
        .padding()
    }
}

struct CustomSizing: PresentationSizing
{
    func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize
    {
        .init(width: 800, height: 600)
    }
}

@available(iOS 18.0, *)
extension PresentationSizing where Self == CustomSizing
{
    static var custom: Self
    {
        CustomSizing()
    }
}


#Preview {
    ContentView()
}
