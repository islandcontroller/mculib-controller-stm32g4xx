/*!*****************************************************************************
 * @file 
 * stm32g4xx_it.c
 * 
 * @brief
 * Application-defined interrupt handlers
 * 
 * @note ARMv7-M cores will use hardware stack handling on interrupt entry and
 * return, hence ISRs should **not** use the "interrupt" function attribute.
 * Ref. [1] "https://developer.arm.com/documentation/ddi0403/d/System-Level-
 * Architecture/System-Level-Programmers--Model/ARMv7-M-exception-model/
 * Exception-entry-behavior"
 * 
 * See [2] "https://support.arm.com/documentation/dui0553/b" Cortex-M4 Devices
 * Generic User Guide, Section 2.4.1 for additional information on fault types.
 * 
 * @date  21.08.2023
 ******************************************************************************/

/*- Header files -------------------------------------------------------------*/
#include "stm32g4xx.h"


/*!*****************************************************************************
 * @brief
 * Non-Maskable Interrupt (NMI) handler 
 * 
 * @date  21.08.2023
 ******************************************************************************/
void NMI_Handler(void)
{
}

/*!*****************************************************************************
 * @brief
 * Hard Fault handler 
 * 
 * @date  21.08.2023
 ******************************************************************************/
void HardFault_Handler(void)
{
  while (1)
  {
  }
}

/*!*****************************************************************************
 * @brief
 * MPU / Memory map fault handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void MemManage_Handler(void)
{
  while (1)
  {
  }
}

/*!*****************************************************************************
 * @brief
 * Bus access error handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void BusFault_Handler(void)
{
  while (1)
  {
  }
}

/*!*****************************************************************************
 * @brief
 * Usage Fault Exception handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void UsageFault_Handler(void)
{
  while (1)
  {
  }
}

/*!*****************************************************************************
 * @brief
 * Supervisor Call Exception handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void SVC_Handler(void)
{
}

/*!*****************************************************************************
 * @brief
 * Debug Monitor Exception handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void DebugMon_Handler(void)
{
}

/*!*****************************************************************************
 * @brief
 * PendSV / Pending Supervisor Call Exception handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void PendSV_Handler(void)
{
}

/*!*****************************************************************************
 * @brief
 * SysTick Interrupt Handler
 * 
 * @date  21.08.2023
 ******************************************************************************/
void SysTick_Handler(void)
{
}
