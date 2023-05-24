# VLC Batch Convert Command
Powershell command line for batch converting file using VLC
By default, the script converts all ***.mts** files to ***.mp4** under currect directory and sub-directories.

## Run in Powershell
```
cd to the media dir
\path to\convert.ps1

```

## Change source file format
Modify source file format in line 1 as needed. Defaut is *.mts. It can be any format VideoLan supports.
```
foreach($inputFile in get-childitem -recurse -Filter *.mts)
```

## If target file exists
The script can be re-run safely, it skips converted files.

## If interrupt the script during execution
By Ctrl-C or bad file, delete the unfinished output file (if file is still in use, use PowerToy to investigate), then re-run the script again.
