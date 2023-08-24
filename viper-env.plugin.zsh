function activate_env_execution() {  
  local virtualenv_directory=$1
  local d=$2
  local full_virtualenv_directory=$d/$virtualenv_directory

  source $full_virtualenv_directory/bin/activate
}

function get_env_path(){
  echo "$(basename "$1")/$2"
}

function get_envs(){
  local output="$(ls (.*|*)/bin/pip(.x))" &> /dev/null
  local candidate_envs_found
  if [ $? -eq 0 ]; then
    candidate_envs_found=($output)
  else
    candidate_envs_found=()
  fi
  envs_found=()
  for env in "${candidate_envs_found[@]}"
  do
    local env_name="$(dirname $env)"
    ls $env_name/activate &> /dev/null
    if [ $? -eq 0 ]; then
      envs_found+=("$(dirname $env_name)")
    fi
  done
}

function activate_env(){
  local current_dir=$1
  get_envs
  if [ ${#envs_found[@]} -gt 0 ]; then
    # Use first found only!
    local env_name="${envs_found[1]}"
    activate_env_execution $env_name $current_dir
  fi  
}

function automatically_activate_python_env() {
  local current_dir="$PWD"
  local env_var="$VIRTUAL_ENV"
  if [[ -z $env_var ]] ; then
    activate_env $current_dir
  else
    parentdir="$(dirname $env_var)"
    if [[ $current_dir/ != $parentdir/* ]] ; then
      deactivate
      activate_env $current_dir
    fi
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd automatically_activate_python_env
