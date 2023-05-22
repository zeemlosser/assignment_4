abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposit successful. New balance: \$$balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
    print('Withdrawal successful. New balance: \$$balance');
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance - amount >= -overdraftLimit) {
      balance -= amount;
      print('Withdrawal successful. New balance: \$$balance');
    } else {
      print('Withdrawal limit exceeded.');
    }
  }
}

void main() {
  var savingsAccount = SavingsAccount(12345, 1000.0, 0.05);
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(200.0);

  var currentAccount = CurrentAccount(67890, 2000.0, 1000.0);
  currentAccount.deposit(100.0);
  currentAccount.withdraw(3000.0);
}
