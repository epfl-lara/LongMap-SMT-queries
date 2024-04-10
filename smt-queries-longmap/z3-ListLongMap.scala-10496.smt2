; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123554 () Bool)

(assert start!123554)

(declare-fun b!1432487 () Bool)

(declare-fun res!966364 () Bool)

(declare-fun e!808621 () Bool)

(assert (=> b!1432487 (=> (not res!966364) (not e!808621))))

(declare-datatypes ((array!97526 0))(
  ( (array!97527 (arr!47070 (Array (_ BitVec 32) (_ BitVec 64))) (size!47620 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97526)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432487 (= res!966364 (validKeyInArray!0 (select (arr!47070 a!2831) j!81)))))

(declare-fun b!1432488 () Bool)

(declare-fun e!808620 () Bool)

(declare-fun e!808624 () Bool)

(assert (=> b!1432488 (= e!808620 (not e!808624))))

(declare-fun res!966357 () Bool)

(assert (=> b!1432488 (=> res!966357 e!808624)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432488 (= res!966357 (or (= (select (arr!47070 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47070 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47070 a!2831) index!585) (select (arr!47070 a!2831) j!81)) (= (select (store (arr!47070 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808625 () Bool)

(assert (=> b!1432488 e!808625))

(declare-fun res!966354 () Bool)

(assert (=> b!1432488 (=> (not res!966354) (not e!808625))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97526 (_ BitVec 32)) Bool)

(assert (=> b!1432488 (= res!966354 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48444 0))(
  ( (Unit!48445) )
))
(declare-fun lt!630613 () Unit!48444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48444)

(assert (=> b!1432488 (= lt!630613 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432489 () Bool)

(declare-fun res!966362 () Bool)

(assert (=> b!1432489 (=> (not res!966362) (not e!808621))))

(declare-datatypes ((List!33580 0))(
  ( (Nil!33577) (Cons!33576 (h!34899 (_ BitVec 64)) (t!48274 List!33580)) )
))
(declare-fun arrayNoDuplicates!0 (array!97526 (_ BitVec 32) List!33580) Bool)

(assert (=> b!1432489 (= res!966362 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33577))))

(declare-fun b!1432490 () Bool)

(declare-fun res!966358 () Bool)

(assert (=> b!1432490 (=> (not res!966358) (not e!808620))))

(declare-datatypes ((SeekEntryResult!11349 0))(
  ( (MissingZero!11349 (index!47788 (_ BitVec 32))) (Found!11349 (index!47789 (_ BitVec 32))) (Intermediate!11349 (undefined!12161 Bool) (index!47790 (_ BitVec 32)) (x!129431 (_ BitVec 32))) (Undefined!11349) (MissingVacant!11349 (index!47791 (_ BitVec 32))) )
))
(declare-fun lt!630617 () SeekEntryResult!11349)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97526 (_ BitVec 32)) SeekEntryResult!11349)

(assert (=> b!1432490 (= res!966358 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47070 a!2831) j!81) a!2831 mask!2608) lt!630617))))

(declare-fun b!1432491 () Bool)

(declare-fun res!966355 () Bool)

(assert (=> b!1432491 (=> (not res!966355) (not e!808621))))

(assert (=> b!1432491 (= res!966355 (and (= (size!47620 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47620 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47620 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432492 () Bool)

(declare-fun res!966351 () Bool)

(assert (=> b!1432492 (=> (not res!966351) (not e!808620))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432492 (= res!966351 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432493 () Bool)

(declare-fun res!966352 () Bool)

(assert (=> b!1432493 (=> (not res!966352) (not e!808621))))

(assert (=> b!1432493 (= res!966352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432494 () Bool)

(declare-fun res!966356 () Bool)

(assert (=> b!1432494 (=> (not res!966356) (not e!808620))))

(declare-fun lt!630616 () SeekEntryResult!11349)

(declare-fun lt!630615 () (_ BitVec 64))

(declare-fun lt!630614 () array!97526)

(assert (=> b!1432494 (= res!966356 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630615 lt!630614 mask!2608) lt!630616))))

(declare-fun b!1432495 () Bool)

(assert (=> b!1432495 (= e!808624 true)))

(declare-fun lt!630618 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432495 (= lt!630618 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!966361 () Bool)

(assert (=> start!123554 (=> (not res!966361) (not e!808621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123554 (= res!966361 (validMask!0 mask!2608))))

(assert (=> start!123554 e!808621))

(assert (=> start!123554 true))

(declare-fun array_inv!36098 (array!97526) Bool)

(assert (=> start!123554 (array_inv!36098 a!2831)))

(declare-fun b!1432496 () Bool)

(declare-fun e!808623 () Bool)

(assert (=> b!1432496 (= e!808621 e!808623)))

(declare-fun res!966363 () Bool)

(assert (=> b!1432496 (=> (not res!966363) (not e!808623))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432496 (= res!966363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47070 a!2831) j!81) mask!2608) (select (arr!47070 a!2831) j!81) a!2831 mask!2608) lt!630617))))

(assert (=> b!1432496 (= lt!630617 (Intermediate!11349 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432497 () Bool)

(assert (=> b!1432497 (= e!808623 e!808620)))

(declare-fun res!966360 () Bool)

(assert (=> b!1432497 (=> (not res!966360) (not e!808620))))

(assert (=> b!1432497 (= res!966360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630615 mask!2608) lt!630615 lt!630614 mask!2608) lt!630616))))

(assert (=> b!1432497 (= lt!630616 (Intermediate!11349 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432497 (= lt!630615 (select (store (arr!47070 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432497 (= lt!630614 (array!97527 (store (arr!47070 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47620 a!2831)))))

(declare-fun b!1432498 () Bool)

(declare-fun res!966353 () Bool)

(assert (=> b!1432498 (=> (not res!966353) (not e!808621))))

(assert (=> b!1432498 (= res!966353 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47620 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47620 a!2831))))))

(declare-fun b!1432499 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97526 (_ BitVec 32)) SeekEntryResult!11349)

(assert (=> b!1432499 (= e!808625 (= (seekEntryOrOpen!0 (select (arr!47070 a!2831) j!81) a!2831 mask!2608) (Found!11349 j!81)))))

(declare-fun b!1432500 () Bool)

(declare-fun res!966359 () Bool)

(assert (=> b!1432500 (=> (not res!966359) (not e!808621))))

(assert (=> b!1432500 (= res!966359 (validKeyInArray!0 (select (arr!47070 a!2831) i!982)))))

(assert (= (and start!123554 res!966361) b!1432491))

(assert (= (and b!1432491 res!966355) b!1432500))

(assert (= (and b!1432500 res!966359) b!1432487))

(assert (= (and b!1432487 res!966364) b!1432493))

(assert (= (and b!1432493 res!966352) b!1432489))

(assert (= (and b!1432489 res!966362) b!1432498))

(assert (= (and b!1432498 res!966353) b!1432496))

(assert (= (and b!1432496 res!966363) b!1432497))

(assert (= (and b!1432497 res!966360) b!1432490))

(assert (= (and b!1432490 res!966358) b!1432494))

(assert (= (and b!1432494 res!966356) b!1432492))

(assert (= (and b!1432492 res!966351) b!1432488))

(assert (= (and b!1432488 res!966354) b!1432499))

(assert (= (and b!1432488 (not res!966357)) b!1432495))

(declare-fun m!1322297 () Bool)

(assert (=> b!1432495 m!1322297))

(declare-fun m!1322299 () Bool)

(assert (=> b!1432497 m!1322299))

(assert (=> b!1432497 m!1322299))

(declare-fun m!1322301 () Bool)

(assert (=> b!1432497 m!1322301))

(declare-fun m!1322303 () Bool)

(assert (=> b!1432497 m!1322303))

(declare-fun m!1322305 () Bool)

(assert (=> b!1432497 m!1322305))

(declare-fun m!1322307 () Bool)

(assert (=> b!1432494 m!1322307))

(declare-fun m!1322309 () Bool)

(assert (=> b!1432499 m!1322309))

(assert (=> b!1432499 m!1322309))

(declare-fun m!1322311 () Bool)

(assert (=> b!1432499 m!1322311))

(declare-fun m!1322313 () Bool)

(assert (=> b!1432500 m!1322313))

(assert (=> b!1432500 m!1322313))

(declare-fun m!1322315 () Bool)

(assert (=> b!1432500 m!1322315))

(assert (=> b!1432496 m!1322309))

(assert (=> b!1432496 m!1322309))

(declare-fun m!1322317 () Bool)

(assert (=> b!1432496 m!1322317))

(assert (=> b!1432496 m!1322317))

(assert (=> b!1432496 m!1322309))

(declare-fun m!1322319 () Bool)

(assert (=> b!1432496 m!1322319))

(assert (=> b!1432487 m!1322309))

(assert (=> b!1432487 m!1322309))

(declare-fun m!1322321 () Bool)

(assert (=> b!1432487 m!1322321))

(declare-fun m!1322323 () Bool)

(assert (=> b!1432493 m!1322323))

(assert (=> b!1432488 m!1322303))

(declare-fun m!1322325 () Bool)

(assert (=> b!1432488 m!1322325))

(declare-fun m!1322327 () Bool)

(assert (=> b!1432488 m!1322327))

(declare-fun m!1322329 () Bool)

(assert (=> b!1432488 m!1322329))

(assert (=> b!1432488 m!1322309))

(declare-fun m!1322331 () Bool)

(assert (=> b!1432488 m!1322331))

(declare-fun m!1322333 () Bool)

(assert (=> start!123554 m!1322333))

(declare-fun m!1322335 () Bool)

(assert (=> start!123554 m!1322335))

(assert (=> b!1432490 m!1322309))

(assert (=> b!1432490 m!1322309))

(declare-fun m!1322337 () Bool)

(assert (=> b!1432490 m!1322337))

(declare-fun m!1322339 () Bool)

(assert (=> b!1432489 m!1322339))

(check-sat (not b!1432496) (not b!1432489) (not b!1432497) (not b!1432499) (not b!1432494) (not start!123554) (not b!1432493) (not b!1432487) (not b!1432490) (not b!1432495) (not b!1432500) (not b!1432488))
(check-sat)
