Dump of assembler code for function phase_4:
   0x000000000040100c <+0>:     sub    $0x18,%rsp//申请空间
   0x0000000000401010 <+4>:     lea    0xc(%rsp),%rcx//传参，加载有效地址，将0xc(%rsp)设为num2
   0x0000000000401015 <+9>:     lea    0x8(%rsp),%rdx //传参，加载有效地址，将0x8(%rsp)设为num1

   0x000000000040101a <+14>:    mov    $0x4025cf,%esi
   0x000000000040101f <+19>:    mov    $0x0,%eax
   0x0000000000401024 <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000401029 <+29>:    cmp    $0x2,%eax
   0x000000000040102c <+32>:    jne    0x401035 <phase_4+41>//当scanf输入数据个数不等于2时，跳转至爆炸

   0x000000000040102e <+34>:    cmpl   $0xe,0x8(%rsp)
   0x0000000000401033 <+39>:    jbe    0x40103a <phase_4+46> //jbe：无符号小于等于跳转，当num1小于等于14时，跳转至40103a，否则爆炸，所以num1的限制条件为[0,14]
   0x0000000000401035 <+41>:    callq  0x40143a <explode_bomb>
   0x000000000040103a <+46>:    mov    $0xe,%edx  ////%edx=14
   0x000000000040103f <+51>:    mov    $0x0,%esi //%esi=0
   0x0000000000401044 <+56>:    mov    0x8(%rsp),%edi//%edi=num1

   0x0000000000401048 <+60>:    callq  0x400fce <func4> //调用函数fun4，三个参数%edx，%esi，%edi
   0x000000000040104d <+65>:    test   %eax,%eax
   0x000000000040104f <+67>:    jne    0x401058 <phase_4+76> //如果fun4返回值%eax不等于0，则跳转至爆炸，所以需要知道当num1为何值时，%eax为0

   0x0000000000401051 <+69>:    cmpl   $0x0,0xc(%rsp)
   0x0000000000401056 <+74>:    je     0x40105d <phase_4+81> //如果num2=0，则跳转至结束，否则爆炸，所以输入的第二个数据只能为0
   0x0000000000401058 <+76>:    callq  0x40143a <explode_bomb>
   0x000000000040105d <+81>:    add    $0x18,%rsp
   0x0000000000401061 <+85>:    retq   
End of assembler dump.


Dump of assembler code for function func4:
   0x0000000000400fce <+0>:     sub    $0x8,%rsp//申请空间

   0x0000000000400fd2 <+4>:     mov    %edx,%eax
   0x0000000000400fd4 <+6>:     sub    %esi,%eax
   0x0000000000400fd6 <+8>:     mov    %eax,%ecx//%ecx=%eax=14

   0x0000000000400fd8 <+10>:    shr    $0x1f,%ecx //%ecx的值逻辑右移31位，即%ecx=%ecx>>31=1110>>31=14/2^31=0
   0x0000000000400fdb <+13>:    add    %ecx,%eax //因为是逻辑右移，也就是如果%eax为正数则不变，为负数则+1；%eax=%eax+%ecx=14+0=14
   0x0000000000400fdd <+15>:    sar    %eax//算术右移1位，%eax=%eax/2=14/2=7

   0x0000000000400fdf <+17>:    lea    (%rax,%rsi,1),%ecx//加载有效地址，%ecx=%rax+%rsi=7+0=7
   0x0000000000400fe2 <+20>:    cmp    %edi,%ecx
   0x0000000000400fe4 <+22>:    jle    0x400ff2 <func4+36>//有符号小于等于则跳转， 若%ecx（初始为7）小于等于num1,则跳转至400ff2,%eax=0,说明num1=7,为其中一个解
   0x0000000000400fe6 <+24>:    lea    -0x1(%rcx),%edx//当num1小于等于%ecx时，加载有效地址，%edx=%rcx-1=7-1=6 （%ecx为%rcx的低32位表示)
   0x0000000000400fe9 <+27>:    callq  0x400fce <func4>//递归调用，减小%ecx的值，直至num1>%ecx，因为num1是无符号数，取值范围[0,14]，所以%ecx下限为0
   0x0000000000400fee <+32>:    add    %eax,%eax//%eax=%eax*2
   0x0000000000400ff0 <+34>:    jmp    0x401007 <func4+57> //递归出口
   0x0000000000400ff2 <+36>:    mov    $0x0,%eax
   0x0000000000400ff7 <+41>:    cmp    %edi,%ecx             //若%ecx大于等于num1，递归结束，返回phase_4
   0x0000000000400ff9 <+43>:    jge    0x401007 <func4+57>//递归出口
   0x0000000000400ffb <+45>:    lea    0x1(%rcx),%esi//%esi=%rcx+1
   0x0000000000400ffe <+48>:    callq  0x400fce <func4>
   0x0000000000401003 <+53>:    lea    0x1(%rax,%rax,1),%eax//%eax=%rax+1+%rax
   0x0000000000401007 <+57>:    add    $0x8,%rsp
   0x000000000040100b <+61>:    retq   