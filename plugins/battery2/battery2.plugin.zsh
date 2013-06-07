function is_battery_discharging() {
if [[ $(acpi 2&>/dev/null | grep -c '^Battery.*Discharging') -gt 0 ]]; then
  return 1 
else
  return 0 
fi
}

function battery_prompt() {
if is_battery_discharging -lt 1; then
  local on_mains='∞'
fi

local charge_percent=$(acpi | cut -f2 -d ',' | tr -cd '[:digit:]')
if ((${charge_percent} > 50)); then
  local color='green'
elif ((${charge_percent} > 20)); then
  local color='yellow'
else
  local color='red'
fi

echo "$on_mains%{%F{yellow}%}⚡%{%F{$color}%}$charge_percent%%%{%f%}"
}
