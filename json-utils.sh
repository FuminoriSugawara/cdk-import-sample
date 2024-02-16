function get_json_value() {
  local json_file=$1
  local key=$2

  if [ ! -f $json_file ]; then
    echo "JSON file not found: $json_file"
    return 1
  fi

  # Check if jq is installed
  if [ -z $(which jq) ]; then
    echo "jq is not installed"
    exit 1
  fi

  local value=$(cat $json_file | jq -r $key)

  if [ -z $value ]; then
    echo "Key not found in JSON file: $key"
    return 1
  fi

  echo $value
}