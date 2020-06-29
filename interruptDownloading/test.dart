import 'dart:io';
import 'dart:convert';

enum State
{
    Initial,
    Complete0PercentFound,
    ProcessKilled,
}

const skipTestReturnCode = 254;

void deleteIfExists(final Directory path)
{
    if (path.existsSync())
        path.deleteSync(recursive: true);
}

Future main(final List<String> args) async
{
    assert(args.length > 4);

    final currentDirectory = Directory.current;
    final cnpmRoot = currentDirectory.path + '/3rd_party';
    deleteIfExists(Directory(cnpmRoot));

    final process = await Process.start(args[0],
            [ '-G', args[1], '-DCMAKE_BUILD_TYPE=${args[2]}', '-DCNPM_SOURCE_ROOT=${args[3]}', args[4] ],
            environment: { 'CNPM_ROOT': cnpmRoot });

    var state = State.Initial;
    await for (var data in process.stdout.transform(utf8.decoder))
    {
        print('======================= stdout new element start');
        print(data);
        print('======================= stdout new element end');

        switch (state)
        {
            case State.Initial:
                if (data.indexOf(RegExp(r'0%[ \t]+complete')) != -1)
                    state = State.Complete0PercentFound;

                break;

            case State.Complete0PercentFound:
                final killed = process.kill();
                print(killed);
                if (!killed)
                {
                    exitCode = skipTestReturnCode;
                    return;
                }

                state = State.ProcessKilled;
                break;

            case State.ProcessKilled:
                print('wait for finished');
                if (data.indexOf(RegExp(r'after foreach;')) != -1)
                {
                    // looks like the package was downloaded successfully
                    exitCode = skipTestReturnCode;
                    return;
                }
                break;
        }
    }

    final packagePath = cnpmRoot + '/boost-1.72.0-amd64-1sdk18362_vsbt19.7z';
    if (File(packagePath).existsSync())
    {
        print("'$packagePath' exists");
        exitCode = 1;
    }
}

