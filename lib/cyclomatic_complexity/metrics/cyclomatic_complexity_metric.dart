library cyclomatic_complexity_metric;

import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/cyclomatic_complexity/models/cyclomatic_complexity_parameters.dart';
import 'package:solid_metrics/cyclomatic_complexity/visitor/cyclomatic_complexity_visitor.dart';

/// A Complexity metric checks content of block and detects more easier solution
class CyclomaticComplexityMetric extends DartLintRule {
  /// The [LintCode] of this lint rule that represents the error.
  static const lintCode = LintCode(
    name: 'cyclomatic_complexity_metric',
    problemMessage: 'Check complexity',
  );

  /// The additional parameters for this metric.
  final CyclomaticComplexityParameters additionalParameters;

  static const _defaultMaxComplexity = 2;

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

      final maxComplexity =
          additionalParameters.minComplexity ?? _defaultMaxComplexity;

      if (visitor.complexityEntities.length + 1 > maxComplexity) {
        reporter.reportErrorForNode(lintCode, node);
      }
    });
  }
}
