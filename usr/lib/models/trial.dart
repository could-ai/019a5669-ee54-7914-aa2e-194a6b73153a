/// Model representing a trial subscription
class Trial {
  final String id;
  final String domain;
  final String aliasId;
  final DateTime trialStart;
  final DateTime trialEnd;
  final bool autoRenew;
  final String? subscriptionId;
  final String status; // active, cancelled, expired
  final DateTime? cancelledAt;
  final List<String> remindersSent;
  final String? cancellationEvidence; // Screenshot or response log

  Trial({
    required this.id,
    required this.domain,
    required this.aliasId,
    required this.trialStart,
    required this.trialEnd,
    this.autoRenew = true,
    this.subscriptionId,
    required this.status,
    this.cancelledAt,
    this.remindersSent = const [],
    this.cancellationEvidence,
  });

  /// Convert Trial to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'domain': domain,
      'alias_id': aliasId,
      'trial_start': trialStart.toIso8601String(),
      'trial_end': trialEnd.toIso8601String(),
      'auto_renew': autoRenew ? 1 : 0,
      'subscription_id': subscriptionId,
      'status': status,
      'cancelled_at': cancelledAt?.toIso8601String(),
      'reminders_sent': remindersSent.join(','),
      'cancellation_evidence': cancellationEvidence,
    };
  }

  /// Create Trial from SQLite Map
  factory Trial.fromMap(Map<String, dynamic> map) {
    return Trial(
      id: map['id'],
      domain: map['domain'],
      aliasId: map['alias_id'],
      trialStart: DateTime.parse(map['trial_start']),
      trialEnd: DateTime.parse(map['trial_end']),
      autoRenew: map['auto_renew'] == 1,
      subscriptionId: map['subscription_id'],
      status: map['status'],
      cancelledAt: map['cancelled_at'] != null ? DateTime.parse(map['cancelled_at']) : null,
      remindersSent: (map['reminders_sent'] as String).split(',').where((r) => r.isNotEmpty).toList(),
      cancellationEvidence: map['cancellation_evidence'],
    );
  }

  /// Check if trial is expiring soon (within 2 days)
  bool get isExpiringSoon {
    final daysUntilExpiry = trialEnd.difference(DateTime.now()).inDays;
    return daysUntilExpiry <= 2 && daysUntilExpiry >= 0;
  }

  /// Get days remaining in trial
  int get daysRemaining {
    return trialEnd.difference(DateTime.now()).inDays;
  }

  /// Create a copy with updated fields
  Trial copyWith({
    String? id,
    String? domain,
    String? aliasId,
    DateTime? trialStart,
    DateTime? trialEnd,
    bool? autoRenew,
    String? subscriptionId,
    String? status,
    DateTime? cancelledAt,
    List<String>? remindersSent,
    String? cancellationEvidence,
  }) {
    return Trial(
      id: id ?? this.id,
      domain: domain ?? this.domain,
      aliasId: aliasId ?? this.aliasId,
      trialStart: trialStart ?? this.trialStart,
      trialEnd: trialEnd ?? this.trialEnd,
      autoRenew: autoRenew ?? this.autoRenew,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      status: status ?? this.status,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      remindersSent: remindersSent ?? this.remindersSent,
      cancellationEvidence: cancellationEvidence ?? this.cancellationEvidence,
    );
  }
}