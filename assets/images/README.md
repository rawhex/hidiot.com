# Adding images
* install imagemagick (https://www.imagemagick.org/script/download.php)
  * on MacOS, `brew install imagemagick` or `port install ImageMagick`

## Posts
* add desired image to assets/images/posts directory as <image-name>-orig.jpg
* `convert <image-name>-orig.jpg -gaussian-blur 0x4 -modulate 80 <image-name>.jpg`

Original image will remain un-edited for use in post body while the blurred copy
will be used for the masthead.

## Events
* add desired image to events/images/posts directory
* `convert <image-name>.jpg -gaussian-blur 0x4 -modulate 80 <image-name>.jpg`

Original image will be overwritten as it is primarily used for masthead.
