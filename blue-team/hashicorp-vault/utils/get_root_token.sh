#!/bin/bash

grep 'Initial Root Token:' vault_init.txt | awk '{print $NF}'admin-policy.hcl