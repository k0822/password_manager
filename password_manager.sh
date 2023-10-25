#!/bin/bash

add_password(){
	read -p "サービス名を入力してください：" service
	read -p "ユーザー名を入力してください：" username
	read -p "パスワードを入力してください：" password
	echo "$service:$username:$password" >> passwords.txt
	echo パスワードの追加は成功しました。
}

get_password(){
	read -p "サービス名を入力してください：" target_service
	password_info=$(grep "$target_service:" passwords.txt)
	service=$(echo "$password_info" | cut -d ":" -f 1)
	username=$(echo "$password_info" | cut -d ":" -f 2)
	password=$(echo "$password_info" | cut -d ":" -f 3)
	echo "サイト名:$service"
	echo "ユーザー名:$username"
	echo "パスワード:$password"
}

while true; do
	read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" action
	
	case "$action" in
		"Add Password") add_password;;
		"Get Password") get_password;;
		"Exit") echo Thank you!
		      exit 0;;
		*) echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	esac
done
