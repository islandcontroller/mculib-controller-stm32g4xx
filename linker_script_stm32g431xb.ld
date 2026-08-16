/*!****************************************************************************
 * @file
 * linker_script_stm32g431xb.ld
 *
 * @brief
 * Device specific linker script for STM32G431xB application code
 *
 * @date  03.08.2026
 ******************************************************************************/

/* Stack and heap memory size definitions                                     */
__min_heap_size = 0;                /* Minimum required heap size             */
__stack_size = 1024;                /* Reserved stack size                    */ 

/* Memories definition                                                        */
MEMORY
{
  FLASH     (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
  RAM       (xrw) : ORIGIN = 0x20000000, LENGTH = 32K
}

/* Include common definitions                                                 */
INCLUDE linker_script_common.ld