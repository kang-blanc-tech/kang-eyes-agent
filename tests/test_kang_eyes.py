"""Kang Eyes Agent: its own changes from Agent Reach 1.6.1 (KANG-EYES-CHANGES.md). Each test fails if a change is undone."""
from agent_reach.channels import get_channel
from agent_reach.runtime import manage, state, update_notice

LANG_VARS = ("AGENT_REACH_LANG", "LC_ALL", "LC_MESSAGES", "LANG")


def _no_language(monkeypatch):
    for var in LANG_VARS:
        monkeypatch.delenv(var, raising=False)


def test_english_unless_chinese_is_asked_for(monkeypatch):
    _no_language(monkeypatch)
    assert manage._skill_lang() == "en"                 # upstream: "zh"
    monkeypatch.setenv("AGENT_REACH_LANG", "zh")
    assert manage._skill_lang() == "zh"
    _no_language(monkeypatch)
    monkeypatch.setenv("LANG", "zh_CN.UTF-8")
    assert manage._skill_lang() == "zh"
    monkeypatch.setenv("AGENT_REACH_LANG", "en")
    assert manage._skill_lang() == "en"


def test_skill_is_english_by_default(monkeypatch):
    _no_language(monkeypatch)
    text = manage.render_skill()
    assert "Read-only access to platform content" in text
    assert "kang-eyes" in text and "agent-reach" not in text


def test_youtube_captions_ask_for_the_english_track_first():
    action = next(a for a in get_channel("youtube").actions if a.name == "subtitle")
    lang = next(p for p in action.params if p.name == "lang")
    assert lang.default == "en,en-orig,zh-Hans,zh"       # upstream: "zh-Hans,zh,en,en-orig"


def test_updates_come_only_from_our_repository():
    assert update_notice.REPO == "kang-blanc-tech/kang-eyes-agent"


def test_own_name_and_data_folder():
    assert manage.SKILL_NAME == "kang-eyes"
    assert state.root().name == ".kang-eyes"
