{
        array[$1]+=1
}
END {
        for (j=0;j<10;j++){
                sum=0
                for (i=0;i<10;i++)
                        sum+=array[j*10+i]
                pr_sum = sum*100/NR;
                if (j==0)
                        printf "  0 -  9: %5.2f\% ",pr_sum
                else
                        printf "%2d0 -%2d9: %5.2f\% ",j,j,pr_sum
                for (i=0;i<pr_sum-1;i++)
                        printf "*"
                printf "\n"
        }
        printf "100:%11.2f\% ",array[100]*100/NR;
        for (i=0;i<(array[100]*100/NR)-1;i++)
                printf "*"
        printf "\n"
}