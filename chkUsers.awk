#!/usr/bin/awk -f

BEGIN {
    FS=":";
    x=1;
    printf "\033[1m\n%28s\n\033[0m", "**Processing /etc/passwd**";
    system("printf \"%45s\n\" \" \" | tr ' ' '-'");
}

{  
    if ($NF ~ /bash/) {
        i=1;
        while( i<= NF ) {
            if (i == 1) {
                printf "\033[1m%-8s\033[0m\033[31m%-6s\033[0m\n", "User Name: ", $1;
            } else if (i == 3) {
                printf "%-5s%-3d\n", "User ID: ", $3;
            } else if (i == 6) {
                printf "%-8s%-7s\n", "Home Directory: ", $6;
            } else if (i == NF) {
                printf "%-8s%-7s\n", "Default Shell: ", $7;
                system("printf \"%45s\n\" \" \" | tr ' ' '-'");
            }
        i++;
        }
        users[x++]=$1;
    }
}

END {
    system("sleep 0.3");
    printf "\033[1m***Number of users who can login: %d\n", length(users);
    system("sleep 0.3");
    printf "*****List of users with login capabilities: ";

    for (i=1;i <= length(users); i++) {
        if (i == length(users)) {
            printf "%s",users[i];
        } else {
           printf "%s, ",users[i];
        }
    }
    printf "\033[0m\n\n";
}