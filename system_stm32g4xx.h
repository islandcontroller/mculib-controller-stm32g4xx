/*!****************************************************************************
 * @file
 * system_stm32g4xx.h
 *
 * @brief
 * Early system initialisation
 *
 * @date  19.08.2023
 ******************************************************************************/

#ifndef SYSTEM_STM32G4xx_H_
#define SYSTEM_STM32G4xx_H_

/*- Header files -------------------------------------------------------------*/
#include <stdint.h>


/*- Global Variables ---------------------------------------------------------*/
/*! AHB Prescaler shift Look-Up Table                                         */
extern const uint8_t AHBPrescTable[16];

/*! APB Prescaler shift Look-Up Table                                         */
extern const uint8_t APBPrescTable[8];

/*! Calculated SYSCLK frequency in Hz                                         */
extern volatile uint32_t SystemCoreClock;


/*- Exported methods ---------------------------------------------------------*/
void SystemInit(void);
void SystemCoreClockUpdate(void);

#endif /* SYSTEM_STM32G4xx_H_ */
