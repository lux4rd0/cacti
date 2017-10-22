# Volume 1

application_start=`date +%s`       
application=`du -sxL /volume1/application | awk '{print $1;}'`
application_end=`date +%s`
application_duration=$((application_end-application_start))
echo "dirsize:${application} duration:${application_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_application.log

attic_start=`date +%s`       
attic=`du -sxL /volume1/attic | awk '{print $1;}'`
attic_end=`date +%s`
attic_duration=$((attic_end-attic_start))
echo "dirsize:${attic} duration:${attic_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_attic.log

audio_start=`date +%s`       
audio=`du -sxL /volume1/audio | awk '{print $1;}'`
audio_end=`date +%s`
audio_duration=$((audio_end-audio_start))
echo "dirsize:${audio} duration:${audio_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_audio.log

hyperbackup_start=`date +%s`       
hyperbackup=`du -sxL /volume1/hyperbackup | awk '{print $1;}'`
hyperbackup_end=`date +%s`
hyperbackup_duration=$((hyperbackup_end-hyperbackup_start))
echo "dirsize:${hyperbackup} duration:${hyperbackup_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_hyperbackup.log

homes_start=`date +%s`       
homes=`du -sxL /volume1/homes | awk '{print $1;}'`
homes_end=`date +%s`
homes_duration=$((homes_end-homes_start))
echo "dirsize:${homes} duration:${homes_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_homes.log

images_start=`date +%s`       
images=`du -sxL /volume1/images | awk '{print $1;}'`
images_end=`date +%s`
images_duration=$((images_end-images_start))
echo "dirsize:${images} duration:${images_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_images.log

music_start=`date +%s`       
music=`du -sxL /volume1/music | awk '{print $1;}'`
music_end=`date +%s`
music_duration=$((music_end-music_start))
echo "dirsize:${music} duration:${music_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_music.log

photo_start=`date +%s`       
photo=`du -sxL /volume1/photo | awk '{print $1;}'`
photo_end=`date +%s`
photo_duration=$((photo_end-photo_start))
echo "dirsize:${photo} duration:${photo_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_photo.log

storage_start=`date +%s`       
storage=`du -sxL /volume1/storage | awk '{print $1;}'`
storage_end=`date +%s`
storage_duration=$((storage_end-storage_start))
echo "dirsize:${storage} duration:${storage_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_storage.log
   
vm_start=`date +%s`       
vm=`du -sxL /volume1/vm | awk '{print $1;}'`
vm_end=`date +%s`
vm_duration=$((vm_end-vm_start))
echo "dirsize:${vm} duration:${vm_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_vm.log

web_start=`date +%s`       
web=`du -sxL /volume1/web | awk '{print $1;}'`
web_end=`date +%s`
web_duration=$((web_end-web_start))
echo "dirsize:${web} duration:${web_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_web.log
   
work_start=`date +%s`       
work=`du -sxL /volume1/work | awk '{print $1;}'`
work_end=`date +%s`
work_duration=$((work_end-work_start))
echo "dirsize:${work} duration:${work_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_work.log

iso_start=`date +%s`       
iso=`du -sxL /volume1/iso | awk '{print $1;}'`
iso_end=`date +%s`
iso_duration=$((iso_end-iso_start))
echo "dirsize:${iso} duration:${iso_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_iso.log

   
             
# Volume 3

nbd_start=`date +%s`       
nbd=`du -sxL /volume1/nbd | awk '{print $1;}'`
nbd_end=`date +%s`
nbd_duration=$((nbd_end-nbd_start))
echo "dirsize:${nbd} duration:${nbd_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_nbd.log

tm_start=`date +%s`       
tm=`du -sxL /volume1/tm | awk '{print $1;}'`
tm_end=`date +%s`
tm_duration=$((tm_end-tm_start))
echo "dirsize:${tm} duration:${tm_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_tm.log

vmtemplate_start=`date +%s`       
vmtemplate=`du -sxL /volume1/vmtemplate | awk '{print $1;}'`
vmtemplate_end=`date +%s`
vmtemplate_duration=$((vmtemplate_end-vmtemplate_start))
echo "dirsize:${vmtemplate} duration:${vmtemplate_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_vmtemplate.log

www_start=`date +%s`       
www=`du -sxL /volume1/www | awk '{print $1;}'`
www_end=`date +%s`
www_duration=$((www_end-www_start))
echo "dirsize:${www} duration:${www_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_www.log

googledrive_start=`date +%s`       
googledrive=`du -sxL /volume1/googledrive | awk '{print $1;}'`
googledrive_end=`date +%s`
googledrive_duration=$((googledrive_end-googledrive_start))
echo "dirsize:${googledrive} duration:${googledrive_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_googledrive.log

media_start=`date +%s`       
media=`du -sxL /volume1/media | awk '{print $1;}'`
media_end=`date +%s`
media_duration=$((media_end-media_start))
echo "dirsize:${media} duration:${media_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_media.log

video_start=`date +%s`       
video=`du -sxL /volume1/video | awk '{print $1;}'`
video_end=`date +%s`
video_duration=$((video_end-video_start))
echo "dirsize:${video} duration:${video_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_video.log

vmbackup_start=`date +%s`       
vmbackup=`du -sxL /volume1/vmbackup | awk '{print $1;}'`
vmbackup_end=`date +%s`
vmbackup_duration=$((vmbackup_end-vmbackup_start))
echo "dirsize:${vmbackup} duration:${vmbackup_duration}" > /volume1/attic/logs/metrics/boulphstation_dirsize_vmbackup.log
