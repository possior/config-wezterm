if
  [[ ! -d ${HOME}/.config/wezterm ]]
then
  mkdir -p ${HOME}/.config/wezterm
  echo ".. created configuration directory"
fi

if
  [[ -f ${HOME}/.config/wezterm/wezterm.lua ]]
then
  echo "?? detected wezterm.lua at the configuration directory"
  read -rp ":: overwriting wezterm.lua? [Y/n]" decision
fi

if
  [[ "${decision}" =~ [Yy] || -z "${decision}" ]]
then
  echo ".. accepted your input"
  curl -so ${HOME}/.config/wezterm/wezterm.lua https://raw.githubusercontent.com/possior/config-wezterm/default/src/wezterm.lua
  echo ".. downloaded wezterm.lua"
elif
  [[ "${decision}" =~ [Nn] ]]
then
  echo ".. accepted your input"
else
  echo "!! detected an invalid input -- terminated the process"
  exit
fi
