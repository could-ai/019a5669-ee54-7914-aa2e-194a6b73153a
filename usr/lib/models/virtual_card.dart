/// Model representing a virtual card ("bluff card") metadata
/// NOTE: This is NOT a real credit card. Balance is always $0.
/// Used for legal automation and form-filling simulation.
class VirtualCard {
  final String id;
  final String cardNumber; // Formatted display number (not functional)
  final String cardholderName; // Always "John Doe"
  final String expiryMonth;
  final String expiryYear;
  final String cvv; // Display only
  final double balance; // Always 0.0
  final String status; // active, expired
  final DateTime createdAt;
  final String? associatedAliasId;
  final List<String> usedOnDomains;

  VirtualCard({
    required this.id,
    required this.cardNumber,
    this.cardholderName = 'John Doe',
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    this.balance = 0.0,
    this.status = 'active',
    required this.createdAt,
    this.associatedAliasId,
    this.usedOnDomains = const [],
  });

  /// Convert VirtualCard to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'card_number': cardNumber,
      'cardholder_name': cardholderName,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'cvv': cvv,
      'balance': balance,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'associated_alias_id': associatedAliasId,
      'used_on_domains': usedOnDomains.join(','),
    };
  }

  /// Create VirtualCard from SQLite Map
  factory VirtualCard.fromMap(Map<String, dynamic> map) {
    return VirtualCard(
      id: map['id'],
      cardNumber: map['card_number'],
      cardholderName: map['cardholder_name'] ?? 'John Doe',
      expiryMonth: map['expiry_month'],
      expiryYear: map['expiry_year'],
      cvv: map['cvv'],
      balance: map['balance'] ?? 0.0,
      status: map['status'] ?? 'active',
      createdAt: DateTime.parse(map['created_at']),
      associatedAliasId: map['associated_alias_id'],
      usedOnDomains: (map['used_on_domains'] as String).split(',').where((d) => d.isNotEmpty).toList(),
    );
  }

  /// Get formatted card number (4-digit groups)
  String get formattedCardNumber {
    return cardNumber.replaceAllMapped(
      RegExp(r'.{1,4}'),
      (match) => '${match.group(0)} ',
    ).trim();
  }

  /// Get masked card number (show last 4 digits)
  String get maskedCardNumber {
    if (cardNumber.length < 4) return '****';
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  /// Create a copy with updated fields
  VirtualCard copyWith({
    String? id,
    String? cardNumber,
    String? cardholderName,
    String? expiryMonth,
    String? expiryYear,
    String? cvv,
    double? balance,
    String? status,
    DateTime? createdAt,
    String? associatedAliasId,
    List<String>? usedOnDomains,
  }) {
    return VirtualCard(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cardholderName: cardholderName ?? this.cardholderName,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      cvv: cvv ?? this.cvv,
      balance: balance ?? this.balance,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      associatedAliasId: associatedAliasId ?? this.associatedAliasId,
      usedOnDomains: usedOnDomains ?? this.usedOnDomains,
    );
  }
}