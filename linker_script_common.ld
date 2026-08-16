/*!****************************************************************************
 * @file
 * linker_script_common.ld
 *
 * @brief
 * Common section layout definitions across all controller types
 *
 * @date  18.08.2023
 * @date  13.10.2025  Added heap/stack space reservation; configuration options
 ******************************************************************************/

/* Entry Point assignment                                                     */
ENTRY(_start)


/* Reserved bootloader space at the start of FLASH                            */
__boot_size = DEFINED(__boot_size) ? __boot_size : 0;
ASSERT((ALIGN(__boot_size, 64)-__boot_size) == 0, "__boot_size must be multiple of 64")

/* Reserved space for heap                                                    */
__min_heap_size = DEFINED(__min_heap_size) ? __min_heap_size : 0;
ASSERT((ALIGN(__min_heap_size, 4)-__min_heap_size) == 0, "__min_heap_size must be multiple of 4")

/* Reserved space for stack                                                   */
__stack_size = DEFINED(__stack_size) ? __stack_size : 256;
ASSERT((ALIGN(__stack_size, 4)-__stack_size) == 0, "__stack_size must be multiple of 4")


/* Sections definition                                                        */
SECTIONS
{
  /* Interrupt Vector Table at start of app memory        */
  .isr_vector :
  {
    . = ALIGN(4);

    KEEP( *(.isr_vector))
    KEEP( *(.isr_vector*))

    . = ALIGN(64);
  } >FLASH

  /* Code and read-only constants in FLASH memory         */
  .text :
  {
    . = ALIGN(4);

    *(.text)
    *(.text*)
    *(.glue_7)
    *(.glue_7t)
    *(.eh_frame)
    
    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(4);

    *(.rodata)
    *(.rodata*)

    . = ALIGN(4);
  } >FLASH

  /* Stack unwinding information                          */
  .ARM.extab :
  {
    KEEP(*(.ARM.extab*))
    KEEP(*(.gnu.linkonce.armextab.*))
  } >FLASH
  .ARM :
  {
    __exidx_start = .;
    KEEP(*(.ARM.exidx*))
    __exidx_end = .;
  } >FLASH

  /* Initialised data section                             */
  .data :
  {
    . = ALIGN(4);
    _sdata = .;
    *(.data)
    *(.data*)
    _edata = .;
  } >RAM AT>FLASH

  /* Initialisation data location in FLASH                */
  _sidata = LOADADDR(.data);

  /* Zero-initialised data section                        */
  .bss (NOLOAD) :
  {
    . = ALIGN(4);
    _sbss = .;

    *(.bss)
    *(.bss*)
    *(COMMON*)

    . = ALIGN(4);
    _ebss = .;
    PROVIDE( end = . );
    
  } >RAM
  
  /* Stack allocation at end of RAM                       */
  PROVIDE(_estack = ORIGIN(RAM) + LENGTH(RAM));
  PROVIDE(_sstack = _estack - __stack_size);
  ASSERT(_sstack > _ebss, "Insufficient space for stack allocation")

  /* Heap allocation between bss and stack                */
  PROVIDE(_sheap = _ebss);
  PROVIDE(_eheap = _sstack);
  ASSERT((_eheap - _sheap) >= __min_heap_size, "Insufficient space for heap allocation")

  /* Discard sections                                     */
  /DISCARD/ :
  {
  }

  .ARM.attributes 0 : { *(.ARM.attributes) }
}