//
//  HomeView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 1/3/23.
//

import SwiftUI
struct HomeView: View {
    @State var vectorFavorites : [Bool] = [false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    @State var showAll1 : Bool = false;
    @State var showAll2 : Bool = false;
    @State var showAll3 : Bool = false;
    @State var preparePopUpVar = false
    @State var preparePopUpVarEnd = false
    @State var preferinte = CofeePreferences()
    @State var preferinteVect = [CofeePreferences()]
    @State var inter = 0
    var friends : [String] = ["","","","","Ana","Andreea","Liviu","Costi","Laur","Antonio","Giulia","Patricia"]
    var body: some View {
        
        ZStack{
            TabView{
                ZStack{
                    
                    
                    
                    Color(.systemBackground)
                    ScrollView{
                        VStack{
                            
                            TodayCaffeeView(PreparePopUpVar: $preparePopUpVar, VectorFavorite: $vectorFavorites)
                                .padding(.top, 200)
                                .padding(.bottom, -150)
                            
                            YourListView(VectorFavorite: $vectorFavorites, coffeeNrStart: 1, coffeeNrEnd:14, type: "", exit: $inter, preppopup: $preparePopUpVar )
                                .frame(width: UIScreen.main.bounds.width)
                            PopularView(exit: $inter, preppopup: $preparePopUpVar)
                                .frame(width: UIScreen.main.bounds.width)
                            
                           
                        }
                        VStack{
                            
                            Text("Categories")
                                .padding()
                                .scaleEffect(1.5)
                                .frame(width: UIScreen.main.bounds.width , alignment: .leading)
                                .padding(.top, 50)
                                .padding(.leading,50)
                            
                            
                            CategoriesView(showAll: $showAll1, coffeeNrStart: 1, coffeeNrEnd: 4, type: "espresso", exit: $inter, preppopup: $preparePopUpVar )
                                .frame(width: UIScreen.main.bounds.width)
                            CategoriesView(showAll: $showAll2, coffeeNrStart: 10, coffeeNrEnd: 14, type: "capucino", exit: $inter, preppopup: $preparePopUpVar )
                                .frame(width: UIScreen.main.bounds.width)
                            CategoriesView(showAll: $showAll3, coffeeNrStart: 4, coffeeNrEnd: 9, type: "late", exit: $inter, preppopup: $preparePopUpVar )
                                .frame(width: UIScreen.main.bounds.width)
                            CategoriesView(showAll: $showAll3, coffeeNrStart: 9, coffeeNrEnd: 10, type: "alcohool", exit: $inter, preppopup: $preparePopUpVar )
                                .frame(width: UIScreen.main.bounds.width, height: showAll3 ?300 : 200)
                                
                            
                            Text("Your Friends Caffee")
                                .padding()
                                .frame(width: UIScreen.main.bounds.width , alignment: .leading)
                                .padding(.top, 50)

                            Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    
                                    ForEach(4..<8){ ok in
                                        VStack{
                                           Text(String(friends[ok]))
                                            Image("c" + String(ok + 6))
                                                .resizable()
                                                .cornerRadius(20)
                                                .frame(width: 105, height: 200)
                                                .padding(.trailing, 60)
                                        }
                                    }
                                }
   
                            }.frame(width: UIScreen.main.bounds.width)
                                .padding(.leading, 40)
                                .padding(.top, 10)

                        }
                    }
                    
                }.tabItem {
                    VStack{
                        Text("Home")
                        Image(systemName: "house.fill")
                            .resizable()
                            .foregroundStyle(.red)
                    }
                }

                VStack{
                   StoreView()
                    
                }.tabItem {
                    VStack{
                        Text("Store")
                        Image(systemName: "archivebox")
                            .resizable()
                            .foregroundStyle(.red)
                    }
                }
            }.tint(.brown)
                .padding(.bottom,-40)
                
            VStack {
                    if preparePopUpVar {
                        Spacer()
                        PreparePopUp(VectorFavorite: $vectorFavorites, sentJob: $preparePopUpVar, name: "c" + String(inter), preferinte: $preferinte)
                            .zIndex(5)
                    }
            }
            .ignoresSafeArea()
           // .animation(.spring(),value: preparePopUpVar)
        }
    }//body
}//struct


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
