base_dir='/usr/local/etc/v2ray/v2ray_manager/src/' # 资源目录


# 加载脚本
load_script() {
  local script_name=$1
  local _param=$2
  if [[ -z $script_name ]]; then
    Log 'e' '加载脚本时没有传递正确的脚本名!'
    return 1
  else
    # shellcheck source=${base_dir}${script_name}.sh
    . ${base_dir}${script_name}.sh $_param
  fi

  return 0
}

# 加载工具脚本
load_script utils          # 工具类
load_script color          # 颜色类
load_script message_helper # 消息提示
load_script enum           # 枚举声明

# 获取参数
_args=$1
_param=$2

v2ray_help() {
  local _help_menu=(
    "输入v2ray mkurl 生成vmess链接"
    "输入v2ray menu 查看功能目录"
    "输入v2ray info 查看v2ray配置信息"
  )

  show_message
  for (( i = 0; i < ${#_help_menu[*]-1}; i++ )); do
      show_message "$MessageType_Info" "${_help_menu[i]}"
  done
}

v2ray_init() {
  show_message "$MessageType_Info" "开始初始化v2ray设置 ${red_bold} 初始化过程中切勿终止 ${none} 如果需要可以重新输入v2ray init"
  show_message "$MessageType_Info" "请选择v2ray传输类型: "
  read -p "${green}请输入[${magenta}1 - ${#transport_type[*]}${green}]:"

}

v2ray_main() {

  load_script init_profile

  case $_args in
  'menu' | 'Menu' | 'MENU')
    load_script menu
    ;;
  'info' | 'Info' | 'INFO' | 'i' | 'I')
    load_script v2ray_info
    ;;
  'init' | 'INIT')
    v2ray_init
    ;;
  'help' | 'h' | '-h')
    v2ray_help
    ;;
  *)
    load_script menu
    ;;
  esac

}

v2ray_main
