localbin="$HOME/.local/bin"
if [ ! -d "$localbin" ]; then
   mkdir $localbin
fi
cat > $localbin/s2h <<EOF
echo -n "\$@" | od -A n -t x1 | sed 's/ /\\\x/g'|tr -d '\n';echo
EOF

cat > $localbin/h2s <<EOF
echo "\$@" | tr -d '\n' | xxd -r -p;echo
EOF

chmod +x $localbin/s2h
chmod +x $localbin/h2s
echo "Usage: \ns2h [string] \nh2s [hexadecimal]"
