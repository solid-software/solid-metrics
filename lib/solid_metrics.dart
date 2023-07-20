library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/metrics/cyclomatic_complexity_metric.dart';

/// creates plugin
PluginBase createPlugin() => _SolidMetrics();

/// Solid metric linter
class _SolidMetrics extends PluginBase {
  /// Get params of lint rule
  Map<String, Object?>? _getParamsForLintRule(
    CustomLintConfigs configs,
    String code,
  ) {
    return configs.rules[code]?.json;
  }

  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        CyclomaticComplexityMetric(
          additionalParameters: _getParamsForLintRule(
                configs,
                CyclomaticComplexityMetric.lintCode.name,
              ) ??
              {},
        ),
      ];
}
