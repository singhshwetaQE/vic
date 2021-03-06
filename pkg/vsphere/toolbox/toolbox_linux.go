// Copyright 2017 VMware, Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package toolbox

import (
	"fmt"
	"os"
	"syscall"
	"time"
)

func fileExtendedInfoFormat(info os.FileInfo) string {
	const format = "<fxi>" +
		"<Name>%s</Name>" +
		"<ft>%d</ft>" +
		"<fs>%d</fs>" +
		"<mt>%d</mt>" +
		"<at>%d</at>" +
		"<uid>%d</uid>" +
		"<gid>%d</gid>" +
		"<perm>%d</perm>" +
		"<slt>%s</slt>" +
		"</fxi>"

	props := 0

	if info.IsDir() {
		props |= vixFileAttributesDirectory
	}

	if info.Mode()&os.ModeSymlink == os.ModeSymlink {
		props |= vixFileAttributesSymlink
	}

	size := info.Size()
	mtime := info.ModTime().Unix()
	perm := info.Mode().Perm()

	sys := info.Sys().(*syscall.Stat_t)

	atime := time.Unix(sys.Atim.Unix()).Unix()
	uid := sys.Uid
	gid := sys.Gid

	targ := ""

	return fmt.Sprintf(format, info.Name(), props, size, mtime, atime, uid, gid, perm, targ)
}
