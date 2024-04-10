; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123236 () Bool)

(assert start!123236)

(declare-fun b!1428864 () Bool)

(declare-fun res!963503 () Bool)

(declare-fun e!806921 () Bool)

(assert (=> b!1428864 (=> (not res!963503) (not e!806921))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428864 (= res!963503 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428865 () Bool)

(declare-fun res!963501 () Bool)

(declare-fun e!806918 () Bool)

(assert (=> b!1428865 (=> (not res!963501) (not e!806918))))

(declare-datatypes ((array!97397 0))(
  ( (array!97398 (arr!47010 (Array (_ BitVec 32) (_ BitVec 64))) (size!47560 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97397)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428865 (= res!963501 (validKeyInArray!0 (select (arr!47010 a!2831) i!982)))))

(declare-fun e!806917 () Bool)

(declare-fun b!1428866 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11289 0))(
  ( (MissingZero!11289 (index!47548 (_ BitVec 32))) (Found!11289 (index!47549 (_ BitVec 32))) (Intermediate!11289 (undefined!12101 Bool) (index!47550 (_ BitVec 32)) (x!129187 (_ BitVec 32))) (Undefined!11289) (MissingVacant!11289 (index!47551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97397 (_ BitVec 32)) SeekEntryResult!11289)

(assert (=> b!1428866 (= e!806917 (= (seekEntryOrOpen!0 (select (arr!47010 a!2831) j!81) a!2831 mask!2608) (Found!11289 j!81)))))

(declare-fun b!1428867 () Bool)

(declare-fun res!963494 () Bool)

(assert (=> b!1428867 (=> (not res!963494) (not e!806921))))

(declare-fun lt!629148 () SeekEntryResult!11289)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97397 (_ BitVec 32)) SeekEntryResult!11289)

(assert (=> b!1428867 (= res!963494 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47010 a!2831) j!81) a!2831 mask!2608) lt!629148))))

(declare-fun b!1428868 () Bool)

(declare-fun res!963498 () Bool)

(assert (=> b!1428868 (=> (not res!963498) (not e!806918))))

(declare-datatypes ((List!33520 0))(
  ( (Nil!33517) (Cons!33516 (h!34830 (_ BitVec 64)) (t!48214 List!33520)) )
))
(declare-fun arrayNoDuplicates!0 (array!97397 (_ BitVec 32) List!33520) Bool)

(assert (=> b!1428868 (= res!963498 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33517))))

(declare-fun b!1428869 () Bool)

(declare-fun res!963505 () Bool)

(assert (=> b!1428869 (=> (not res!963505) (not e!806918))))

(assert (=> b!1428869 (= res!963505 (and (= (size!47560 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47560 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47560 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428870 () Bool)

(declare-fun e!806919 () Bool)

(assert (=> b!1428870 (= e!806919 e!806921)))

(declare-fun res!963500 () Bool)

(assert (=> b!1428870 (=> (not res!963500) (not e!806921))))

(declare-fun lt!629144 () (_ BitVec 64))

(declare-fun lt!629146 () array!97397)

(declare-fun lt!629145 () SeekEntryResult!11289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428870 (= res!963500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629144 mask!2608) lt!629144 lt!629146 mask!2608) lt!629145))))

(assert (=> b!1428870 (= lt!629145 (Intermediate!11289 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428870 (= lt!629144 (select (store (arr!47010 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428870 (= lt!629146 (array!97398 (store (arr!47010 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47560 a!2831)))))

(declare-fun res!963497 () Bool)

(assert (=> start!123236 (=> (not res!963497) (not e!806918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123236 (= res!963497 (validMask!0 mask!2608))))

(assert (=> start!123236 e!806918))

(assert (=> start!123236 true))

(declare-fun array_inv!36038 (array!97397) Bool)

(assert (=> start!123236 (array_inv!36038 a!2831)))

(declare-fun b!1428871 () Bool)

(assert (=> b!1428871 (= e!806921 (not true))))

(assert (=> b!1428871 e!806917))

(declare-fun res!963495 () Bool)

(assert (=> b!1428871 (=> (not res!963495) (not e!806917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97397 (_ BitVec 32)) Bool)

(assert (=> b!1428871 (= res!963495 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48324 0))(
  ( (Unit!48325) )
))
(declare-fun lt!629147 () Unit!48324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48324)

(assert (=> b!1428871 (= lt!629147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428872 () Bool)

(declare-fun res!963496 () Bool)

(assert (=> b!1428872 (=> (not res!963496) (not e!806921))))

(assert (=> b!1428872 (= res!963496 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629144 lt!629146 mask!2608) lt!629145))))

(declare-fun b!1428873 () Bool)

(declare-fun res!963502 () Bool)

(assert (=> b!1428873 (=> (not res!963502) (not e!806918))))

(assert (=> b!1428873 (= res!963502 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47560 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47560 a!2831))))))

(declare-fun b!1428874 () Bool)

(declare-fun res!963504 () Bool)

(assert (=> b!1428874 (=> (not res!963504) (not e!806918))))

(assert (=> b!1428874 (= res!963504 (validKeyInArray!0 (select (arr!47010 a!2831) j!81)))))

(declare-fun b!1428875 () Bool)

(declare-fun res!963493 () Bool)

(assert (=> b!1428875 (=> (not res!963493) (not e!806918))))

(assert (=> b!1428875 (= res!963493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428876 () Bool)

(assert (=> b!1428876 (= e!806918 e!806919)))

(declare-fun res!963499 () Bool)

(assert (=> b!1428876 (=> (not res!963499) (not e!806919))))

(assert (=> b!1428876 (= res!963499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47010 a!2831) j!81) mask!2608) (select (arr!47010 a!2831) j!81) a!2831 mask!2608) lt!629148))))

(assert (=> b!1428876 (= lt!629148 (Intermediate!11289 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123236 res!963497) b!1428869))

(assert (= (and b!1428869 res!963505) b!1428865))

(assert (= (and b!1428865 res!963501) b!1428874))

(assert (= (and b!1428874 res!963504) b!1428875))

(assert (= (and b!1428875 res!963493) b!1428868))

(assert (= (and b!1428868 res!963498) b!1428873))

(assert (= (and b!1428873 res!963502) b!1428876))

(assert (= (and b!1428876 res!963499) b!1428870))

(assert (= (and b!1428870 res!963500) b!1428867))

(assert (= (and b!1428867 res!963494) b!1428872))

(assert (= (and b!1428872 res!963496) b!1428864))

(assert (= (and b!1428864 res!963503) b!1428871))

(assert (= (and b!1428871 res!963495) b!1428866))

(declare-fun m!1318979 () Bool)

(assert (=> b!1428874 m!1318979))

(assert (=> b!1428874 m!1318979))

(declare-fun m!1318981 () Bool)

(assert (=> b!1428874 m!1318981))

(declare-fun m!1318983 () Bool)

(assert (=> b!1428870 m!1318983))

(assert (=> b!1428870 m!1318983))

(declare-fun m!1318985 () Bool)

(assert (=> b!1428870 m!1318985))

(declare-fun m!1318987 () Bool)

(assert (=> b!1428870 m!1318987))

(declare-fun m!1318989 () Bool)

(assert (=> b!1428870 m!1318989))

(declare-fun m!1318991 () Bool)

(assert (=> b!1428872 m!1318991))

(declare-fun m!1318993 () Bool)

(assert (=> b!1428875 m!1318993))

(declare-fun m!1318995 () Bool)

(assert (=> b!1428871 m!1318995))

(declare-fun m!1318997 () Bool)

(assert (=> b!1428871 m!1318997))

(assert (=> b!1428867 m!1318979))

(assert (=> b!1428867 m!1318979))

(declare-fun m!1318999 () Bool)

(assert (=> b!1428867 m!1318999))

(assert (=> b!1428866 m!1318979))

(assert (=> b!1428866 m!1318979))

(declare-fun m!1319001 () Bool)

(assert (=> b!1428866 m!1319001))

(declare-fun m!1319003 () Bool)

(assert (=> b!1428868 m!1319003))

(declare-fun m!1319005 () Bool)

(assert (=> b!1428865 m!1319005))

(assert (=> b!1428865 m!1319005))

(declare-fun m!1319007 () Bool)

(assert (=> b!1428865 m!1319007))

(declare-fun m!1319009 () Bool)

(assert (=> start!123236 m!1319009))

(declare-fun m!1319011 () Bool)

(assert (=> start!123236 m!1319011))

(assert (=> b!1428876 m!1318979))

(assert (=> b!1428876 m!1318979))

(declare-fun m!1319013 () Bool)

(assert (=> b!1428876 m!1319013))

(assert (=> b!1428876 m!1319013))

(assert (=> b!1428876 m!1318979))

(declare-fun m!1319015 () Bool)

(assert (=> b!1428876 m!1319015))

(check-sat (not b!1428874) (not b!1428865) (not b!1428868) (not b!1428876) (not b!1428870) (not b!1428866) (not start!123236) (not b!1428871) (not b!1428872) (not b!1428875) (not b!1428867))
(check-sat)
