function sshagent_findsockets
    find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null
end

function sshagent_testsocket
    if not command -v ssh-add >/dev/null
        log_error "ssh-add not found; aborting agent test."
        return 1
    end

    if test -n "$argv[1]"
        set -xg SSH_AUTH_SOCK $argv[1]
    end

    if test -z "$SSH_AUTH_SOCK"
        log_warn "SSH_AUTH_SOCK not set."
        return 2
    end

    if test -S "$SSH_AUTH_SOCK"
        ssh-add -l >/dev/null 2>&1
        if test $status -eq 2
            log_error "Socket $SSH_AUTH_SOCK is dead — deleting it."
            rm -f "$SSH_AUTH_SOCK"
            return 4
        else
            log_ok "Found working ssh-agent at $SSH_AUTH_SOCK"
            return 0
        end
    else
        log_error "$SSH_AUTH_SOCK is not a valid socket!"
        return 3
    end
end

function cleanup_ssh_agent --on-event fish_exit
    if test -n "$SSH_AGENT_PID"
        log_info "Killing ssh-agent (PID $SSH_AGENT_PID)"
        ssh-agent -k >/dev/null 2>&1
    end
end

function ssh_agent_init
    set -l AGENTFOUND 0

    log_info "Checking current SSH agent..."
    if sshagent_testsocket
        set AGENTFOUND 1
    end

    if test $AGENTFOUND -eq 0
        log_info "Searching for orphaned agent sockets..."
        for agentsocket in (sshagent_findsockets)
            if test $AGENTFOUND -ne 0
                break
            end
            if sshagent_testsocket $agentsocket
                set AGENTFOUND 1
            end
        end
    end

    if test $AGENTFOUND -eq 0
        log_start "No valid agent found — starting new ssh-agent..."
        eval (ssh-agent -c | sed 's/^setenv/set -x/')
    end
end
