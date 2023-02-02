#Para criar usuário e ele mudar senha ao logar pela primeira vez:
1. adduser liminha
2. passwd liminha  #Devemos adicionar uma senha para que o usuario consiga logar e mudar a senha
3. passwd -e liminha  #dizemos que ao logar o usuario deve digitar a senha que foi passada para mudar ( e = expire)

#Para adicionar um usuário com permissão de sudo no Linux Red Hat, siga esses passos:
1. Digite "usermod -aG wheel username" #(substitua "username" pelo nome do usuário) para adicionar o usuário ao grupo "wheel", que é o grupo de usuários com permissão de sudo.
2. Edite o arquivo "/etc/sudoers" usando o comando "vim" e adicione a seguinte linha: "username ALL=(ALL) ALL" (substitua "username" pelo nome do usuário).

#Excluir os usuarios
userdel -r <nome_user>

groupdel -r <nome_grupo>
