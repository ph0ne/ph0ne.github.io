---
layout: post
title:  "音频kernel部分架构二"
date:   2017-04-16 01:14:54
categories: ALSA
tags: alsa linux audio
---

* content
{:toc}





![](http://i.imgur.com/7UL9cVJ.png)

## 冒泡

```js
/* buble sort  */
//冒泡排序总的时间复杂度为O(n*n)。
void bublesort(int a[],int n)
{
	int i,j,k;
    for(i = 0; i < n; i++)
    {   
    ¦   for(j = 0; j < n-i; j++)///* 值比较大的元素沉下去后，只把剩下的元素中的最大值再沉下去就可以啦 */
    ¦   {
    ¦   ¦   if(a[j] > a[j+1])///* 把值比较大的元素沉到底 */
    ¦   ¦   {   
    ¦   ¦   ¦   k = a[j];
    ¦   ¦   ¦   a[j] = a[j+1];
    ¦   ¦   ¦   a[j+1] = k;
    ¦   ¦   }   
    ¦   }   
    }   
}
```