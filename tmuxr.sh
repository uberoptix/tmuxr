#!/bin/bash

# Tmuxr - Tmux Session Management Tool
# Copyright (c) 2023 James Forwood (uberoptix)

while true; do
    SESSIONS=$(tmux list-sessions -F "#S" 2>/dev/null)
    MENU_OPTIONS=("NEW" "Create a new session")

    if [ -z "$SESSIONS" ]; then
        MENU_OPTIONS+=("NONE" "No sessions available")
    else
        while IFS= read -r session; do
            MENU_OPTIONS+=("$session" "Select to manage")
        done <<< "$SESSIONS"
        MENU_OPTIONS+=("CLOSE_ALL" "Exit all sessions")
    fi

    if [ -n "$PRESELECTED_SESSION" ]; then
        CHOICE="$PRESELECTED_SESSION"
        unset PRESELECTED_SESSION
    else
        CHOICE=$(whiptail --title "Tmuxer - Manage Tmux Sessions" --menu "Choose a session or create a new one" 25 80 15 \
            "${MENU_OPTIONS[@]}" \
            3>&1 1>&2 2>&3)
    fi
    
    exitstatus=$?

    if [ $exitstatus = 0 ]; then
        case $CHOICE in
            NEW)
                SESSION_NAME=$(whiptail --inputbox "Enter new session name" 10 60 3>&1 1>&2 2>&3)
                tmux new-session -d -s "$SESSION_NAME" 2>/dev/null
                if [ $? -eq 0 ]; then
                    PRESELECTED_SESSION="$SESSION_NAME"
                    whiptail --msgbox "Session created successfully" 8 45
                else
                    whiptail --msgbox "Failed to create session. Session name might already be in use or tmux server not running." 8 78
                fi
                ;;
            NONE)
                if whiptail --yesno "Do you want to create a new session?" 10 60; then
                    SESSION_NAME=$(whiptail --inputbox "Enter new session name" 10 60 3>&1 1>&2 2>&3)
                    tmux new-session -d -s "$SESSION_NAME" 2>/dev/null
                    if [ $? -eq 0 ]; then
                        PRESELECTED_SESSION="$SESSION_NAME"
                        whiptail --msgbox "Session created successfully" 8 45
                    else
                        whiptail --msgbox "Failed to create session. Session name might already be in use or tmux server not running." 8 78
                    fi
                fi
                ;;
            CLOSE_ALL)
                if whiptail --yesno "Are you sure you want to exit all sessions?" 10 60; then
                    tmux kill-server
                fi
                ;;
            *)
                if [ -z "$PRESELECTED_SESSION" ]; then
                    ACTION=$(whiptail --title "Session Actions" --menu "Choose an action for session '$CHOICE'" 15 60 4 \
                        "attach" "Attach to the session" \
                        "kill" "Kill the session" \
                        "rename" "Rename the session" \
                        3>&1 1>&2 2>&3)
                else
                    ACTION="attach"
                fi

                case $ACTION in
                    attach)
                        tmux attach-session -t "$CHOICE"
                        ;;
                    kill)
                        if whiptail --yesno "Are you sure you want to kill session '$CHOICE'?" 10 60; then
                            tmux kill-session -t "$CHOICE"
                        fi
                        ;;
                    rename)
                        NEW_NAME=$(whiptail --inputbox "Enter new session name" 10 60 3>&1 1>&2 2>&3)
                        if [ -n "$NEW_NAME" ]; then
                            tmux rename-session -t "$CHOICE" "$NEW_NAME"
                        fi
                        ;;
                esac
                PRESELECTED_SESSION="" # Reset preselected session variable
                ;;
        esac
    else
        break
    fi
done
