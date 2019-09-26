#!/bin/sh

curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UU4st5ADGKgflJ6xw7IYfHSg&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyAvkpbnm9pZ7pG0IBRCHWIdGpRBEk0GVCc' > ar.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=PLARfz3-vanawckVP7FgALoIIKL3ShKKYa&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyAvkpbnm9pZ7pG0IBRCHWIdGpRBEk0GVCc' > zh.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UUNEsl3pLJyAo1W05YJCyekQ&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyDASNqtDuhLNi2bgNtow1WuET2jx5zXpMI' > sw.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UUO1Sb-zzUPe4RGOT_3NIJyQ&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyCWQXB0YRaXDdL5alLZztKbX__f34BlRXc' > ru.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UUEMsuZg5Sd9Be-UGqwEhqNA&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyAvkpbnm9pZ7pG0IBRCHWIdGpRBEk0GVCc' > pt.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=PLARfz3-vanawckVP7FgALoIIKL3ShKKYa&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyDASNqtDuhLNi2bgNtow1WuET2jx5zXpMI' > en.json
curl -L 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UUQbOt4AdDlhG8vAqkgx2Y-g&fields=items(snippet(resourceId%2FvideoId%2Cthumbnails%2Fhigh%2Furl%2Ctitle))&key=AIzaSyCWQXB0YRaXDdL5alLZztKbX__f34BlRXc' > fr.json
cd ../..
git add --all && git commit -m "--" && git push -u origin master

