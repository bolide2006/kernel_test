cmd_/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o := /project/workspace1/frazho01/tools/gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc -Wp,-MMD,/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/.component_example.o.d  -nostdinc -isystem /project/workspace1/frazho01/tools/gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/6.2.1/include -I/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include -I./arch/arm64/include/generated -I/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include -I./include -I/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi -I./include/generated/uapi -include /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kconfig.h -include /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -mgeneral-regs-only -Wno-psabi -mabi=lp64 -fno-asynchronous-unwind-tables -fno-unwind-tables -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-frame-address -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -DMODULE  -DKBUILD_BASENAME='"component_example"' -DKBUILD_MODNAME='"test_component"' -c -o /project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o /project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.c

source_/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o := /project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.c

deps_/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o := \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kconfig.h \
    $(wildcard include/config/cc/version/text.h) \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler_attributes.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
    $(wildcard include/config/kcov.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/compiler.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/have/static/call/inline.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/int-ll64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/int-ll64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/bitsperlong.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitsperlong.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/bitsperlong.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/posix_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/stddef.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/stddef.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/posix_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/posix_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/const.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/const.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/const.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/limits.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/limits.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/limits.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/linkage.h \
    $(wildcard include/config/arch/use/sym/annotations.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/stringify.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  arch/arm64/include/generated/asm/rwonce.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/rwonce.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/kasan.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/kcsan.h) \
    $(wildcard include/config/kcsan/ignore/atomics.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/linkage.h \
    $(wildcard include/config/arm64/bti/kernel.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bitops.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bits.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/bits.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/build_bug.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/bitops.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/builtin-__ffs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/builtin-ffs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/builtin-__fls.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/builtin-fls.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/ffz.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/fls64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/sched.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/hweight.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/arch_hweight.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/const_hweight.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/atomic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/atomic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/atomic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/barrier.h \
    $(wildcard include/config/arm64/pseudo/nmi.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/barrier.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/cmpxchg.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/arm64/lse/atomics.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/atomic_ll_sc.h \
    $(wildcard include/config/cc/has/k/constraint.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/jump_label.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/insn.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/cpucaps.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/atomic_lse.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/atomic-arch-fallback.h \
    $(wildcard include/config/generic/atomic64.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/atomic-instrumented.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/instrumented.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/atomic-long.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/lock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/non-atomic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/le.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/byteorder.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/byteorder/little_endian.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/byteorder/little_endian.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/swab.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/swab.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/byteorder/generic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kstrtox.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/minmax.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/typecheck.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/dynamic/debug/core.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kern_levels.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/kernel.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/sysinfo.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/cache.h \
    $(wildcard include/config/kasan/sw/tags.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/cputype.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/pa/bits/52.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ratelimit_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/param.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/param.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/param.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/spinlock_types.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/spinlock_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/nr/cpus.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/qrwlock_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/prove/raw/lock/nesting.h) \
    $(wildcard include/config/preempt/lock.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rwlock_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dynamic_debug.h \
  arch/arm64/include/generated/asm/div64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/div64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/stat.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/compat.h) \
  arch/arm64/include/generated/uapi/asm/stat.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/stat.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
    $(wildcard include/config/posix/timers.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/math64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/time64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/time64.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/time.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/time_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/time32.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timex.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/timex.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/timex.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/hwcap.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/hwcap.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
    $(wildcard include/config/arm64/sve.h) \
    $(wildcard include/config/arm64/cnp.h) \
    $(wildcard include/config/arm64/ptr/auth.h) \
    $(wildcard include/config/arm64/mte.h) \
    $(wildcard include/config/arm64/debug/priority/masking.h) \
    $(wildcard include/config/arm64/bti.h) \
    $(wildcard include/config/arm64/tlb/range.h) \
    $(wildcard include/config/arm64/pa/bits.h) \
    $(wildcard include/config/arm64/hw/afdbm.h) \
    $(wildcard include/config/arm64/amu/extn.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/bug.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/brk-imm.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/instrumentation.h \
    $(wildcard include/config/debug/entry.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
    $(wildcard include/config/debug/preempt.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/errno.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/errno.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/errno.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/errno-base.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/threads.h \
    $(wildcard include/config/base/small.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bitmap.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/string.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/smp_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preemption.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/preempt.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/restart_block.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/current.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/thread_info.h \
    $(wildcard include/config/shadow/call/stack.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/kasan/shadow/offset.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/arm/gic/v3/its.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sizes.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/pfn.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/stack_pointer.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/percpu.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timecounter.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/timex.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/time32.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/time.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/compat.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/compat.h \
    $(wildcard include/config/compat/for/u64/alignment.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tasks/trace/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/posix/cpu/timers/task/work.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/io/uring.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/ubsan/trap.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/kunit.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/x86/mce.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/debug/rseq.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/sched.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/pid.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcupdate.h \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tasks/rcu/generic.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rude/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/irqflags.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/ptrace.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/ptrace.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/sve_context.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bottom_half.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/lockdep.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm64/force/52bit.h) \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm64/tagged/addr/abi.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/processor.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/vdso/processor.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/hw_breakpoint.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/virt.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/sections.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/sections.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/kasan.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/pgtable-types.h \
    $(wildcard include/config/pgtable/levels.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/pgtable-nop4d.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/arm64/cont/pte/shift.h) \
    $(wildcard include/config/arm64/cont/pmd/shift.h) \
    $(wildcard include/config/arm64/va/bits/52.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/pointer_auth.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/random.h \
    $(wildcard include/config/arch/random.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/once.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/random.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/ioctl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/ioctl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/irqnr.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/irqnr.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/prandom.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/siphash.h \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/archrandom.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/spectre.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/fpsimd.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/sigcontext.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcutree.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/wait.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/spinlock.h \
  arch/arm64/include/generated/asm/mmiowb.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/spinlock.h \
  arch/arm64/include/generated/asm/qrwlock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/qrwlock.h \
  arch/arm64/include/generated/asm/qspinlock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/qspinlock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/wait.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/refcount.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sem.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/sem.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ipc.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/highuid.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rhashtable-types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/osq_lock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/debug_locks.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ktime.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/jiffies.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/vdso/ktime.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timekeeping.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timekeeping32.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/ipcbuf.h \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/sembuf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/shm.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/page.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/personality.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/personality.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/getorder.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/shm.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/shmbuf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/shmparam.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/shmparam.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kcov.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/kcov.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/hrtimer_defs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rbtree.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/seqlock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ww_mutex.h \
    $(wildcard include/config/debug/ww/mutex/slowpath.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/timerqueue.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/seccomp.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/seccomp.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/unistd.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/unistd.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/unistd.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/seccomp.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/unistd.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
    $(wildcard include/config/numa/keep/meminfo.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/sparsemem.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/resource.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/resource.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/resource.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/latencytop.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/prio.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/signal.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/signal.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/signal.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/signal.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/signal-defs.h \
  arch/arm64/include/generated/uapi/asm/siginfo.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/siginfo.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/posix-timers.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/alarmtimer.h \
    $(wildcard include/config/rtc/class.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/task_work.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/rseq.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kcsan.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/magic.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/stat.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kmod.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/umh.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/iommu/support.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/auxvec.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/auxvec.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/auxvec.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/err.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/completion.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/swait.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/uprobes.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/mmu.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/notifier.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcu_segcblist.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/srcutree.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/mmzone.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/numa.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/topology.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/topology.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/sysctl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/elf.h \
    $(wildcard include/config/arch/use/gnu/property.h) \
    $(wildcard include/config/arch/have/elf/prot.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/elf.h \
    $(wildcard include/config/compat/vdso.h) \
  arch/arm64/include/generated/asm/user.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/user.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/elf.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/elf-em.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/fs.h \
    $(wildcard include/config/read/only/thp/for/fs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/fs/verity.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/unicode.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/wait_bit.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kdev_t.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/kdev_t.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dcache.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rculist_bl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/list_bl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/bit_spinlock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/path.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/shrinker.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/radix-tree.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kconfig.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/local_lock.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/local_lock_internal.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/capability.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/capability.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/semaphore.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/fcntl.h \
    $(wildcard include/config/arch/32bit/off/t.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/fcntl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/uapi/asm/fcntl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/asm-generic/fcntl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/openat2.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/migrate_mode.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/percpu-rwsem.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcuwait.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/signal.h \
    $(wildcard include/config/proc/fs.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/jobctl.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/task.h \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
    $(wildcard include/config/have/arch/thread/struct/whitelist.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/uaccess.h \
    $(wildcard include/config/set/fs.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/fault/injection/usercopy.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/arm64/pan.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/kernel-pgtable.h \
    $(wildcard include/config/randomize/base.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/extable.h \
    $(wildcard include/config/bpf/jit.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/key.h \
    $(wildcard include/config/key/notifications.h) \
    $(wildcard include/config/net.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/watch/queue.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ratelimit.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rcu_sync.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/delayed_call.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/uuid.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/uuid.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/errseq.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ioprio.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/rt.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/iocontext.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/fs_types.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/fs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/percpu_counter.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/dqblk_xfs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dqblk_v1.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dqblk_v2.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dqblk_qtree.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/projid.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/uapi/linux/quota.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/nfs_fs_i.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sysfs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/idr.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kobject_ns.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kref.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/rbtree_latch.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/error-injection.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/error-injection.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/tracepoint-defs.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/static_key.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/static_call_types.h \
    $(wildcard include/config/have/static/call.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/arm64/erratum/843419.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
    $(wildcard include/config/superh.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/energy/model.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/ops.h) \
    $(wildcard include/config/dma/declare/coherent.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/arch/has/sync/dma/for/device.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu/all.h) \
    $(wildcard include/config/dma/ops/bypass.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/dev_printk.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/energy_model.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/cpufreq.h \
    $(wildcard include/config/cpu/freq.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/topology.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/sched/mc.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/idle.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/sched/sd_flags.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/ioport.h \
    $(wildcard include/config/io/strict/devmem.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/klist.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/overflow.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/device/bus.h \
    $(wildcard include/config/acpi.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/device/class.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/device/driver.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/arch/arm64/include/asm/device.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/pm_wakeup.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/component.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/percpu-refcount.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/kasan.h \
    $(wildcard include/config/kasan/vmalloc.h) \
    $(wildcard include/config/kasan/generic.h) \
    $(wildcard include/config/kasan/inline.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/of.h \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/of/overlay.h) \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/mod_devicetable.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/property.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/fwnode.h \
  /project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/include/linux/of_graph.h \

/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o: $(deps_/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o)

$(deps_/project/workspace2/frazho01/Gerrit/github/my_test/kernel_test/component_example/component_example.o):
