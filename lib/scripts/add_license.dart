// ignore_for_file: avoid_print

/*
<DiveCalc is an app to help Public Safety Divers>
Copyright (C) <2024>  <Nicollas Soares Goncalves>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'dart:io';

void main() {
  final directory = Directory('lib');
  final licenseText = '''
/*
<DiveCalc is an app to help Public Safety Divers>
Copyright (C) <2024>  <Nicollas Soares Goncalves>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, version 3.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

''';

  if (directory.existsSync()) {
    directory.listSync(recursive: true).forEach((file) {
      if (file is File && file.path.endsWith('.dart')) {
        final content = file.readAsStringSync();
        if (!content.startsWith(
            '/*<DiveCalc is an app to help Public Safety Divers>')) {
          file.writeAsStringSync(licenseText + content);
          print('License added to ${file.path}');
        } else {
          print('License already present in ${file.path}');
        }
      }
    });
  } else {
    print('Directory "lib" does not exist.');
  }
}
