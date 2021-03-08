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
interr_in.elf.size \

ELFCHECK += \
interr_in.elf.elfcheck \


# All Target
all: interr_in.elf secondary-outputs

# Tool invocations
interr_in.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../interr_in_bsp/microblaze_0/lib -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "interr_in.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

interr_in.elf.size: interr_in.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size interr_in.elf  |tee "interr_in.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

interr_in.elf.elfcheck: interr_in.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck interr_in.elf -hw ../../tp_SOC_hw_platform/system.xml -pe microblaze_0  |tee "interr_in.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) interr_in.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
