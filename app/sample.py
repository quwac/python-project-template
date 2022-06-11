import os

from sample.sample_module import sample_print


def b():
    pass


def a():
    _ = os.path.basename(__file__)


if __name__ == "__main__":
    sample_print()
