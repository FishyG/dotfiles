awk '1;/\[[0-9]+A/{system("sleep .05")}' ~/.ducky/duck_render

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec sway
fi

