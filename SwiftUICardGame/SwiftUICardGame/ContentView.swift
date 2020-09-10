//
//  ContentView.swift
//  SwiftUICardGame
//
//  Created by Taylan Bostanci on 28.08.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import SwiftUI
import UIKit
struct ContentView: View {
    @State private var kredi = 200
    @State private var sembol = ["uzayli","canavar","ufo","loading"]
    @State  private var cardId = [0,1,2,3]
    @State private var backgroundColor = [Color.white,Color.white,Color.white]
    @State  var buttonAction = false
    @State  private var bahis = 10
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 100/255, green: 150/255, blue: 30/255)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(.yellow).rotationEffect(Angle(degrees: 75)).edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    if  self.backgroundColor[2] == Color.green
                    {
                        Text("KAZANDINIZ!!").bold().foregroundColor(.red
                        ).padding().background(Color.white.opacity(0.5)).cornerRadius(50)
                            .padding(40).font(Font.custom("Avenir-Book", size: 30)).isHidden(false)
                    }
                }
                if self.kredi <= 5 {
                    Text("YETERSİZ KREDİ !!").bold().foregroundColor(.black
                    ).padding().background(Color.red
                        .opacity(0.5)).cornerRadius(50)
                        .padding(40)
                }else{
                    Text("KREDİ:"+String(kredi)).bold().foregroundColor(.black
                    ).padding().background(Color.white.opacity(0.5)).cornerRadius(50)
                        .padding(40).font(Font.custom("Avenir-Book", size: 15).italic())
                }
                HStack {
                    Spacer()
                    CardView(sembol:$sembol[cardId[0]],backgroundColor: $backgroundColor[0])
                    CardView(sembol:$sembol[cardId[1]],backgroundColor: $backgroundColor[1])
                    CardView(sembol:$sembol[cardId[2]],backgroundColor: $backgroundColor[2])
                }.padding()
                Button(action: {
                    self.buttonAction = true
                    self.cardId[0] = self.cardId[3]
                    self.cardId[1] = self.cardId[3]
                    self.cardId[2] = self.cardId[3]
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5 ){
                        if self.kredi <= 10 {
                            self.buttonAction = true
                        }else{
                            self.buttonAction = false
                            
                        }
                        self.cardId[0] = Int.random(in: 0...2)
                        self.cardId[1] = Int.random(in: 0...2)
                        self.cardId[2] = Int.random(in: 0...2)
                        self.backgroundColor[0] = Color.white
                        self.backgroundColor[1] = Color.white
                        self.backgroundColor[2] = Color.white
                        if self.cardId[0]==self.cardId[1] &&
                            self.cardId[1]==self.cardId[2] {
                            self.kredi += self.bahis + 50
                            self.backgroundColor[0] = Color.green
                            self.backgroundColor[1] = Color.green
                            self.backgroundColor[2] = Color.green
                        }
                        else{
                            self.kredi -= self.bahis
                        }
                    }
                }
                    )
                {
                    Text("EŞLEŞTİR").bold().foregroundColor(.black).padding(.all,10).padding([.leading,.trailing],30).foregroundColor(.black
                    ).background(Color.pink.opacity(0.5)).cornerRadius(20).padding()
                }.disabled(buttonAction).font(Font.custom("Avenir-Book", size: 20).bold().italic())
            }
        }
    }
}

extension View{
    @ViewBuilder    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        }
    }
}
