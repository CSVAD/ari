## What is are the goals of your library? (What is it intended to help people do and why?)
The goal of this library is to help people create oscillating patterns. People can use this to create different textures, but also include an animation effect. Maybe someone who is using MaxMSP could send their amplitude and period information to this library and it would be easy for them to see their sound visually.  

## What approaches do you provide for people to accomplish those goals (i.e. what are the methods you expose to the person using the library)?

I started with assignment to create a repeating wallpaper and thought that someone would possibly want to create something similar, but not know how to create the same effect. I just allow the person to enter the height, width, amplitude, period, and size. I also allow them to add changes in the amplitude, period, and size to adjust the look as the pattern continues.

## What key terminology did you use for your library (i.e. function, class, and property names). How did you select this terminology?

The key terminology I used where drawWaves and setPattern. I think these words help identify where the user might call these functions. setPattern I would hope would lead the user to put in the setUp and drawWaves I hope would lead the user to use in the draw function. Animate I thought a user would be able to understand there will be some effect to how the waves will be displayed. The property names are exactly what you think they would mean. I decided not to use any abbreviations because the names were not that long and will be more easily understood. 