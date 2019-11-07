currentmonth="$(date +%m)"
currentday="$(date +%d)"

medialocation="/home/doorbell/media"
regular="/home/doorbell/media/regular"
seasonal="/home/doorbell/media/seasonal"
birthday="/home/doorbell/media/birthday"
#currentbell="$regular/$(ls $regular | shuf -n 1)"
#currentbell="$medialocation/doorbell.wav"
currentbell="$medialocation/beep.wav"
nodate="No special date today..."
isthisaspecialdate=$nodate

if [ $currentmonth -eq 01 ]; then
  if [ $currentday -gt 00 -a $currentday -lt 11 ]; then
    currentbell="$seasonal/happynewyear.wav"
    isthisaspecialdate="Happy Newyear!"
  fi
fi

elif [ $currentmonth -eq 02 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 03 ]; then
  if [ $currentday -eq 11 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
    isthisaspecialdate="It's Jane Doe's Birthday!"
  fi
fi

elif [ $currentmonth -eq 04 ]; then
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 05 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 06 ]; then
  if [ $currentday -eq 01 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
    isthisaspecialdate="It's John Doe's Birthday!"
  fi
fi

elif [ $currentmonth -eq 07 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 08 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 09 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 10 ]; then
  if [ $currentday -eq 31 ]; then
    currentbell="$seasonal/halloween/$(ls $seasonal/halloween | shuf -n 1)"
    isthisaspecialdate="It's Halloween!"
  fi
fi

elif [ $currentday -eq 01 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 11 ]; then
#  if [ $currentday -eq 01 ]; then
#  fi
  isthisaspecialdate=$nodate
fi

elif [ $currentmonth -eq 12 ]; then
  if [ $currentday -gt 24 -a $currentday -lt 31 ]; then
    currentbell="$seasonal/christmas/$(ls $seasonal/christmas | shuf -n 1)"
    isthisaspecialdate="Ho Ho Ho, It's Christmas time!"
  fi

fi

echo $isthisaspecialdate
aplay --device iec958:CARD=System,DEV=0 $currentbell