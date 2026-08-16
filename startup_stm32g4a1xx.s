.include "Core/startup_cm4.s"

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

/******************************************************************************
 * _vector_base
 * Interrupt Vector Table
 ******************************************************************************/
.section  .isr_vector, "a", %progbits
.balign 4
.globl  _vector_base
_vector_base:
  /* Main stack pointer                                                       */
  .word _estack
  /* Internal interrupts                                                      */
  .word _start
  .word NMI_Handler
  .word HardFault_Handler
  .word MemManage_Handler
  .word BusFault_Handler
  .word UsageFault_Handler
  .word 0
  .word 0
  .word 0
  .word 0
  .word SVC_Handler
  .word DebugMon_Handler
  .word 0
  .word PendSV_Handler
  .word SysTick_Handler
  /* External Interrupts                                                      */
  .word WWDG_IRQHandler
  .word PVD_PVM_IRQHandler
  .word RTC_TAMP_LSECSS_IRQHandler
  .word RTC_WKUP_IRQHandler
  .word FLASH_IRQHandler
  .word RCC_IRQHandler
  .word EXTI0_IRQHandler
  .word EXTI1_IRQHandler
  .word EXTI2_IRQHandler
  .word EXTI3_IRQHandler
  .word EXTI4_IRQHandler
  .word DMA1_Channel1_IRQHandler
  .word DMA1_Channel2_IRQHandler
  .word DMA1_Channel3_IRQHandler
  .word DMA1_Channel4_IRQHandler
  .word DMA1_Channel5_IRQHandler
  .word DMA1_Channel6_IRQHandler
  .word DMA1_Channel7_IRQHandler
  .word ADC1_2_IRQHandler
  .word USB_HP_IRQHandler
  .word USB_LP_IRQHandler
  .word FDCAN1_IT0_IRQHandler
  .word FDCAN1_IT1_IRQHandler
  .word EXTI9_5_IRQHandler
  .word TIM1_BRK_TIM15_IRQHandler
  .word TIM1_UP_TIM16_IRQHandler
  .word TIM1_TRG_COM_TIM17_IRQHandler
  .word TIM1_CC_IRQHandler
  .word TIM2_IRQHandler
  .word TIM3_IRQHandler
  .word TIM4_IRQHandler
  .word I2C1_EV_IRQHandler
  .word I2C1_ER_IRQHandler
  .word I2C2_EV_IRQHandler
  .word I2C2_ER_IRQHandler
  .word SPI1_IRQHandler
  .word SPI2_IRQHandler
  .word USART1_IRQHandler
  .word USART2_IRQHandler
  .word USART3_IRQHandler
  .word EXTI15_10_IRQHandler
  .word RTC_Alarm_IRQHandler
  .word USBWakeUp_IRQHandler
  .word TIM8_BRK_IRQHandler
  .word TIM8_UP_IRQHandler
  .word TIM8_TRG_COM_IRQHandler
  .word TIM8_CC_IRQHandler
  .word ADC3_IRQHandler
  .word 0
  .word LPTIM1_IRQHandler
  .word 0
  .word SPI3_IRQHandler
  .word UART4_IRQHandler
  .word UART5_IRQHandler
  .word TIM6_DAC_IRQHandler
  .word TIM7_IRQHandler
  .word DMA2_Channel1_IRQHandler
  .word DMA2_Channel2_IRQHandler
  .word DMA2_Channel3_IRQHandler
  .word DMA2_Channel4_IRQHandler
  .word DMA2_Channel5_IRQHandler
  .word 0
  .word 0
  .word UCPD1_IRQHandler
  .word COMP1_2_3_IRQHandler
  .word COMP4_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word CRS_IRQHandler
  .word SAI1_IRQHandler
  .word TIM20_BRK_IRQHandler
  .word TIM20_UP_IRQHandler
  .word TIM20_TRG_COM_IRQHandler
  .word TIM20_CC_IRQHandler
  .word FPU_IRQHandler
  .word 0
  .word 0
  .word 0
  .word AES_IRQHandler
  .word FDCAN2_IT0_IRQHandler
  .word FDCAN2_IT1_IRQHandler
  .word 0
  .word 0
  .word RNG_IRQHandler
  .word LPUART1_IRQHandler
  .word I2C3_EV_IRQHandler
  .word I2C3_ER_IRQHandler
  .word DMAMUX_OVR_IRQHandler
  .word QUADSPI_IRQHandler
  .word DMA1_Channel8_IRQHandler
  .word DMA2_Channel6_IRQHandler
  .word DMA2_Channel7_IRQHandler
  .word DMA2_Channel8_IRQHandler
  .word CORDIC_IRQHandler
  .word FMAC_IRQHandler

/* Weak definitions of interrupt handlers in .text                            */
.section  .text.vector_handler, "ax", %progbits
.weak NMI_Handler
.weak HardFault_Handler
.weak MemManage_Handler
.weak BusFault_Handler
.weak UsageFault_Handler
.weak SVC_Handler
.weak DebugMon_Handler
.weak PendSV_Handler
.weak SysTick_Handler
.weak WWDG_IRQHandler
.weak PVD_PVM_IRQHandler
.weak RTC_TAMP_LSECSS_IRQHandler
.weak RTC_WKUP_IRQHandler
.weak FLASH_IRQHandler
.weak RCC_IRQHandler
.weak EXTI0_IRQHandler
.weak EXTI1_IRQHandler
.weak EXTI2_IRQHandler
.weak EXTI3_IRQHandler
.weak EXTI4_IRQHandler
.weak DMA1_Channel1_IRQHandler
.weak DMA1_Channel2_IRQHandler
.weak DMA1_Channel3_IRQHandler
.weak DMA1_Channel4_IRQHandler
.weak DMA1_Channel5_IRQHandler
.weak DMA1_Channel6_IRQHandler
.weak DMA1_Channel7_IRQHandler
.weak ADC1_2_IRQHandler
.weak USB_HP_IRQHandler
.weak USB_LP_IRQHandler
.weak FDCAN1_IT0_IRQHandler
.weak FDCAN1_IT1_IRQHandler
.weak EXTI9_5_IRQHandler
.weak TIM1_BRK_TIM15_IRQHandler
.weak TIM1_UP_TIM16_IRQHandler
.weak TIM1_TRG_COM_TIM17_IRQHandler
.weak TIM1_CC_IRQHandler
.weak TIM2_IRQHandler
.weak TIM3_IRQHandler
.weak TIM4_IRQHandler
.weak I2C1_EV_IRQHandler
.weak I2C1_ER_IRQHandler
.weak I2C2_EV_IRQHandler
.weak I2C2_ER_IRQHandler
.weak SPI1_IRQHandler
.weak SPI2_IRQHandler
.weak USART1_IRQHandler
.weak USART2_IRQHandler
.weak USART3_IRQHandler
.weak EXTI15_10_IRQHandler
.weak RTC_Alarm_IRQHandler
.weak USBWakeUp_IRQHandler
.weak TIM8_BRK_IRQHandler
.weak TIM8_UP_IRQHandler
.weak TIM8_TRG_COM_IRQHandler
.weak TIM8_CC_IRQHandler
.weak ADC3_IRQHandler
.weak LPTIM1_IRQHandler
.weak SPI3_IRQHandler
.weak UART4_IRQHandler
.weak UART5_IRQHandler
.weak TIM6_DAC_IRQHandler
.weak TIM7_IRQHandler
.weak DMA2_Channel1_IRQHandler
.weak DMA2_Channel2_IRQHandler
.weak DMA2_Channel3_IRQHandler
.weak DMA2_Channel4_IRQHandler
.weak DMA2_Channel5_IRQHandler
.weak UCPD1_IRQHandler
.weak COMP1_2_3_IRQHandler
.weak COMP4_IRQHandler
.weak CRS_IRQHandler
.weak SAI1_IRQHandler
.weak TIM20_BRK_IRQHandler
.weak TIM20_UP_IRQHandler
.weak TIM20_TRG_COM_IRQHandler
.weak TIM20_CC_IRQHandler
.weak FPU_IRQHandler
.weak AES_IRQHandler
.weak FDCAN2_IT0_IRQHandler
.weak FDCAN2_IT1_IRQHandler
.weak RNG_IRQHandler
.weak LPUART1_IRQHandler
.weak I2C3_EV_IRQHandler
.weak I2C3_ER_IRQHandler
.weak DMAMUX_OVR_IRQHandler
.weak QUADSPI_IRQHandler
.weak DMA1_Channel8_IRQHandler
.weak DMA2_Channel6_IRQHandler
.weak DMA2_Channel7_IRQHandler
.weak DMA2_Channel8_IRQHandler
.weak CORDIC_IRQHandler
.weak FMAC_IRQHandler

/* Default to generic handler if not implemented                              */
.thumb_set NMI_Handler, Default_Handler
.thumb_set HardFault_Handler, Default_Handler
.thumb_set MemManage_Handler, Default_Handler
.thumb_set BusFault_Handler, Default_Handler
.thumb_set UsageFault_Handler, Default_Handler
.thumb_set SVC_Handler, Default_Handler
.thumb_set DebugMon_Handler, Default_Handler
.thumb_set PendSV_Handler, Default_Handler
.thumb_set SysTick_Handler, Default_Handler
.thumb_set WWDG_IRQHandler, Default_Handler
.thumb_set PVD_PVM_IRQHandler, Default_Handler
.thumb_set RTC_TAMP_LSECSS_IRQHandler, Default_Handler
.thumb_set RTC_WKUP_IRQHandler, Default_Handler
.thumb_set FLASH_IRQHandler, Default_Handler
.thumb_set RCC_IRQHandler, Default_Handler
.thumb_set EXTI0_IRQHandler, Default_Handler
.thumb_set EXTI1_IRQHandler, Default_Handler
.thumb_set EXTI2_IRQHandler, Default_Handler
.thumb_set EXTI3_IRQHandler, Default_Handler
.thumb_set EXTI4_IRQHandler, Default_Handler
.thumb_set DMA1_Channel1_IRQHandler, Default_Handler
.thumb_set DMA1_Channel2_IRQHandler, Default_Handler
.thumb_set DMA1_Channel3_IRQHandler, Default_Handler
.thumb_set DMA1_Channel4_IRQHandler, Default_Handler
.thumb_set DMA1_Channel5_IRQHandler, Default_Handler
.thumb_set DMA1_Channel6_IRQHandler, Default_Handler
.thumb_set DMA1_Channel7_IRQHandler, Default_Handler
.thumb_set ADC1_2_IRQHandler, Default_Handler
.thumb_set USB_HP_IRQHandler, Default_Handler
.thumb_set USB_LP_IRQHandler, Default_Handler
.thumb_set FDCAN1_IT0_IRQHandler, Default_Handler
.thumb_set FDCAN1_IT1_IRQHandler, Default_Handler
.thumb_set EXTI9_5_IRQHandler, Default_Handler
.thumb_set TIM1_BRK_TIM15_IRQHandler, Default_Handler
.thumb_set TIM1_UP_TIM16_IRQHandler, Default_Handler
.thumb_set TIM1_TRG_COM_TIM17_IRQHandler, Default_Handler
.thumb_set TIM1_CC_IRQHandler, Default_Handler
.thumb_set TIM2_IRQHandler, Default_Handler
.thumb_set TIM3_IRQHandler, Default_Handler
.thumb_set TIM4_IRQHandler, Default_Handler
.thumb_set I2C1_EV_IRQHandler, Default_Handler
.thumb_set I2C1_ER_IRQHandler, Default_Handler
.thumb_set I2C2_EV_IRQHandler, Default_Handler
.thumb_set I2C2_ER_IRQHandler, Default_Handler
.thumb_set SPI1_IRQHandler, Default_Handler
.thumb_set SPI2_IRQHandler, Default_Handler
.thumb_set USART1_IRQHandler, Default_Handler
.thumb_set USART2_IRQHandler, Default_Handler
.thumb_set USART3_IRQHandler, Default_Handler
.thumb_set EXTI15_10_IRQHandler, Default_Handler
.thumb_set RTC_Alarm_IRQHandler, Default_Handler
.thumb_set USBWakeUp_IRQHandler, Default_Handler
.thumb_set TIM8_BRK_IRQHandler, Default_Handler
.thumb_set TIM8_UP_IRQHandler, Default_Handler
.thumb_set TIM8_TRG_COM_IRQHandler, Default_Handler
.thumb_set TIM8_CC_IRQHandler, Default_Handler
.thumb_set ADC3_IRQHandler, Default_Handler
.thumb_set LPTIM1_IRQHandler, Default_Handler
.thumb_set SPI3_IRQHandler, Default_Handler
.thumb_set UART4_IRQHandler, Default_Handler
.thumb_set UART5_IRQHandler, Default_Handler
.thumb_set TIM6_DAC_IRQHandler, Default_Handler
.thumb_set TIM7_IRQHandler, Default_Handler
.thumb_set DMA2_Channel1_IRQHandler, Default_Handler
.thumb_set DMA2_Channel2_IRQHandler, Default_Handler
.thumb_set DMA2_Channel3_IRQHandler, Default_Handler
.thumb_set DMA2_Channel4_IRQHandler, Default_Handler
.thumb_set DMA2_Channel5_IRQHandler, Default_Handler
.thumb_set UCPD1_IRQHandler, Default_Handler
.thumb_set COMP1_2_3_IRQHandler, Default_Handler
.thumb_set COMP4_IRQHandler, Default_Handler
.thumb_set CRS_IRQHandler, Default_Handler
.thumb_set SAI1_IRQHandler, Default_Handler
.thumb_set TIM20_BRK_IRQHandler, Default_Handler
.thumb_set TIM20_UP_IRQHandler, Default_Handler
.thumb_set TIM20_TRG_COM_IRQHandler, Default_Handler
.thumb_set TIM20_CC_IRQHandler, Default_Handler
.thumb_set FPU_IRQHandler, Default_Handler
.thumb_set AES_IRQHandler, Default_Handler
.thumb_set FDCAN2_IT0_IRQHandler, Default_Handler
.thumb_set FDCAN2_IT1_IRQHandler, Default_Handler
.thumb_set RNG_IRQHandler, Default_Handler
.thumb_set LPUART1_IRQHandler, Default_Handler
.thumb_set I2C3_EV_IRQHandler, Default_Handler
.thumb_set I2C3_ER_IRQHandler, Default_Handler
.thumb_set DMAMUX_OVR_IRQHandler, Default_Handler
.thumb_set QUADSPI_IRQHandler, Default_Handler
.thumb_set DMA1_Channel8_IRQHandler, Default_Handler
.thumb_set DMA2_Channel6_IRQHandler, Default_Handler
.thumb_set DMA2_Channel7_IRQHandler, Default_Handler
.thumb_set DMA2_Channel8_IRQHandler, Default_Handler
.thumb_set CORDIC_IRQHandler, Default_Handler
.thumb_set FMAC_IRQHandler, Default_Handler


/******************************************************************************
 * Default_Handler
 * Default interrupt handler for unimplemented interrupts
 ******************************************************************************/
.section  .text.Default_Handler
.balign 4
.globl  Default_Handler
.type   Default_Handler, %function
Default_Handler:
  b     Default_Handler