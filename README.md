# kingas
simulation scripts to teach programming with the kinetic theory of gases


### Gif animation
The png output from the single simulation steps can be converted to an animated gif file by a simple call to ImageMagick's `convert`
```bash
convert *.png -delay 3 -loop 0 gas.gif
```
the `-delay` flag defines the speed of the resulting animation and `-delay 0` lets the gif loop for ever.
