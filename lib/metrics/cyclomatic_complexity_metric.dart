library cyclomatic_complexity_metric;

import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/visitor/cyclomatic_complexity_visitor.dart';

/// A Complexity metric checks content of block and detects more easier solution
class CyclomaticComplexityMetric extends DartLintRule {
  /// lint code of metric
  static const lintCode = LintCode(
    name: 'cyclomatic_complexity_metric',
    problemMessage: 'Check complexity',
  );

  /// Additional parameteres
  final Map<String, Object?> additionalParameters;

  static const _minValue = 2;

  /// Creates a new instance of [CyclomaticComplexityMetric].
  const CyclomaticComplexityMetric({
    super.code = lintCode,
    required this.additionalParameters,
  });

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final visitor = CyclomaticComplexityVisitor();

    context.registry.addBlockFunctionBody((node) {
      node.visitChildren(visitor);

      if (visitor.complexityEntities.length + 1 > _minValue) {
        reporter.reportErrorForNode(lintCode, node);
      }
    });
  }
}
