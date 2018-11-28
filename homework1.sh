#!/bin/bash

#запускать от имени root в директории, где необходимо создать каталоги
#пакет acl должен быть в системе

#создаем пользователей и директории, задаем дефолтный пароль и его смену при первом логине
for (( i=1; i <= 5; i++ ))
do
	useradd -s /bin/bash -m -d /home/"R$i" "R$i"
	echo "R$i:password" | chpasswd
	chage -d 0 "R$i"
	if [ $i -le 4 ]
	then
		useradd -s /bin/bash -m -d /home/"A$i" "A$i"
		echo "A$i:password" | chpasswd
		chage -d 0 "A$i"
		if [ $i -le 3 ]
		then
			useradd -s /bin/bash -m -d /home/"I$i" "I$i"
			echo "I$i:password" | chpasswd
			chage -d 0 "I$i"
			mkdir "Proj$i"
		fi
	fi
done

#настройка access list для директорий
setfacl -m u:R2:rwx,u:R3:rwx,u:R5:rwx,u:A1:rwx,u:A1:rx,o:- Proj1
setfacl -dm u:R2:rwx,u:R3:rwx,u:R5:rwx,u:A1:rwx,u:A1:rx,o:- Proj1
setfacl -m u:R1:rwx,u:R5:rwx,u:A1:rwx,u:A2:rx,u:A3:rx,o:- Proj2
setfacl -dm u:R1:rwx,u:R5:rwx,u:A1:rwx,u:A2:rx,u:A3:rx,o:- Proj2
setfacl -m u:R1:rwx,u:R2:rwx,u:R4:rwx,u:A2:rwx,u:A1:rx,u:A4:rx,o:- Proj3
setfacl -dm u:R1:rwx,u:R2:rwx,u:R4:rwx,u:A2:rwx,u:A1:rx,u:A4:rx,o:- Proj3

exit
