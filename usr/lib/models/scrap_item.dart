/// Model representing a captured file or project asset (Scrap)
class ScrapItem {
  final String id;
  final String title;
  final String sourceDomain;
  final String projectLabel;
  final DateTime capturedAt;
  final int sizeBytes;
  final String fileType; // mp4, png, pdf, jpg, zip, etc.
  final String localFilePath; // Path to actual file on disk
  final String? thumbnailPath; // Path to thumbnail/preview
  final List<String> tags;
  final String privacyLevel; // public, private, sensitive
  final String? description;
  final String? associatedAliasId;

  ScrapItem({
    required this.id,
    required this.title,
    required this.sourceDomain,
    required this.projectLabel,
    required this.capturedAt,
    required this.sizeBytes,
    required this.fileType,
    required this.localFilePath,
    this.thumbnailPath,
    this.tags = const [],
    this.privacyLevel = 'private',
    this.description,
    this.associatedAliasId,
  });

  /// Convert ScrapItem to Map for SQLite storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'source_domain': sourceDomain,
      'project_label': projectLabel,
      'captured_at': capturedAt.toIso8601String(),
      'size_bytes': sizeBytes,
      'file_type': fileType,
      'local_file_path': localFilePath,
      'thumbnail_path': thumbnailPath,
      'tags': tags.join(','),
      'privacy_level': privacyLevel,
      'description': description,
      'associated_alias_id': associatedAliasId,
    };
  }

  /// Create ScrapItem from SQLite Map
  factory ScrapItem.fromMap(Map<String, dynamic> map) {
    return ScrapItem(
      id: map['id'],
      title: map['title'],
      sourceDomain: map['source_domain'],
      projectLabel: map['project_label'],
      capturedAt: DateTime.parse(map['captured_at']),
      sizeBytes: map['size_bytes'],
      fileType: map['file_type'],
      localFilePath: map['local_file_path'],
      thumbnailPath: map['thumbnail_path'],
      tags: (map['tags'] as String).split(',').where((t) => t.isNotEmpty).toList(),
      privacyLevel: map['privacy_level'] ?? 'private',
      description: map['description'],
      associatedAliasId: map['associated_alias_id'],
    );
  }

  /// Get human-readable file size
  String get formattedSize {
    if (sizeBytes < 1024) return '$sizeBytes B';
    if (sizeBytes < 1024 * 1024) return '${(sizeBytes / 1024).toStringAsFixed(1)} KB';
    if (sizeBytes < 1024 * 1024 * 1024) return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(sizeBytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Get file extension icon
  String get fileIcon {
    switch (fileType.toLowerCase()) {
      case 'mp4':
      case 'mov':
      case 'avi':
      case 'webm':
        return '🎥';
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'webp':
        return '🖼️';
      case 'pdf':
        return '📄';
      case 'zip':
      case 'rar':
      case '7z':
        return '📦';
      case 'txt':
      case 'md':
        return '📝';
      default:
        return '📁';
    }
  }

  /// Create a copy with updated fields
  ScrapItem copyWith({
    String? id,
    String? title,
    String? sourceDomain,
    String? projectLabel,
    DateTime? capturedAt,
    int? sizeBytes,
    String? fileType,
    String? localFilePath,
    String? thumbnailPath,
    List<String>? tags,
    String? privacyLevel,
    String? description,
    String? associatedAliasId,
  }) {
    return ScrapItem(
      id: id ?? this.id,
      title: title ?? this.title,
      sourceDomain: sourceDomain ?? this.sourceDomain,
      projectLabel: projectLabel ?? this.projectLabel,
      capturedAt: capturedAt ?? this.capturedAt,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      fileType: fileType ?? this.fileType,
      localFilePath: localFilePath ?? this.localFilePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      tags: tags ?? this.tags,
      privacyLevel: privacyLevel ?? this.privacyLevel,
      description: description ?? this.description,
      associatedAliasId: associatedAliasId ?? this.associatedAliasId,
    );
  }
}