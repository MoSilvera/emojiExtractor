#!/usr/bin/env python3

#argument handling
import sys

#for parsing json
import json

#for extracting information from url & making folder
import os

#for downloading files
import urllib.request

if len(sys.argv) != 2:
    print('Usage: %s file.json' % sys.argv[0])
    sys.exit()

with open(sys.argv[1], 'r') as fp:
    obj = json.load(fp)

folder = 'emojis'

os.mkdir(folder)

for emoji in obj['emoji']:
    name = emoji['name'] + os.path.splitext(emoji['url'])[1]
    url = emoji['url']
    print(name)
    urllib.request.urlretrieve(url, folder + '/' + name)