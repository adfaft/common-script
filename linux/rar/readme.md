# RAR

- `sudo apt install rar unrar` install rar and unrar
- `unrar x filename.rar` or `unrar x filename.part1.rar` extract rar in current directory and automatically detect multipart
- `rar a -r -rr10p [dest.rar] [...files to be added]`  , create new rar
- `rar u [file.rar] [...files to be added]` , update rar with new file
- `rar d [file.rar] [...files to be deleted]` , delete rar from files

- Rar all directory in current directory
```sh
# install rar first `sudo apt install rar`

for dir in */
do
  base=$(basename "$dir")
  rar a -r -rr10p "${base}.rar" "$dir"
done
```
