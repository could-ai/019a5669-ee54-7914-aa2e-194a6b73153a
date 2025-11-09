/// Model representing a user alias (Sudonim)
class Alias {
  final String id;
  final String aliasAddress;
  final DateTime createdAt;
  final List<String> usedOnDomains;
  final DateTime? expiresAt;
  final String status; // active, expired, revoked
  final int usageCount;
  final DateTime? lastUsedAt;

  Alias({
    required this.id,
    required this.aliasAddress,
    required this.createdAt,
    required this.usedOnDomains,
    this.expiresAt,
    required this.status,
    this.usageCount = 0,
    this.lastUsedAt,
  });

  /// Convert Alias to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alias_address': aliasAddress,
      'created_at': createdAt.toIso8601String(),
      'used_on_domains': usedOnDomains.join(','),
      'expires_at': expiresAt?.toIso8601String(),
      'status': status,
      'usage_count': usageCount,
      'last_used_at': lastUsedAt?.toIso8601String(),
    };
  }

  /// Create Alias from SQLite Map
  factory Alias.fromMap(Map<String, dynamic> map) {
    return Alias(
      id: map['id'],
      aliasAddress: map['alias_address'],
      createdAt: DateTime.parse(map['created_at']),
      usedOnDomains: (map['used_on_domains'] as String).split(',').where((d) => d.isNotEmpty).toList(),
      expiresAt: map['expires_at'] != null ? DateTime.parse(map['expires_at']) : null,
      status: map['status'],
      usageCount: map['usage_count'] ?? 0,
      lastUsedAt: map['last_used_at'] != null ? DateTime.parse(map['last_used_at']) : null,
    );
  }

  /// Create a copy with updated fields
  Alias copyWith({
    String? id,
    String? aliasAddress,
    DateTime? createdAt,
    List<String>? usedOnDomains,
    DateTime? expiresAt,
    String? status,
    int? usageCount,
    DateTime? lastUsedAt,
  }) {
    return Alias(
      id: id ?? this.id,
      aliasAddress: aliasAddress ?? this.aliasAddress,
      createdAt: createdAt ?? this.createdAt,
      usedOnDomains: usedOnDomains ?? this.usedOnDomains,
      expiresAt: expiresAt ?? this.expiresAt,
      status: status ?? this.status,
      usageCount: usageCount ?? this.usageCount,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    );
  }
}