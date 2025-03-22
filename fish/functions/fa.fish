# fish aliases list display
function fa
    echo (set_color cyan)"📦 Defined Aliases:"(set_color normal)
    functions -n | while read -l f
        if string match -qr '^alias ' (functions $f)
            echo (set_color yellow)"$f"(set_color normal)" → "(functions $f | string match -r '^alias .+' | string replace -r '^alias \S+ ' '')
        end
    end
end
