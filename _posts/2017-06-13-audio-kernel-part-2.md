---
layout: post
title:  "音频kernel部分架构二"
date:   2017-04-16 01:14:54
categories: ALSA
tags: alsa linux audio
---

* content
{:toc}

# 一：alsa kernel部分主要提供两个东西 #

> 01:controlc* 一般只有controlc0
> 
> 02:pcmc*d*p/c  23个cpm，c*  card;d* device;p/c p：play back（播放）c：capture（录音）；





```
xxx:/ # cd dev/snd/
xxx:/dev/snd # ls -l
total 0
crw-rw---- 1 system audio  14,  12 2016-12-04 01:03 adsp
crw-rw---- 1 system audio  14,   4 2016-12-04 01:03 audio
crw-rw---- 1 system audio 116,  36 2016-12-04 01:03 comprC0D23
crw-rw---- 1 system audio 116,   2 2016-12-04 01:03 controlC0
crw-rw---- 1 system audio  14,   3 2016-12-04 01:03 dsp
crw-rw---- 1 system audio  14,   0 2016-12-04 01:03 mixer
crw-rw---- 1 system audio 116,   3 2016-12-04 01:03 pcmC0D0p
crw-rw---- 1 system audio 116,  19 2016-12-04 01:03 pcmC0D10p
crw-rw---- 1 system audio 116,  20 2016-12-04 01:03 pcmC0D11p
crw-rw---- 1 system audio 116,  21 2016-12-04 01:03 pcmC0D12c
crw-rw---- 1 system audio 116,  22 2016-12-04 01:03 pcmC0D13c
crw-rw---- 1 system audio 116,  23 2016-12-04 01:03 pcmC0D14p
crw-rw---- 1 system audio 116,  24 2016-12-04 01:03 pcmC0D15c
crw-rw---- 1 system audio 116,  25 2016-12-04 01:03 pcmC0D16c
crw-rw---- 1 system audio 116,  27 2016-12-04 01:03 pcmC0D17c
crw-rw---- 1 system audio 116,  26 2016-12-04 01:03 pcmC0D17p
crw-rw---- 1 system audio 116,  28 2016-12-04 01:03 pcmC0D18p
crw-rw---- 1 system audio 116,  29 2016-12-04 01:03 pcmC0D19p
crw-rw---- 1 system audio 116,   4 2016-12-04 01:03 pcmC0D1c
crw-rw---- 1 system audio 116,  30 2016-12-04 01:03 pcmC0D20p
crw-rw---- 1 system audio 116,  31 2016-12-04 01:03 pcmC0D21p
crw-rw---- 1 system audio 116,  34 2016-12-04 01:03 pcmC0D22c
crw-rw---- 1 system audio 116,  35 2016-12-04 01:03 pcmC0D24p
crw-rw---- 1 system audio 116,   6 2016-12-04 01:03 pcmC0D2c
crw-rw---- 1 system audio 116,   5 2016-12-04 01:03 pcmC0D2p
crw-rw---- 1 system audio 116,   8 2016-12-04 01:03 pcmC0D3c
crw-rw---- 1 system audio 116,   7 2016-12-04 01:03 pcmC0D3p
crw-rw---- 1 system audio 116,  10 2016-12-04 01:03 pcmC0D4c
crw-rw---- 1 system audio 116,   9 2016-12-04 01:03 pcmC0D4p
crw-rw---- 1 system audio 116,  12 2016-12-04 01:03 pcmC0D5c
crw-rw---- 1 system audio 116,  11 2016-12-04 01:03 pcmC0D5p
crw-rw---- 1 system audio 116,  14 2016-12-04 01:03 pcmC0D6c
crw-rw---- 1 system audio 116,  13 2016-12-04 01:03 pcmC0D6p
crw-rw---- 1 system audio 116,  16 2016-12-04 01:03 pcmC0D7c
crw-rw---- 1 system audio 116,  15 2016-12-04 01:03 pcmC0D7p
crw-rw---- 1 system audio 116,  17 2016-12-04 01:03 pcmC0D8p
crw-rw---- 1 system audio 116,  18 2016-12-04 01:03 pcmC0D9c
crw-rw---- 1 system audio 116,   1 2016-12-04 01:03 seq
crw-rw---- 1 system audio  14,   1 2016-12-04 01:03 sequencer
crw-rw---- 1 system audio  14,   8 2016-12-04 01:03 sequencer2
crw-rw---- 1 system audio 116,  33 2016-12-04 01:03 timer
xxx:/dev/snd # 
```