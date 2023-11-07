#!/usr/bin/python3
"""recurse function"""
import requests


def recurse(subreddit, hot_list=[], after="", count=0):
    """Returns a list of titles."""
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {"User-Agent": "Custom User Agent"}
    params = {
        "after": after,
        "count": count,
        "limit": 100
    }
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code == 404:
        return None

    results = response.json().get("data")
    after = results.get("after")
    count += results.get("dist")
    for res in results.get("children"):
        hot_list.append(res.get("data").get("title"))

    if after is not None:
        return recurse(subreddit, hot_list, after, count)
    return hot_list
