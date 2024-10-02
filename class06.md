# Class 6 - File systems; Compression; Data formats; File types

## In-class

- "Act out a file system"
    - draw the filesystem tree

    ```
    ls /
    ls /bin
    ls /bin/log
    ls /home
    ls /home/demo
    ls /home/student
    ls /home/student/docs
    ls /home/student/docs/class
    ls /home/student/docs/work

    mv  /home/student/docs/resume  /home/student/docs/work
    ```

    Someone be a "process" with a "current directory" = `/home/student`.

    ```
    ls .
    ls ../
    mv docs/class/pic  ../demo/

    mkdir temp
    
    cd docs/work/
    cd ../
    mv /bin/log  ../temp/
    mv ../temp/log/err*    /bin
    mv /bin/ls  .

    cd /home/student/temp

    touch log
    touch home

    mv /home/demo/history  ./backup
    ```


- In Ubuntu

    Open a terminal
    ```
    pwd 
    ls
    cd Downloads/
    git clone https://github.com/nadeemabdulhamid/csc101-repo-fall2024.git
    mv csc101<tab>  ../Desktop
    cd ../Desktop/csc101<tab>
    ```

    View files, file types

    Compression

    ```
    ls -al class*.md
    tar cvf class.tar class*.md
    hexdump -C class.tar  | less

    man gz
    gzip class.tar
    hexdump -C class.tar  | less
    # magic bytes

    ```


## Assignment

- **File forensics [EXT]** (TBA)

- [**Pixel Art Competition**](https://cs.berry.edu/pixelcomp-2024/)



## References and Links

- https://e115.engr.ncsu.edu/file-systems/
- https://en.wikipedia.org/wiki/List_of_file_signatures

