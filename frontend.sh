USERID=$(id -u)
mkdir -p  /var/log/mysqlserver
LOG_FOLDER="/var/log/mysqlserver"
SCRIPT_NAME=$(echo $0 | cut -d "." "-f1")
TIME=$(date +%F-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

#check root user or not
CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then 
    echo -e "Proceed executing the script with root user acces::$R Example Sudo Scriptname.sh$N"
    exit 1
    else
    echo "Running the script with Root user access on $date"
    fi 
}

VALIDATION(){

    if [ $1 -ne 0 ]
    then
 echo -e "$R Command failure....$N $2"
 exit 1
 else
 echo -e "$G Command success....$N $3"
 fi

}

CHECK_ROOT
#install nginx
dnf install nginx

#enable the nginx
systemctl enable nginx

#start nginx
systemctl start nginx

#remove default html cod eof nginx
rm -rf /usr/share/nginx/html/*

#download the dev code
curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip

#extract the content
cd /usr/share/nginx/html

#unzip the file
unzip /tmp/frontend.zip

#copy the file
cp /home/ec2-user/shellpractice/expense.conf /etc/nginx/default.d/expense.conf

systemctl restart nginx


