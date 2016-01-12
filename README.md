# bookRipper

bookRipper is a processing 3 script used to automatically convert ebooks page by page into images. 

This software is intended to be used in a LEGAL fashion. Only copy sources your have a right to copy.

To Start

1. Open your ebook in your preferred ebook reading software. 
2. Determine the page you'd like to start copying from and change "currentNumber" to reflect that page number. 
3. Determine how many pages you would like to copy from the "currentNumber" page and change "totalPages" to reflect that number. 
4. Change "outFile" to a destination you would like all of the images to go to. (ex. "Documents/BookTitle/page-") The final image file will be "outFile" + "currentNumber" + "." + "outType". 
5. Run the sketch and follow the printed instructions. 
  -- Hover over the top left corner, click t. 
  -- Hover over the bottom right corner, click b.
  -- Hover over the 'next page' button, click n.
  -- If you are satisfied with these coordinates, click r then s to start capturing. 

Tips: 
Run a test on a few pages, make sure that the program works. 
If you want the program to run faster or slower change the "waitTime" parameter. This is how long the program waits between image captures. If this time is too short, you may be unable to capture pages in time.
