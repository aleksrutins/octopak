using Mkdirp;
namespace Octopak.Commands {
    public class Install {
        public int run(string pkg) {
            stdout.puts(@"\033[1;32mInstalling $pkg\033[0m\n");
            var url = @"https://raw.githubusercontent.com/$pkg/master/octopak.json";
            var session = new Soup.Session();
            var msg = new Soup.Message("GET", url);
            session.send_message(msg);
            var node = Json.from_string((string)msg.response_body.data);
            var manifestFilename = node.get_object().get_string_member("manifest");
            var manifestURL = @"https://raw.githubusercontent.com/$pkg/master/$manifestFilename";
            msg = new Soup.Message("GET", manifestURL);
            var manifestDir = @"$(Environment.get_variable("HOME"))/.local/share/octopak/manifests/$pkg";
            mkdirp(manifestDir + "/", 0777);
            stdout.puts(@"\033[1mDownloading manifest\033[0m\n");
            session.send_message(msg);
            try {
                var file = File.new_for_path(@"$manifestDir/$manifestFilename");
                if(file.query_exists()) {
                    file.delete();
                }
                var stream = file.create(FileCreateFlags.REPLACE_DESTINATION);
                var dos = new DataOutputStream(stream);
                dos.put_string((string)msg.response_body.data);
            } catch(Error e) {
                stdout.puts("\033[1;31mError\033[0m\n");
                return 1;
            } // All streams are cleaned up here
            stdout.puts(@"\033[1mBuilding & installing\033[0m\n");
            var buildDir = @"$(Environment.get_variable("HOME"))/.local/share/octopak/build/$pkg";
            mkdirp(buildDir + "/", 0777);
            Posix.system(@"flatpak-builder '$buildDir' '$manifestDir/$manifestFilename' --force-clean --user --install");
            return 0;
        }
    }
}
