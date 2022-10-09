//
//  PromiseCreation.swift
//  MARO
//
//  Created by 김연호 on 2022/09/18.
//

import SwiftUI

struct PromiseCreation: View {
    @StateObject var viewModel = PromiseViewModel()
    @Environment(\.dismiss) private var dismiss
    @State var promise: String
    @State var memoDescription: String
    @State private var chooseCategory = "선택"

    var body: some View {
        VStack {
            HStack {
                Text("약속 내용")
                Spacer()
                // TODO: 글자 수 기능 구현
            }.padding(.horizontal)

            TextField("약속 내용을 입력해주세요", text: $promise)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.horizontal)
            HStack {
                Text("카테고리")
                    .padding()
                Spacer()
            }
            HStack {
                Menu {
                    ForEach(Category.allCases, id: \.self) { selected in
                        Button {
                            self.chooseCategory = selected.categoryName
                        } label: {
                            Text("\(selected.categoryName)")
                        }
                    }
                } label: {
                    HStack() {
                        Text("\(chooseCategory)")
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                    .frame(height: 40)
                    .foregroundColor(Color.black)
                    .background(Color.gray)
                    .padding(.horizontal)
                }.cornerRadius(20)

                Spacer()
            }
            HStack {
                Text("메모")
                    .padding()
                Spacer()
            }
            TextField("메모 내용을 입력해주세요", text: $memoDescription)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.horizontal)

            Spacer()
            // MARK: CoreData 적용 확인
            /*
            List {
                ForEach(viewModel.saveEntities) { entity in
                    VStack {
                        Text(entity.promise ?? "")
                        Text(entity.category ?? "")
                        Text(entity.memoDescription ?? "")
                        Text(entity.dateCreated?.toString() ?? "")
                    }
                }
                .onDelete(perform: viewModel.deletePromise)
            }
            .listStyle(PlainListStyle())
             */

            Button {
                viewModel.addPromise(promise: promise, category: chooseCategory, description: memoDescription)
            } label: {
                Text("약속 추가")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

        }
        .navigationTitle(Text("약속 만들기"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
           dismiss()
        }, label: {
            Image(systemName: "arrow.backward")
        }))

    }
}

//struct PromiseCreation_Previews: PreviewProvider {
//    static var previews: some View {
//        PromiseCreation()
//    }
//}
