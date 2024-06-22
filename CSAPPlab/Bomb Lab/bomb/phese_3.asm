Dump of assembler code for function phase_3:
   0x0000000000400f43 <+0>:     sub    $0x18,%rsp           //为变量预留空间
   0x0000000000400f47 <+4>:     lea    0xc(%rsp),%rcx       //将 (%rsp)+0xc 的地址加载到%rcx中，n1
   0x0000000000400f4c <+9>:     lea    0x8(%rsp),%rdx       //将 (%rsp)+0x8 的地址加载到%rdx中，n2
   0x0000000000400f51 <+14>:    mov    $0x4025cf,%esi       
   0x0000000000400f56 <+19>:    mov    $0x0,%eax            //初始化%eax
   0x0000000000400f5b <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>  //调用<__isoc99_sscanf@plt>,eax存放输入数据的个数
   0x0000000000400f60 <+29>:    cmp    $0x1,%eax            
   0x0000000000400f63 <+32>:    jg     0x400f6a <phase_3+39>//jg:有符号大于则跳转，说明scanf输入数据的个数必须大于1
   0x0000000000400f65 <+34>:    callq  0x40143a <explode_bomb>
   0x0000000000400f6a <+39>:    cmpl   $0x7,0x8(%rsp)
   0x0000000000400f6f <+44>:    ja     0x400fad <phase_3+106>//ja:无符号大于则跳转,至爆炸，说明num1为无符号数，大于0且需要小于等于7，所以num1=[0,7]
   0x0000000000400f71 <+46>:    mov    0x8(%rsp),%eax       //n1存储到eax中
   0x0000000000400f75 <+50>:    jmpq   *0x402470(,%rax,8)  //0x402470+%rax*8，间接跳转，由此可以看出，跳转的地址是由rax决定的
                                                           //以 *0x402470 处的值为基地址，再加上8 * %rax 进行跳转，不同的 %rax 跳转到不同的位置
                                                           //可以很简单的看出是swich语句
   0x0000000000400f7c <+57>:    mov    $0xcf,%eax          //case0 207
   0x0000000000400f81 <+62>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f83 <+64>:    mov    $0x2c3,%eax          //case2 707
   0x0000000000400f88 <+69>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f8a <+71>:    mov    $0x100,%eax          //case3 256
   0x0000000000400f8f <+76>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f91 <+78>:    mov    $0x185,%eax          //case4 389
   0x0000000000400f96 <+83>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f98 <+85>:    mov    $0xce,%eax           //case5 206
   0x0000000000400f9d <+90>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f9f <+92>:    mov    $0x2aa,%eax          //case6 682
   0x0000000000400fa4 <+97>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400fa6 <+99>:    mov    $0x147,%eax          //case7 327
   0x0000000000400fab <+104>:   jmp    0x400fbe <phase_3+123>
   0x0000000000400fad <+106>:   callq  0x40143a <explode_bomb>
   0x0000000000400fb2 <+111>:   mov    $0x0,%eax           
   0x0000000000400fb7 <+116>:   jmp    0x400fbe <phase_3+123>
   0x0000000000400fb9 <+118>:   mov    $0x137,%eax          //case1 311
   0x0000000000400fbe <+123>:   cmp    0xc(%rsp),%eax
   0x0000000000400fc2 <+127>:   je     0x400fc9 <phase_3+134>
   0x0000000000400fc4 <+129>:   callq  0x40143a <explode_bomb>