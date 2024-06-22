# csapp datalab
    //1
    /* 
    * bitXor - x^y using only ~ and & 
    *   Example: bitXor(4, 5) = 1
    *   Legal ops: ~ &
    *   Max ops: 14
    *   Rating: 1
    *   用&和~符号，来表示异或
    */
    int bitXor(int x, int y) { 
    int a = ~x&y;
    int b = ~y&x;
    return ~(~a & ~b);
    }
![](image.png)

    /* 
    * tmin - return minimum two's complement integer 
    *   Legal ops: ! ~ & ^ | + << >>
    *   Max ops: 4
    *   Rating: 1
    *   求最小整数的补码
    *   补码的优势：
    *   1.使从负数到正数的过渡是连续的
    *   2.保证第一位都是符号位
    *   3.节约硬件资源
    */
    int tmin(void) {

    return 1 << 31;

    }
![](image-1.png)
我们可以从途中看到，-8的补码是1000，所以，最小整数的补码也和这个类似，而有符号整数的最大范围是32位，那么我们只需要将1左移31位即可

![](image-2.png)

![alt text](image-3.png)


# 记忆点
-x -> ~x+1
! -> ((x | -x) >> 31) + 1