library cyclomatic_complexity_metric;

import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:cyclomatic_complexity_metric/visitor/cyclomatic_complexity_visitor.dart';

/// creates plugin
PluginBase createPlugin() => _SolidMetricsLinter();

/// Solid metric linter
class _SolidMetricsLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const CyclomaticComplexityMetric(),
      ];
}

/// A Complexity metric.
class CyclomaticComplexityMetric extends DartLintRule {
  static const _lintCode = LintCode(
    name: 'cyclomatic_complexity_metric',
    problemMessage: 'Check complexity',
  );

  static const _minValue = 2;

  /// Creates a new instance of [CyclomaticComplexityMetric].
  const CyclomaticComplexityMetric({super.code = _lintCode});

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
        reporter.reportErrorForNode(_lintCode, node);
      }
    });
  }
}
