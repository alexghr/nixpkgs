{ lib
, python3Packages
, fetchFromGitHub
}:

python3Packages.buildPythonApplication rec {
  pname = "itchiodl";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "Emersont1";
    repo = "itchio";
    rev = "v${version}";
    hash = "sha256-U9oLrocwVdTqTQ26/MMiYO++yFGdOjnn8g+ea1jCl/A=";
  };

  format = "pyproject";

  nativeBuildInputs = with python3Packages; [
    poetry-core
  ];

  propagatedBuildInputs = with python3Packages; [
    beautifulsoup4
    clint
    requests
  ];

  meta = with lib; {
    homepage = "https://github.com/Emersont1/itchio";
    description = "itch.io download tool";
    license = licenses.mit;
    maintainers = with maintainers; [ fgaz ];
  };
}
