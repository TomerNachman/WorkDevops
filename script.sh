#!/bin/bash

while true; do
    # בקש מהמשתמש להזין מחרוזת לבדיקה
    input=$(zenity --entry --title="בדיקת פלינדרום" --text="הזן מחרוזת לבדיקה (או -1 לסיום):")

    # בדוק אם המשתמש הכניס -1 או לחץ ביטול
    if [ "$input" = "-1" ] || [ -z "$input" ]; then
        zenity --info --title="סיום" --text="הסקריפט הסתיים."
        exit 0
    fi

    # הסר רווחים ולבבות מהמחרוזת המקורית והפוך אותה
    cleaned_input=$(echo "$input" | tr -d '[:space:]')
    reversed_input=$(echo "$cleaned_input" | rev)

    # בדוק אם המחרוזת ההפוכה שווה למחרוזת המקורית
    if [ "$cleaned_input" = "$reversed_input" ]; then
        zenity --info --title="תוצאה" --text="כן, זה פלינדרום"
    else
        zenity --info --title="תוצאה" --text="לא, זה לא פלינדרום"
    fi
done

fi
