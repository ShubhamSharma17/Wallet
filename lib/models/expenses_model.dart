class ExpensesVariable {
  var image;
  var placeName;
  var date;
  var spendingMoney;

  ExpensesVariable({
    this.date,
    this.image,
    this.placeName,
    this.spendingMoney,
  });
}

class DataofExpenses {
  static final expensesVariable = [
    ExpensesVariable(
      date: "9-sep-22",
      image:
          "https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/d2fd6cbb32432311f93bc729a65c7fb0.png",
      placeName: "Hollywood Café",
      spendingMoney: "23",
    ),
    ExpensesVariable(
      date: "8-feb-22",
      image:
          "https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/d2fd6cbb32432311f93bc729a65c7fb0.png",
      placeName: "The French Gourmet",
      spendingMoney: "70",
    ),
    ExpensesVariable(
      date: "27-nov-22",
      image:
          "https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/d2fd6cbb32432311f93bc729a65c7fb0.png",
      placeName: "Polo Bar",
      spendingMoney: "120",
    ),
    ExpensesVariable(
      date: "14-jun-22",
      image:
          "https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/d2fd6cbb32432311f93bc729a65c7fb0.png",
      placeName: "Dine In a Dime",
      spendingMoney: "170",
    ),
  ];
}
