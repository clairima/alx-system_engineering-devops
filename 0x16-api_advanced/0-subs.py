#!/usr/bin/python3
"""
number_of_subscribers
"""

import requests


def number_of_subscribers(subreddit):
    """returns the number of subscribers"""
    if subreddit is None or type(subreddit) is not str:
        return 0
    req = requests.get('http://www.reddit.com/r/{}/about.json'.format(subreddit),
                     headers={'User-Agent': '0x16-api_advanced:project:\
v1.0.0 (by /u/clairima)'}).json()
    subdata = req.get("data", {}).get("subscribers", 0)
    return subdata