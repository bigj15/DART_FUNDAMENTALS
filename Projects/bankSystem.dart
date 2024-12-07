class BankAccount {
  String _accountHolderName;
  String _accountNumber;
  double _balance;

  
  BankAccount(this._accountHolderName, this._accountNumber, this._balance);

  // Getters
  String get accountHolderName{ 
    return _accountHolderName;
    }
  String get accountNumber{ 
  return _accountNumber;
  }
  double get balance{

   return _balance;
   }

  // Setters
  set accountHolderName(String name) {
    _accountHolderName = name;
  }

  set accountNumber(String number) {
    _accountNumber = number;
  }

  set balance(double newBalance) {
    _balance = newBalance;
  }

  // Deposit method
  void deposit(double amount) {
    _balance += amount;
  }

  // Withdraw method
  double withdraw(double amount) {
    if (amount > _balance) {
      print("Can't exceed amount");
    } else {
      print("You have taken $amount from $_balance");
      _balance -= amount;
    }
    return amount;
  }

  // Account summary
  void AccountSummary() {
    print("Name: $accountHolderName");
    print("Number: $accountNumber");
    print("Balance: $balance");
  }
}


void main(){

BankAccount account = new BankAccount("Jedel","1122",500);
 account.withdraw(300.0);
 
 

account.AccountSummary();
  

  
  
  
  
  

}