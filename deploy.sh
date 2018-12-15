#!/bin/sh

# clear the temp pubic directory
rm -rf public

hugo    # build the site. built site will be stored in public folder
aws s3 sync ./public s3://blockweavers.com --acl public-read --profile=personal   # deploy site to s3
aws cloudfront create-invalidation --distribution-id=E1TH03XX52FPP --paths=/* --profile=personal
