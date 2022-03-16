#!/bin/sh

# AzureCliとmysqlのclientをインストールしてください。
# Memo: Macのhomebrewでmysqlクライアントのみインストールする(https://qiita.com/fault/items/b854d90ae6eef5aa3417)

export resource_group_name=""
export admin_password=""
export admin_user=""
export server_name=""
export my_gip=""

# リソースグループ作成
az group create \
--location japaneast \
--name ${resource_group_name}

# mysqlサーバの作成
az mysql server create \
--resource-group ${resource_group_name} \
--name ${server_name} \
--admin-password ${admin_password} \
--admin-user "${admin_user}" \
--version 5.7 \
--ssl-enforcement Disabled \
--sku-name GP_Gen5_2
# --sku-name B_Gen5_1


# グローバルIP許可
az mysql server firewall-rule create \
--resource-group ${resource_group_name} \
--server-name ${server_name} \
--name myfwrule \
--start-ip-address ${my_gip} \
--end-ip-address ${my_gip}

# 初期データ投入
mysql \
--host="${server_name}.mysql.database.azure.com" \
--user="${admin_user}@${server_name}" \
--password=${admin_password} \
< init.sql

# mysqlサーバの削除
# az mysql server delete \
# --resource-group ${resource_group_name} \
# --name ${server_name} \
# --yes

# リソースグループ削除
# az group delete \
# --name ${resource_group_name} \
# --yes
