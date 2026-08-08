function overwriter() {
  curl -fsSLo "$HOME/.config/wezterm/${1##*/}" "$1"
}

function preserver() {
  if
    [[ ! -f "$HOME/.config/wezterm/${1##*/}" ]]
  then
    curl -fsSLo "$HOME/.config/wezterm/${1##*/}" "$1"
  fi
}

echo ":: initiated the process"

while
  [[ "$#" -gt "0" ]]
do
  case "$1" in
    "-o" | "--overwrite")
      if
	[[ -z "$behavior" ]]
      then
	behavior="overwrite"
	shift 1
      else
	echo "!! detected conflicting behavior flags"
	exit
      fi
      ;;
    "-p" | "--preserve")
      if
	[[ -z "$behavior" ]]
      then
	behavior="preserve"
        shift 1
      else
	echo "!! detected conflicting behavior flags"
	exit
      fi
      ;;
  esac
done

echo ":: parsed arguments"

if
  [[ ! -d "$HOME/.config/wezterm" ]]
then
  mkdir -p "$HOME/.config/wezterm"
  echo ":: created the configuration directory"
fi

case "${behavior:-overwrite}" in
  "overwrite")
    overwriter "https://raw.githubusercontent.com/possior/config-wezterm/default/src/wezterm.lua"
    echo ":: downloaded configuration files (overwrite)"
    ;;
  "preserve")
    preserver "https://raw.githubusercontent.com/possior/config-wezterm/default/src/wezterm.lua"
    echo ":: downloaded configuration files (preserve)"
    ;;
  *)
    echo "!! failed downloadation due to unknown internal variable value"
    exit
    ;;
esac
