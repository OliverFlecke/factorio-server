#!/usr/bin/env python

import requests
import re
import os

url = 'https://www.factorio.com/download/archive/'
response = requests.get(url)

pattern = '/download/archive/(?P<version>\d+\.\d+\.\d+)'
versions = re.findall(pattern, response.text)

stable = versions[0]
print(f'{stable}')
