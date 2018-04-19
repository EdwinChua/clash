#!/bin/bash
cd "$(dirname "$0")"
chmod 777 data/
php update.php
