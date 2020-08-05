# Works on the directory passed as the first and only argument. 
# Recursivly decents into subdirectories and moves files up to the root directory.
# Delets the now empty subdirectories.


echo "######################################################"
echo "######################################################"
ORIGIN=$(pwd)
cd "$1"
PARENT=$(pwd)

echo "Recursively moving files from subfolders to parent folder. "
echo "Parent Folder: $PARENT"
echo

movingFilesToParentFolder ()
{
echo "Decending into $1"
for i in "$1"/*
do
        	if test -d "$i"
        	then
                  DIRTODEL="$i"
                  movingFilesToParentFolder "$i"
                  rm -r "$DIRTODEL"
                  echo "Deleted dircetory $DIRTODEL"
                  echo
        	fi
       		if test -f "$i"
        	then
                	echo "$i is a file and gets moved to $PARENT"
                  mv "$i" "$PARENT"
        	fi
	done
}


movingFilesToParentFolder "$PARENT"
cd "$ORIGIN"
