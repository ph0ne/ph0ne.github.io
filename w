---
layout: post
title:  "各种排序算法时间复杂度和空间复杂度表"
date:   2017-06-07 01:14:54
categories: Language
tags: sort time complexity
---

* content
{:toc}

![](http://i.imgur.com/7UL9cVJ.png)




## 冒泡

```
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

应用：
```
#if 0
/* buble sort */
int main(void)
{
int i = 0, n = 5;
int str_one[5]={116,103,105,120,120};
bublesort(str_one,5); 
for(i = 0;i < n; i++)
{
¦ printf("this is test for buble sort the out is: %d\r\n",str_one[i]);
}
// printf("This is lynn test for strcpy the out is : %s\r\n",str_one); 
return 0;
}
```
---

## 快速

```
//quick sort  this is very classic,the time complexity is O(n*n);
void quick_sort(int *a, int low, int high)
{               
    int i = low, j = high;
    int temp = a[low];
    if( low >= high )
    {   
//        printf("quick_sort test low:%d,high:%d\n",low,high);
    ¦   return;
    }   
    while(i != j)  //look at the number is position
    {   
    ¦   while(i < j && a[j] >= temp)
    ¦   ¦   j--;
    ¦   a[i] = a[j];
    ¦   while(i < j && a[i] <= temp)
    ¦   ¦   i++;
    ¦   a[j] = a[i];
    }   
    a[ i ] = temp;
//    printf("quick_sort test i:%d\n",i);
    quick_sort( a, low, i - 1 );  //递归
    quick_sort( a, i + 1, high );
}
```
应用：
```
#if 0
/* quick sort */
int main(void)
{
int i = 0, n = 7;
int str_one[5]={116,103,105,120,120};
int str_two[7]={4,5,1,2,3,5,2};
quick_sort(str_two,0,6); 
for(i = 0;i < n; i++)
{
¦ printf("this is test for buble sort the out is: %d\r\n",str_two[i]);
}
// printf("This is lynn test for strcpy the out is : %s\r\n",str_one); 
return 0;
}
#endif
```
---
 
## 选择
(找到该轮查询的最小元素是哪一个，然后把最小给查询的起始)
```
//straight select sort,select the smallest one in front,the time complexity is O(n*n);
void SelectSort(int R[], int n)
{
    int i, j, m;
//    int t;
    int p;
    for(i=0; i<n-1; i++)
    {
    ¦   m = i;
    ¦   for(j = i+1; j < n; j++)
    ¦   {
    ¦   ¦   if(R[j] < R[m])
    ¦   ¦   ¦   m = j;
    ¦   }//R[m] which is the smallest 
    ¦   if(m != i)//put to the R[i],R[i] is beginning of each round;
    ¦   {
    ¦   ¦   int t = R[i];
    ¦   ¦   R[i] = R[m];
    ¦   ¦   R[m] = t;
    ¦   }
    ¦   for(p = 0;p < n; p++)
    ¦   {
    ¦   ¦   printf("%d,",R[p]);
    ¦   }
    ¦   printf("\n");
    }
}
```
应用
```
#if 1
/* straight select sort */
int main(void)
{
int i = 0, n = 7;
int str_one[5]={116,103,105,120,120};
int str_two[7]={4,5,1,2,3,5,2};
SelectSort(str_two,7); 
for(i = 0;i < n; i++)
{
¦ printf("this is test for buble sort the out is: %d\r\n",str_two[i]);
}
// printf("This is lynn test for strcpy the out is : %s\r\n",str_one); 
return 0;
}
#endif
```
---
 
## 插入
（从前往后有不按顺序来的元素就把它放到对应位置）
```
//insert sort,the time complexity is O(n*n) or the optimal is O(n);
void Insertsort(int a[], int n)  
{  
    int i, j, k, p;  
    for (i = 1; i < n; i++)  
    { 
    ¦   //1,为a[i]在前面的a[0...i-1]找到第一个比前面小的数 
    ¦   for (j = i - 1; j >= 0; j--) //j == -1 is ok 
    ¦   ¦   if (a[j] < a[i]) //if ture please let i add 
    ¦   ¦   ¦   break;  
    ¦  
    ¦   //2,如找到了一个合适的位置 
    ¦   if (j != i - 1)  
    ¦   {  
    ¦   ¦   int temp = a[i]; 
    ¦   ¦   //将比a[i]大的数据向后移 
    ¦   ¦   for (k = i - 1; k > j; k--)  a[k + 1] = a[k]; 
    ¦   ¦   //3,将a[i]放到正确位置上
    ¦   ¦   a[k + 1] = temp;  
    ¦   }

    ¦   for(p = 0;p < n; p++)
    ¦   {
    ¦   ¦   printf("%d,",a[p]);
    ¦   }
    ¦   printf("\n");
    } 

}
```
应用
```
#if 0
/* straight select sort */
int main(void)
{
int i = 0, n = 7;
int str_one[5]={116,103,105,120,120};
int str_two[7]={4,5,1,2,3,5,2};
Insertsort(str_two,7); 
for(i = 0;i < n; i++)
{
¦ printf("this is test for buble sort the out is: %d\r\n",str_two[i]);
}

// printf("This is lynn test for strcpy the out is : %s\r\n",str_one); 
return 0;
}
#endif
```
---
 

**冒泡：每次找出最大值放后面，找n次，每个数对比n-i次；**
**快速：比他大的放右边，比他小的放左边，i=j来，等temp，左边再排，右边再排；**
**选择：找到剩下中最小的，把这个数放到前面；**
**插入：找到第一个比前面小的数，前面的数整体后移，该数放到对应位置；**


**copy from ： CPJ**
