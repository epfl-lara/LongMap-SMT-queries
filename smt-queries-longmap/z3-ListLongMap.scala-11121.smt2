; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129958 () Bool)

(assert start!129958)

(declare-fun b!1524977 () Bool)

(declare-fun res!1043339 () Bool)

(declare-fun e!850089 () Bool)

(assert (=> b!1524977 (=> (not res!1043339) (not e!850089))))

(declare-datatypes ((array!101434 0))(
  ( (array!101435 (arr!48945 (Array (_ BitVec 32) (_ BitVec 64))) (size!49495 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101434)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524977 (= res!1043339 (validKeyInArray!0 (select (arr!48945 a!2804) i!961)))))

(declare-fun b!1524978 () Bool)

(declare-fun res!1043346 () Bool)

(assert (=> b!1524978 (=> (not res!1043346) (not e!850089))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524978 (= res!1043346 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49495 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49495 a!2804))))))

(declare-fun b!1524979 () Bool)

(declare-fun e!850087 () Bool)

(declare-fun e!850090 () Bool)

(assert (=> b!1524979 (= e!850087 e!850090)))

(declare-fun res!1043349 () Bool)

(assert (=> b!1524979 (=> res!1043349 e!850090)))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1524979 (= res!1043349 (or (not (= (select (arr!48945 a!2804) j!70) (select (store (arr!48945 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48945 a!2804) index!487) (select (arr!48945 a!2804) j!70)) (not (= (select (arr!48945 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1524980 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13110 0))(
  ( (MissingZero!13110 (index!54835 (_ BitVec 32))) (Found!13110 (index!54836 (_ BitVec 32))) (Intermediate!13110 (undefined!13922 Bool) (index!54837 (_ BitVec 32)) (x!136531 (_ BitVec 32))) (Undefined!13110) (MissingVacant!13110 (index!54838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101434 (_ BitVec 32)) SeekEntryResult!13110)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101434 (_ BitVec 32)) SeekEntryResult!13110)

(assert (=> b!1524980 (= e!850090 (= (seekEntryOrOpen!0 (select (arr!48945 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48945 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524981 () Bool)

(declare-fun res!1043338 () Bool)

(assert (=> b!1524981 (=> (not res!1043338) (not e!850089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101434 (_ BitVec 32)) Bool)

(assert (=> b!1524981 (= res!1043338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524982 () Bool)

(declare-fun res!1043343 () Bool)

(declare-fun e!850088 () Bool)

(assert (=> b!1524982 (=> (not res!1043343) (not e!850088))))

(declare-fun lt!660530 () SeekEntryResult!13110)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101434 (_ BitVec 32)) SeekEntryResult!13110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524982 (= res!1043343 (= lt!660530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48945 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48945 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101435 (store (arr!48945 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49495 a!2804)) mask!2512)))))

(declare-fun b!1524983 () Bool)

(declare-fun res!1043350 () Bool)

(assert (=> b!1524983 (=> (not res!1043350) (not e!850089))))

(assert (=> b!1524983 (= res!1043350 (validKeyInArray!0 (select (arr!48945 a!2804) j!70)))))

(declare-fun b!1524984 () Bool)

(assert (=> b!1524984 (= e!850088 (not true))))

(assert (=> b!1524984 e!850087))

(declare-fun res!1043341 () Bool)

(assert (=> b!1524984 (=> (not res!1043341) (not e!850087))))

(assert (=> b!1524984 (= res!1043341 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51004 0))(
  ( (Unit!51005) )
))
(declare-fun lt!660531 () Unit!51004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51004)

(assert (=> b!1524984 (= lt!660531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524985 () Bool)

(assert (=> b!1524985 (= e!850089 e!850088)))

(declare-fun res!1043348 () Bool)

(assert (=> b!1524985 (=> (not res!1043348) (not e!850088))))

(declare-fun lt!660532 () SeekEntryResult!13110)

(assert (=> b!1524985 (= res!1043348 (= lt!660530 lt!660532))))

(assert (=> b!1524985 (= lt!660532 (Intermediate!13110 false resIndex!21 resX!21))))

(assert (=> b!1524985 (= lt!660530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48945 a!2804) j!70) mask!2512) (select (arr!48945 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1043345 () Bool)

(assert (=> start!129958 (=> (not res!1043345) (not e!850089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129958 (= res!1043345 (validMask!0 mask!2512))))

(assert (=> start!129958 e!850089))

(assert (=> start!129958 true))

(declare-fun array_inv!37973 (array!101434) Bool)

(assert (=> start!129958 (array_inv!37973 a!2804)))

(declare-fun b!1524986 () Bool)

(declare-fun res!1043344 () Bool)

(assert (=> b!1524986 (=> (not res!1043344) (not e!850089))))

(declare-datatypes ((List!35428 0))(
  ( (Nil!35425) (Cons!35424 (h!36854 (_ BitVec 64)) (t!50122 List!35428)) )
))
(declare-fun arrayNoDuplicates!0 (array!101434 (_ BitVec 32) List!35428) Bool)

(assert (=> b!1524986 (= res!1043344 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35425))))

(declare-fun b!1524987 () Bool)

(declare-fun res!1043340 () Bool)

(assert (=> b!1524987 (=> (not res!1043340) (not e!850087))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101434 (_ BitVec 32)) SeekEntryResult!13110)

(assert (=> b!1524987 (= res!1043340 (= (seekEntry!0 (select (arr!48945 a!2804) j!70) a!2804 mask!2512) (Found!13110 j!70)))))

(declare-fun b!1524988 () Bool)

(declare-fun res!1043347 () Bool)

(assert (=> b!1524988 (=> (not res!1043347) (not e!850089))))

(assert (=> b!1524988 (= res!1043347 (and (= (size!49495 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49495 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49495 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524989 () Bool)

(declare-fun res!1043342 () Bool)

(assert (=> b!1524989 (=> (not res!1043342) (not e!850088))))

(assert (=> b!1524989 (= res!1043342 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48945 a!2804) j!70) a!2804 mask!2512) lt!660532))))

(assert (= (and start!129958 res!1043345) b!1524988))

(assert (= (and b!1524988 res!1043347) b!1524977))

(assert (= (and b!1524977 res!1043339) b!1524983))

(assert (= (and b!1524983 res!1043350) b!1524981))

(assert (= (and b!1524981 res!1043338) b!1524986))

(assert (= (and b!1524986 res!1043344) b!1524978))

(assert (= (and b!1524978 res!1043346) b!1524985))

(assert (= (and b!1524985 res!1043348) b!1524989))

(assert (= (and b!1524989 res!1043342) b!1524982))

(assert (= (and b!1524982 res!1043343) b!1524984))

(assert (= (and b!1524984 res!1043341) b!1524987))

(assert (= (and b!1524987 res!1043340) b!1524979))

(assert (= (and b!1524979 (not res!1043349)) b!1524980))

(declare-fun m!1407855 () Bool)

(assert (=> b!1524981 m!1407855))

(declare-fun m!1407857 () Bool)

(assert (=> b!1524987 m!1407857))

(assert (=> b!1524987 m!1407857))

(declare-fun m!1407859 () Bool)

(assert (=> b!1524987 m!1407859))

(declare-fun m!1407861 () Bool)

(assert (=> b!1524982 m!1407861))

(declare-fun m!1407863 () Bool)

(assert (=> b!1524982 m!1407863))

(assert (=> b!1524982 m!1407863))

(declare-fun m!1407865 () Bool)

(assert (=> b!1524982 m!1407865))

(assert (=> b!1524982 m!1407865))

(assert (=> b!1524982 m!1407863))

(declare-fun m!1407867 () Bool)

(assert (=> b!1524982 m!1407867))

(assert (=> b!1524989 m!1407857))

(assert (=> b!1524989 m!1407857))

(declare-fun m!1407869 () Bool)

(assert (=> b!1524989 m!1407869))

(declare-fun m!1407871 () Bool)

(assert (=> b!1524984 m!1407871))

(declare-fun m!1407873 () Bool)

(assert (=> b!1524984 m!1407873))

(declare-fun m!1407875 () Bool)

(assert (=> b!1524986 m!1407875))

(declare-fun m!1407877 () Bool)

(assert (=> start!129958 m!1407877))

(declare-fun m!1407879 () Bool)

(assert (=> start!129958 m!1407879))

(assert (=> b!1524980 m!1407857))

(assert (=> b!1524980 m!1407857))

(declare-fun m!1407881 () Bool)

(assert (=> b!1524980 m!1407881))

(assert (=> b!1524980 m!1407857))

(declare-fun m!1407883 () Bool)

(assert (=> b!1524980 m!1407883))

(assert (=> b!1524983 m!1407857))

(assert (=> b!1524983 m!1407857))

(declare-fun m!1407885 () Bool)

(assert (=> b!1524983 m!1407885))

(declare-fun m!1407887 () Bool)

(assert (=> b!1524977 m!1407887))

(assert (=> b!1524977 m!1407887))

(declare-fun m!1407889 () Bool)

(assert (=> b!1524977 m!1407889))

(assert (=> b!1524985 m!1407857))

(assert (=> b!1524985 m!1407857))

(declare-fun m!1407891 () Bool)

(assert (=> b!1524985 m!1407891))

(assert (=> b!1524985 m!1407891))

(assert (=> b!1524985 m!1407857))

(declare-fun m!1407893 () Bool)

(assert (=> b!1524985 m!1407893))

(assert (=> b!1524979 m!1407857))

(assert (=> b!1524979 m!1407861))

(assert (=> b!1524979 m!1407863))

(declare-fun m!1407895 () Bool)

(assert (=> b!1524979 m!1407895))

(check-sat (not b!1524980) (not b!1524982) (not b!1524984) (not b!1524986) (not start!129958) (not b!1524977) (not b!1524989) (not b!1524981) (not b!1524985) (not b!1524983) (not b!1524987))
(check-sat)
