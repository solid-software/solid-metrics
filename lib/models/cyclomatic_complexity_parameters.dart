/// Complexity input parameters
class CyclomaticComplexityParameters {
  /// Min value of complexity level
  final int? minComplexity;

  /// Constructor for [CyclomaticComplexityParameters] model
  const CyclomaticComplexityParameters({required this.minComplexity});

  /// Method for creating from json data
  factory CyclomaticComplexityParameters.fromJson(Map<String, Object?> json) =>
      CyclomaticComplexityParameters(
        minComplexity: json['min_complexity'] as int?,
      );
}
