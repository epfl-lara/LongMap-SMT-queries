; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122736 () Bool)

(assert start!122736)

(declare-fun b!1422303 () Bool)

(declare-fun res!957747 () Bool)

(declare-fun e!804080 () Bool)

(assert (=> b!1422303 (=> (not res!957747) (not e!804080))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97101 0))(
  ( (array!97102 (arr!46868 (Array (_ BitVec 32) (_ BitVec 64))) (size!47418 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97101)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422303 (= res!957747 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47418 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47418 a!2831))))))

(declare-fun b!1422304 () Bool)

(declare-fun res!957742 () Bool)

(assert (=> b!1422304 (=> (not res!957742) (not e!804080))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97101 (_ BitVec 32)) Bool)

(assert (=> b!1422304 (= res!957742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422305 () Bool)

(declare-fun e!804085 () Bool)

(assert (=> b!1422305 (= e!804080 e!804085)))

(declare-fun res!957748 () Bool)

(assert (=> b!1422305 (=> (not res!957748) (not e!804085))))

(declare-datatypes ((SeekEntryResult!11153 0))(
  ( (MissingZero!11153 (index!47004 (_ BitVec 32))) (Found!11153 (index!47005 (_ BitVec 32))) (Intermediate!11153 (undefined!11965 Bool) (index!47006 (_ BitVec 32)) (x!128651 (_ BitVec 32))) (Undefined!11153) (MissingVacant!11153 (index!47007 (_ BitVec 32))) )
))
(declare-fun lt!626616 () SeekEntryResult!11153)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97101 (_ BitVec 32)) SeekEntryResult!11153)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422305 (= res!957748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46868 a!2831) j!81) mask!2608) (select (arr!46868 a!2831) j!81) a!2831 mask!2608) lt!626616))))

(assert (=> b!1422305 (= lt!626616 (Intermediate!11153 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422306 () Bool)

(declare-fun e!804082 () Bool)

(assert (=> b!1422306 (= e!804082 true)))

(declare-fun lt!626621 () (_ BitVec 32))

(declare-fun lt!626619 () SeekEntryResult!11153)

(declare-fun lt!626620 () (_ BitVec 64))

(declare-fun lt!626617 () array!97101)

(assert (=> b!1422306 (= lt!626619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626621 lt!626620 lt!626617 mask!2608))))

(declare-fun b!1422308 () Bool)

(declare-fun res!957741 () Bool)

(assert (=> b!1422308 (=> (not res!957741) (not e!804080))))

(declare-datatypes ((List!33378 0))(
  ( (Nil!33375) (Cons!33374 (h!34676 (_ BitVec 64)) (t!48072 List!33378)) )
))
(declare-fun arrayNoDuplicates!0 (array!97101 (_ BitVec 32) List!33378) Bool)

(assert (=> b!1422308 (= res!957741 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33375))))

(declare-fun b!1422309 () Bool)

(declare-fun e!804086 () Bool)

(assert (=> b!1422309 (= e!804086 e!804082)))

(declare-fun res!957740 () Bool)

(assert (=> b!1422309 (=> res!957740 e!804082)))

(assert (=> b!1422309 (= res!957740 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626621 #b00000000000000000000000000000000) (bvsge lt!626621 (size!47418 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422309 (= lt!626621 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422310 () Bool)

(declare-fun res!957745 () Bool)

(assert (=> b!1422310 (=> (not res!957745) (not e!804080))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422310 (= res!957745 (and (= (size!47418 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47418 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47418 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422311 () Bool)

(declare-fun e!804081 () Bool)

(assert (=> b!1422311 (= e!804085 e!804081)))

(declare-fun res!957738 () Bool)

(assert (=> b!1422311 (=> (not res!957738) (not e!804081))))

(declare-fun lt!626622 () SeekEntryResult!11153)

(assert (=> b!1422311 (= res!957738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626620 mask!2608) lt!626620 lt!626617 mask!2608) lt!626622))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422311 (= lt!626622 (Intermediate!11153 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422311 (= lt!626620 (select (store (arr!46868 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422311 (= lt!626617 (array!97102 (store (arr!46868 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47418 a!2831)))))

(declare-fun b!1422312 () Bool)

(declare-fun res!957739 () Bool)

(assert (=> b!1422312 (=> (not res!957739) (not e!804081))))

(assert (=> b!1422312 (= res!957739 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46868 a!2831) j!81) a!2831 mask!2608) lt!626616))))

(declare-fun res!957737 () Bool)

(assert (=> start!122736 (=> (not res!957737) (not e!804080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122736 (= res!957737 (validMask!0 mask!2608))))

(assert (=> start!122736 e!804080))

(assert (=> start!122736 true))

(declare-fun array_inv!35896 (array!97101) Bool)

(assert (=> start!122736 (array_inv!35896 a!2831)))

(declare-fun b!1422307 () Bool)

(declare-fun res!957750 () Bool)

(assert (=> b!1422307 (=> (not res!957750) (not e!804081))))

(assert (=> b!1422307 (= res!957750 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422313 () Bool)

(assert (=> b!1422313 (= e!804081 (not e!804086))))

(declare-fun res!957746 () Bool)

(assert (=> b!1422313 (=> res!957746 e!804086)))

(assert (=> b!1422313 (= res!957746 (or (= (select (arr!46868 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46868 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46868 a!2831) index!585) (select (arr!46868 a!2831) j!81)) (= (select (store (arr!46868 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804083 () Bool)

(assert (=> b!1422313 e!804083))

(declare-fun res!957751 () Bool)

(assert (=> b!1422313 (=> (not res!957751) (not e!804083))))

(assert (=> b!1422313 (= res!957751 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48142 0))(
  ( (Unit!48143) )
))
(declare-fun lt!626618 () Unit!48142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48142)

(assert (=> b!1422313 (= lt!626618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422314 () Bool)

(declare-fun res!957749 () Bool)

(assert (=> b!1422314 (=> (not res!957749) (not e!804080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422314 (= res!957749 (validKeyInArray!0 (select (arr!46868 a!2831) i!982)))))

(declare-fun b!1422315 () Bool)

(declare-fun res!957744 () Bool)

(assert (=> b!1422315 (=> (not res!957744) (not e!804080))))

(assert (=> b!1422315 (= res!957744 (validKeyInArray!0 (select (arr!46868 a!2831) j!81)))))

(declare-fun b!1422316 () Bool)

(declare-fun res!957743 () Bool)

(assert (=> b!1422316 (=> res!957743 e!804082)))

(assert (=> b!1422316 (= res!957743 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626621 (select (arr!46868 a!2831) j!81) a!2831 mask!2608) lt!626616)))))

(declare-fun b!1422317 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97101 (_ BitVec 32)) SeekEntryResult!11153)

(assert (=> b!1422317 (= e!804083 (= (seekEntryOrOpen!0 (select (arr!46868 a!2831) j!81) a!2831 mask!2608) (Found!11153 j!81)))))

(declare-fun b!1422318 () Bool)

(declare-fun res!957736 () Bool)

(assert (=> b!1422318 (=> (not res!957736) (not e!804081))))

(assert (=> b!1422318 (= res!957736 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626620 lt!626617 mask!2608) lt!626622))))

(assert (= (and start!122736 res!957737) b!1422310))

(assert (= (and b!1422310 res!957745) b!1422314))

(assert (= (and b!1422314 res!957749) b!1422315))

(assert (= (and b!1422315 res!957744) b!1422304))

(assert (= (and b!1422304 res!957742) b!1422308))

(assert (= (and b!1422308 res!957741) b!1422303))

(assert (= (and b!1422303 res!957747) b!1422305))

(assert (= (and b!1422305 res!957748) b!1422311))

(assert (= (and b!1422311 res!957738) b!1422312))

(assert (= (and b!1422312 res!957739) b!1422318))

(assert (= (and b!1422318 res!957736) b!1422307))

(assert (= (and b!1422307 res!957750) b!1422313))

(assert (= (and b!1422313 res!957751) b!1422317))

(assert (= (and b!1422313 (not res!957746)) b!1422309))

(assert (= (and b!1422309 (not res!957740)) b!1422316))

(assert (= (and b!1422316 (not res!957743)) b!1422306))

(declare-fun m!1312851 () Bool)

(assert (=> b!1422305 m!1312851))

(assert (=> b!1422305 m!1312851))

(declare-fun m!1312853 () Bool)

(assert (=> b!1422305 m!1312853))

(assert (=> b!1422305 m!1312853))

(assert (=> b!1422305 m!1312851))

(declare-fun m!1312855 () Bool)

(assert (=> b!1422305 m!1312855))

(assert (=> b!1422312 m!1312851))

(assert (=> b!1422312 m!1312851))

(declare-fun m!1312857 () Bool)

(assert (=> b!1422312 m!1312857))

(declare-fun m!1312859 () Bool)

(assert (=> b!1422304 m!1312859))

(declare-fun m!1312861 () Bool)

(assert (=> b!1422318 m!1312861))

(declare-fun m!1312863 () Bool)

(assert (=> start!122736 m!1312863))

(declare-fun m!1312865 () Bool)

(assert (=> start!122736 m!1312865))

(declare-fun m!1312867 () Bool)

(assert (=> b!1422308 m!1312867))

(declare-fun m!1312869 () Bool)

(assert (=> b!1422309 m!1312869))

(assert (=> b!1422315 m!1312851))

(assert (=> b!1422315 m!1312851))

(declare-fun m!1312871 () Bool)

(assert (=> b!1422315 m!1312871))

(assert (=> b!1422316 m!1312851))

(assert (=> b!1422316 m!1312851))

(declare-fun m!1312873 () Bool)

(assert (=> b!1422316 m!1312873))

(declare-fun m!1312875 () Bool)

(assert (=> b!1422314 m!1312875))

(assert (=> b!1422314 m!1312875))

(declare-fun m!1312877 () Bool)

(assert (=> b!1422314 m!1312877))

(declare-fun m!1312879 () Bool)

(assert (=> b!1422306 m!1312879))

(declare-fun m!1312881 () Bool)

(assert (=> b!1422311 m!1312881))

(assert (=> b!1422311 m!1312881))

(declare-fun m!1312883 () Bool)

(assert (=> b!1422311 m!1312883))

(declare-fun m!1312885 () Bool)

(assert (=> b!1422311 m!1312885))

(declare-fun m!1312887 () Bool)

(assert (=> b!1422311 m!1312887))

(assert (=> b!1422313 m!1312885))

(declare-fun m!1312889 () Bool)

(assert (=> b!1422313 m!1312889))

(declare-fun m!1312891 () Bool)

(assert (=> b!1422313 m!1312891))

(declare-fun m!1312893 () Bool)

(assert (=> b!1422313 m!1312893))

(assert (=> b!1422313 m!1312851))

(declare-fun m!1312895 () Bool)

(assert (=> b!1422313 m!1312895))

(assert (=> b!1422317 m!1312851))

(assert (=> b!1422317 m!1312851))

(declare-fun m!1312897 () Bool)

(assert (=> b!1422317 m!1312897))

(push 1)

