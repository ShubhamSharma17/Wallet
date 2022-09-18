class DataOfCards {
  static final data = [
    VariableOfCard(
      cardNumber: "1234 5678 9012 3456",
      expireDate: "09/17",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/640px-Visa.svg.png",
    ),
    VariableOfCard(
      cardNumber: "2548 6598 3254 7895",
      expireDate: "01/30",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/640px-Visa.svg.png",
    ),
    VariableOfCard(
      cardNumber: "9848 6574 2549 5487",
      expireDate: "05/23",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/640px-Visa.svg.png",
    ),
  ];
}

class VariableOfCard {
  var cardNumber;
  var image;
  var expireDate;

  VariableOfCard({
    this.cardNumber,
    this.image,
    this.expireDate,
  });
}
