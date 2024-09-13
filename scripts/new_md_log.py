import datetime
import os
import subprocess

LOG_DIR = "/Users/peter.hessey/Documents/Notes"


def get_log_template(day, month, year, new_to_do):
    if new_to_do is None:
        new_to_do = "- [ ]"

    template = f"""# {day}/{month}/{year}



## To-Do
{new_to_do}
## Notes

"""

    return template


def get_date_strings(minus_days=0):
    date = datetime.date.today() - datetime.timedelta(days=minus_days)
    year = str(date.year)
    month = str(date.month)
    day = str(date.day)
    if len(month) == 1:
        month = "0" + month
    if len(day) == 1:
        day = "0" + day

    return day, month, year


def get_yesterday_to_do_path():
    for i in range(365):  # only checks the past year of logs
        day, month, year = get_date_strings(minus_days=i)
        log_path = f"{LOG_DIR}/{year}/{month}_{year[-2:]}/{day}_{month}.md"
        if os.path.exists(log_path):
            return log_path

    return None


def load_old_to_do_list(log_path):
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
                while lines[line_index][:2] == "  ":
                    new_to_do += lines[line_index]
                    line_index += 1

            elif lines[line_index][:2] == "  " or lines[line_index][:5] == "- [x]":
                line_index += 1
            else:
                new_to_do += lines[line_index]
                line_index += 1

    return new_to_do[:-1]


def get_new_log_path(day, month, year):
    log_path = f"{LOG_DIR}/{year}"
    if not os.path.exists(log_path):
        os.mkdir(log_path)

    log_path = f"{log_path}/{month}_{year[-2:]}"
    if not os.path.exists(log_path):
        os.mkdir(log_path)

    log_path = f"{log_path}/{day}_{month}.md"
    return log_path


def main():
    day, month, year = get_date_strings()

    log_path = get_new_log_path(day, month, year)

    if not os.path.exists(log_path):
        old_log_path = get_yesterday_to_do_path()
        if old_log_path is not None:
            new_to_do = load_old_to_do_list(old_log_path)
        else:
            new_to_do = ""

        template = get_log_template(day, month, year, new_to_do)
        with open(log_path, "w", encoding="utf-8") as log_file:
            log_file.write(template)


if __name__ == "__main__":
    main()
