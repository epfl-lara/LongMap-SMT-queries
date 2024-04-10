; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126126 () Bool)

(assert start!126126)

(declare-fun b!1476382 () Bool)

(declare-fun res!1002637 () Bool)

(declare-fun e!828318 () Bool)

(assert (=> b!1476382 (=> (not res!1002637) (not e!828318))))

(declare-datatypes ((array!99232 0))(
  ( (array!99233 (arr!47895 (Array (_ BitVec 32) (_ BitVec 64))) (size!48445 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99232)

(declare-datatypes ((List!34396 0))(
  ( (Nil!34393) (Cons!34392 (h!35760 (_ BitVec 64)) (t!49090 List!34396)) )
))
(declare-fun arrayNoDuplicates!0 (array!99232 (_ BitVec 32) List!34396) Bool)

(assert (=> b!1476382 (= res!1002637 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34393))))

(declare-fun b!1476383 () Bool)

(declare-fun res!1002625 () Bool)

(declare-fun e!828321 () Bool)

(assert (=> b!1476383 (=> (not res!1002625) (not e!828321))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12135 0))(
  ( (MissingZero!12135 (index!50932 (_ BitVec 32))) (Found!12135 (index!50933 (_ BitVec 32))) (Intermediate!12135 (undefined!12947 Bool) (index!50934 (_ BitVec 32)) (x!132534 (_ BitVec 32))) (Undefined!12135) (MissingVacant!12135 (index!50935 (_ BitVec 32))) )
))
(declare-fun lt!644996 () SeekEntryResult!12135)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12135)

(assert (=> b!1476383 (= res!1002625 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47895 a!2862) j!93) a!2862 mask!2687) lt!644996))))

(declare-fun b!1476384 () Bool)

(declare-fun res!1002633 () Bool)

(assert (=> b!1476384 (=> (not res!1002633) (not e!828318))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476384 (= res!1002633 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48445 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48445 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48445 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476385 () Bool)

(declare-fun res!1002634 () Bool)

(assert (=> b!1476385 (=> (not res!1002634) (not e!828318))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476385 (= res!1002634 (validKeyInArray!0 (select (arr!47895 a!2862) i!1006)))))

(declare-fun b!1476386 () Bool)

(declare-fun res!1002632 () Bool)

(declare-fun e!828323 () Bool)

(assert (=> b!1476386 (=> (not res!1002632) (not e!828323))))

(assert (=> b!1476386 (= res!1002632 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1002626 () Bool)

(assert (=> start!126126 (=> (not res!1002626) (not e!828318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126126 (= res!1002626 (validMask!0 mask!2687))))

(assert (=> start!126126 e!828318))

(assert (=> start!126126 true))

(declare-fun array_inv!36923 (array!99232) Bool)

(assert (=> start!126126 (array_inv!36923 a!2862)))

(declare-fun b!1476387 () Bool)

(declare-fun e!828315 () Bool)

(assert (=> b!1476387 (= e!828318 e!828315)))

(declare-fun res!1002629 () Bool)

(assert (=> b!1476387 (=> (not res!1002629) (not e!828315))))

(assert (=> b!1476387 (= res!1002629 (= (select (store (arr!47895 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644995 () array!99232)

(assert (=> b!1476387 (= lt!644995 (array!99233 (store (arr!47895 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48445 a!2862)))))

(declare-fun b!1476388 () Bool)

(declare-fun res!1002636 () Bool)

(assert (=> b!1476388 (=> (not res!1002636) (not e!828318))))

(assert (=> b!1476388 (= res!1002636 (validKeyInArray!0 (select (arr!47895 a!2862) j!93)))))

(declare-fun b!1476389 () Bool)

(declare-fun lt!644998 () (_ BitVec 64))

(declare-fun e!828322 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12135)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12135)

(assert (=> b!1476389 (= e!828322 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644998 lt!644995 mask!2687) (seekEntryOrOpen!0 lt!644998 lt!644995 mask!2687)))))

(declare-fun b!1476390 () Bool)

(declare-fun e!828317 () Bool)

(declare-fun e!828319 () Bool)

(assert (=> b!1476390 (= e!828317 e!828319)))

(declare-fun res!1002630 () Bool)

(assert (=> b!1476390 (=> (not res!1002630) (not e!828319))))

(declare-fun lt!644997 () SeekEntryResult!12135)

(assert (=> b!1476390 (= res!1002630 (= lt!644997 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47895 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476391 () Bool)

(declare-fun lt!644999 () SeekEntryResult!12135)

(assert (=> b!1476391 (= e!828322 (= lt!644999 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644998 lt!644995 mask!2687)))))

(declare-fun b!1476392 () Bool)

(assert (=> b!1476392 (= e!828323 (not true))))

(declare-fun e!828316 () Bool)

(assert (=> b!1476392 e!828316))

(declare-fun res!1002631 () Bool)

(assert (=> b!1476392 (=> (not res!1002631) (not e!828316))))

(assert (=> b!1476392 (= res!1002631 (and (= lt!644997 (Found!12135 j!93)) (or (= (select (arr!47895 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47895 a!2862) intermediateBeforeIndex!19) (select (arr!47895 a!2862) j!93)))))))

(assert (=> b!1476392 (= lt!644997 (seekEntryOrOpen!0 (select (arr!47895 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99232 (_ BitVec 32)) Bool)

(assert (=> b!1476392 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49610 0))(
  ( (Unit!49611) )
))
(declare-fun lt!645000 () Unit!49610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49610)

(assert (=> b!1476392 (= lt!645000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476393 () Bool)

(declare-fun res!1002635 () Bool)

(assert (=> b!1476393 (=> (not res!1002635) (not e!828323))))

(assert (=> b!1476393 (= res!1002635 e!828322)))

(declare-fun c!136398 () Bool)

(assert (=> b!1476393 (= c!136398 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476394 () Bool)

(assert (=> b!1476394 (= e!828319 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476395 () Bool)

(assert (=> b!1476395 (= e!828316 e!828317)))

(declare-fun res!1002640 () Bool)

(assert (=> b!1476395 (=> res!1002640 e!828317)))

(assert (=> b!1476395 (= res!1002640 (or (and (= (select (arr!47895 a!2862) index!646) (select (store (arr!47895 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47895 a!2862) index!646) (select (arr!47895 a!2862) j!93))) (not (= (select (arr!47895 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476396 () Bool)

(assert (=> b!1476396 (= e!828315 e!828321)))

(declare-fun res!1002639 () Bool)

(assert (=> b!1476396 (=> (not res!1002639) (not e!828321))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476396 (= res!1002639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47895 a!2862) j!93) mask!2687) (select (arr!47895 a!2862) j!93) a!2862 mask!2687) lt!644996))))

(assert (=> b!1476396 (= lt!644996 (Intermediate!12135 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476397 () Bool)

(declare-fun res!1002628 () Bool)

(assert (=> b!1476397 (=> (not res!1002628) (not e!828318))))

(assert (=> b!1476397 (= res!1002628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476398 () Bool)

(declare-fun res!1002638 () Bool)

(assert (=> b!1476398 (=> (not res!1002638) (not e!828318))))

(assert (=> b!1476398 (= res!1002638 (and (= (size!48445 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48445 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48445 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476399 () Bool)

(assert (=> b!1476399 (= e!828321 e!828323)))

(declare-fun res!1002627 () Bool)

(assert (=> b!1476399 (=> (not res!1002627) (not e!828323))))

(assert (=> b!1476399 (= res!1002627 (= lt!644999 (Intermediate!12135 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476399 (= lt!644999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644998 mask!2687) lt!644998 lt!644995 mask!2687))))

(assert (=> b!1476399 (= lt!644998 (select (store (arr!47895 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126126 res!1002626) b!1476398))

(assert (= (and b!1476398 res!1002638) b!1476385))

(assert (= (and b!1476385 res!1002634) b!1476388))

(assert (= (and b!1476388 res!1002636) b!1476397))

(assert (= (and b!1476397 res!1002628) b!1476382))

(assert (= (and b!1476382 res!1002637) b!1476384))

(assert (= (and b!1476384 res!1002633) b!1476387))

(assert (= (and b!1476387 res!1002629) b!1476396))

(assert (= (and b!1476396 res!1002639) b!1476383))

(assert (= (and b!1476383 res!1002625) b!1476399))

(assert (= (and b!1476399 res!1002627) b!1476393))

(assert (= (and b!1476393 c!136398) b!1476391))

(assert (= (and b!1476393 (not c!136398)) b!1476389))

(assert (= (and b!1476393 res!1002635) b!1476386))

(assert (= (and b!1476386 res!1002632) b!1476392))

(assert (= (and b!1476392 res!1002631) b!1476395))

(assert (= (and b!1476395 (not res!1002640)) b!1476390))

(assert (= (and b!1476390 res!1002630) b!1476394))

(declare-fun m!1362371 () Bool)

(assert (=> b!1476383 m!1362371))

(assert (=> b!1476383 m!1362371))

(declare-fun m!1362373 () Bool)

(assert (=> b!1476383 m!1362373))

(declare-fun m!1362375 () Bool)

(assert (=> b!1476399 m!1362375))

(assert (=> b!1476399 m!1362375))

(declare-fun m!1362377 () Bool)

(assert (=> b!1476399 m!1362377))

(declare-fun m!1362379 () Bool)

(assert (=> b!1476399 m!1362379))

(declare-fun m!1362381 () Bool)

(assert (=> b!1476399 m!1362381))

(declare-fun m!1362383 () Bool)

(assert (=> b!1476389 m!1362383))

(declare-fun m!1362385 () Bool)

(assert (=> b!1476389 m!1362385))

(assert (=> b!1476387 m!1362379))

(declare-fun m!1362387 () Bool)

(assert (=> b!1476387 m!1362387))

(declare-fun m!1362389 () Bool)

(assert (=> b!1476382 m!1362389))

(declare-fun m!1362391 () Bool)

(assert (=> b!1476395 m!1362391))

(assert (=> b!1476395 m!1362379))

(declare-fun m!1362393 () Bool)

(assert (=> b!1476395 m!1362393))

(assert (=> b!1476395 m!1362371))

(assert (=> b!1476390 m!1362371))

(assert (=> b!1476390 m!1362371))

(declare-fun m!1362395 () Bool)

(assert (=> b!1476390 m!1362395))

(assert (=> b!1476388 m!1362371))

(assert (=> b!1476388 m!1362371))

(declare-fun m!1362397 () Bool)

(assert (=> b!1476388 m!1362397))

(declare-fun m!1362399 () Bool)

(assert (=> b!1476397 m!1362399))

(assert (=> b!1476396 m!1362371))

(assert (=> b!1476396 m!1362371))

(declare-fun m!1362401 () Bool)

(assert (=> b!1476396 m!1362401))

(assert (=> b!1476396 m!1362401))

(assert (=> b!1476396 m!1362371))

(declare-fun m!1362403 () Bool)

(assert (=> b!1476396 m!1362403))

(declare-fun m!1362405 () Bool)

(assert (=> b!1476392 m!1362405))

(declare-fun m!1362407 () Bool)

(assert (=> b!1476392 m!1362407))

(assert (=> b!1476392 m!1362371))

(declare-fun m!1362409 () Bool)

(assert (=> b!1476392 m!1362409))

(declare-fun m!1362411 () Bool)

(assert (=> b!1476392 m!1362411))

(assert (=> b!1476392 m!1362371))

(declare-fun m!1362413 () Bool)

(assert (=> b!1476391 m!1362413))

(declare-fun m!1362415 () Bool)

(assert (=> start!126126 m!1362415))

(declare-fun m!1362417 () Bool)

(assert (=> start!126126 m!1362417))

(declare-fun m!1362419 () Bool)

(assert (=> b!1476385 m!1362419))

(assert (=> b!1476385 m!1362419))

(declare-fun m!1362421 () Bool)

(assert (=> b!1476385 m!1362421))

(check-sat (not b!1476396) (not b!1476391) (not b!1476392) (not b!1476382) (not b!1476383) (not start!126126) (not b!1476397) (not b!1476390) (not b!1476388) (not b!1476399) (not b!1476385) (not b!1476389))
(check-sat)
