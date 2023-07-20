library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/metrics/cyclomatic_complexity_metric.dart';

/// creates plugin
PluginBase createPlugin() => _SolidMetrics();

/// Solid metric linter
class _SolidMetrics extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const CyclomaticComplexityMetric(),
      ];
}
