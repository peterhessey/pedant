import datetime
import os
import argparse


DEFAULT_LOG_DIR = "/Users/peter.hessey/Documents/Notes"


def get_log_template(day: str, month: str, year: str, new_to_do: str | None) -> str:
    if new_to_do is None:
        new_to_do = "- [ ]"

    template = f"""# {day}/{month}/{year}



## To-Do
{new_to_do}
## Notes

"""

    return template


def get_date_strings(minus_days: int = 0) -> tuple[str, str, str]:
    date = datetime.date.today() - datetime.timedelta(days=minus_days)
    year = str(date.year)
    month = str(date.month)
    day = str(date.day)
    if len(month) == 1:
        month = "0" + month
    if len(day) == 1:
        day = "0" + day

    return day, month, year


def get_yesterday_to_do_path(log_dir: str = DEFAULT_LOG_DIR) -> str | None:
    for i in range(365):  # only checks the past year of logs
        day, month, year = get_date_strings(minus_days=i)
        log_path = f"{log_dir}/{year}/{month}_{year[-2:]}/{day}_{month}.md"
        if os.path.exists(log_path):
            return log_path

    return None


def load_old_to_do_list(log_path: str) -> str | None:
    new_to_do = ""
    if not os.path.exists(log_path):
        return None
    with open(log_path, "r") as old_log_file:
        lines = old_log_file.readlines()

        line_index = lines.index("## To-Do\n") + 1
        end_index = lines.index("## Notes\n")

        while line_index < end_index:
            if lines[line_index][:5] == "- [ ]":
                new_to_do += lines[line_index]
                line_index += 1
                while line_index < end_index and lines[line_index][:2] == "  ":
                    new_to_do += lines[line_index]
                    line_index += 1

            elif line_index < end_index and (
                lines[line_index][:2] == "  " or lines[line_index][:5] == "- [x]"
            ):
                line_index += 1
            else:
                new_to_do += lines[line_index]
                line_index += 1

    return new_to_do[:-1] if new_to_do else None


def get_new_log_path(
    day: str,
    month: str,
    year: str,
    log_dir: str = DEFAULT_LOG_DIR,
) -> str:
    log_path = f"{log_dir}/{year}"
    if not os.path.exists(log_path):
        os.mkdir(log_path)

    log_path = f"{log_path}/{month}_{year[-2:]}"
    if not os.path.exists(log_path):
        os.mkdir(log_path)

    log_path = f"{log_path}/{day}_{month}.md"
    return log_path


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create a new daily log file with to-do items from previous log"
    )
    parser.add_argument(
        "--log-dir",
        type=str,
        default=DEFAULT_LOG_DIR,
        help=f"Base directory for logs (default: {DEFAULT_LOG_DIR})",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_arguments()
    log_dir = args.log_dir

    day, month, year = get_date_strings()

    log_path = get_new_log_path(day, month, year, log_dir=log_dir)

    if not os.path.exists(log_path):
        old_log_path = get_yesterday_to_do_path(log_dir=log_dir)
        if old_log_path is not None:
            new_to_do = load_old_to_do_list(old_log_path)
        else:
            new_to_do = ""

        template = get_log_template(day, month, year, new_to_do)
        with open(log_path, "w", encoding="utf-8") as log_file:
            log_file.write(template)


if __name__ == "__main__":
    main()

