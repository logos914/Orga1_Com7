#!/bin/bash

echo "📥 Upgrade marp-cli (if needed)"
yarn global upgrade --silent @marp-team/marp-cli

echo 👀 marp version: $(marp --version)
