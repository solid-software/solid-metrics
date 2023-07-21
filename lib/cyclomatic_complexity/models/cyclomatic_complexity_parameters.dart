/// A data model class that represents the cyclomatic complexity input paramters.
class CyclomaticComplexityParameters {
  /// Min value of complexity level
  final int? minComplexity;

  /// Constructor for [CyclomaticComplexityParameters] model
  const CyclomaticComplexityParameters({required this.minComplexity});

  /// Method for creating from json data
  factory CyclomaticComplexityParameters.fromJson(Map<String, Object?> json) =>
      CyclomaticComplexityParameters(
        minComplexity: json['max_complexity'] as int?,
      );
}
