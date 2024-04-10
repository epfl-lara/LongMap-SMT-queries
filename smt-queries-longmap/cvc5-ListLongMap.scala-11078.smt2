; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129300 () Bool)

(assert start!129300)

(declare-fun b!1518616 () Bool)

(declare-fun res!1038519 () Bool)

(declare-fun e!847162 () Bool)

(assert (=> b!1518616 (=> (not res!1038519) (not e!847162))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101156 0))(
  ( (array!101157 (arr!48815 (Array (_ BitVec 32) (_ BitVec 64))) (size!49365 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101156)

(assert (=> b!1518616 (= res!1038519 (and (= (size!49365 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49365 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49365 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518617 () Bool)

(declare-fun res!1038521 () Bool)

(assert (=> b!1518617 (=> (not res!1038521) (not e!847162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101156 (_ BitVec 32)) Bool)

(assert (=> b!1518617 (= res!1038521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518618 () Bool)

(declare-fun res!1038530 () Bool)

(declare-fun e!847165 () Bool)

(assert (=> b!1518618 (=> (not res!1038530) (not e!847165))))

(declare-datatypes ((SeekEntryResult!12986 0))(
  ( (MissingZero!12986 (index!54339 (_ BitVec 32))) (Found!12986 (index!54340 (_ BitVec 32))) (Intermediate!12986 (undefined!13798 Bool) (index!54341 (_ BitVec 32)) (x!136016 (_ BitVec 32))) (Undefined!12986) (MissingVacant!12986 (index!54342 (_ BitVec 32))) )
))
(declare-fun lt!658259 () SeekEntryResult!12986)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101156 (_ BitVec 32)) SeekEntryResult!12986)

(assert (=> b!1518618 (= res!1038530 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48815 a!2804) j!70) a!2804 mask!2512) lt!658259))))

(declare-fun b!1518619 () Bool)

(declare-fun e!847163 () Bool)

(assert (=> b!1518619 (= e!847165 e!847163)))

(declare-fun res!1038527 () Bool)

(assert (=> b!1518619 (=> (not res!1038527) (not e!847163))))

(declare-fun lt!658255 () (_ BitVec 64))

(declare-fun lt!658257 () array!101156)

(declare-fun lt!658261 () SeekEntryResult!12986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518619 (= res!1038527 (= lt!658261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658255 mask!2512) lt!658255 lt!658257 mask!2512)))))

(assert (=> b!1518619 (= lt!658255 (select (store (arr!48815 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518619 (= lt!658257 (array!101157 (store (arr!48815 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49365 a!2804)))))

(declare-fun b!1518620 () Bool)

(declare-fun e!847167 () Bool)

(declare-fun e!847166 () Bool)

(assert (=> b!1518620 (= e!847167 e!847166)))

(declare-fun res!1038522 () Bool)

(assert (=> b!1518620 (=> res!1038522 e!847166)))

(declare-fun lt!658260 () (_ BitVec 32))

(assert (=> b!1518620 (= res!1038522 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658260 #b00000000000000000000000000000000) (bvsge lt!658260 (size!49365 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518620 (= lt!658260 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518621 () Bool)

(declare-fun res!1038523 () Bool)

(assert (=> b!1518621 (=> (not res!1038523) (not e!847162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518621 (= res!1038523 (validKeyInArray!0 (select (arr!48815 a!2804) j!70)))))

(declare-fun res!1038532 () Bool)

(assert (=> start!129300 (=> (not res!1038532) (not e!847162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129300 (= res!1038532 (validMask!0 mask!2512))))

(assert (=> start!129300 e!847162))

(assert (=> start!129300 true))

(declare-fun array_inv!37843 (array!101156) Bool)

(assert (=> start!129300 (array_inv!37843 a!2804)))

(declare-fun b!1518622 () Bool)

(declare-fun res!1038531 () Bool)

(assert (=> b!1518622 (=> (not res!1038531) (not e!847162))))

(declare-datatypes ((List!35298 0))(
  ( (Nil!35295) (Cons!35294 (h!36706 (_ BitVec 64)) (t!49992 List!35298)) )
))
(declare-fun arrayNoDuplicates!0 (array!101156 (_ BitVec 32) List!35298) Bool)

(assert (=> b!1518622 (= res!1038531 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35295))))

(declare-fun b!1518623 () Bool)

(declare-fun res!1038525 () Bool)

(assert (=> b!1518623 (=> (not res!1038525) (not e!847162))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518623 (= res!1038525 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49365 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49365 a!2804))))))

(declare-fun b!1518624 () Bool)

(declare-fun res!1038526 () Bool)

(assert (=> b!1518624 (=> (not res!1038526) (not e!847162))))

(assert (=> b!1518624 (= res!1038526 (validKeyInArray!0 (select (arr!48815 a!2804) i!961)))))

(declare-fun b!1518625 () Bool)

(assert (=> b!1518625 (= e!847162 e!847165)))

(declare-fun res!1038524 () Bool)

(assert (=> b!1518625 (=> (not res!1038524) (not e!847165))))

(assert (=> b!1518625 (= res!1038524 (= lt!658261 lt!658259))))

(assert (=> b!1518625 (= lt!658259 (Intermediate!12986 false resIndex!21 resX!21))))

(assert (=> b!1518625 (= lt!658261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48815 a!2804) j!70) mask!2512) (select (arr!48815 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518626 () Bool)

(assert (=> b!1518626 (= e!847166 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101156 (_ BitVec 32)) SeekEntryResult!12986)

(assert (=> b!1518626 (= (seekEntryOrOpen!0 (select (arr!48815 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658255 lt!658257 mask!2512))))

(declare-datatypes ((Unit!50840 0))(
  ( (Unit!50841) )
))
(declare-fun lt!658258 () Unit!50840)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50840)

(assert (=> b!1518626 (= lt!658258 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658260 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518627 () Bool)

(assert (=> b!1518627 (= e!847163 (not e!847167))))

(declare-fun res!1038528 () Bool)

(assert (=> b!1518627 (=> res!1038528 e!847167)))

(assert (=> b!1518627 (= res!1038528 (or (not (= (select (arr!48815 a!2804) j!70) lt!658255)) (= x!534 resX!21)))))

(declare-fun e!847168 () Bool)

(assert (=> b!1518627 e!847168))

(declare-fun res!1038529 () Bool)

(assert (=> b!1518627 (=> (not res!1038529) (not e!847168))))

(assert (=> b!1518627 (= res!1038529 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658256 () Unit!50840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50840)

(assert (=> b!1518627 (= lt!658256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518628 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101156 (_ BitVec 32)) SeekEntryResult!12986)

(assert (=> b!1518628 (= e!847168 (= (seekEntry!0 (select (arr!48815 a!2804) j!70) a!2804 mask!2512) (Found!12986 j!70)))))

(declare-fun b!1518629 () Bool)

(declare-fun res!1038520 () Bool)

(assert (=> b!1518629 (=> res!1038520 e!847166)))

(assert (=> b!1518629 (= res!1038520 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658260 (select (arr!48815 a!2804) j!70) a!2804 mask!2512) lt!658259)))))

(assert (= (and start!129300 res!1038532) b!1518616))

(assert (= (and b!1518616 res!1038519) b!1518624))

(assert (= (and b!1518624 res!1038526) b!1518621))

(assert (= (and b!1518621 res!1038523) b!1518617))

(assert (= (and b!1518617 res!1038521) b!1518622))

(assert (= (and b!1518622 res!1038531) b!1518623))

(assert (= (and b!1518623 res!1038525) b!1518625))

(assert (= (and b!1518625 res!1038524) b!1518618))

(assert (= (and b!1518618 res!1038530) b!1518619))

(assert (= (and b!1518619 res!1038527) b!1518627))

(assert (= (and b!1518627 res!1038529) b!1518628))

(assert (= (and b!1518627 (not res!1038528)) b!1518620))

(assert (= (and b!1518620 (not res!1038522)) b!1518629))

(assert (= (and b!1518629 (not res!1038520)) b!1518626))

(declare-fun m!1401943 () Bool)

(assert (=> b!1518627 m!1401943))

(declare-fun m!1401945 () Bool)

(assert (=> b!1518627 m!1401945))

(declare-fun m!1401947 () Bool)

(assert (=> b!1518627 m!1401947))

(assert (=> b!1518621 m!1401943))

(assert (=> b!1518621 m!1401943))

(declare-fun m!1401949 () Bool)

(assert (=> b!1518621 m!1401949))

(declare-fun m!1401951 () Bool)

(assert (=> b!1518620 m!1401951))

(declare-fun m!1401953 () Bool)

(assert (=> b!1518619 m!1401953))

(assert (=> b!1518619 m!1401953))

(declare-fun m!1401955 () Bool)

(assert (=> b!1518619 m!1401955))

(declare-fun m!1401957 () Bool)

(assert (=> b!1518619 m!1401957))

(declare-fun m!1401959 () Bool)

(assert (=> b!1518619 m!1401959))

(declare-fun m!1401961 () Bool)

(assert (=> start!129300 m!1401961))

(declare-fun m!1401963 () Bool)

(assert (=> start!129300 m!1401963))

(assert (=> b!1518629 m!1401943))

(assert (=> b!1518629 m!1401943))

(declare-fun m!1401965 () Bool)

(assert (=> b!1518629 m!1401965))

(assert (=> b!1518626 m!1401943))

(assert (=> b!1518626 m!1401943))

(declare-fun m!1401967 () Bool)

(assert (=> b!1518626 m!1401967))

(declare-fun m!1401969 () Bool)

(assert (=> b!1518626 m!1401969))

(declare-fun m!1401971 () Bool)

(assert (=> b!1518626 m!1401971))

(assert (=> b!1518625 m!1401943))

(assert (=> b!1518625 m!1401943))

(declare-fun m!1401973 () Bool)

(assert (=> b!1518625 m!1401973))

(assert (=> b!1518625 m!1401973))

(assert (=> b!1518625 m!1401943))

(declare-fun m!1401975 () Bool)

(assert (=> b!1518625 m!1401975))

(declare-fun m!1401977 () Bool)

(assert (=> b!1518622 m!1401977))

(assert (=> b!1518628 m!1401943))

(assert (=> b!1518628 m!1401943))

(declare-fun m!1401979 () Bool)

(assert (=> b!1518628 m!1401979))

(declare-fun m!1401981 () Bool)

(assert (=> b!1518617 m!1401981))

(declare-fun m!1401983 () Bool)

(assert (=> b!1518624 m!1401983))

(assert (=> b!1518624 m!1401983))

(declare-fun m!1401985 () Bool)

(assert (=> b!1518624 m!1401985))

(assert (=> b!1518618 m!1401943))

(assert (=> b!1518618 m!1401943))

(declare-fun m!1401987 () Bool)

(assert (=> b!1518618 m!1401987))

(push 1)

