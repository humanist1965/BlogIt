#!/bin/bash

echo "HM65 Blogit"
GIT_SSH_COMMAND="ssh -i ~/SSH/tribes/tribes" git add . && git commit -m "update"
GIT_SSH_COMMAND="ssh -i ~/SSH/tribes/tribes" git push
