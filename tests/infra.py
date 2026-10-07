"""Run with python3 tests/infra.py; requires bash, git, and jq."""
import os
from pathlib import Path
import subprocess
import tempfile

script = Path(__file__).resolve().parents[1] / "infra"
with tempfile.TemporaryDirectory() as directory:
    root = Path(directory)
    (root / "tofu").mkdir()
    (root / "tofu/locals.tf").write_text('  domain = "example.test"\n')
    (root / "mk").mkdir()
    (root / "mk/common.mk").write_text("")
    (root / "Makefile").write_text("ssh: ## [dev] Connect\n")
    (root / "projects/demo").mkdir(parents=True)
    (root / "projects/demo/Makefile").write_text("up: ## [setup] Start\n")
    (root / "bin").mkdir()
    tailscale = root / "bin/tailscale"
    tailscale.write_text('''#!/bin/sh
printf '%s\\n' '{"BackendState":"Running","Self":{"HostName":"dev-us"},"Peer":{"eu":{"ID":"eu","HostName":"dev-eu","Online":true}}}'
''')
    tailscale.chmod(0o755)
    ssh = root / "bin/ssh"
    ssh.write_text('#!/bin/sh\nprintf "%s\\n" "$@"\n')
    ssh.chmod(0o755)
    subprocess.run(["git", "init", "-q", str(root)], check=True)
    env = dict(os.environ, INFRA_DIR=str(root), PATH=f"{root / 'bin'}:{os.environ['PATH']}")

    def run(*args):
        return subprocess.run(["bash", str(script), *args], env=env, text=True, capture_output=True)

    main = run()
    assert main.returncode == 0, main.stderr
    assert "infra dev —" in main.stdout and "infra demo —" in main.stdout
    assert "infra setup —" not in main.stdout and "infra foundation —" not in main.stdout
    assert "make ssh" not in main.stdout and "dev-eu" not in main.stdout
    assert "self=dev-us" in main.stdout and "exit node: none" in main.stdout
    assert "make ssh" in run("dev").stdout
    assert "make up" in run("demo").stdout
    assert run("missing").returncode == 1
    for name in ["joceline", "maeve"]:
        assert f"Test {name}'s SSH login" in run("help", name).stdout
        available_key = any(path.is_file() for path in [
            Path.home() / f".local/share/infra/onboarding/{name}/{name}-dev-us",
            Path.home() / f".ssh/{name}-dev-us",
        ])
        login = run(name)
        if available_key:
            assert f"infra {name} —" in main.stdout
            assert login.returncode == 0 and f"{name}@dev-us.tailnet.example.test" in login.stdout
            assert "IdentitiesOnly=yes" in login.stdout and "-t" in login.stdout
        else:
            assert f"infra {name} —" not in main.stdout
            assert login.returncode == 1 and "private key is missing" in login.stderr
    assert "peer: dev-eu=online" in run("tailnet").stdout
    tailscale.write_text(tailscale.read_text().replace('"Self":', '"ExitNodeStatus":{"ID":"eu"},"Self":'))
    assert "exit node: dev-eu" in run("tailnet").stdout
print("infra checks passed")
