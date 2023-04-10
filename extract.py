#!/usr/bin/env python

import requests
import re
import os

url = 'https://www.factorio.com/download/archive/'
response = requests.get(url)

pattern = '/download/archive/(?P<version>\d+\.\d+\.\d+)'
versions = re.findall(pattern, response.text)

ghcr_token = os.environ['GHCR_TOKEN']
headers = {'Authorization': f'Bearer {ghcr_token}'}
url = 'https://ghcr.io/v2/oliverflecke/factorio-server/tags/list'
response = requests.get(url, headers=headers)
tags = response.json()['tags']

stable = versions[0]
if stable not in tags:
    print(f'{stable}')
