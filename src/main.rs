use std::process::Command;
use std::str;
use regex::Regex;
use clap::{App, Arg, SubCommand};

fn list_reviews(closed: bool) {
    let output = Command::new("git")
                    .arg("show-ref")
                    .output()
                    .expect("failed to execute 'git show-ref'");
    match str::from_utf8(&output.stdout) {
        Ok(text) => {
            let mut status = "open";
            if closed {
                status = "closed";
            }
            let regex = format!(r"[a-f0-9]{{40}} refs/code-reviews/{}/(.*)", status);
            match Regex::new(&regex) {
                Ok(re) => {
                    for name in re.captures_iter(text) {
                        println!("{}",&name[1])
                    }
                },
                _ => { }
            }
        }
        _ => {}
    }
    
}

fn main() {
    let matches = App::new("git-code-review")
        .version("1.0")
        .author("Kevin K. <kbknapp@gmail.com>")
        .about("Does awesome things")
        .subcommand(SubCommand::with_name("list")
            .about("Lists code reviews")
            .arg(Arg::with_name("closed")
                .long("closed")
                .help("List closed code reviews")))
        .subcommand(SubCommand::with_name("open")
             .about("Open a code review"))
        .subcommand(SubCommand::with_name("close")
             .about("Close a code review"))
        .subcommand(SubCommand::with_name("view")
             .about("View a code review"))
        .get_matches();

    if let Some(matches) = matches.subcommand_matches("list") {
        list_reviews(matches.is_present("closed"))
    }

}
