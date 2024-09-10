# Class 2 - Git & GitHub; Ubuntu (Linux) VM, CLI

## In-class

- Fork/clone a repo and update it.

  (Use https://github.com/nadeemabdulhamid/csc101-demo-repo-fall2024 )

- Use [GitHub Desktop](https://github.com/apps/desktop).

- Linux demos
    - Replace all spaces in a filename with underscore for a given directory.

        `for file in *\ *; do mv "$file" "${file// /-}"; done`

    - Report the last ten errant accesses to the web server coming from a specific IP address

        `grep -E "4[0-9]{2}|5[0-9]{2}" /var/log/apache2/error.log | grep "149.18.87.30" | tail -n 10`

    - Count the number of lines in a file that a specific word appears on at least once. If the word occurs more than once on the same line it is only counted once.

        `grep -E -c '\<specific_word\>' file.txt`

    - Check for changes to a file, append the date and time to a log file.

    - List servers in a file and ping them one by one; in case anything is down, print a message.

- Git in linux




## Assignment


- Complete [Learning Ubuntu](https://www.linkedin.com/learning/learning-ubuntu-desktop-18015807?u=2300338) [2h 15m].

- Complete the [Linux Scavenger Hunt](https://github.com/pushingice/scavenger-hunt). Keep track of your **secret number** and the numbers of all the clues you find. You will need to submit these on Canvas to receive credit.

    Use a terminal in your Linux VM to type in the setup commands in the instructions for the scavenger hunt. You may need to install Python, in which case you should type: `sudo apt install python3` in the terminal before following the scavenger hunt instructions above; and then type `python3` instead of just `python`.

- Continue skill practice: [Typing](https://typing.com)



## References and Links

- Official GitHub stuff
    - Skills: https://skills.github.com/
    - Documentation/Getting Started: https://docs.github.com/en/get-started

- Software Carpentry tutorials
    - https://swcarpentry.github.io/shell-novice/
    - https://swcarpentry.github.io/git-novice/
    - https://swcarpentry.github.io/shell-novice/reference

- [Mozilla Science Lab workshop](https://joeyklee.github.io/friendly-github-intro/) materials

- Logs
    - https://www.crowdstrike.com/cybersecurity-101/observability/access-logs/
    - https://www.sec.gov/about/dera_edgarlogfiledataset

