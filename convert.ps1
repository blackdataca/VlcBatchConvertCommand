foreach($inputFile in get-childitem -recurse -Filter *.mts)
{
	$outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($inputFile.FullName) + ".mp4";
	$outputFileName = [System.IO.Path]::Combine($inputFile.DirectoryName, $outputFileName);

	Write-Host $inputFile.FullName " " -NoNewline
	if ([System.IO.File]::Exists($outputFileName))
	{
		 Write-Host "skip" 
	}
	else
	{
		Write-Host "converting..." -NoNewline

		$processName = ${env:ProgramFiles} + "\VideoLAN\VLC\vlc.exe"
		
		$processArgs = "-I dummy -vvv `"$($inputFile.FullName)`" --sout=#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100,vcodec=h264}:standard{access=file,mux=mp4,dst=`"$outputFileName`"} vlc://quit"

		start-process $processName $processArgs -wait
		Write-Host "done"
	}

}
