; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123230 () Bool)

(assert start!123230)

(declare-fun b!1428747 () Bool)

(declare-fun e!806872 () Bool)

(declare-fun e!806875 () Bool)

(assert (=> b!1428747 (= e!806872 e!806875)))

(declare-fun res!963383 () Bool)

(assert (=> b!1428747 (=> (not res!963383) (not e!806875))))

(declare-fun lt!629101 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11286 0))(
  ( (MissingZero!11286 (index!47536 (_ BitVec 32))) (Found!11286 (index!47537 (_ BitVec 32))) (Intermediate!11286 (undefined!12098 Bool) (index!47538 (_ BitVec 32)) (x!129176 (_ BitVec 32))) (Undefined!11286) (MissingVacant!11286 (index!47539 (_ BitVec 32))) )
))
(declare-fun lt!629100 () SeekEntryResult!11286)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97391 0))(
  ( (array!97392 (arr!47007 (Array (_ BitVec 32) (_ BitVec 64))) (size!47557 (_ BitVec 32))) )
))
(declare-fun lt!629099 () array!97391)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97391 (_ BitVec 32)) SeekEntryResult!11286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428747 (= res!963383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629101 mask!2608) lt!629101 lt!629099 mask!2608) lt!629100))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428747 (= lt!629100 (Intermediate!11286 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97391)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428747 (= lt!629101 (select (store (arr!47007 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428747 (= lt!629099 (array!97392 (store (arr!47007 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47557 a!2831)))))

(declare-fun b!1428748 () Bool)

(declare-fun res!963384 () Bool)

(declare-fun e!806874 () Bool)

(assert (=> b!1428748 (=> (not res!963384) (not e!806874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97391 (_ BitVec 32)) Bool)

(assert (=> b!1428748 (= res!963384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428749 () Bool)

(assert (=> b!1428749 (= e!806875 (not true))))

(declare-fun e!806876 () Bool)

(assert (=> b!1428749 e!806876))

(declare-fun res!963376 () Bool)

(assert (=> b!1428749 (=> (not res!963376) (not e!806876))))

(assert (=> b!1428749 (= res!963376 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48318 0))(
  ( (Unit!48319) )
))
(declare-fun lt!629102 () Unit!48318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48318)

(assert (=> b!1428749 (= lt!629102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428750 () Bool)

(assert (=> b!1428750 (= e!806874 e!806872)))

(declare-fun res!963386 () Bool)

(assert (=> b!1428750 (=> (not res!963386) (not e!806872))))

(declare-fun lt!629103 () SeekEntryResult!11286)

(assert (=> b!1428750 (= res!963386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47007 a!2831) j!81) mask!2608) (select (arr!47007 a!2831) j!81) a!2831 mask!2608) lt!629103))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428750 (= lt!629103 (Intermediate!11286 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428751 () Bool)

(declare-fun res!963385 () Bool)

(assert (=> b!1428751 (=> (not res!963385) (not e!806874))))

(declare-datatypes ((List!33517 0))(
  ( (Nil!33514) (Cons!33513 (h!34827 (_ BitVec 64)) (t!48211 List!33517)) )
))
(declare-fun arrayNoDuplicates!0 (array!97391 (_ BitVec 32) List!33517) Bool)

(assert (=> b!1428751 (= res!963385 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33514))))

(declare-fun b!1428752 () Bool)

(declare-fun res!963387 () Bool)

(assert (=> b!1428752 (=> (not res!963387) (not e!806874))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428752 (= res!963387 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47557 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47557 a!2831))))))

(declare-fun b!1428753 () Bool)

(declare-fun res!963377 () Bool)

(assert (=> b!1428753 (=> (not res!963377) (not e!806874))))

(assert (=> b!1428753 (= res!963377 (and (= (size!47557 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47557 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47557 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428755 () Bool)

(declare-fun res!963380 () Bool)

(assert (=> b!1428755 (=> (not res!963380) (not e!806874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428755 (= res!963380 (validKeyInArray!0 (select (arr!47007 a!2831) i!982)))))

(declare-fun b!1428756 () Bool)

(declare-fun res!963388 () Bool)

(assert (=> b!1428756 (=> (not res!963388) (not e!806875))))

(assert (=> b!1428756 (= res!963388 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629101 lt!629099 mask!2608) lt!629100))))

(declare-fun b!1428757 () Bool)

(declare-fun res!963379 () Bool)

(assert (=> b!1428757 (=> (not res!963379) (not e!806875))))

(assert (=> b!1428757 (= res!963379 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428754 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97391 (_ BitVec 32)) SeekEntryResult!11286)

(assert (=> b!1428754 (= e!806876 (= (seekEntryOrOpen!0 (select (arr!47007 a!2831) j!81) a!2831 mask!2608) (Found!11286 j!81)))))

(declare-fun res!963382 () Bool)

(assert (=> start!123230 (=> (not res!963382) (not e!806874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123230 (= res!963382 (validMask!0 mask!2608))))

(assert (=> start!123230 e!806874))

(assert (=> start!123230 true))

(declare-fun array_inv!36035 (array!97391) Bool)

(assert (=> start!123230 (array_inv!36035 a!2831)))

(declare-fun b!1428758 () Bool)

(declare-fun res!963381 () Bool)

(assert (=> b!1428758 (=> (not res!963381) (not e!806875))))

(assert (=> b!1428758 (= res!963381 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47007 a!2831) j!81) a!2831 mask!2608) lt!629103))))

(declare-fun b!1428759 () Bool)

(declare-fun res!963378 () Bool)

(assert (=> b!1428759 (=> (not res!963378) (not e!806874))))

(assert (=> b!1428759 (= res!963378 (validKeyInArray!0 (select (arr!47007 a!2831) j!81)))))

(assert (= (and start!123230 res!963382) b!1428753))

(assert (= (and b!1428753 res!963377) b!1428755))

(assert (= (and b!1428755 res!963380) b!1428759))

(assert (= (and b!1428759 res!963378) b!1428748))

(assert (= (and b!1428748 res!963384) b!1428751))

(assert (= (and b!1428751 res!963385) b!1428752))

(assert (= (and b!1428752 res!963387) b!1428750))

(assert (= (and b!1428750 res!963386) b!1428747))

(assert (= (and b!1428747 res!963383) b!1428758))

(assert (= (and b!1428758 res!963381) b!1428756))

(assert (= (and b!1428756 res!963388) b!1428757))

(assert (= (and b!1428757 res!963379) b!1428749))

(assert (= (and b!1428749 res!963376) b!1428754))

(declare-fun m!1318865 () Bool)

(assert (=> b!1428758 m!1318865))

(assert (=> b!1428758 m!1318865))

(declare-fun m!1318867 () Bool)

(assert (=> b!1428758 m!1318867))

(declare-fun m!1318869 () Bool)

(assert (=> b!1428755 m!1318869))

(assert (=> b!1428755 m!1318869))

(declare-fun m!1318871 () Bool)

(assert (=> b!1428755 m!1318871))

(declare-fun m!1318873 () Bool)

(assert (=> b!1428747 m!1318873))

(assert (=> b!1428747 m!1318873))

(declare-fun m!1318875 () Bool)

(assert (=> b!1428747 m!1318875))

(declare-fun m!1318877 () Bool)

(assert (=> b!1428747 m!1318877))

(declare-fun m!1318879 () Bool)

(assert (=> b!1428747 m!1318879))

(declare-fun m!1318881 () Bool)

(assert (=> b!1428748 m!1318881))

(declare-fun m!1318883 () Bool)

(assert (=> start!123230 m!1318883))

(declare-fun m!1318885 () Bool)

(assert (=> start!123230 m!1318885))

(assert (=> b!1428750 m!1318865))

(assert (=> b!1428750 m!1318865))

(declare-fun m!1318887 () Bool)

(assert (=> b!1428750 m!1318887))

(assert (=> b!1428750 m!1318887))

(assert (=> b!1428750 m!1318865))

(declare-fun m!1318889 () Bool)

(assert (=> b!1428750 m!1318889))

(assert (=> b!1428759 m!1318865))

(assert (=> b!1428759 m!1318865))

(declare-fun m!1318891 () Bool)

(assert (=> b!1428759 m!1318891))

(declare-fun m!1318893 () Bool)

(assert (=> b!1428751 m!1318893))

(declare-fun m!1318895 () Bool)

(assert (=> b!1428749 m!1318895))

(declare-fun m!1318897 () Bool)

(assert (=> b!1428749 m!1318897))

(declare-fun m!1318899 () Bool)

(assert (=> b!1428756 m!1318899))

(assert (=> b!1428754 m!1318865))

(assert (=> b!1428754 m!1318865))

(declare-fun m!1318901 () Bool)

(assert (=> b!1428754 m!1318901))

(check-sat (not b!1428756) (not b!1428750) (not b!1428755) (not start!123230) (not b!1428758) (not b!1428754) (not b!1428748) (not b!1428751) (not b!1428759) (not b!1428747) (not b!1428749))
(check-sat)
