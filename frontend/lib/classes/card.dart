class BankingCard {
  final String image;
  final String card_number;
  final String iban;
  final String bic;
  final String expires;
  const BankingCard({
    required this.image,
    required this.card_number,
    required this.iban,
    required this.bic,
    required this.expires,
  });
  factory BankingCard.fromJson(Map<String, dynamic> json) {
    return BankingCard(
      image: json['bank']["name"],
      card_number: json["cardNum"],
      iban: json["iban"],
      bic: json["bank"]["bic"],
      expires: json["expiration"],
    );
  }
}
