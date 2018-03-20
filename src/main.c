#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_exti.h"
#define USE_FULL_LL_DRIVER

char current_digits[4] = {1, 9, 3, 8};
char show_dot = 0;

const int digits[10] = {0b11101011, 0b10001000, 0b10110011, 0b10111010, 0b11011000, 0b01111010, 0b01111011, 0b10101000, 0b11111011, 0b11111010, 0};
void SystemClock_Config(void);
void EXTI0_1_IRQHandler(void);
void UserButton_Init(void);

//~ void display_digit1(char the_digit)
//~ {
	//~ LL_GPIO_WriteOutputPort(GPIOA, (0b1000 >> 8) | output_digits && 0b11111111000000000000000000000000);
	//~ LL_GPIO_WriteOutputPort(GPIOA, (0b0100 >> 8) | output_digits && 0b00000000111111110000000000000000);
	//~ LL_GPIO_WriteOutputPort(GPIOA, (0b0010 >> 8) | output_digits && 0b00000000000000001111111100000000);
	//~ LL_GPIO_WriteOutputPort(GPIOA, (0b0001 >> 8) | output_digits && 0b00000000000000000000000011111111);
//~ }

void display_digit1(char the_digit)
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b011100000000 | digits[the_digit]);
}
void display_digit2(char the_digit)
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b101100000000 | digits[the_digit]);
}
void display_digit3(char the_digit)
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b110100000000 | digits[the_digit]);
}
void display_digit4(char the_digit)
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b111000000000 | digits[the_digit]);
}
void display_dot1()
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b011100000100);
}
void display_dot2()
{
	if (show_dot)
		LL_GPIO_WriteOutputPort(GPIOB, 0b101100000100);
	else
		LL_GPIO_WriteOutputPort(GPIOB, 0b101100000000);
}
void display_dot3()
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b110100000100);
}
void display_dot4()
{
	LL_GPIO_WriteOutputPort(GPIOB, 0b111000000100);
}

int main(void)
{
        SystemClock_Config();
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
		LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
		
        LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
        
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_5, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_10, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_11, LL_GPIO_MODE_OUTPUT);
        
		

        UserButton_Init();

        while (1);
        return 0;
}

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */

void
SystemClock_Config() {
        /* Set FLASH latency */
        LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

        /* Enable HSI and wait for activation*/
        LL_RCC_HSI_Enable();
        while (LL_RCC_HSI_IsReady() != 1);

        /* Main PLL configuration and activation */
        LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                    LL_RCC_PLL_MUL_12);

        LL_RCC_PLL_Enable();
        while (LL_RCC_PLL_IsReady() != 1);

        /* Sysclk activation on the main PLL */
        LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
        LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
        while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

        /* Set APB1 prescaler */
        LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

        /* Set systick to 1ms */
        SysTick_Config(48000000/1000);

        /* Update CMSIS variable (which can be updated also
         * through SystemCoreClockUpdate function) */
        SystemCoreClock = 48000000;
}

void UserButton_Init(void) {
		//~ LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA); 
		//~ LL_GPIO_InitTypeDef GPIO_InitStruct; 
		//~ LL_GPIO_StructInit(&GPIO_InitStruct); 
		//~ GPIO_InitStruct.Mode = LL_GPIO_MODE_INPUT; 
		//~ GPIO_InitStruct.Pin = LL_GPIO_PIN_0; 
		//~ GPIO_InitStruct.Pull = LL_GPIO_PULL_NO; 
		//~ LL_GPIO_Init(GPIOA, &GPIO_InitStruct);
		
        /* Enable the BUTTON Clock */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
        
        
        LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_2, LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GPIOA, LL_GPIO_PIN_0, LL_GPIO_PULL_NO);
        LL_GPIO_SetPinPull(GPIOA, LL_GPIO_PIN_2, LL_GPIO_PULL_DOWN);
        
        
        LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_SYSCFG);
        
        LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE0);
        LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE2);
        
        
        LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_0);
        LL_EXTI_EnableFallingTrig_0_31(LL_EXTI_LINE_0);
        NVIC_EnableIRQ(EXTI0_1_IRQn);
        NVIC_SetPriority(EXTI0_1_IRQn, 0);
        
        LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_2);
        LL_EXTI_EnableFallingTrig_0_31(LL_EXTI_LINE_2);
        NVIC_EnableIRQ(EXTI2_3_IRQn);
        NVIC_SetPriority(EXTI2_3_IRQn, 0);
}

void
NMI_Handler(void) {
}

void HardFault_Handler(void) {
        while (1);
}

void
SVC_Handler(void) {
}

void
PendSV_Handler(void) {
}

int tick, i = 0, count = 3, time = 0, sec = 0;
void SysTick_Handler(void) {
        tick++;
        time++;
        sec++;
        if (tick == count)
        {
			display_digit1(current_digits[0]);
        }
        else if (tick == 2*count)
        {
			display_digit2(current_digits[1]);
		}
		else if (tick == 3*count)
		{
			display_digit3(current_digits[2]);
		}
		else if (tick == 4*count)
		{
			display_digit4(current_digits[3]);
		}
		else if (tick == 5*count)
		{
			display_dot2();
			tick = 0;
		}
		
		if (time == 1000*60)
		{
			time = 0;
			current_digits[3]++;
			if (current_digits[3] == 10)
			{
				current_digits[3] = 0;
				current_digits[2]++;
			}
			if (current_digits[2] == 6)
			{
				current_digits[2] = 0;
				current_digits[1]++;
			}
			if (current_digits[1] == 10)
			{
				current_digits[1] = 0;
				current_digits[0]++;
			}
			if (current_digits[0] == 2 && current_digits[1] == 4)
			{
				current_digits[0] = 0;
				current_digits[1] = 0;
			}
		}
		
		if (sec == 1000)
		{
			sec = 0;
			show_dot++;
			show_dot %= 2;
		}
		
}

//button interrupt handler
void EXTI0_1_IRQHandler(void)
{
        LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
        //~ LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
        //don't forget to add this line at the end
        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
}

int t = 0;
void EXTI2_3_IRQHandler(void)
{
	if (t > 2000)
	{
        //~ LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
        LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
        //~ //don't forget to add this line at the end
        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_2);
        t = 0;
	}
	t++;
}
