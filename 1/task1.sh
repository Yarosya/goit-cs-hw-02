
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"
> "$log_file"

for site in "${websites[@]}"; do
    response=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$site")

    if [[ "$response" -eq 200 ]]; then
        status="UP"
    else
        status="DOWN"
    fi
    echo "$site is $status" >> "$log_file"
done

echo "Результати перевірки записано у файл $log_file"