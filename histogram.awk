{
        array[$1]+=1
}
END {
        for (j=0;j<10;j++){
                sum=0
                for (i=0;i<10;i++)
                        sum+=array[j*10+i]
                if (j==0)
                        printf "  0 -  9: %3d ",sum
                else
                        printf "%2d0 -%2d9: %3d ",j,j,sum
                for (i=0;i<sum;i++)
                        printf "*"
                printf "\n"
        }
        printf "100:%9d ",array[100]
        for (i=0;i<array[100];i++)
                printf "*"
        printf "\n"
}
