; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123164 () Bool)

(assert start!123164)

(declare-fun res!963034 () Bool)

(declare-fun e!806596 () Bool)

(assert (=> start!123164 (=> (not res!963034) (not e!806596))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123164 (= res!963034 (validMask!0 mask!2608))))

(assert (=> start!123164 e!806596))

(assert (=> start!123164 true))

(declare-datatypes ((array!97376 0))(
  ( (array!97377 (arr!47001 (Array (_ BitVec 32) (_ BitVec 64))) (size!47551 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97376)

(declare-fun array_inv!36029 (array!97376) Bool)

(assert (=> start!123164 (array_inv!36029 a!2831)))

(declare-fun b!1428204 () Bool)

(declare-fun res!963035 () Bool)

(assert (=> b!1428204 (=> (not res!963035) (not e!806596))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428204 (= res!963035 (validKeyInArray!0 (select (arr!47001 a!2831) j!81)))))

(declare-fun b!1428205 () Bool)

(declare-fun res!963041 () Bool)

(declare-fun e!806595 () Bool)

(assert (=> b!1428205 (=> (not res!963041) (not e!806595))))

(declare-fun lt!628881 () array!97376)

(declare-datatypes ((SeekEntryResult!11280 0))(
  ( (MissingZero!11280 (index!47512 (_ BitVec 32))) (Found!11280 (index!47513 (_ BitVec 32))) (Intermediate!11280 (undefined!12092 Bool) (index!47514 (_ BitVec 32)) (x!129148 (_ BitVec 32))) (Undefined!11280) (MissingVacant!11280 (index!47515 (_ BitVec 32))) )
))
(declare-fun lt!628877 () SeekEntryResult!11280)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628879 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97376 (_ BitVec 32)) SeekEntryResult!11280)

(assert (=> b!1428205 (= res!963041 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628879 lt!628881 mask!2608) lt!628877))))

(declare-fun b!1428206 () Bool)

(declare-fun res!963045 () Bool)

(assert (=> b!1428206 (=> (not res!963045) (not e!806596))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428206 (= res!963045 (and (= (size!47551 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47551 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47551 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428207 () Bool)

(assert (=> b!1428207 (= e!806595 (not true))))

(declare-fun e!806593 () Bool)

(assert (=> b!1428207 e!806593))

(declare-fun res!963037 () Bool)

(assert (=> b!1428207 (=> (not res!963037) (not e!806593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97376 (_ BitVec 32)) Bool)

(assert (=> b!1428207 (= res!963037 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48306 0))(
  ( (Unit!48307) )
))
(declare-fun lt!628878 () Unit!48306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48306)

(assert (=> b!1428207 (= lt!628878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428208 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97376 (_ BitVec 32)) SeekEntryResult!11280)

(assert (=> b!1428208 (= e!806593 (= (seekEntryOrOpen!0 (select (arr!47001 a!2831) j!81) a!2831 mask!2608) (Found!11280 j!81)))))

(declare-fun b!1428209 () Bool)

(declare-fun res!963040 () Bool)

(assert (=> b!1428209 (=> (not res!963040) (not e!806595))))

(declare-fun lt!628880 () SeekEntryResult!11280)

(assert (=> b!1428209 (= res!963040 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47001 a!2831) j!81) a!2831 mask!2608) lt!628880))))

(declare-fun b!1428210 () Bool)

(declare-fun res!963036 () Bool)

(assert (=> b!1428210 (=> (not res!963036) (not e!806596))))

(assert (=> b!1428210 (= res!963036 (validKeyInArray!0 (select (arr!47001 a!2831) i!982)))))

(declare-fun b!1428211 () Bool)

(declare-fun res!963044 () Bool)

(assert (=> b!1428211 (=> (not res!963044) (not e!806595))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428211 (= res!963044 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428212 () Bool)

(declare-fun res!963039 () Bool)

(assert (=> b!1428212 (=> (not res!963039) (not e!806596))))

(assert (=> b!1428212 (= res!963039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428213 () Bool)

(declare-fun e!806594 () Bool)

(assert (=> b!1428213 (= e!806596 e!806594)))

(declare-fun res!963038 () Bool)

(assert (=> b!1428213 (=> (not res!963038) (not e!806594))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428213 (= res!963038 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47001 a!2831) j!81) mask!2608) (select (arr!47001 a!2831) j!81) a!2831 mask!2608) lt!628880))))

(assert (=> b!1428213 (= lt!628880 (Intermediate!11280 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428214 () Bool)

(assert (=> b!1428214 (= e!806594 e!806595)))

(declare-fun res!963043 () Bool)

(assert (=> b!1428214 (=> (not res!963043) (not e!806595))))

(assert (=> b!1428214 (= res!963043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628879 mask!2608) lt!628879 lt!628881 mask!2608) lt!628877))))

(assert (=> b!1428214 (= lt!628877 (Intermediate!11280 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428214 (= lt!628879 (select (store (arr!47001 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428214 (= lt!628881 (array!97377 (store (arr!47001 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47551 a!2831)))))

(declare-fun b!1428215 () Bool)

(declare-fun res!963046 () Bool)

(assert (=> b!1428215 (=> (not res!963046) (not e!806596))))

(assert (=> b!1428215 (= res!963046 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47551 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47551 a!2831))))))

(declare-fun b!1428216 () Bool)

(declare-fun res!963042 () Bool)

(assert (=> b!1428216 (=> (not res!963042) (not e!806596))))

(declare-datatypes ((List!33511 0))(
  ( (Nil!33508) (Cons!33507 (h!34818 (_ BitVec 64)) (t!48205 List!33511)) )
))
(declare-fun arrayNoDuplicates!0 (array!97376 (_ BitVec 32) List!33511) Bool)

(assert (=> b!1428216 (= res!963042 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33508))))

(assert (= (and start!123164 res!963034) b!1428206))

(assert (= (and b!1428206 res!963045) b!1428210))

(assert (= (and b!1428210 res!963036) b!1428204))

(assert (= (and b!1428204 res!963035) b!1428212))

(assert (= (and b!1428212 res!963039) b!1428216))

(assert (= (and b!1428216 res!963042) b!1428215))

(assert (= (and b!1428215 res!963046) b!1428213))

(assert (= (and b!1428213 res!963038) b!1428214))

(assert (= (and b!1428214 res!963043) b!1428209))

(assert (= (and b!1428209 res!963040) b!1428205))

(assert (= (and b!1428205 res!963041) b!1428211))

(assert (= (and b!1428211 res!963044) b!1428207))

(assert (= (and b!1428207 res!963037) b!1428208))

(declare-fun m!1318445 () Bool)

(assert (=> b!1428216 m!1318445))

(declare-fun m!1318447 () Bool)

(assert (=> b!1428210 m!1318447))

(assert (=> b!1428210 m!1318447))

(declare-fun m!1318449 () Bool)

(assert (=> b!1428210 m!1318449))

(declare-fun m!1318451 () Bool)

(assert (=> b!1428212 m!1318451))

(declare-fun m!1318453 () Bool)

(assert (=> start!123164 m!1318453))

(declare-fun m!1318455 () Bool)

(assert (=> start!123164 m!1318455))

(declare-fun m!1318457 () Bool)

(assert (=> b!1428214 m!1318457))

(assert (=> b!1428214 m!1318457))

(declare-fun m!1318459 () Bool)

(assert (=> b!1428214 m!1318459))

(declare-fun m!1318461 () Bool)

(assert (=> b!1428214 m!1318461))

(declare-fun m!1318463 () Bool)

(assert (=> b!1428214 m!1318463))

(declare-fun m!1318465 () Bool)

(assert (=> b!1428204 m!1318465))

(assert (=> b!1428204 m!1318465))

(declare-fun m!1318467 () Bool)

(assert (=> b!1428204 m!1318467))

(assert (=> b!1428213 m!1318465))

(assert (=> b!1428213 m!1318465))

(declare-fun m!1318469 () Bool)

(assert (=> b!1428213 m!1318469))

(assert (=> b!1428213 m!1318469))

(assert (=> b!1428213 m!1318465))

(declare-fun m!1318471 () Bool)

(assert (=> b!1428213 m!1318471))

(declare-fun m!1318473 () Bool)

(assert (=> b!1428205 m!1318473))

(assert (=> b!1428209 m!1318465))

(assert (=> b!1428209 m!1318465))

(declare-fun m!1318475 () Bool)

(assert (=> b!1428209 m!1318475))

(assert (=> b!1428208 m!1318465))

(assert (=> b!1428208 m!1318465))

(declare-fun m!1318477 () Bool)

(assert (=> b!1428208 m!1318477))

(declare-fun m!1318479 () Bool)

(assert (=> b!1428207 m!1318479))

(declare-fun m!1318481 () Bool)

(assert (=> b!1428207 m!1318481))

(check-sat (not b!1428208) (not b!1428213) (not b!1428205) (not start!123164) (not b!1428209) (not b!1428214) (not b!1428204) (not b!1428210) (not b!1428212) (not b!1428216) (not b!1428207))
(check-sat)
