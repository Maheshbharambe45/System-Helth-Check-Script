#!/bin/bash

LOG_FILE="/var/log/sys_health.log"
EMAIL="bharambemahesh9@gmail.com"

show_disk_usage() {
    echo "Displaying current disk usage:"
    df -h
}

list_active_services() {
    echo "Listing all active system services:"
    systemctl list-units --type=service --state=running
}

display_memory_status() {
    echo "Memory status in megabytes:"
    free -m
}

display_cpu_load() {
    echo "Current CPU utilization:"
    top -bn1 | grep "Cpu"
}

send_system_report() {
    REPORT_FILE="/tmp/system_health_report.txt"
    echo "Creating system health report..."

    {
        echo "-----SYSTEM HEALTH REPORT UNING SCRIPT-----"
        echo "Report generated on: $(date)"
        echo -e "\nDisk Usage Overview:"
        df -h
        echo -e "\nActive Services:"
        systemctl list-units --type=service --state=running
        echo -e "\nMemory Usage Details:"
        free -m
        echo -e "\nCPU Load Snapshot:"
        top -bn1 | grep "Cpu"
    } > "$REPORT_FILE"

    mail -s "System Health Status Report" "$EMAIL" < "$REPORT_FILE"
    echo "Report emailed successfully to $EMAIL."
}

while true; do
    clear
    echo "--------------------------------"
    echo "      SYSTEM HEALTH MONITOR     "
    echo "--------------------------------"
    echo "1) Show Disk Usage"
    echo "2) List Active Services"
    echo "3) Show Memory Status"
    echo "4) Show CPU Load"
    echo "5) Email Full Health Report"
    echo "6) Quit"
    echo -n "Choose an option: "
    read -r option

    case $option in
        1) show_disk_usage ;;
        2) list_active_services ;;
        3) display_memory_status ;;
        4) display_cpu_load ;;
        5) send_system_report ;;
        6) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac

    echo -e "\nPress Enter to continue..."
    read -r
done

