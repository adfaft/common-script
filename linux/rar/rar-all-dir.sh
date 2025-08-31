# install rar first `sudo apt install rar`

for dir in */
do
  base=$(basename "$dir")
  rar a -r -rr10p "${base}.rar" "$dir"
done
