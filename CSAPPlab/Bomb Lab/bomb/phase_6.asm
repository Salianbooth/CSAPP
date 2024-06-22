Dump of assembler code for function phase_6:
   0x00000000004010f4 <+0>:     push   %r14
   0x00000000004010f6 <+2>:     push   %r13
   0x00000000004010f8 <+4>:     push   %r12
   0x00000000004010fa <+6>:     push   %rbp
   0x00000000004010fb <+7>:     push   %rbx
   //以上均为对调用者保存寄存器的保存过程
   0x00000000004010fc <+8>:     sub    $0x50,%rsp
   0x0000000000401100 <+12>:    mov    %rsp,%r13
   0x0000000000401103 <+15>:    mov    %rsp,%rsi
   0x0000000000401106 <+18>:    callq  0x40145c <read_six_numbers>
   //这里的rsi就是我们的栈帧指针然后调用 read_six_numbers
   0x000000000040110b <+23>:    mov    %rsp,%r14  //%r14 = %rsp
   0x000000000040110e <+26>:    mov    $0x0,%r12d //r12d = 0 %r12d当做数组索引，类似i=0

   0x0000000000401114 <+32>:    mov    %r13,%rbp//初始 %rbp=%r13=%rsp
   0x0000000000401117 <+35>:    mov    0x0(%r13),%eax//%eax=num[i]
   0x000000000040111b <+39>:    sub    $0x1,%eax
   0x000000000040111e <+42>:    cmp    $0x5,%eax
   0x0000000000401121 <+45>:    jbe    0x401128 <phase_6+52>//无符号数比较，说明num为无符号数，即大于等于0，40111b~401121 num[i]-1<=5,所以num[i]<=6
   0x0000000000401123 <+47>:    callq  0x40143a <explode_bomb>
   0x0000000000401128 <+52>:    add    $0x1,%r12d 
   0x000000000040112c <+56>:    cmp    $0x6,%r12d
   0x0000000000401130 <+60>:    je     0x401153 <phase_6+95>
   0x0000000000401132 <+62>:    mov    %r12d,%ebx //401128~401132 退出大循环的条件:6个数字全部遍历到

   0x0000000000401135 <+65>:    movslq %ebx,%rax
   0x0000000000401138 <+68>:    mov    (%rsp,%rax,4),%eax
   0x000000000040113b <+71>:    cmp    %eax,0x0(%rbp)
   0x000000000040113e <+74>:    jne    0x401145 <phase_6+81>
   0x0000000000401140 <+76>:    callq  0x40143a <explode_bomb>
   0x0000000000401145 <+81>:    add    $0x1,%ebx
   0x0000000000401148 <+84>:    cmp    $0x5,%ebx
   0x000000000040114b <+87>:    jle    0x401135 <phase_6+65>//401145~40114b 小循环，判断数组元素是否相等
   0x000000000040114d <+89>:    add    $0x4,%r13
   0x0000000000401151 <+93>:    jmp    0x401114 <phase_6+32>// 40114d~401151 大循环，每次将%r13加4，之后回到401114,%r13赋给了%eax
   /*
      r14 = 0;
      r13 = 0;
      r12d = 0;
      while(1){     
      rbp = r13;
      if(num[r13] - 1 > 5)  
         goto bomb;
      r12d++;     
      if(r12d == 6) 
         break;
      for(ebx = r12d; ebx <= 5; ebx++){ 
         if(num[ebx] == num[rbp])    
            goto bomb;
      }
      r13++;
      }
*/
   0x0000000000401153 <+95>:    lea    0x18(%rsp),%rsi//0x18=24,刚好为6个int型数据所占字节，将 %rsi 指向栈中跳过读入数据位置作为结束标记
   0x0000000000401158 <+100>:   mov    %r14,%rax//%rax=%r14=%rsp  (%rax)存放输入数
   0x000000000040115b <+103>:   mov    $0x7,%ecx//%ecx=7
   0x0000000000401160 <+108>:   mov    %ecx,%edx//%edx=%ecx=7
   0x0000000000401162 <+110>:   sub    (%rax),%edx//7-(%rax)=7-(%r14) 立即数7减去 %r14 指向的数据
   0x0000000000401164 <+112>:   mov    %edx,(%rax)//将7减的结果存回 %r14 执行的内存单元
   0x0000000000401166 <+114>:   add    $0x4,%rax// %rax 指向下一个输入数
   0x000000000040116a <+118>:   cmp    %rsi,%rax// 比较是否达到输入数组的末尾
   0x000000000040116d <+121>:   jne    0x401160 <phase_6+108>
   /*
      rsi=7；
      for(rax = 0; rax != rsi; rax++)
      {
      num[rax] = 7 - num[rax];
      }
*/

   0x000000000040116f <+123>:   mov    $0x0,%esi
   0x0000000000401174 <+128>:   jmp    0x401197 <phase_6+163>
   0x0000000000401176 <+130>:   mov    0x8(%rdx),%rdx//将 0x8(%rdx) 指向内存单元的内容（即下一结点的指针值）复制到 %rdx, 指向链表下一个元素
   0x000000000040117a <+134>:   add    $0x1,%eax
   0x000000000040117d <+137>:   cmp    %ecx,%eax//比较 %ecx 和 %eax 是否相等
   0x000000000040117f <+139>:   jne    0x401176 <phase_6+130> //不相等,继续遍历链表 【【最终 %rdx 指向链表的第 %ecx 个节点】】
   0x0000000000401181 <+141>:   jmp    0x401188 <phase_6+148>
   0x0000000000401183 <+143>:   mov    $0x6032d0,%edx //重置链表首地址，%edx存放链表首结点地址
   0x0000000000401188 <+148>:   mov    %rdx,0x20(%rsp,%rsi,2)//(%rsp+32+%rsi*2）=%rdx
   0x000000000040118d <+153>:   add    $0x4,%rsi//%rsi=%rsi+4
   0x0000000000401191 <+157>:   cmp    $0x18,%rsi
   0x0000000000401195 <+161>:   je     0x4011ab <phase_6+183> //当%rsi=24时，跳转至4011ab
   0x0000000000401197 <+163>:   mov    (%rsp,%rsi,1),%ecx//将 (%rsp + %rsi) 指向的数据复制到 %ecx，%ecx存放输入数据
   0x000000000040119a <+166>:   cmp    $0x1,%ecx//比较 %ecx 是否小于等于1
   0x000000000040119d <+169>:   jle    0x401183 <phase_6+143>//若%ecx小于等于1,跳转（因为%ecx代表结点，结点标号从1开始，所以输入数据的范围为[1,6])
                                                            //即%ecx=1时，%edx存放链表首结点地址
   0x000000000040119f <+171>:   mov    $0x1,%eax //若%ecx>1, 则%eax=1
   0x00000000004011a4 <+176>:   mov    $0x6032d0,%edx  //%edx存放链表首结点地址
   0x00000000004011a9 <+181>:   jmp    0x401176 <phase_6+130>

/*
x /4xw 0x6032d0
0x6032d0 <node1>: 0x0000014c  0x00000001  0x006032e0  0x00000000
0x6032e0 <node2>: 0x000000a8  0x00000002  0x006032f0  0x00000000
0x6032f0 <node3>: 0x0000039c  0x00000003  0x00603300  0x00000000
0x603300 <node4>: 0x000002b3  0x00000004  0x00603310  0x00000000
0x603310 <node5>: 0x000001dd  0x00000005  0x00603320  0x00000000
0x603320 <node6>: 0x000001bb  0x00000006  0x00000000  0x00000000*/
   0x00000000004011ab <+183>:   mov    0x20(%rsp),%rbx      //将(%rsp+32)的链表节点地址复制到 %rbx
   0x00000000004011b0 <+188>:   lea    0x28(%rsp),%rax      //将 %rax 指向栈中下一个链表结点的地址(%rsp+40)
   0x00000000004011b5 <+193>:   lea    0x50(%rsp),%rsi      //将 %rsi 指向保存的链表节点地址的末尾(%rsp+80)
   0x00000000004011ba <+198>:   mov    %rbx,%rcx
   0x00000000004011bd <+201>:   mov    (%rax),%rdx
   0x00000000004011c0 <+204>:   mov    %rdx,0x8(%rcx)        //将栈中指向的后一个节点的地址复制到前一个节点的next指针位置
   0x00000000004011c4 <+208>:   add    $0x8,%rax            //移动到下一个节点
   0x00000000004011c8 <+212>:   cmp    %rsi,%rax            //判断6个节点是否遍历完毕
   0x00000000004011cb <+215>:   je     0x4011d2 <phase_6+222>
   0x00000000004011cd <+217>:   mov    %rdx,%rcx            //继续遍历
   0x00000000004011d0 <+220>:   jmp    0x4011bd <phase_6+201>
   0x00000000004011d2 <+222>:   movq   $0x0,0x8(%rdx)           //末尾链表next 为 NULL 则设置为0x0


   0x00000000004011da <+230>:   mov    $0x5,%ebp
   0x00000000004011df <+235>:   mov    0x8(%rbx),%rax       //将 %rax 指向 %rbx 下一个链表结点
   0x00000000004011e3 <+239>:   mov    (%rax),%eax
   0x00000000004011e5 <+241>:   cmp    %eax,(%rbx)          //比较链表结点中第一个字段值的大小,如果前一个节点值大于后一个节点值,跳转
   0x00000000004011e7 <+243>:   jge    0x4011ee <phase_6+250>
   0x00000000004011e9 <+245>:   callq  0x40143a <explode_bomb>
   0x00000000004011ee <+250>:   mov    0x8(%rbx),%rbx //将 %rbx 向后移动,指向栈中下一个链表节点的地址
   0x00000000004011f2 <+254>:   sub    $0x1,%ebp
   0x00000000004011f5 <+257>:   jne    0x4011df <phase_6+235>//判断循环是否结束
   //该循环判断栈中重新调整后的链表结点是否按照降序排列
   0x00000000004011f7 <+259>:   add    $0x50,%rsp
   0x00000000004011fb <+263>:   pop    %rbx
   0x00000000004011fc <+264>:   pop    %rbp
   0x00000000004011fd <+265>:   pop    %r12
   0x00000000004011ff <+267>:   pop    %r13
   0x0000000000401201 <+269>:   pop    %r14
   0x0000000000401203 <+271>:   retq  

   /*
         cin>>a[6];//输入六个数
         if(a[i]=a[i+1]||a[i]>6)bomb!//i=1~6所有元素都不能相同都不能大于6
         //这里我们有一个单链表
         node1->node2->node3->node4->node5->node6
         // 由于最后我们的链表要满足单调递减
         // 按照值进行排序如下。所以我们重新排序的链表顺序必须如下
         node3>node4>node5>node6>node1>node2
         List *L=new(List(-1));//新建一个链表 
         for(int i=1;i<=6;i++){
         if(a[i]==6)L[i]=node1; //L[i]表示我们新链表的第i个结点。
         else{
            int b=7-a[i],p=node1;
            while(b--){
               p=p->next;
            }
            L[i]=p; //这里就是7-a[i]为多少就把node[7-a[i]]赋给L[i]
         }
         }  
      */