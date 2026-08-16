/*!****************************************************************************
 * @file
 * system_stm32g4xx.c
 *
 * @brief
 * Early system initialisation
 *
 * @date  19.08.2023
 ******************************************************************************/

/*- Header files -------------------------------------------------------------*/
#include "stm32g4xx.h"
#include "system_stm32g4xx.h"


/*- Compiler options ---------------------------------------------------------*/
#pragma GCC push_options
#pragma GCC optimize("O1")


/*- Protoypes ----------------------------------------------------------------*/
static uint32_t ulCalcPllBaseClk(void);


/*- Global variables ---------------------------------------------------------*/
/*! AHB Prescaler shift Look-Up Table                                         */
const uint8_t AHBPrescTable[16] = { [0 ... 7] = 0, 1, 2, 3, 4, 6, 7, 8, 9};

/*! APB Prescaler shift Look-Up Table                                         */
const uint8_t APBPrescTable[8] = { [0 ... 3] = 0, 1, 2, 3, 4};

/*! Calculated SYSCLK frequency in Hz                                         */
volatile uint32_t SystemCoreClock;


/*- Public interface ---------------------------------------------------------*/
/*!*****************************************************************************
 * @brief
 * Early system init
 * 
 * Configures relocateable interrupt vector table, enables FPU coprocessor ac-
 * cess and initialises calculated SYSCLK frequency variable.
 * 
 * @date  19.08.2023
 ******************************************************************************/
void SystemInit(void)
{
  // Set vector table address (placed by linker)
  extern const void _vector_base;
  SCB->VTOR = (uint32_t)&_vector_base & SCB_VTOR_TBLOFF_Msk;

#if (__FPU_USED == 1U)
  // Enable FPU (CP10+11)
  SCB->CPACR = (0b11uL << SCB_CPACR_CPn_Pos(10)) | (0b11uL << SCB_CPACR_CPn_Pos(11));
#endif // __FPU_USED

  // Update system core clock
  SystemCoreClockUpdate();
}

/*!*****************************************************************************
 * @brief
 * Calculate HCLK from current configuration
 * 
 * @date  19.08.2023
 ******************************************************************************/
void SystemCoreClockUpdate(void)
{
  uint32_t ulCfgR = RCC->CFGR;

  // Select base clock source
  uint32_t ulBaseClk;
  switch (ulCfgR & RCC_CFGR_SWS)
  {
    case RCC_CFGR_SWS_HSI: ulBaseClk = HSI_VALUE;           break;
    case RCC_CFGR_SWS_HSE: ulBaseClk = HSE_VALUE;           break;
    case RCC_CFGR_SWS_PLL: ulBaseClk = ulCalcPllBaseClk();  break;
    default:
      // Invalid hardware config
      __builtin_unreachable();
  }

  // Apply AHB prescaler
  uint32_t ulPrescInd = (ulCfgR & RCC_CFGR_HPRE) >> RCC_CFGR_HPRE_Pos;
  SystemCoreClock = ulBaseClk >> AHBPrescTable[ulPrescInd];
}


/*- Private functions --------------------------------------------------------*/
/*!****************************************************************************
 * @brief
 * Calculate PLL output clock from current config
 * 
 * @return  (uint32_t)  PLL output clock frequency in Hz
 * @date  09.08.2026
 ******************************************************************************/
static uint32_t ulCalcPllBaseClk(void)
{
  uint32_t ulPllCfgR = RCC->PLLCFGR;
  
  // Select clock source
  uint32_t ulInputClk;
  switch (ulPllCfgR & RCC_PLLCFGR_PLLSRC)
  {
    case RCC_PLLCFGR_PLLSRC_HSI: ulInputClk = HSI_VALUE;  break;
    case RCC_PLLCFGR_PLLSRC_HSE: ulInputClk = HSE_VALUE;  break;
    default:
      // Invalid hardware config
      __builtin_unreachable();
  }

  // Apply prediv and multiplier
  uint32_t ulMul = (ulPllCfgR & RCC_PLLCFGR_PLLN) >> RCC_PLLCFGR_PLLN_Pos;
  uint32_t ulDiv = 1uL + ((ulPllCfgR & RCC_PLLCFGR_PLLM) >> RCC_PLLCFGR_PLLM_Pos);
  return (ulInputClk * ulMul) / ulDiv;
}


/*- Restore compiler options -------------------------------------------------*/
#pragma GCC pop_options
