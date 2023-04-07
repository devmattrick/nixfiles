{lib, ...}: {
  config = {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      localVariables = {
        ZSH_AUTOSUGGEST_STRATEGY = ["history" "completion"];
      };
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$localip"
          "$directory"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_metrics"
          "$git_status"
          "$fill"
          "$cmd_duration"
          "$line_break"
          "$shell"
          "$character"
        ];

        fill = {
          symbol = " ";
        };

        directory = {
          style = "bright-cyan";
          repo_root_style = "bright-red";
          repo_root_format = "[$before_root_path]($style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
        };

        git_branch = {
          style = "purple";
          truncation_length = 24;
          format = "[$symbol$branch(:$remote_branch)]($style) ";
        };

        cmd_duration = {
          min_time = 0;
          format = "[$duration]($style)";
          style = "yellow";
        };
      };
    };
  };
}
