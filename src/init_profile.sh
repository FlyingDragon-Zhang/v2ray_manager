profile_path="${base_dir}profile.cfg"

create_template_profile() {
  sed -i "1sI want to konw" $profile_path
}

backup_all_cfg() {
  for keys in $*; do
    case $keys in
    v2ray_transport) ;;
    esac
  done
}

init_profile_main() {
  # 看看有没有配置文件
  if [ ! -f $profile_path ]; then
    touch $profile_path
    create_template_profile
  fi
  # shellcheck source=/usr/local/etc/v2ray/v2ray_manager/src/profile.cfg
  . $profile_path
}

init_profile_main
