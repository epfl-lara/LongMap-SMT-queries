; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123524 () Bool)

(assert start!123524)

(declare-fun b!1432025 () Bool)

(declare-fun e!808400 () Bool)

(assert (=> b!1432025 (= e!808400 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630263 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432025 (= lt!630263 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432026 () Bool)

(declare-fun res!965999 () Bool)

(declare-fun e!808399 () Bool)

(assert (=> b!1432026 (=> (not res!965999) (not e!808399))))

(declare-datatypes ((array!97461 0))(
  ( (array!97462 (arr!47038 (Array (_ BitVec 32) (_ BitVec 64))) (size!47590 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97461)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97461 (_ BitVec 32)) Bool)

(assert (=> b!1432026 (= res!965999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!966003 () Bool)

(assert (=> start!123524 (=> (not res!966003) (not e!808399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123524 (= res!966003 (validMask!0 mask!2608))))

(assert (=> start!123524 e!808399))

(assert (=> start!123524 true))

(declare-fun array_inv!36271 (array!97461) Bool)

(assert (=> start!123524 (array_inv!36271 a!2831)))

(declare-fun b!1432027 () Bool)

(declare-fun res!966006 () Bool)

(assert (=> b!1432027 (=> (not res!966006) (not e!808399))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432027 (= res!966006 (validKeyInArray!0 (select (arr!47038 a!2831) j!81)))))

(declare-fun b!1432028 () Bool)

(declare-fun res!965998 () Bool)

(declare-fun e!808403 () Bool)

(assert (=> b!1432028 (=> (not res!965998) (not e!808403))))

(declare-datatypes ((SeekEntryResult!11344 0))(
  ( (MissingZero!11344 (index!47768 (_ BitVec 32))) (Found!11344 (index!47769 (_ BitVec 32))) (Intermediate!11344 (undefined!12156 Bool) (index!47770 (_ BitVec 32)) (x!129405 (_ BitVec 32))) (Undefined!11344) (MissingVacant!11344 (index!47771 (_ BitVec 32))) )
))
(declare-fun lt!630265 () SeekEntryResult!11344)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97461 (_ BitVec 32)) SeekEntryResult!11344)

(assert (=> b!1432028 (= res!965998 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!630265))))

(declare-fun b!1432029 () Bool)

(declare-fun res!966004 () Bool)

(assert (=> b!1432029 (=> (not res!966004) (not e!808403))))

(declare-fun lt!630262 () (_ BitVec 64))

(declare-fun lt!630266 () SeekEntryResult!11344)

(declare-fun lt!630264 () array!97461)

(assert (=> b!1432029 (= res!966004 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630262 lt!630264 mask!2608) lt!630266))))

(declare-fun b!1432030 () Bool)

(declare-fun e!808401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97461 (_ BitVec 32)) SeekEntryResult!11344)

(assert (=> b!1432030 (= e!808401 (= (seekEntryOrOpen!0 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) (Found!11344 j!81)))))

(declare-fun b!1432031 () Bool)

(declare-fun e!808402 () Bool)

(assert (=> b!1432031 (= e!808399 e!808402)))

(declare-fun res!966000 () Bool)

(assert (=> b!1432031 (=> (not res!966000) (not e!808402))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432031 (= res!966000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!630265))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432031 (= lt!630265 (Intermediate!11344 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432032 () Bool)

(assert (=> b!1432032 (= e!808403 (not e!808400))))

(declare-fun res!965995 () Bool)

(assert (=> b!1432032 (=> res!965995 e!808400)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432032 (= res!965995 (or (= (select (arr!47038 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47038 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47038 a!2831) index!585) (select (arr!47038 a!2831) j!81)) (= (select (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432032 e!808401))

(declare-fun res!966005 () Bool)

(assert (=> b!1432032 (=> (not res!966005) (not e!808401))))

(assert (=> b!1432032 (= res!966005 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48273 0))(
  ( (Unit!48274) )
))
(declare-fun lt!630267 () Unit!48273)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48273)

(assert (=> b!1432032 (= lt!630267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432033 () Bool)

(assert (=> b!1432033 (= e!808402 e!808403)))

(declare-fun res!966001 () Bool)

(assert (=> b!1432033 (=> (not res!966001) (not e!808403))))

(assert (=> b!1432033 (= res!966001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630262 mask!2608) lt!630262 lt!630264 mask!2608) lt!630266))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432033 (= lt!630266 (Intermediate!11344 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432033 (= lt!630262 (select (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432033 (= lt!630264 (array!97462 (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47590 a!2831)))))

(declare-fun b!1432034 () Bool)

(declare-fun res!966002 () Bool)

(assert (=> b!1432034 (=> (not res!966002) (not e!808399))))

(assert (=> b!1432034 (= res!966002 (and (= (size!47590 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47590 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47590 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432035 () Bool)

(declare-fun res!965997 () Bool)

(assert (=> b!1432035 (=> (not res!965997) (not e!808399))))

(assert (=> b!1432035 (= res!965997 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47590 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47590 a!2831))))))

(declare-fun b!1432036 () Bool)

(declare-fun res!965996 () Bool)

(assert (=> b!1432036 (=> (not res!965996) (not e!808399))))

(assert (=> b!1432036 (= res!965996 (validKeyInArray!0 (select (arr!47038 a!2831) i!982)))))

(declare-fun b!1432037 () Bool)

(declare-fun res!965994 () Bool)

(assert (=> b!1432037 (=> (not res!965994) (not e!808403))))

(assert (=> b!1432037 (= res!965994 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432038 () Bool)

(declare-fun res!966007 () Bool)

(assert (=> b!1432038 (=> (not res!966007) (not e!808399))))

(declare-datatypes ((List!33626 0))(
  ( (Nil!33623) (Cons!33622 (h!34945 (_ BitVec 64)) (t!48312 List!33626)) )
))
(declare-fun arrayNoDuplicates!0 (array!97461 (_ BitVec 32) List!33626) Bool)

(assert (=> b!1432038 (= res!966007 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33623))))

(assert (= (and start!123524 res!966003) b!1432034))

(assert (= (and b!1432034 res!966002) b!1432036))

(assert (= (and b!1432036 res!965996) b!1432027))

(assert (= (and b!1432027 res!966006) b!1432026))

(assert (= (and b!1432026 res!965999) b!1432038))

(assert (= (and b!1432038 res!966007) b!1432035))

(assert (= (and b!1432035 res!965997) b!1432031))

(assert (= (and b!1432031 res!966000) b!1432033))

(assert (= (and b!1432033 res!966001) b!1432028))

(assert (= (and b!1432028 res!965998) b!1432029))

(assert (= (and b!1432029 res!966004) b!1432037))

(assert (= (and b!1432037 res!965994) b!1432032))

(assert (= (and b!1432032 res!966005) b!1432030))

(assert (= (and b!1432032 (not res!965995)) b!1432025))

(declare-fun m!1321337 () Bool)

(assert (=> start!123524 m!1321337))

(declare-fun m!1321339 () Bool)

(assert (=> start!123524 m!1321339))

(declare-fun m!1321341 () Bool)

(assert (=> b!1432031 m!1321341))

(assert (=> b!1432031 m!1321341))

(declare-fun m!1321343 () Bool)

(assert (=> b!1432031 m!1321343))

(assert (=> b!1432031 m!1321343))

(assert (=> b!1432031 m!1321341))

(declare-fun m!1321345 () Bool)

(assert (=> b!1432031 m!1321345))

(declare-fun m!1321347 () Bool)

(assert (=> b!1432032 m!1321347))

(declare-fun m!1321349 () Bool)

(assert (=> b!1432032 m!1321349))

(declare-fun m!1321351 () Bool)

(assert (=> b!1432032 m!1321351))

(declare-fun m!1321353 () Bool)

(assert (=> b!1432032 m!1321353))

(assert (=> b!1432032 m!1321341))

(declare-fun m!1321355 () Bool)

(assert (=> b!1432032 m!1321355))

(assert (=> b!1432028 m!1321341))

(assert (=> b!1432028 m!1321341))

(declare-fun m!1321357 () Bool)

(assert (=> b!1432028 m!1321357))

(declare-fun m!1321359 () Bool)

(assert (=> b!1432026 m!1321359))

(declare-fun m!1321361 () Bool)

(assert (=> b!1432025 m!1321361))

(declare-fun m!1321363 () Bool)

(assert (=> b!1432029 m!1321363))

(assert (=> b!1432030 m!1321341))

(assert (=> b!1432030 m!1321341))

(declare-fun m!1321365 () Bool)

(assert (=> b!1432030 m!1321365))

(declare-fun m!1321367 () Bool)

(assert (=> b!1432038 m!1321367))

(assert (=> b!1432027 m!1321341))

(assert (=> b!1432027 m!1321341))

(declare-fun m!1321369 () Bool)

(assert (=> b!1432027 m!1321369))

(declare-fun m!1321371 () Bool)

(assert (=> b!1432033 m!1321371))

(assert (=> b!1432033 m!1321371))

(declare-fun m!1321373 () Bool)

(assert (=> b!1432033 m!1321373))

(assert (=> b!1432033 m!1321347))

(declare-fun m!1321375 () Bool)

(assert (=> b!1432033 m!1321375))

(declare-fun m!1321377 () Bool)

(assert (=> b!1432036 m!1321377))

(assert (=> b!1432036 m!1321377))

(declare-fun m!1321379 () Bool)

(assert (=> b!1432036 m!1321379))

(check-sat (not b!1432032) (not b!1432028) (not b!1432029) (not b!1432026) (not b!1432027) (not b!1432030) (not b!1432036) (not b!1432033) (not start!123524) (not b!1432031) (not b!1432025) (not b!1432038))
(check-sat)
