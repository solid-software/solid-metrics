library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/cyclomatic_complexity/metrics/cyclomatic_complexity_metric.dart';
import 'package:solid_metrics/cyclomatic_complexity/models/cyclomatic_complexity_parameters.dart';

/// creates plugin
PluginBase createPlugin() => _SolidMetrics();

/// Solid metric linter
class _SolidMetrics extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    final complexityMetricParameters = CyclomaticComplexityParameters.fromJson(
      _getParamsForLintRule(
            configs,
            CyclomaticComplexityMetric.lintCode.name,
          ) ??
          {},
    );

    return [
      CyclomaticComplexityMetric(
        additionalParameters: complexityMetricParameters,
      ),
    ];
  }

  /// Get params of lint rule
  Map<String, Object?>? _getParamsForLintRule(
    CustomLintConfigs configs,
    String code,
  ) {
    return configs.rules[code]?.json;
  }
}
