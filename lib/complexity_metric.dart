library complexity_metric;

import 'package:analyzer/error/listener.dart';
import 'package:complexity_metric/visitor/complexity_metric_flow_visitor.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// creates plugin
PluginBase createPlugin() => _ComplexityMetricLinter();

/// Complexity metric linter
class _ComplexityMetricLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const ComplexityMetric(),
      ];
}

/// A Complexity metric.
class ComplexityMetric extends DartLintRule {
  static const _code = LintCode(
    name: 'complexity_metric',
    problemMessage: 'Check complexity',
  );

  static const _minValue = 2;

  /// Constructor class
  const ComplexityMetric({super.code = _code});

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final visitor = ComplexityMetricFlowVisitor();

    context.registry.addBlockFunctionBody((node) {
      node.visitChildren(visitor);

      if (visitor.complexityEntities.length + 1 > _minValue) {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}
