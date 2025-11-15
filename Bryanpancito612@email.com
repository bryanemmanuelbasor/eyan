.animated-container-laju{max-width:100%;width:100%;text-align:center;padding:30px;background:linear-gradient(45deg,#4caf50,#2e7d32,#1b5e20);border:5px solid gold;color:#fff;font-family:Arial,sans-serif;animation:pulseGlow 2s infinite alternate;border-radius:15px}.laju-title{font-size:40px;font-weight:700;text-shadow:2px 2px 10px rgba(255,215,0,.8);animation:bounce 1.5s infinite alternate}.laju-message{font-size:22px;margin-top:10px;opacity:0;animation:fadeIn 1.5s forwards .5s}.laju-btn{display:inline-block;margin-top:20px;padding:12px 25px;background:gold;color:#000;font-size:18px;font-weight:700;text-decoration:none;border-radius:8px;border:3px solid #fff;box-shadow:0 0 15px rgba(255,215,0,.8);animation:jerkShake 1.5s infinite;transition:all .3s}.laju-btn:hover{transform:scale(1.1);background:orange}@keyframes pulseGlow{from{box-shadow:0 0 15px rgba(255,215,0,.5)}to{box-shadow:0 0 25px rgba(255,215,0,1)}}@keyframes bounce{from{transform:translateY(0)}to{transform:translateY(-10px)}}@keyframes fadeIn{from{opacity:0}to{opacity:1}}@keyframes jerkShake{0%,100%{transform:rotate(0)}25%{transform:rotate(-3deg)}50%{transform:rotate(3deg)}75%{transform:rotate(-3deg)}}✅ Pendaftaran Berjaya!Akaun anda kini aktif. Sertai permainan dan menangi hadiah besar!Mula Bermain 🎰# Minimal settings to update dependencies stored in one private registry

version: 2
registries:
  dockerhub: # Define access for a private registry
    type: docker-registry
    url: registry.hub.docker.com
    username: octocat
    password: ${{secrets.DOCKERHUB_PASSWORD}}
updates:
  - package-ecosystem: "docker"
    directory: "/docker-registry/dockerhub"
    registries:
      - dockerhub # Allow version updates for dependencies in this registry
    schedule:
      interval: "monthly"
