import 'dart:io';
import 'dart:math';
void main() {
  print("Welcome to my mini-calculator.");
   
    print("""
What operation would you like to perform?
Select an option:
 1. Addition
 2. Subtraction
 3. Multiplication
 4. Division
 5. Squareroot of first number
 6. Squareroot of second number 
""");
  print("Your option:");
   
  String? input = stdin.readLineSync();
  int option = int.parse(input!);
  
  print("Enter your first number:");
  String? input1 = stdin.readLineSync();
  double num1 = double.parse(input1!);
  
  
  print("Enter your second number:");
  String? input2 = stdin.readLineSync();
  double num2 = double.parse(input2!);
  
  double result = 0;
if( option == 1){
  result = num1 + num2;
  print("Your answer is $result");
}
else if( option == 2){
  result = num1 - num2;
  print("Your answer is $result");
}
else if( option == 3){
  result = num1 * num2;
  print("Your answer is $result");
}
else if(option == 4){
  result = num1 / num2;
  print("Your answer is $result");
}
else if(option == 5){
  result = sqrt(num1) ;
  print("Your answer is $result");
}
else if(option == 6){
  result = sqrt(num2);
  print("Your answer is $result");
}
else(){
  print("Invalid option input. Select a valid option (1-6)");
};
}