#ifndef SUNXI_ENDIAN_COMPAT_H_
#define SUNXI_ENDIAN_COMPAT_H_

#ifdef __APPLE__ 

#include <CoreFoundation/CoreFoundation.h>
#define htole32(x) CFSwapInt32HostToLittle(x)
#define le32toh(x) CFSwapInt32LittleToHost(x)
#define htole16(x) CFSwapInt16HostToLittle(x)
#define le16toh(x) CFSwapInt16LittleToHost(x)

#else

#include <endian.h>

/* On little endian machines, these macros are null */
#ifndef __BIG_ENDIAN__
# define htole32(x) (x)
# define le32toh(x) (x)
# define htole16(x) (x)
# define le16toh(x) (x)
#endif

#endif

#endif
