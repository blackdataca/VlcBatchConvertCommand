$inputFilter = "*.mts"
Write-Host "VLC Batch Convert to mp4 by BlackData 2023 To conver all files, change $inputFilter to *.*"
foreach($inputFile in get-childitem -recurse -Filter $inputFilter)
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
		
		#Uncomment to hide UI 
		#$processArgs = "-I dummy"
		
		$processArgs = $processArgs + " -vv `"$($inputFile.FullName)`" --sout=#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100,vcodec=h264}:standard{access=file,mux=mp4,dst=`"$outputFileName`"} --rc-show-pos vlc://quit"

		start-process $processName $processArgs -wait
		Write-Host "done"
	}

}
