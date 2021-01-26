for f in ./{.,}*; do
	case $f in
		[.][/][.])
			;;
		[.][/][.][.])
			;;
		[.][/][n][o][d][e][_][m][o][d][u][l][e][s])
			;;
		*)
			echo "$f"
			mv "$f" /root/kickstart/
			;;
	esac
done