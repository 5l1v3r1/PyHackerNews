#!/usr/bin/env python


import os
import sys


from setuptools import setup, find_packages
from pip.req import parse_requirements
install_reqs = parse_requirements('requirements.txt')
reqs = [str(ir.req) for ir in install_reqs]


setup(
    name='PyHackerNews',
    version='0.0.1',
    description='Hacker News, write in Python',
    author='akun',
    author_email='6awkun@gmail.com',
    url='https://github.com/akun/PyHackerNews',
    license='Apache License',
    package_dir={'pyhn': os.path.join('src', 'pyhn')},
    packages=find_packages('src'),
    install_requires=reqs,
    test_suite='nose.collector',
)
