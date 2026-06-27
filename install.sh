if
  [[ ! -d ${HOME}/.config/wezterm ]]
then
  mkdir -p ${HOME}/.config/wezterm
  echo ".. created config directory"
fi

while
  [[ -f ${HOME}/.config/wezterm/wezterm.lua ]]
do
  read -rp ":: overwriting wezterm.lua? [Y/n] " decision
  if
    [[ -z "${decision}" ]]
  then
    decision="Y"
    break
  elif
    [[ "${decision}" =~ ^[NYny]$ ]]
  then
    break
  else
    echo "!! detected invalid input -- try again"
  fi
done

case "${decision}" in
  "Y" | "y")
    curl -o ${HOME}/.config/wezterm/wezterm.lua https://raw.githubusercontent.com/possior/config-wezterm/default/src/wezterm.lua
    echo ".. downloaded config file"
    ;;
  *)
    ;;
esac
