# thesource
A Docker Container Project for Secure Downloads. 

Build: 
cd thesource
sudo docker build -t thesource .

Run:
#sudo docker run -it --restart=unless-stopped --privileged=true -v {LOCAL_DIR}:{CONTAINER_DIR} --name thesource thesource

Attach: 
#sudo docker attach -it thesource

Remove:
#sudo docker rm -f thesource