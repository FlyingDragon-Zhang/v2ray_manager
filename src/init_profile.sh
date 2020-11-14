profile_path="${base_dir}.profile.cfg"

create_template_profile() {
  {
    echo "#重要的事情说三遍! 千万不要修改或者删除这个文件! 我都隐藏了你还能找到!" #1s
    echo "#重要的事情说三遍! 千万不要修改或者删除这个文件! 我都隐藏了你还能找到!" #2s
    echo "#重要的事情说三遍! 千万不要修改或者删除这个文件! 我都隐藏了你还能找到!" #3s
    echo ""                                                                                                       #4s
    echo "#传输协议"                                                                                          #5s
    echo "v2ray_transport=1"                                                                                      #6s
    echo "#端口号"
    echo "v2ray_port=443" #7s
  } >>"${profile_path}"
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
