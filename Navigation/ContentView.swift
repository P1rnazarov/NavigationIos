//
//  ContentView.swift
//  Navigation
//
//  Created by otabek on 15/03/23.
//

import SwiftUI

struct View1: View {
    @State private var tagSelection: String? = nil
    
    var body: some View {
        NavigationView {
                    VStack {
                      // ссылки на View с привязкой к teg'у
                        NavigationLink(destination: View2(), tag: "view1", selection: $tagSelection) { EmptyView() }
                        NavigationLink(destination: View3(), tag: "view2", selection: $tagSelection) { EmptyView() }
                        
                        Button {
                          // сообщаем объявленному свойству значение teg'а
                          // на основании которого будет активированн та или
                          // иная ссылка
                            tagSelection = "view1"
                        } label: {
                            Text("Переход на View2_1")
                        }

                        Button {
                            tagSelection = "view2"
                        } label: {
                            Text("Переход на View2_2")
                        }
                    }.navigationBarBackButtonHidden(true)
                }
    }
}
struct View2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
      // объявляем NavigationView единожды на первом экране
        Text("2").onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
struct View3: View {
    var body: some View {
      // объявляем NavigationView единожды на первом экране
        Text("3")
    }
}

// первый экран
//struct View1: View {
//    var body: some View {
//      // объявляем NavigationView единожды на первом экране
//        NavigationView {
//            NavigationLink {
//                View1_1()
//            } label: {
//                Text("Переход на View1_1")
//            }.navigationBarBackButtonHidden(true)
//
//        }
//    }
//}
//
//// второй экран
//struct View1_1: View {
//    var body: some View {
//        NavigationLink() {
//            View1_2()
//        } label: {
//            Text("Переход на View1_2")
//        }.navigationBarBackButtonHidden(true)
//
//    }
//}
//
//// третий экран
//struct View1_2: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        Button(
//                   "Here is Detail View. Tap to go back.",
//                   action: { self.presentationMode.wrappedValue.dismiss() }
//               )
//    }
//}
