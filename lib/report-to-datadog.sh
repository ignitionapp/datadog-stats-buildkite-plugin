function reportToDatadog() {
  local metric_name=$1
  local metric_value=$2
  local metric_type=$3
  local tags=$4

  DD_HOST=${BUILDKITE_PLUGIN_DATADOG_STATS_DOGSTATSD_HOST:-localhost}
  DD_PORT=${BUILDKITE_PLUGIN_DATADOG_STATS_DOGSTATSD_PORT:-8125}

  echo -n "${metric_name}:${metric_value}|${metric_type}|#${tags}"
  echo -n "${metric_name}:${metric_value}|${metric_type}|#${tags}" | nc -u -w1 $DD_HOST $DD_PORT
}