xinput disable  $(xinput | grep Touchpad | grep -Eo '=[0-9]+' | grep -Eo '[0-9]+')
