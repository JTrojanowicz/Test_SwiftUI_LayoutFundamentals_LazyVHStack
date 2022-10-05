//
//  AnotherLazyVHStackView.swift
//  Test_SwiftUI_LayoutFundamentals_LazyVHStack
//
//  Created by Jaroslaw Trojanowicz on 05/10/2022.
//

import SwiftUI

struct SectionFooterView: View {

    var body: some View {
        HStack {
            Text("Footer")
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.primary
                        .colorInvert() //odwrócenie koloru (like day-night color schemes)
                        .opacity(0.75) //przezroczystość
        )
    }
}

struct AnotherLazyVHStackView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center) {
                    ForEach(1...100, id: \.self) {
                        Text("Column \($0)")
                        Divider()
                    }
                }
            }
            .frame(height: 100)
            
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionFooters]) {
                    Section(footer: SectionFooterView()) {
                        ForEach(1...100, id: \.self) {
                            Text("Row \($0)")
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct AnotherLazyVHStackView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherLazyVHStackView()
    }
}
