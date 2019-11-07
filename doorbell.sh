# Setting all variables

sounddevice="iec958:CARD=System,DEV=0"          # The address of your soundcard
medialocation="/home/doorbell/media"            # The root of your media
regular="$medialocation/regular"
seasonal="$medialocation/seasonal"
birthday="$medialocation/birthday"
nodate="No special date today..."

# only change underneath if you know what you are doing!

currentmonth="$(date +%m)"
currentday="$(date +%d)"
#currentbell="$regular/$(ls $regular | shuf -n 1)"
currentbell="$medialocation/test/beep.wav"
isthisaspecialdate=$nodate

if [ $currentmonth -eq 01 ]; then
  if [ $currentday -gt 00 -a $currentday -lt 11 ]; then
    currentbell="$seasonal/happynewyear.wav"
    isthisaspecialdate="Happy Newyear!"
  fi

elif [ $currentmonth -eq 02 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 03 ]; then
  if [ $currentday -eq 11 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
    isthisaspecialdate="It's Jane Doe's Birthday!"
  fi

elif [ $currentmonth -eq 04 ]; then
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 05 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 06 ]; then
  if [ $currentday -eq 01 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
    isthisaspecialdate="It's John Doe's Birthday!"
  fi

elif [ $currentmonth -eq 07 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 08 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 09 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 10 ]; then
  if [ $currentday -eq 31 ]; then
    currentbell="$seasonal/halloween/$(ls $seasonal/halloween | shuf -n 1)"
    isthisaspecialdate="It's Halloween!"
  elif [ $currentday -eq 01 ]; then
  #  if [ $currentday -eq 01 ]; then
  #  fi
  isthisaspecialdate=$nodate
  fi

elif [ $currentmonth -eq 11 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate

elif [ $currentmonth -eq 12 ]; then
  if [ $currentday -gt 24 -a $currentday -lt 31 ]; then
    currentbell="$seasonal/christmas/$(ls $seasonal/christmas | shuf -n 1)"
    isthisaspecialdate="Ho Ho Ho, It's Christmas time!"
  fi

fi

echo $isthisaspecialdate
aplay --device $sounddevice $currentbell