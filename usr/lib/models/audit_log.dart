/// Model representing an audit log entry for tamper-evident tracking
class AuditLog {
  final String id;
  final DateTime timestamp;
  final String eventType; // alias_created, trial_started, file_captured, cancellation_attempted, etc.
  final String description;
  final Map<String, dynamic> metadata;
  final String? relatedEntityId; // ID of alias, trial, scrap, etc.
  final String hashChain; // Hash of previous log entry for tamper evidence

  AuditLog({
    required this.id,
    required this.timestamp,
    required this.eventType,
    required this.description,
    this.metadata = const {},
    this.relatedEntityId,
    required this.hashChain,
  });

  /// Convert AuditLog to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'event_type': eventType,
      'description': description,
      'metadata': _encodeMetadata(metadata),
      'related_entity_id': relatedEntityId,
      'hash_chain': hashChain,
    };
  }

  /// Create AuditLog from SQLite Map
  factory AuditLog.fromMap(Map<String, dynamic> map) {
    return AuditLog(
      id: map['id'],
      timestamp: DateTime.parse(map['timestamp']),
      eventType: map['event_type'],
      description: map['description'],
      metadata: _decodeMetadata(map['metadata']),
      relatedEntityId: map['related_entity_id'],
      hashChain: map['hash_chain'],
    );
  }

  /// Encode metadata map to JSON string
  static String _encodeMetadata(Map<String, dynamic> metadata) {
    if (metadata.isEmpty) return '{}';
    // In production, use proper JSON encoding
    return metadata.entries.map((e) => '"${e.key}":"${e.value}"').join(',');
  }

  /// Decode metadata JSON string to map
  static Map<String, dynamic> _decodeMetadata(String? encoded) {
    if (encoded == null || encoded.isEmpty || encoded == '{}') return {};
    // In production, use proper JSON decoding
    return {}; // Placeholder
  }
}