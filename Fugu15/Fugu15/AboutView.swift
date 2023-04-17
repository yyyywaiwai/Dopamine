//
//  AboutView.swift
//  Fugu15
//
//  Created by Linus Henze on 2022-07-29.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.openURL) var openURL

    @State private var descriptionMaxWidth: CGFloat?

    struct DescriptionWidthPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }

    var body: some View {
        VStack(alignment: .center) {
            Image("FuguIcon")
                .resizable()
                .cornerRadius(22.37)
                .padding()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.size.width/3)
                .shadow(radius: 10)

            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("        Fugu15 越狱        ")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                        .background(
                            GeometryReader(content: { geometry in
                                Color.clear.preference(
                                    key: DescriptionWidthPreferenceKey.self,
                                    value: geometry.size.width
                                )
                            })
                        )
                        .padding(.bottom)

                    Text("Fugu15 是针对 iOS 15.0 - 15.4.1 设计的（尚未完成的）越狱，它支持 iPhone XS 及更新的设备。")
                        .multilineTextAlignment(.center)
                        .frame(width: descriptionMaxWidth)
                }
                    .onPreferenceChange(DescriptionWidthPreferenceKey.self) {
                        descriptionMaxWidth = $0
                    }
            }.padding(.bottom)

            //
            // You should change the links below if you make any changes to Fugu15
            // so that others know where to find the source code
            //
            Link("源代码", destination: URL(string: "https://github.com/pinauten/Fugu15")!)
                .padding([.top, .leading, .trailing])
            Link("许可证", destination: URL(string: "https://github.com/pinauten/Fugu15/LICENSE")!)
                .padding([.top, .leading, .trailing])
            Link("致谢", destination: URL(string: "https://github.com/pinauten/Fugu15/blob/master/README.md#Credits")!)
                .padding([.top, .leading, .trailing])

            Spacer()

            Text("编译版本: " + Constants.commitShortHash())
            Text("编译时间: " + Constants.compileTime())

            Group {
                Image("PinautenLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 100)
                    .padding(.trailing, 100)
                    .padding(.bottom)
                    .frame(maxHeight: 100)
                    .onTapGesture {
                        openURL(URL(string: "https://pinauten.de/")!)
                    }
            }.padding(.bottom, 25)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
