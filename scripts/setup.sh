#!/usr/bin/env bash

# Install dependencies.
pipenv --python 3.6 && pipenv install --dev

# Setup jupyter notebook extensions.
pipenv run 'jupyter contrib nbextension install --sys-prefix'

declare -a nbextension_list=(
    "spellchecker/main"
    "latex_envs/latex_envs"
    "hide_input/main"
    "livemdpreview/livemdpreview"
)
for nbext in "${nbextension_list[@]}"
do
   pipenv run "jupyter nbextension enable --sys-prefix $nbext"
done