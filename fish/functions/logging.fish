function log_info
    echo (set_color blue)"[INFO]"(set_color normal)" $argv"
end

function log_warn
    echo (set_color yellow)"[WARN]"(set_color normal)" $argv"
end

function log_error
    echo (set_color red)"[ERROR]"(set_color normal)" $argv"
end

function log_ok
    echo (set_color green)"[OK]"(set_color normal)" $argv"
end

function log_start
    echo (set_color cyan)"[START]"(set_color normal)" $argv"
end
