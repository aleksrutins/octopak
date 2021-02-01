using Posix;
[CCode(cheader_filename="mkdirp/mkdirp.h")]
namespace Mkdirp {
	public void mkdirp(string path, mode_t mode);
}
