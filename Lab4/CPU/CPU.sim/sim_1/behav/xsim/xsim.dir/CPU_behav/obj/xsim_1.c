/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_26(char*, char *);
extern void execute_235(char*, char *);
extern void execute_3642(char*, char *);
extern void execute_3888(char*, char *);
extern void execute_126(char*, char *);
extern void execute_31(char*, char *);
extern void execute_128(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_234(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_3440(char*, char *);
extern void execute_3441(char*, char *);
extern void execute_3644(char*, char *);
extern void execute_3779(char*, char *);
extern void execute_3647(char*, char *);
extern void execute_3648(char*, char *);
extern void execute_3650(char*, char *);
extern void execute_3651(char*, char *);
extern void execute_3652(char*, char *);
extern void execute_3653(char*, char *);
extern void execute_3654(char*, char *);
extern void execute_3655(char*, char *);
extern void execute_3656(char*, char *);
extern void execute_3657(char*, char *);
extern void execute_3658(char*, char *);
extern void execute_3659(char*, char *);
extern void execute_3660(char*, char *);
extern void execute_3661(char*, char *);
extern void execute_3671(char*, char *);
extern void execute_3672(char*, char *);
extern void execute_3673(char*, char *);
extern void execute_3674(char*, char *);
extern void execute_3675(char*, char *);
extern void execute_3676(char*, char *);
extern void execute_3677(char*, char *);
extern void execute_3678(char*, char *);
extern void execute_3679(char*, char *);
extern void execute_3680(char*, char *);
extern void execute_3681(char*, char *);
extern void execute_3683(char*, char *);
extern void execute_3684(char*, char *);
extern void execute_3686(char*, char *);
extern void execute_3687(char*, char *);
extern void execute_3689(char*, char *);
extern void execute_3690(char*, char *);
extern void execute_3692(char*, char *);
extern void execute_3693(char*, char *);
extern void execute_3695(char*, char *);
extern void execute_3696(char*, char *);
extern void execute_3698(char*, char *);
extern void execute_3699(char*, char *);
extern void execute_3701(char*, char *);
extern void execute_3702(char*, char *);
extern void execute_3704(char*, char *);
extern void execute_3705(char*, char *);
extern void execute_3707(char*, char *);
extern void execute_3708(char*, char *);
extern void execute_3710(char*, char *);
extern void execute_3711(char*, char *);
extern void execute_3713(char*, char *);
extern void execute_3714(char*, char *);
extern void execute_3716(char*, char *);
extern void execute_3717(char*, char *);
extern void execute_3719(char*, char *);
extern void execute_3720(char*, char *);
extern void execute_3722(char*, char *);
extern void execute_3723(char*, char *);
extern void execute_3725(char*, char *);
extern void execute_3726(char*, char *);
extern void execute_3728(char*, char *);
extern void execute_3729(char*, char *);
extern void execute_3731(char*, char *);
extern void execute_3732(char*, char *);
extern void execute_3734(char*, char *);
extern void execute_3735(char*, char *);
extern void execute_3737(char*, char *);
extern void execute_3738(char*, char *);
extern void execute_3740(char*, char *);
extern void execute_3741(char*, char *);
extern void execute_3743(char*, char *);
extern void execute_3744(char*, char *);
extern void execute_3746(char*, char *);
extern void execute_3747(char*, char *);
extern void execute_3749(char*, char *);
extern void execute_3750(char*, char *);
extern void execute_3752(char*, char *);
extern void execute_3753(char*, char *);
extern void execute_3755(char*, char *);
extern void execute_3756(char*, char *);
extern void execute_3758(char*, char *);
extern void execute_3759(char*, char *);
extern void execute_3761(char*, char *);
extern void execute_3762(char*, char *);
extern void execute_3764(char*, char *);
extern void execute_3765(char*, char *);
extern void execute_3767(char*, char *);
extern void execute_3768(char*, char *);
extern void execute_3770(char*, char *);
extern void execute_3771(char*, char *);
extern void execute_3773(char*, char *);
extern void execute_3774(char*, char *);
extern void execute_3777(char*, char *);
extern void execute_3778(char*, char *);
extern void execute_3880(char*, char *);
extern void execute_3882(char*, char *);
extern void execute_3883(char*, char *);
extern void execute_3887(char*, char *);
extern void execute_3890(char*, char *);
extern void execute_3892(char*, char *);
extern void execute_3894(char*, char *);
extern void execute_3995(char*, char *);
extern void execute_3997(char*, char *);
extern void execute_3998(char*, char *);
extern void execute_4000(char*, char *);
extern void execute_4200(char*, char *);
extern void execute_5113(char*, char *);
extern void execute_4331(char*, char *);
extern void execute_4203(char*, char *);
extern void execute_4207(char*, char *);
extern void execute_4211(char*, char *);
extern void execute_4215(char*, char *);
extern void execute_4219(char*, char *);
extern void execute_4223(char*, char *);
extern void execute_4227(char*, char *);
extern void execute_4231(char*, char *);
extern void execute_4235(char*, char *);
extern void execute_4239(char*, char *);
extern void execute_4243(char*, char *);
extern void execute_4247(char*, char *);
extern void execute_4251(char*, char *);
extern void execute_4255(char*, char *);
extern void execute_4259(char*, char *);
extern void execute_4263(char*, char *);
extern void execute_4267(char*, char *);
extern void execute_4271(char*, char *);
extern void execute_4275(char*, char *);
extern void execute_4279(char*, char *);
extern void execute_4283(char*, char *);
extern void execute_4287(char*, char *);
extern void execute_4291(char*, char *);
extern void execute_4295(char*, char *);
extern void execute_4299(char*, char *);
extern void execute_4303(char*, char *);
extern void execute_4307(char*, char *);
extern void execute_4311(char*, char *);
extern void execute_4315(char*, char *);
extern void execute_4319(char*, char *);
extern void execute_4323(char*, char *);
extern void execute_4327(char*, char *);
extern void execute_4590(char*, char *);
extern void execute_4334(char*, char *);
extern void execute_4338(char*, char *);
extern void execute_4342(char*, char *);
extern void execute_4346(char*, char *);
extern void execute_4350(char*, char *);
extern void execute_4354(char*, char *);
extern void execute_4358(char*, char *);
extern void execute_4362(char*, char *);
extern void execute_4366(char*, char *);
extern void execute_4370(char*, char *);
extern void execute_4374(char*, char *);
extern void execute_4378(char*, char *);
extern void execute_4382(char*, char *);
extern void execute_4386(char*, char *);
extern void execute_4390(char*, char *);
extern void execute_4394(char*, char *);
extern void execute_4398(char*, char *);
extern void execute_4402(char*, char *);
extern void execute_4406(char*, char *);
extern void execute_4410(char*, char *);
extern void execute_4414(char*, char *);
extern void execute_4418(char*, char *);
extern void execute_4422(char*, char *);
extern void execute_4426(char*, char *);
extern void execute_4430(char*, char *);
extern void execute_4434(char*, char *);
extern void execute_4438(char*, char *);
extern void execute_4442(char*, char *);
extern void execute_4446(char*, char *);
extern void execute_4450(char*, char *);
extern void execute_4454(char*, char *);
extern void execute_4458(char*, char *);
extern void execute_4462(char*, char *);
extern void execute_4466(char*, char *);
extern void execute_4470(char*, char *);
extern void execute_4474(char*, char *);
extern void execute_4478(char*, char *);
extern void execute_4482(char*, char *);
extern void execute_4486(char*, char *);
extern void execute_4490(char*, char *);
extern void execute_4494(char*, char *);
extern void execute_4498(char*, char *);
extern void execute_4502(char*, char *);
extern void execute_4506(char*, char *);
extern void execute_4510(char*, char *);
extern void execute_4514(char*, char *);
extern void execute_4518(char*, char *);
extern void execute_4522(char*, char *);
extern void execute_4526(char*, char *);
extern void execute_4530(char*, char *);
extern void execute_4534(char*, char *);
extern void execute_4538(char*, char *);
extern void execute_4542(char*, char *);
extern void execute_4546(char*, char *);
extern void execute_4550(char*, char *);
extern void execute_4554(char*, char *);
extern void execute_4558(char*, char *);
extern void execute_4562(char*, char *);
extern void execute_4566(char*, char *);
extern void execute_4570(char*, char *);
extern void execute_4574(char*, char *);
extern void execute_4578(char*, char *);
extern void execute_4582(char*, char *);
extern void execute_4586(char*, char *);
extern void execute_4592(char*, char *);
extern void execute_4593(char*, char *);
extern void execute_4788(char*, char *);
extern void execute_4790(char*, char *);
extern void execute_5112(char*, char *);
extern void execute_4792(char*, char *);
extern void execute_4797(char*, char *);
extern void execute_4802(char*, char *);
extern void execute_4807(char*, char *);
extern void execute_4812(char*, char *);
extern void execute_4817(char*, char *);
extern void execute_4822(char*, char *);
extern void execute_4827(char*, char *);
extern void execute_4832(char*, char *);
extern void execute_4837(char*, char *);
extern void execute_4842(char*, char *);
extern void execute_4847(char*, char *);
extern void execute_4852(char*, char *);
extern void execute_4857(char*, char *);
extern void execute_4862(char*, char *);
extern void execute_4867(char*, char *);
extern void execute_4872(char*, char *);
extern void execute_4877(char*, char *);
extern void execute_4882(char*, char *);
extern void execute_4887(char*, char *);
extern void execute_4892(char*, char *);
extern void execute_4897(char*, char *);
extern void execute_4902(char*, char *);
extern void execute_4907(char*, char *);
extern void execute_4912(char*, char *);
extern void execute_4917(char*, char *);
extern void execute_4922(char*, char *);
extern void execute_4927(char*, char *);
extern void execute_4932(char*, char *);
extern void execute_4937(char*, char *);
extern void execute_4942(char*, char *);
extern void execute_4947(char*, char *);
extern void execute_4952(char*, char *);
extern void execute_4957(char*, char *);
extern void execute_4962(char*, char *);
extern void execute_4967(char*, char *);
extern void execute_4972(char*, char *);
extern void execute_4977(char*, char *);
extern void execute_4982(char*, char *);
extern void execute_4987(char*, char *);
extern void execute_4992(char*, char *);
extern void execute_4997(char*, char *);
extern void execute_5002(char*, char *);
extern void execute_5007(char*, char *);
extern void execute_5012(char*, char *);
extern void execute_5017(char*, char *);
extern void execute_5022(char*, char *);
extern void execute_5027(char*, char *);
extern void execute_5032(char*, char *);
extern void execute_5037(char*, char *);
extern void execute_5042(char*, char *);
extern void execute_5047(char*, char *);
extern void execute_5052(char*, char *);
extern void execute_5057(char*, char *);
extern void execute_5062(char*, char *);
extern void execute_5067(char*, char *);
extern void execute_5072(char*, char *);
extern void execute_5077(char*, char *);
extern void execute_5082(char*, char *);
extern void execute_5087(char*, char *);
extern void execute_5092(char*, char *);
extern void execute_5097(char*, char *);
extern void execute_5102(char*, char *);
extern void execute_5107(char*, char *);
extern void execute_4794(char*, char *);
extern void execute_4795(char*, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[291] = {(funcp)execute_26, (funcp)execute_235, (funcp)execute_3642, (funcp)execute_3888, (funcp)execute_126, (funcp)execute_31, (funcp)execute_128, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_234, (funcp)execute_237, (funcp)execute_238, (funcp)execute_3440, (funcp)execute_3441, (funcp)execute_3644, (funcp)execute_3779, (funcp)execute_3647, (funcp)execute_3648, (funcp)execute_3650, (funcp)execute_3651, (funcp)execute_3652, (funcp)execute_3653, (funcp)execute_3654, (funcp)execute_3655, (funcp)execute_3656, (funcp)execute_3657, (funcp)execute_3658, (funcp)execute_3659, (funcp)execute_3660, (funcp)execute_3661, (funcp)execute_3671, (funcp)execute_3672, (funcp)execute_3673, (funcp)execute_3674, (funcp)execute_3675, (funcp)execute_3676, (funcp)execute_3677, (funcp)execute_3678, (funcp)execute_3679, (funcp)execute_3680, (funcp)execute_3681, (funcp)execute_3683, (funcp)execute_3684, (funcp)execute_3686, (funcp)execute_3687, (funcp)execute_3689, (funcp)execute_3690, (funcp)execute_3692, (funcp)execute_3693, (funcp)execute_3695, (funcp)execute_3696, (funcp)execute_3698, (funcp)execute_3699, (funcp)execute_3701, (funcp)execute_3702, (funcp)execute_3704, (funcp)execute_3705, (funcp)execute_3707, (funcp)execute_3708, (funcp)execute_3710, (funcp)execute_3711, (funcp)execute_3713, (funcp)execute_3714, (funcp)execute_3716, (funcp)execute_3717, (funcp)execute_3719, (funcp)execute_3720, (funcp)execute_3722, (funcp)execute_3723, (funcp)execute_3725, (funcp)execute_3726, (funcp)execute_3728, (funcp)execute_3729, (funcp)execute_3731, (funcp)execute_3732, (funcp)execute_3734, (funcp)execute_3735, (funcp)execute_3737, (funcp)execute_3738, (funcp)execute_3740, (funcp)execute_3741, (funcp)execute_3743, (funcp)execute_3744, (funcp)execute_3746, (funcp)execute_3747, (funcp)execute_3749, (funcp)execute_3750, (funcp)execute_3752, (funcp)execute_3753, (funcp)execute_3755, (funcp)execute_3756, (funcp)execute_3758, (funcp)execute_3759, (funcp)execute_3761, (funcp)execute_3762, (funcp)execute_3764, (funcp)execute_3765, (funcp)execute_3767, (funcp)execute_3768, (funcp)execute_3770, (funcp)execute_3771, (funcp)execute_3773, (funcp)execute_3774, (funcp)execute_3777, (funcp)execute_3778, (funcp)execute_3880, (funcp)execute_3882, (funcp)execute_3883, (funcp)execute_3887, (funcp)execute_3890, (funcp)execute_3892, (funcp)execute_3894, (funcp)execute_3995, (funcp)execute_3997, (funcp)execute_3998, (funcp)execute_4000, (funcp)execute_4200, (funcp)execute_5113, (funcp)execute_4331, (funcp)execute_4203, (funcp)execute_4207, (funcp)execute_4211, (funcp)execute_4215, (funcp)execute_4219, (funcp)execute_4223, (funcp)execute_4227, (funcp)execute_4231, (funcp)execute_4235, (funcp)execute_4239, (funcp)execute_4243, (funcp)execute_4247, (funcp)execute_4251, (funcp)execute_4255, (funcp)execute_4259, (funcp)execute_4263, (funcp)execute_4267, (funcp)execute_4271, (funcp)execute_4275, (funcp)execute_4279, (funcp)execute_4283, (funcp)execute_4287, (funcp)execute_4291, (funcp)execute_4295, (funcp)execute_4299, (funcp)execute_4303, (funcp)execute_4307, (funcp)execute_4311, (funcp)execute_4315, (funcp)execute_4319, (funcp)execute_4323, (funcp)execute_4327, (funcp)execute_4590, (funcp)execute_4334, (funcp)execute_4338, (funcp)execute_4342, (funcp)execute_4346, (funcp)execute_4350, (funcp)execute_4354, (funcp)execute_4358, (funcp)execute_4362, (funcp)execute_4366, (funcp)execute_4370, (funcp)execute_4374, (funcp)execute_4378, (funcp)execute_4382, (funcp)execute_4386, (funcp)execute_4390, (funcp)execute_4394, (funcp)execute_4398, (funcp)execute_4402, (funcp)execute_4406, (funcp)execute_4410, (funcp)execute_4414, (funcp)execute_4418, (funcp)execute_4422, (funcp)execute_4426, (funcp)execute_4430, (funcp)execute_4434, (funcp)execute_4438, (funcp)execute_4442, (funcp)execute_4446, (funcp)execute_4450, (funcp)execute_4454, (funcp)execute_4458, (funcp)execute_4462, (funcp)execute_4466, (funcp)execute_4470, (funcp)execute_4474, (funcp)execute_4478, (funcp)execute_4482, (funcp)execute_4486, (funcp)execute_4490, (funcp)execute_4494, (funcp)execute_4498, (funcp)execute_4502, (funcp)execute_4506, (funcp)execute_4510, (funcp)execute_4514, (funcp)execute_4518, (funcp)execute_4522, (funcp)execute_4526, (funcp)execute_4530, (funcp)execute_4534, (funcp)execute_4538, (funcp)execute_4542, (funcp)execute_4546, (funcp)execute_4550, (funcp)execute_4554, (funcp)execute_4558, (funcp)execute_4562, (funcp)execute_4566, (funcp)execute_4570, (funcp)execute_4574, (funcp)execute_4578, (funcp)execute_4582, (funcp)execute_4586, (funcp)execute_4592, (funcp)execute_4593, (funcp)execute_4788, (funcp)execute_4790, (funcp)execute_5112, (funcp)execute_4792, (funcp)execute_4797, (funcp)execute_4802, (funcp)execute_4807, (funcp)execute_4812, (funcp)execute_4817, (funcp)execute_4822, (funcp)execute_4827, (funcp)execute_4832, (funcp)execute_4837, (funcp)execute_4842, (funcp)execute_4847, (funcp)execute_4852, (funcp)execute_4857, (funcp)execute_4862, (funcp)execute_4867, (funcp)execute_4872, (funcp)execute_4877, (funcp)execute_4882, (funcp)execute_4887, (funcp)execute_4892, (funcp)execute_4897, (funcp)execute_4902, (funcp)execute_4907, (funcp)execute_4912, (funcp)execute_4917, (funcp)execute_4922, (funcp)execute_4927, (funcp)execute_4932, (funcp)execute_4937, (funcp)execute_4942, (funcp)execute_4947, (funcp)execute_4952, (funcp)execute_4957, (funcp)execute_4962, (funcp)execute_4967, (funcp)execute_4972, (funcp)execute_4977, (funcp)execute_4982, (funcp)execute_4987, (funcp)execute_4992, (funcp)execute_4997, (funcp)execute_5002, (funcp)execute_5007, (funcp)execute_5012, (funcp)execute_5017, (funcp)execute_5022, (funcp)execute_5027, (funcp)execute_5032, (funcp)execute_5037, (funcp)execute_5042, (funcp)execute_5047, (funcp)execute_5052, (funcp)execute_5057, (funcp)execute_5062, (funcp)execute_5067, (funcp)execute_5072, (funcp)execute_5077, (funcp)execute_5082, (funcp)execute_5087, (funcp)execute_5092, (funcp)execute_5097, (funcp)execute_5102, (funcp)execute_5107, (funcp)execute_4794, (funcp)execute_4795, (funcp)transaction_1, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 291;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/CPU_behav/xsim.reloc",  (void **)funcTab, 291);
	iki_vhdl_file_variable_register(dp + 157720);
	iki_vhdl_file_variable_register(dp + 157776);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/CPU_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/CPU_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/CPU_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/CPU_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/CPU_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
