################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
LED_Shift.elf.size \

ELFCHECK += \
LED_Shift.elf.elfcheck \


# All Target
all: LED_Shift.elf secondary-outputs

# Tool invocations
LED_Shift.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../LED_Shift_bsp/microblaze_0/lib -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "LED_Shift.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

LED_Shift.elf.size: LED_Shift.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size LED_Shift.elf  |tee "LED_Shift.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

LED_Shift.elf.elfcheck: LED_Shift.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck LED_Shift.elf -hw ../../tp_SOC_hw_platform/system.xml -pe microblaze_0  |tee "LED_Shift.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) LED_Shift.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
