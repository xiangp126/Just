## rsync
### Example
```bash
rsync -azP /var/www/example.com root@108.175.12.239:/var/www/
rsync -azP /var/www/example.com/ root@108.175.12.239:/var/www/example.com/
                               ^
                               | care for the difference with this '/'
```

### Dry Mode
```bash
# Add '-n' at the end of command, Dry Mode
rsync -azP /var/www/example.com/ root@108.175.12.239:/var/www/example.com/ -n

       Local:  rsync [OPTION...] SRC... [DEST]

       Access via remote shell:
         Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
         Push: rsync [OPTION...] SRC... [USER@]HOST:DEST
```

### Not port 22
```bash
# rsync not at port 22
rsync -azP "-e ssh -p 23" user@server-ip:/opt/o-source/ /opt/o-source -n
```

### Before sync
```bash
# must do this before actually sync. with -n -v flag, in case of data lose.
# Did not real copy，-n -v —verbose
rsync -anv dir1/ dir2
    -r, --recursive             recurse into directories
    -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
    -n, --dry-run               perform a trial run with no changes made
```

### Local sync
Refer <https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps>

```bash
# Notice there are 2 dots in total, create 100 files consecutive
touch file{1..100}

# If not leave '/' after dir1, will put dir1 into dir2, or will send files under dir1
rsync -anv dir1/ dir2

rsync -a --progress dir1/ dir2
    --progress              show progress during transfer
```

```bash
# Remote sync
rsync -azP dir1/ user@server:~/dir2

-z, --compress              compress file data during the transfer
-P                          same as --partial —progress
    --progress              show progress during transfer
    --partial               keep partially transferred files
```

### Remote delete
```bash
# delete remote files that was not in local machine
rm dir1/file99
rsync -azP --delete dir1/ user@server:~/dir2 -n
sending incremental file list
./
deleting file99

sent 831 bytes  received 15 bytes  564.00 bytes/sec
total size is 0  speedup is 0.00 (DRY RUN)

rsync -azP --delete dir1/ user@server:~/dir2
```