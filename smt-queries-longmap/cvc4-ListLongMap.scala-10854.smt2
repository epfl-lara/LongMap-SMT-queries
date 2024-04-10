; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127106 () Bool)

(assert start!127106)

(declare-fun b!1493872 () Bool)

(declare-fun res!1016310 () Bool)

(declare-fun e!836824 () Bool)

(assert (=> b!1493872 (=> (not res!1016310) (not e!836824))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493872 (= res!1016310 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493873 () Bool)

(declare-fun res!1016312 () Bool)

(assert (=> b!1493873 (=> (not res!1016312) (not e!836824))))

(declare-fun e!836821 () Bool)

(assert (=> b!1493873 (= res!1016312 e!836821)))

(declare-fun c!138312 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493873 (= c!138312 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1016323 () Bool)

(declare-fun e!836822 () Bool)

(assert (=> start!127106 (=> (not res!1016323) (not e!836822))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127106 (= res!1016323 (validMask!0 mask!2687))))

(assert (=> start!127106 e!836822))

(assert (=> start!127106 true))

(declare-datatypes ((array!99753 0))(
  ( (array!99754 (arr!48145 (Array (_ BitVec 32) (_ BitVec 64))) (size!48695 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99753)

(declare-fun array_inv!37173 (array!99753) Bool)

(assert (=> start!127106 (array_inv!37173 a!2862)))

(declare-fun b!1493874 () Bool)

(declare-fun e!836820 () Bool)

(assert (=> b!1493874 (= e!836822 e!836820)))

(declare-fun res!1016314 () Bool)

(assert (=> b!1493874 (=> (not res!1016314) (not e!836820))))

(assert (=> b!1493874 (= res!1016314 (= (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651173 () array!99753)

(assert (=> b!1493874 (= lt!651173 (array!99754 (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48695 a!2862)))))

(declare-fun e!836825 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1493875 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493875 (= e!836825 (or (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) (select (arr!48145 a!2862) j!93))))))

(declare-fun b!1493876 () Bool)

(declare-fun res!1016321 () Bool)

(assert (=> b!1493876 (=> (not res!1016321) (not e!836822))))

(declare-datatypes ((List!34646 0))(
  ( (Nil!34643) (Cons!34642 (h!36031 (_ BitVec 64)) (t!49340 List!34646)) )
))
(declare-fun arrayNoDuplicates!0 (array!99753 (_ BitVec 32) List!34646) Bool)

(assert (=> b!1493876 (= res!1016321 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34643))))

(declare-fun b!1493877 () Bool)

(declare-fun res!1016318 () Bool)

(declare-fun e!836823 () Bool)

(assert (=> b!1493877 (=> (not res!1016318) (not e!836823))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12385 0))(
  ( (MissingZero!12385 (index!51932 (_ BitVec 32))) (Found!12385 (index!51933 (_ BitVec 32))) (Intermediate!12385 (undefined!13197 Bool) (index!51934 (_ BitVec 32)) (x!133529 (_ BitVec 32))) (Undefined!12385) (MissingVacant!12385 (index!51935 (_ BitVec 32))) )
))
(declare-fun lt!651171 () SeekEntryResult!12385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99753 (_ BitVec 32)) SeekEntryResult!12385)

(assert (=> b!1493877 (= res!1016318 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!651171))))

(declare-fun b!1493878 () Bool)

(declare-fun res!1016311 () Bool)

(assert (=> b!1493878 (=> (not res!1016311) (not e!836822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493878 (= res!1016311 (validKeyInArray!0 (select (arr!48145 a!2862) j!93)))))

(declare-fun b!1493879 () Bool)

(declare-fun e!836818 () Bool)

(assert (=> b!1493879 (= e!836818 true)))

(declare-fun lt!651169 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493879 (= lt!651169 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493880 () Bool)

(assert (=> b!1493880 (= e!836824 (not e!836818))))

(declare-fun res!1016308 () Bool)

(assert (=> b!1493880 (=> res!1016308 e!836818)))

(assert (=> b!1493880 (= res!1016308 (or (and (= (select (arr!48145 a!2862) index!646) (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48145 a!2862) index!646) (select (arr!48145 a!2862) j!93))) (= (select (arr!48145 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493880 e!836825))

(declare-fun res!1016315 () Bool)

(assert (=> b!1493880 (=> (not res!1016315) (not e!836825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99753 (_ BitVec 32)) Bool)

(assert (=> b!1493880 (= res!1016315 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50110 0))(
  ( (Unit!50111) )
))
(declare-fun lt!651170 () Unit!50110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50110)

(assert (=> b!1493880 (= lt!651170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493881 () Bool)

(declare-fun res!1016322 () Bool)

(assert (=> b!1493881 (=> (not res!1016322) (not e!836822))))

(assert (=> b!1493881 (= res!1016322 (and (= (size!48695 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48695 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48695 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493882 () Bool)

(declare-fun res!1016317 () Bool)

(assert (=> b!1493882 (=> (not res!1016317) (not e!836822))))

(assert (=> b!1493882 (= res!1016317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493883 () Bool)

(assert (=> b!1493883 (= e!836820 e!836823)))

(declare-fun res!1016320 () Bool)

(assert (=> b!1493883 (=> (not res!1016320) (not e!836823))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493883 (= res!1016320 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48145 a!2862) j!93) mask!2687) (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!651171))))

(assert (=> b!1493883 (= lt!651171 (Intermediate!12385 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493884 () Bool)

(declare-fun res!1016313 () Bool)

(assert (=> b!1493884 (=> (not res!1016313) (not e!836822))))

(assert (=> b!1493884 (= res!1016313 (validKeyInArray!0 (select (arr!48145 a!2862) i!1006)))))

(declare-fun b!1493885 () Bool)

(assert (=> b!1493885 (= e!836823 e!836824)))

(declare-fun res!1016316 () Bool)

(assert (=> b!1493885 (=> (not res!1016316) (not e!836824))))

(declare-fun lt!651174 () SeekEntryResult!12385)

(assert (=> b!1493885 (= res!1016316 (= lt!651174 (Intermediate!12385 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651172 () (_ BitVec 64))

(assert (=> b!1493885 (= lt!651174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651172 mask!2687) lt!651172 lt!651173 mask!2687))))

(assert (=> b!1493885 (= lt!651172 (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493886 () Bool)

(assert (=> b!1493886 (= e!836821 (= lt!651174 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651172 lt!651173 mask!2687)))))

(declare-fun b!1493887 () Bool)

(declare-fun res!1016309 () Bool)

(assert (=> b!1493887 (=> (not res!1016309) (not e!836822))))

(assert (=> b!1493887 (= res!1016309 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48695 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48695 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48695 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99753 (_ BitVec 32)) SeekEntryResult!12385)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99753 (_ BitVec 32)) SeekEntryResult!12385)

(assert (=> b!1493888 (= e!836821 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651172 lt!651173 mask!2687) (seekEntryOrOpen!0 lt!651172 lt!651173 mask!2687)))))

(declare-fun b!1493889 () Bool)

(declare-fun res!1016319 () Bool)

(assert (=> b!1493889 (=> (not res!1016319) (not e!836825))))

(assert (=> b!1493889 (= res!1016319 (= (seekEntryOrOpen!0 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) (Found!12385 j!93)))))

(assert (= (and start!127106 res!1016323) b!1493881))

(assert (= (and b!1493881 res!1016322) b!1493884))

(assert (= (and b!1493884 res!1016313) b!1493878))

(assert (= (and b!1493878 res!1016311) b!1493882))

(assert (= (and b!1493882 res!1016317) b!1493876))

(assert (= (and b!1493876 res!1016321) b!1493887))

(assert (= (and b!1493887 res!1016309) b!1493874))

(assert (= (and b!1493874 res!1016314) b!1493883))

(assert (= (and b!1493883 res!1016320) b!1493877))

(assert (= (and b!1493877 res!1016318) b!1493885))

(assert (= (and b!1493885 res!1016316) b!1493873))

(assert (= (and b!1493873 c!138312) b!1493886))

(assert (= (and b!1493873 (not c!138312)) b!1493888))

(assert (= (and b!1493873 res!1016312) b!1493872))

(assert (= (and b!1493872 res!1016310) b!1493880))

(assert (= (and b!1493880 res!1016315) b!1493889))

(assert (= (and b!1493889 res!1016319) b!1493875))

(assert (= (and b!1493880 (not res!1016308)) b!1493879))

(declare-fun m!1377639 () Bool)

(assert (=> b!1493874 m!1377639))

(declare-fun m!1377641 () Bool)

(assert (=> b!1493874 m!1377641))

(declare-fun m!1377643 () Bool)

(assert (=> b!1493879 m!1377643))

(declare-fun m!1377645 () Bool)

(assert (=> b!1493878 m!1377645))

(assert (=> b!1493878 m!1377645))

(declare-fun m!1377647 () Bool)

(assert (=> b!1493878 m!1377647))

(declare-fun m!1377649 () Bool)

(assert (=> b!1493876 m!1377649))

(declare-fun m!1377651 () Bool)

(assert (=> b!1493885 m!1377651))

(assert (=> b!1493885 m!1377651))

(declare-fun m!1377653 () Bool)

(assert (=> b!1493885 m!1377653))

(assert (=> b!1493885 m!1377639))

(declare-fun m!1377655 () Bool)

(assert (=> b!1493885 m!1377655))

(assert (=> b!1493877 m!1377645))

(assert (=> b!1493877 m!1377645))

(declare-fun m!1377657 () Bool)

(assert (=> b!1493877 m!1377657))

(declare-fun m!1377659 () Bool)

(assert (=> b!1493875 m!1377659))

(assert (=> b!1493875 m!1377645))

(assert (=> b!1493889 m!1377645))

(assert (=> b!1493889 m!1377645))

(declare-fun m!1377661 () Bool)

(assert (=> b!1493889 m!1377661))

(declare-fun m!1377663 () Bool)

(assert (=> start!127106 m!1377663))

(declare-fun m!1377665 () Bool)

(assert (=> start!127106 m!1377665))

(declare-fun m!1377667 () Bool)

(assert (=> b!1493882 m!1377667))

(declare-fun m!1377669 () Bool)

(assert (=> b!1493884 m!1377669))

(assert (=> b!1493884 m!1377669))

(declare-fun m!1377671 () Bool)

(assert (=> b!1493884 m!1377671))

(declare-fun m!1377673 () Bool)

(assert (=> b!1493888 m!1377673))

(declare-fun m!1377675 () Bool)

(assert (=> b!1493888 m!1377675))

(declare-fun m!1377677 () Bool)

(assert (=> b!1493880 m!1377677))

(assert (=> b!1493880 m!1377639))

(declare-fun m!1377679 () Bool)

(assert (=> b!1493880 m!1377679))

(declare-fun m!1377681 () Bool)

(assert (=> b!1493880 m!1377681))

(declare-fun m!1377683 () Bool)

(assert (=> b!1493880 m!1377683))

(assert (=> b!1493880 m!1377645))

(assert (=> b!1493883 m!1377645))

(assert (=> b!1493883 m!1377645))

(declare-fun m!1377685 () Bool)

(assert (=> b!1493883 m!1377685))

(assert (=> b!1493883 m!1377685))

(assert (=> b!1493883 m!1377645))

(declare-fun m!1377687 () Bool)

(assert (=> b!1493883 m!1377687))

(declare-fun m!1377689 () Bool)

(assert (=> b!1493886 m!1377689))

(push 1)

