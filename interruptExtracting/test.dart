import 'dart:io';
import 'dart:convert';

const skipTestReturnCode = 254;

void deleteIfExists(final Directory path)
{
    if (path.existsSync())
        path.deleteSync(recursive: true);
}

Future main(final List<String> args) async
{
    assert(args.length > 4);

    final cnpmRoot = Directory.current.path + '/3rd_party';
    deleteIfExists(Directory(cnpmRoot));

    final process = await Process.start(args[0],
            [ '-G', args[1], '-DCMAKE_BUILD_TYPE=${args[2]}', '-DCNPM_SOURCE_ROOT=${args[3]}', args[4] ],
            environment: { 'NPM_ROOT': cnpmRoot });

    await for (var data in process.stdout.transform(utf8.decoder))
    {
        print('======================= stdout new element start');
        print(data);
        print('======================= stdout new element end');

        if (data.indexOf(RegExp(r'after foreach;')) != -1)
            break;
    }

    sleep(Duration(milliseconds: 600));

    // see https://stackoverflow.com/questions/28497734/kill-process-group
    // Nevertheless all process branch is not killed the sense is the same:
    // untill an archive successfully extracted there should be no folder
    final killed = process.kill();
    print('killed - $killed');
    if (!killed)
    {
        exitCode = skipTestReturnCode;
        return;
    }

    final packagePath = cnpmRoot + '/boost-1.72.0-amd64-1sdk18362_vsbt19';
    if (Directory(packagePath).existsSync())
    {
        print("'$packagePath' exists");
        exitCode = 1;
    }
}

