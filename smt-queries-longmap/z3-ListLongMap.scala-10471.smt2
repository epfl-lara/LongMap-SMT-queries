; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123152 () Bool)

(assert start!123152)

(declare-fun b!1427970 () Bool)

(declare-fun res!962808 () Bool)

(declare-fun e!806506 () Bool)

(assert (=> b!1427970 (=> (not res!962808) (not e!806506))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97364 0))(
  ( (array!97365 (arr!46995 (Array (_ BitVec 32) (_ BitVec 64))) (size!47545 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97364)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427970 (= res!962808 (and (= (size!47545 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47545 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47545 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!806504 () Bool)

(declare-fun b!1427971 () Bool)

(declare-datatypes ((SeekEntryResult!11274 0))(
  ( (MissingZero!11274 (index!47488 (_ BitVec 32))) (Found!11274 (index!47489 (_ BitVec 32))) (Intermediate!11274 (undefined!12086 Bool) (index!47490 (_ BitVec 32)) (x!129126 (_ BitVec 32))) (Undefined!11274) (MissingVacant!11274 (index!47491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97364 (_ BitVec 32)) SeekEntryResult!11274)

(assert (=> b!1427971 (= e!806504 (= (seekEntryOrOpen!0 (select (arr!46995 a!2831) j!81) a!2831 mask!2608) (Found!11274 j!81)))))

(declare-fun b!1427972 () Bool)

(declare-fun res!962806 () Bool)

(assert (=> b!1427972 (=> (not res!962806) (not e!806506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427972 (= res!962806 (validKeyInArray!0 (select (arr!46995 a!2831) j!81)))))

(declare-fun b!1427973 () Bool)

(declare-fun e!806503 () Bool)

(assert (=> b!1427973 (= e!806503 (not true))))

(assert (=> b!1427973 e!806504))

(declare-fun res!962811 () Bool)

(assert (=> b!1427973 (=> (not res!962811) (not e!806504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97364 (_ BitVec 32)) Bool)

(assert (=> b!1427973 (= res!962811 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48294 0))(
  ( (Unit!48295) )
))
(declare-fun lt!628789 () Unit!48294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48294)

(assert (=> b!1427973 (= lt!628789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427974 () Bool)

(declare-fun res!962801 () Bool)

(assert (=> b!1427974 (=> (not res!962801) (not e!806506))))

(declare-datatypes ((List!33505 0))(
  ( (Nil!33502) (Cons!33501 (h!34812 (_ BitVec 64)) (t!48199 List!33505)) )
))
(declare-fun arrayNoDuplicates!0 (array!97364 (_ BitVec 32) List!33505) Bool)

(assert (=> b!1427974 (= res!962801 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33502))))

(declare-fun b!1427975 () Bool)

(declare-fun res!962800 () Bool)

(assert (=> b!1427975 (=> (not res!962800) (not e!806503))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427975 (= res!962800 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427977 () Bool)

(declare-fun res!962812 () Bool)

(assert (=> b!1427977 (=> (not res!962812) (not e!806503))))

(declare-fun lt!628791 () SeekEntryResult!11274)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97364 (_ BitVec 32)) SeekEntryResult!11274)

(assert (=> b!1427977 (= res!962812 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46995 a!2831) j!81) a!2831 mask!2608) lt!628791))))

(declare-fun b!1427978 () Bool)

(declare-fun res!962803 () Bool)

(assert (=> b!1427978 (=> (not res!962803) (not e!806506))))

(assert (=> b!1427978 (= res!962803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427979 () Bool)

(declare-fun res!962807 () Bool)

(assert (=> b!1427979 (=> (not res!962807) (not e!806506))))

(assert (=> b!1427979 (= res!962807 (validKeyInArray!0 (select (arr!46995 a!2831) i!982)))))

(declare-fun b!1427980 () Bool)

(declare-fun e!806507 () Bool)

(assert (=> b!1427980 (= e!806506 e!806507)))

(declare-fun res!962805 () Bool)

(assert (=> b!1427980 (=> (not res!962805) (not e!806507))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427980 (= res!962805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46995 a!2831) j!81) mask!2608) (select (arr!46995 a!2831) j!81) a!2831 mask!2608) lt!628791))))

(assert (=> b!1427980 (= lt!628791 (Intermediate!11274 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427981 () Bool)

(declare-fun res!962810 () Bool)

(assert (=> b!1427981 (=> (not res!962810) (not e!806503))))

(declare-fun lt!628787 () SeekEntryResult!11274)

(declare-fun lt!628790 () (_ BitVec 64))

(declare-fun lt!628788 () array!97364)

(assert (=> b!1427981 (= res!962810 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628790 lt!628788 mask!2608) lt!628787))))

(declare-fun b!1427982 () Bool)

(assert (=> b!1427982 (= e!806507 e!806503)))

(declare-fun res!962802 () Bool)

(assert (=> b!1427982 (=> (not res!962802) (not e!806503))))

(assert (=> b!1427982 (= res!962802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628790 mask!2608) lt!628790 lt!628788 mask!2608) lt!628787))))

(assert (=> b!1427982 (= lt!628787 (Intermediate!11274 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427982 (= lt!628790 (select (store (arr!46995 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427982 (= lt!628788 (array!97365 (store (arr!46995 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47545 a!2831)))))

(declare-fun res!962809 () Bool)

(assert (=> start!123152 (=> (not res!962809) (not e!806506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123152 (= res!962809 (validMask!0 mask!2608))))

(assert (=> start!123152 e!806506))

(assert (=> start!123152 true))

(declare-fun array_inv!36023 (array!97364) Bool)

(assert (=> start!123152 (array_inv!36023 a!2831)))

(declare-fun b!1427976 () Bool)

(declare-fun res!962804 () Bool)

(assert (=> b!1427976 (=> (not res!962804) (not e!806506))))

(assert (=> b!1427976 (= res!962804 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47545 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47545 a!2831))))))

(assert (= (and start!123152 res!962809) b!1427970))

(assert (= (and b!1427970 res!962808) b!1427979))

(assert (= (and b!1427979 res!962807) b!1427972))

(assert (= (and b!1427972 res!962806) b!1427978))

(assert (= (and b!1427978 res!962803) b!1427974))

(assert (= (and b!1427974 res!962801) b!1427976))

(assert (= (and b!1427976 res!962804) b!1427980))

(assert (= (and b!1427980 res!962805) b!1427982))

(assert (= (and b!1427982 res!962802) b!1427977))

(assert (= (and b!1427977 res!962812) b!1427981))

(assert (= (and b!1427981 res!962810) b!1427975))

(assert (= (and b!1427975 res!962800) b!1427973))

(assert (= (and b!1427973 res!962811) b!1427971))

(declare-fun m!1318217 () Bool)

(assert (=> b!1427979 m!1318217))

(assert (=> b!1427979 m!1318217))

(declare-fun m!1318219 () Bool)

(assert (=> b!1427979 m!1318219))

(declare-fun m!1318221 () Bool)

(assert (=> b!1427981 m!1318221))

(declare-fun m!1318223 () Bool)

(assert (=> b!1427971 m!1318223))

(assert (=> b!1427971 m!1318223))

(declare-fun m!1318225 () Bool)

(assert (=> b!1427971 m!1318225))

(declare-fun m!1318227 () Bool)

(assert (=> b!1427974 m!1318227))

(declare-fun m!1318229 () Bool)

(assert (=> b!1427982 m!1318229))

(assert (=> b!1427982 m!1318229))

(declare-fun m!1318231 () Bool)

(assert (=> b!1427982 m!1318231))

(declare-fun m!1318233 () Bool)

(assert (=> b!1427982 m!1318233))

(declare-fun m!1318235 () Bool)

(assert (=> b!1427982 m!1318235))

(assert (=> b!1427977 m!1318223))

(assert (=> b!1427977 m!1318223))

(declare-fun m!1318237 () Bool)

(assert (=> b!1427977 m!1318237))

(declare-fun m!1318239 () Bool)

(assert (=> b!1427973 m!1318239))

(declare-fun m!1318241 () Bool)

(assert (=> b!1427973 m!1318241))

(declare-fun m!1318243 () Bool)

(assert (=> start!123152 m!1318243))

(declare-fun m!1318245 () Bool)

(assert (=> start!123152 m!1318245))

(assert (=> b!1427980 m!1318223))

(assert (=> b!1427980 m!1318223))

(declare-fun m!1318247 () Bool)

(assert (=> b!1427980 m!1318247))

(assert (=> b!1427980 m!1318247))

(assert (=> b!1427980 m!1318223))

(declare-fun m!1318249 () Bool)

(assert (=> b!1427980 m!1318249))

(declare-fun m!1318251 () Bool)

(assert (=> b!1427978 m!1318251))

(assert (=> b!1427972 m!1318223))

(assert (=> b!1427972 m!1318223))

(declare-fun m!1318253 () Bool)

(assert (=> b!1427972 m!1318253))

(check-sat (not b!1427978) (not b!1427974) (not b!1427979) (not b!1427971) (not start!123152) (not b!1427973) (not b!1427972) (not b!1427982) (not b!1427977) (not b!1427980) (not b!1427981))
(check-sat)
