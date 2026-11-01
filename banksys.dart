class BankAccount {
  final String owner;
  double _balance;

  List<String> transactions = [];

  BankAccount({
    required this.owner,
    required double initialBalance,
  }) : _balance = initialBalance;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Invalid deposit amount');
      return;
    }

    _balance += amount;
    transactions.add('Deposited: $amount');

    print('Deposit successful');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Invalid withdrawal amount');
      return;
    }

    if (amount > _balance) {
      print('Insufficient balance');
      return;
    }

    _balance -= amount;
    transactions.add('Withdrawn: $amount');

    print('Withdrawal successful');
  }

  void displayAccountInfo() {
    print('Owner: $owner');
    print('Balance: $_balance');

    print('Transactions:');

    for (String transaction in transactions) {
      print(transaction);
    }
  }
}

Future<BankAccount> fetchAccount() async {
  await Future.delayed(Duration(seconds: 2));

  return BankAccount(
    owner: 'Mona',
    initialBalance: 1000,
  );
}

void main() async {
  print('Loading account...');

  BankAccount account = await fetchAccount();

  account.deposit(500);
  account.withdraw(200);

  account.displayAccountInfo();
}