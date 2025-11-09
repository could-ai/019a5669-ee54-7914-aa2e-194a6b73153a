/// Model representing an email message from an alias
class MailMessage {
  final String id;
  final String aliasId;
  final String fromAddress;
  final String subject;
  final String bodyPreview; // First 200 chars
  final String? fullBody;
  final DateTime receivedAt;
  final bool isRead;
  final List<String> tags;
  final String? trialId; // If this email is related to a trial
  final bool isConfirmationEmail;

  MailMessage({
    required this.id,
    required this.aliasId,
    required this.fromAddress,
    required this.subject,
    required this.bodyPreview,
    this.fullBody,
    required this.receivedAt,
    this.isRead = false,
    this.tags = const [],
    this.trialId,
    this.isConfirmationEmail = false,
  });

  /// Convert MailMessage to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alias_id': aliasId,
      'from_address': fromAddress,
      'subject': subject,
      'body_preview': bodyPreview,
      'full_body': fullBody,
      'received_at': receivedAt.toIso8601String(),
      'is_read': isRead ? 1 : 0,
      'tags': tags.join(','),
      'trial_id': trialId,
      'is_confirmation_email': isConfirmationEmail ? 1 : 0,
    };
  }

  /// Create MailMessage from SQLite Map
  factory MailMessage.fromMap(Map<String, dynamic> map) {
    return MailMessage(
      id: map['id'],
      aliasId: map['alias_id'],
      fromAddress: map['from_address'],
      subject: map['subject'],
      bodyPreview: map['body_preview'],
      fullBody: map['full_body'],
      receivedAt: DateTime.parse(map['received_at']),
      isRead: map['is_read'] == 1,
      tags: (map['tags'] as String).split(',').where((t) => t.isNotEmpty).toList(),
      trialId: map['trial_id'],
      isConfirmationEmail: map['is_confirmation_email'] == 1,
    );
  }

  /// Create a copy with updated fields
  MailMessage copyWith({
    String? id,
    String? aliasId,
    String? fromAddress,
    String? subject,
    String? bodyPreview,
    String? fullBody,
    DateTime? receivedAt,
    bool? isRead,
    List<String>? tags,
    String? trialId,
    bool? isConfirmationEmail,
  }) {
    return MailMessage(
      id: id ?? this.id,
      aliasId: aliasId ?? this.aliasId,
      fromAddress: fromAddress ?? this.fromAddress,
      subject: subject ?? this.subject,
      bodyPreview: bodyPreview ?? this.bodyPreview,
      fullBody: fullBody ?? this.fullBody,
      receivedAt: receivedAt ?? this.receivedAt,
      isRead: isRead ?? this.isRead,
      tags: tags ?? this.tags,
      trialId: trialId ?? this.trialId,
      isConfirmationEmail: isConfirmationEmail ?? this.isConfirmationEmail,
    );
  }
}