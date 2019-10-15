# asterisk-monitor-script
Simple script to find recorded calls, convert them to mp3 and remove old `.wav` files

## Usage
1. Ensure You are using Monitor built-in application to record your calls
```
same => n,Monitor(wav,${CALLFILENAME}.wav,bm) 
```
`bm` flags mean "Wait until both sides pick up the phone" and "Mix IN/OUT into single file"

2. Clone this repo, adjust paths as needed.
In my case, Asterisk stores wav files into `/var/lib/asterisk/monitor` directory,
we store compressed mp3's in `/var/lib/asterisk/mixed/2137-09-16/$originalfilename.mp3`

3. Add wav2mp3.sh to Your Crontab
```
# crontab -e
7 0 * * * /usr/local/bin/wav2mp3.sh
```
