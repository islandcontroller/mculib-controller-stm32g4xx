#if defined(STM32G431xx)
#include "startup_stm32g431xx.s"
#elif defined(STM32G441xx)
#include "startup_stm32g441xx.s"
#elif defined(STM32G473xx)
#include "startup_stm32g473xx.s"
#elif defined(STM32G483xx)
#include "startup_stm32g483xx.s"
#elif defined(STM32G474xx)
#include "startup_stm32g474xx.s"
#elif defined(STM32G484xx)
#include "startup_stm32g484xx.s"
#elif defined(STM32G491xx)
#include "startup_stm32g491xx.s"
#elif defined(STM32G4A1xx)
#include "startup_stm32g4a1xx.s"
#else
#error "Please select a valid STM32G4xx device using preprocessor macros"
#endif
