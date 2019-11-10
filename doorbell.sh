# Setting all variables.

sounddevice="iec958:CARD=System,DEV=0"                                                  # The address of your soundcard
medialocation="/home/doorbell/media"                                                    # The root of your media
regular="$medialocation/regular"                                                        # The root of your regular doorbell tones
seasonal="$medialocation/seasonal"                                                      # The root of your seasonal doorbell tones (with subfolder for christmass / halloween)
birthday="$medialocation/birthday"                                                      # The root of your birthday doorbell tones
nodate="No special date today..."                                                       # The default message (Actually doesn't do shit)

# only change underneath if you know what you are doing!

currentmonth="$(date +%m)"                                                              # Fetches the current month
currentday="$(date +%d)"                                                                # Fetches the current day
#currentbell="$regular/$(ls $regular | shuf -n 1)"                                      # Sets the default doorbell by shuffeling the wav files in the regular folder
currentbell="$medialocation/test/beep-beep.wav"                                         # Used for testing, Short beep sound that doesn't wake everyone in the house

if [ $currentmonth -eq 01 ]; then                                                       # Checks the month
  if [ $currentday -gt 00 -a $currentday -lt 11 ]; then                                 # Checks the day range
    currentbell="$seasonal/newyear/$(ls $seasonal/newyear | shuf -n 1)"                 # Sets the replacement doorbell
  fi

elif [ $currentmonth -eq 02 ]; then
  if [ $currentday -eq 11 ]; then
    currentbell="$seasonal/valentine/$(ls $seasonal/valentine | shuf -n 1)"
  fi

elif [ $currentmonth -eq 03 ]; then
  if [ $currentday -eq 11 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
  fi

elif [ $currentmonth -eq 05 ]; then
  if [ $currentday -eq 09 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
  fi

elif [ $currentmonth -eq 06 ]; then
  if [ $currentday -eq 29 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
  fi

elif [ $currentmonth -eq 10 ]; then
  if [ $currentday -eq 31 ]; then
    currentbell="$seasonal/halloween/$(ls $seasonal/halloween | shuf -n 1)"
  elif [ $currentday -eq 01 ]; then
    currentbell="$birthday/$(ls $birthday | shuf -n 1)"
  fi


elif [ $currentmonth -eq 12 ]; then
  if [ $currentday -gt 24 -a $currentday -lt 31 ]; then
    currentbell="$seasonal/christmas/$(ls $seasonal/christmas | shuf -n 1)"
  fi

fi

aplay --device $sounddevice $currentbell                                                # Use aplay to execute the the defined doorbells