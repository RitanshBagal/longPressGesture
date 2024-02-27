//
//  LongPressGesture.swift
//  appleSignIn
//
//  Created by user46b on 27/02/24.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green: Color.blue)
                .frame(maxWidth: isComplete ? .infinity:0)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(Color.gray)
        
            HStack{
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50){ (isPressing) in
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)){
                                isComplete = true
                            }
                        }
                            else{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                    if !isSuccess {
                                        withAnimation(.easeInOut){
                                            isComplete = false
                                        }
                                    }
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut){
                            isSuccess = true
                        }
                    }
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
//        Text(isComplete ? "COMPLETED":"NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green:Color.gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    LongPressGesture()
}
