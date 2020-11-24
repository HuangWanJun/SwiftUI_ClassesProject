//
//  Detail.swift
//  ClassesProject
//
//  Created by Samuel Huang on 23/11/2020.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem:Item
    @Binding var show:Bool
    var animation:Namespace.ID
    @State var loadCOntent = false
    @State var selectedColor:Color = Color("p1")
    
    var body: some View {
         
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content: {
             
            VStack{
                HStack(spacing:25){
                    
                    Button(action:{
                        withAnimation(.spring()){show.toggle()}
                    }){
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action:{}){
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Button(action:{}){
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                VStack(spacing:20){
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    
                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "title\(selectedItem.id)", in: animation)
                    
                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top,4)
                        .matchedGeometryEffect(id: "subtitle\(selectedItem.id)", in: animation)
                    
                    HStack{
                        
                       
                        
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                        Spacer(minLength: 0)
                        
                        Button(action:{}){
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                        
                           
                    }
                    .padding()
                        
                }
                .padding(.top,35)
                .background(
                    Color(selectedItem.image)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(15)
                .padding()
                
                
                //delay loading the content for smooth animation
                
                VStack{
                    VStack(alignment:.leading,spacing:8){
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("frmae + lens for $35(it's 50% off)")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    .background(Color("p3"))
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Color")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        HStack( spacing: 15, content: {
                            ForEach(1...4,id:\.self){ i in
                                ZStack{
                                    Color("p\(i)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation{
                                                selectedColor = Color("p\(i)")
                                            }
                                        }
                                    
                                    if selectedColor == Color("p\(i)") {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            Spacer(minLength: 0)
                        })
                        
                    })
                    .padding()
                    
                    Spacer(minLength: 15)
                    
                    Button(action:{}){
                        Text("TRY FRAME IN 3D")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black,lineWidth: 1)
                            )
                    }
                    
                    Button(action:{}){
                        Text("ADD TO CART")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                Color.black
                            )
                            .cornerRadius(15)
                    }
                    .padding(.vertical)
                    
                }
                .padding([.horizontal,.bottom])
                .frame(height: loadCOntent ? nil : 0)
                .opacity(loadCOntent ? 1 : 0)
                
                
                
                
                Spacer(minLength: 0)
                
            }
        })
     
        .onAppear{
            withAnimation(Animation.spring().delay(0.46)){
                loadCOntent.toggle()
            }
        }
    }
}
 
