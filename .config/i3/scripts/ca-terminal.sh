#!/bin/sh

i3-msg "workspace 4; append_layout ~/.config/i3/layouts/ca-terminal.json"

gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-web" "npm run watch"
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-web" ""
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-api" "lein with-profile dev run \"8300\""
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-api" ""
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-datomic" "~/bin/datomic-cli/datomic client access --region ap-southeast-2 --profile contracta contract-a-datomic"
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-datomic/script" "sh ./keep-alive.sh"
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-auth" "lein run \"8400\""
gnome-terminal -- ~/.config/i3/scripts/with-prompt.sh "~/git/contracta-legal/ca-infrastructure/ca-app" ""
