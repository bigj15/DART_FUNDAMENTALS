void main(){
    // Functions
    myFunc(){
      print ("Trying this out");
    }
    myFunc();
    
    //Way 2
     myFunc1(String name){
      return "Hello $name";
    } 
    print (myFunc1("James"));
    
    //Way 3 
    myFunc2(String name1, name2){
      return "Hello $name1 and $name2";
    } 
    print (myFunc2("James", "John" ));

    //Way 4 Positional Parameter
    myFunc3(String name1, [name2]){
      return "Hello $name1 and $name2";
    } 
    print (myFunc3("James"));

    //Way 5
    myFunc4(String name1, {name2}){
      return "Hello $name1 and $name2";
    } 
    print (myFunc4("James",name2: "John"));

    //Way 6
    myFunc5(String name1, {name2 ="friends"} ){
      return "Hello $name1 and $name2";
    } 
    print (myFunc5("James"));

}
