#include <sstream>

#include <gos/pid/toolkit/version.h>

namespace gos {
namespace pid {
namespace toolkit {
namespace version {

const Option WithAll = WithPrefix | WithBuildDateTime;
const Option WithPrefix = 0x01;
const Option WithBuildDateTime = 0x02;

std::string generate(const Option& option) {
  std::stringstream stream;
  if (option & WithPrefix) {
    stream << "V";
  }
  stream << GPT_VERSION_STRING;
  if (option & WithBuildDateTime) {
#if defined (__DATE__) && defined (__TIME__)
    stream << " built " << __DATE__ << " " << __TIME__;
#else
    stream << " built date and time not available";
#endif
  }
  return stream.str();
}

} // namespace version
} // namespace toolkit
} // namespace pid
} // namespace gos
