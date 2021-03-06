from typing import Optional

class sha224(object):
    name = ...  # type: str
    block_size = ...  # type: int
    digest_size = ...  # type: int
    digestsize = ...  # type: int
    def __init__(self, init: Optional[str]) -> None: ...
    def copy(self) -> "sha224": ...
    def digest(self) -> str: ...
    def hexdigest(self) -> str: ...
    def update(self, arg: str) -> None: ...

class sha256(object):
    name = ...  # type: str
    block_size = ...  # type: int
    digest_size = ...  # type: int
    digestsize = ...  # type: int
    def __init__(self, init: Optional[str]) -> None: ...
    def copy(self) -> "sha256": ...
    def digest(self) -> str: ...
    def hexdigest(self) -> str: ...
    def update(self, arg: str) -> None: ...
