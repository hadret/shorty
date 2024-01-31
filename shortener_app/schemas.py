from pydantic import BaseModel


class URLBase(BaseModel):
    target_url: str
    target_key: str | None = None


class URL(URLBase):
    is_active: bool
    clicks: int

    class Config:
        from_attributes = True


class URLInfo(URL):
    url: str
    admin_url: str
