################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mtr_code.c 

OBJS += \
./mtr_code.o 

C_DEPS += \
./mtr_code.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -I../../mtr_bsp/microblaze_0/include -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


