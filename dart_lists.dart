void main(){
var myList = [1,2,3];
print(myList);
print(myList[1]);

myList[2] = 22;
print(myList);

var emptyList = [];
print(emptyList);

emptyList.add(22);
print(emptyList);

emptyList.addAll([1,2,3,4]);
print(emptyList);

myList.insert(3,7);
print(myList);

myList.insertAll(2,[3,4,5,6]);
print(myList);

var mixedList = [1,2,3,"Jedel","Sid"];
print(mixedList);

mixedList.remove("Jedel");
print(mixedList);

mixedList.removeAt(2);
print(mixedList);


}