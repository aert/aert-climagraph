import os
from setuptools import setup, find_packages

from version import get_git_version

here = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(here, 'README.rst')) as f:
    README = f.read()
#with open(os.path.join(here, 'CHANGES.rst')) as f:
#    CHANGES = f.read()
CHANGES = ""


def gen_data_files(*dirs):
    results = []

    for src_dir in dirs:
        for root, dirs, files in os.walk(src_dir):
            results.append((root, map(lambda f: root + "/" + f, files)))
    return results


requires_base = [
    'Django==1.6.1',
    #'django-braces==1.2.2',
    #'django-model-utils==1.5.0',
    'South==0.8.4',
    'gunicorn==18.0',
    'PyYAML==3.10',
    'raven==3.5.2',
    'logan==0.5.9.1',
]

requires_dev = [
    'bpython==0.12',
    'django-debug-toolbar==1.0',
    # Build tools
    'pip==1.4.1',
    'wheel==0.22.0',
    'pip-tools==0.3.4',
    'flake8==2.1.0',
    # Deploy tools
    'ansible==1.4',
]

extras_requires = {
    'base': requires_base,
    'testing': ['nose>=1.3.0', 'coverage>=3.7'] + requires_dev,
    'docs': ['sphinx'],
}

setup(name='weather',
      version=get_git_version(),
      description='The goal of this project is to '
                  'provide a tool for rainfall data plotting.',
      long_description=README + '\n\n' + CHANGES,
      classifiers=[
          "Programming Language :: Python",
      ],
      author='aert',
      author_email='dev.aert@gmail.com',
      url='https://github.com/aert/aert-weather',
      keywords='weather plot rainfall data',
      packages=find_packages(exclude=['tests']),
      data_files=gen_data_files('weather/etc'),
      include_package_data=True,
      zip_safe=False,
      test_suite='tests',
      install_requires=extras_requires['base'],
      tests_require=extras_requires['testing'],
      extras_require=extras_requires,
      #entry_points={
      #    '[console_scripts]': [
      #        'aert.weather = weather.core.runner:main',
      #    ],
      #},
      )
