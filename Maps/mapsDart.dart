void main(){
    // Maps! Key/Value Pairs
    var cars = {"John":"Lambo", "Chris":"Ferarri", "Benny":"BMW", "Eyram":"Benz"};
    print(cars);
    print(cars["Chris"]);
    // Show Values
    print(cars.values);

    // Show keys
    print(cars.keys);

    // Show length
    print(cars.length);

    // Add something
    cars["Sarah"] = "Mclaren";
    print(cars);

    // Add many things
    cars.addAll({"Ann":"Bentley", "Jay":"Dodge"});
    print(cars);
    
    // Remove something
    cars.remove("Sarah");
    print(cars);

    // Remove everything
    cars.clear();
    print(cars);

    

  
}