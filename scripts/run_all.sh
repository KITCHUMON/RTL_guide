#!/bin/bash
# Local simulation script for GitHub Codespaces

echo "Starting RTL simulations..."

# Create results directory
mkdir -p results

# Find all modules
find rtl -name "rtl_*.v" -exec dirname {} \; | while read module_dir; do
    module_name=$(basename $module_dir)
    echo "Testing $module_name..."
    
    # Compile
    if iverilog -o results/$module_name/sim_$module_name.vvp \
        $module_dir/rtl_${module_name}.v $module_dir/tb_${module_name}.v; then
        
        # Run simulation
        vvp results/$module_name/sim_$module_name.vvp +vcd=results/$module_name/sim_$module_name.vcd
        echo "✅ $module_name: Success"
    else
        echo "❌ $module_name: Compilation failed"
    fi
done

echo "All simulations completed!"
