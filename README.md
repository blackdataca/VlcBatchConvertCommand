# VLC Batch Convert Command
Powershell command line for batch converting file using VLC
By default, the script converts all *.mts files to *.mp4 under currect directory recursively

## Run in Powershell
```
cd to the media dir
\path to\convert.ps1

```

## Change source file format
Modify source file format in line 1. Defaut is *.mts
```
foreach($inputFile in get-childitem -recurse -Filter *.mts)
```

## If target file exists
The script can be re-run safely, it skips converted files.
