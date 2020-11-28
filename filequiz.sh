#!/bin/bash

gnome-terminal --tab
quiz_file=quiz.txt
score=0

if [ ! -f $quiz_file ]
then
    echo "Quiz file doesnt exist!"
    exit 1
fi
clear 
tput clear
tput bold
tput cup 9 18
echo "           OPERATING SYSTEM PROJECT"
tput cup 10 18
echo "PROJECT MADE BY:-"
tput cup 11 18
echo "    NAME                          ROLLNO  "
tput cup 12 18
echo "SUBRATA NANDY                       73"
tput cup 13 18
echo "SAGAR KUMAR JHA                     74"
tput cup 14 18
read -p "        PRESS ENTER TO CONTINUE" enter_var
clear
tput clear
tput bold
tput cup 10 28
read -p "Enter Your name:" name_var

clear
tput clear
tput bold
tput cup 5 28
echo "RULES AND REGULATIONS"
echo "--------------------------------------------------------------------------------"
echo "YOU SHOULD GIVE THE ANSWES IN CAPITAL LETTER"
echo "YOU HAVE 4 OPTIONS CHOOSE FROM THEM ONLY"
echo "THE OPTIONS ARE A, B, C, & D"
echo "YOU HAVE TO CHOOSE CORRECTLY"
echo "IF YOU PRESS ANY INCCORECT OPTIONS THEN IT WILL BE TREATED AS INCORRECT"
echo "LETS START OUR GAME!!!!!!!!!!!!"
tput cup 15 25
read -p "Press Enter to Start" enter_var
clear
# game loop
while read -u9 line
do
   
    question=`echo $line | cut -f1 -d' '`
    choice1=`echo $line | cut -f2 -d' '`
    choice2=`echo $line | cut -f3 -d' '`
    choice3=`echo $line | cut -f4 -d' '`
    choice4=`echo $line | cut -f5 -d' '`
    solution=`echo $line | cut -f6 -d' '`

    
    echo "$question?"
    echo "$choice1"
    echo "$choice2"
    echo "$choice3"
    echo "$choice4"

   
    read -p "- Your response: " player_choice

    
    if [ "$player_choice" == "$solution" ]
    then
        score=$(( ++score ))
        echo "correct answer"
    else
        echo "wrong answer. correct answer is $solution"
    fi

    echo
done 9< $quiz_file

echo "$name_var Your score is $score/`wc -l $quiz_file`"

