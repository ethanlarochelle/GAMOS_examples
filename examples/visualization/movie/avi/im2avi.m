%% Converts a list of image files in a directory into a .avi file.

function im2avi(filename,fmt,xres,yres,quality,fps)   
aviobj=VideoWriter(filename);
aviobj.FrameRate=fps;
aviobj.Quality=quality;
open(aviobj)
list=dir(['*.' fmt]);
for i=1:length(list)
    im=imread(list(i).name);
    im=imresize(im,[yres xres],'bicubic');
    frame=im2frame(im);
    writeVideo(aviobj,frame);
    disp(['frame ' num2str(i) ' of ' num2str(length(list)) ' complete']); 
end
close(aviobj)
disp('avi finished');
end