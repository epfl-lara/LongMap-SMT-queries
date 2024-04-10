; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123556 () Bool)

(assert start!123556)

(declare-fun b!1432529 () Bool)

(declare-fun e!808640 () Bool)

(declare-fun e!808639 () Bool)

(assert (=> b!1432529 (= e!808640 (not e!808639))))

(declare-fun res!966403 () Bool)

(assert (=> b!1432529 (=> res!966403 e!808639)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97528 0))(
  ( (array!97529 (arr!47071 (Array (_ BitVec 32) (_ BitVec 64))) (size!47621 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97528)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432529 (= res!966403 (or (= (select (arr!47071 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47071 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47071 a!2831) index!585) (select (arr!47071 a!2831) j!81)) (= (select (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808638 () Bool)

(assert (=> b!1432529 e!808638))

(declare-fun res!966393 () Bool)

(assert (=> b!1432529 (=> (not res!966393) (not e!808638))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97528 (_ BitVec 32)) Bool)

(assert (=> b!1432529 (= res!966393 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48446 0))(
  ( (Unit!48447) )
))
(declare-fun lt!630636 () Unit!48446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48446)

(assert (=> b!1432529 (= lt!630636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432530 () Bool)

(declare-fun res!966396 () Bool)

(declare-fun e!808643 () Bool)

(assert (=> b!1432530 (=> (not res!966396) (not e!808643))))

(assert (=> b!1432530 (= res!966396 (and (= (size!47621 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47621 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47621 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432531 () Bool)

(declare-fun res!966399 () Bool)

(assert (=> b!1432531 (=> (not res!966399) (not e!808643))))

(assert (=> b!1432531 (= res!966399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432532 () Bool)

(declare-fun res!966398 () Bool)

(assert (=> b!1432532 (=> (not res!966398) (not e!808643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432532 (= res!966398 (validKeyInArray!0 (select (arr!47071 a!2831) i!982)))))

(declare-fun b!1432533 () Bool)

(declare-fun res!966394 () Bool)

(assert (=> b!1432533 (=> (not res!966394) (not e!808640))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11350 0))(
  ( (MissingZero!11350 (index!47792 (_ BitVec 32))) (Found!11350 (index!47793 (_ BitVec 32))) (Intermediate!11350 (undefined!12162 Bool) (index!47794 (_ BitVec 32)) (x!129432 (_ BitVec 32))) (Undefined!11350) (MissingVacant!11350 (index!47795 (_ BitVec 32))) )
))
(declare-fun lt!630634 () SeekEntryResult!11350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97528 (_ BitVec 32)) SeekEntryResult!11350)

(assert (=> b!1432533 (= res!966394 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!630634))))

(declare-fun b!1432534 () Bool)

(declare-fun res!966402 () Bool)

(assert (=> b!1432534 (=> (not res!966402) (not e!808640))))

(declare-fun lt!630631 () (_ BitVec 64))

(declare-fun lt!630633 () SeekEntryResult!11350)

(declare-fun lt!630632 () array!97528)

(assert (=> b!1432534 (= res!966402 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630631 lt!630632 mask!2608) lt!630633))))

(declare-fun b!1432535 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97528 (_ BitVec 32)) SeekEntryResult!11350)

(assert (=> b!1432535 (= e!808638 (= (seekEntryOrOpen!0 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) (Found!11350 j!81)))))

(declare-fun b!1432536 () Bool)

(assert (=> b!1432536 (= e!808639 true)))

(declare-fun lt!630635 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432536 (= lt!630635 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!966397 () Bool)

(assert (=> start!123556 (=> (not res!966397) (not e!808643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123556 (= res!966397 (validMask!0 mask!2608))))

(assert (=> start!123556 e!808643))

(assert (=> start!123556 true))

(declare-fun array_inv!36099 (array!97528) Bool)

(assert (=> start!123556 (array_inv!36099 a!2831)))

(declare-fun b!1432537 () Bool)

(declare-fun res!966404 () Bool)

(assert (=> b!1432537 (=> (not res!966404) (not e!808643))))

(assert (=> b!1432537 (= res!966404 (validKeyInArray!0 (select (arr!47071 a!2831) j!81)))))

(declare-fun b!1432538 () Bool)

(declare-fun e!808641 () Bool)

(assert (=> b!1432538 (= e!808643 e!808641)))

(declare-fun res!966406 () Bool)

(assert (=> b!1432538 (=> (not res!966406) (not e!808641))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432538 (= res!966406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47071 a!2831) j!81) mask!2608) (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!630634))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432538 (= lt!630634 (Intermediate!11350 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432539 () Bool)

(assert (=> b!1432539 (= e!808641 e!808640)))

(declare-fun res!966405 () Bool)

(assert (=> b!1432539 (=> (not res!966405) (not e!808640))))

(assert (=> b!1432539 (= res!966405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630631 mask!2608) lt!630631 lt!630632 mask!2608) lt!630633))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432539 (= lt!630633 (Intermediate!11350 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432539 (= lt!630631 (select (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432539 (= lt!630632 (array!97529 (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47621 a!2831)))))

(declare-fun b!1432540 () Bool)

(declare-fun res!966395 () Bool)

(assert (=> b!1432540 (=> (not res!966395) (not e!808643))))

(assert (=> b!1432540 (= res!966395 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47621 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47621 a!2831))))))

(declare-fun b!1432541 () Bool)

(declare-fun res!966400 () Bool)

(assert (=> b!1432541 (=> (not res!966400) (not e!808640))))

(assert (=> b!1432541 (= res!966400 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432542 () Bool)

(declare-fun res!966401 () Bool)

(assert (=> b!1432542 (=> (not res!966401) (not e!808643))))

(declare-datatypes ((List!33581 0))(
  ( (Nil!33578) (Cons!33577 (h!34900 (_ BitVec 64)) (t!48275 List!33581)) )
))
(declare-fun arrayNoDuplicates!0 (array!97528 (_ BitVec 32) List!33581) Bool)

(assert (=> b!1432542 (= res!966401 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33578))))

(assert (= (and start!123556 res!966397) b!1432530))

(assert (= (and b!1432530 res!966396) b!1432532))

(assert (= (and b!1432532 res!966398) b!1432537))

(assert (= (and b!1432537 res!966404) b!1432531))

(assert (= (and b!1432531 res!966399) b!1432542))

(assert (= (and b!1432542 res!966401) b!1432540))

(assert (= (and b!1432540 res!966395) b!1432538))

(assert (= (and b!1432538 res!966406) b!1432539))

(assert (= (and b!1432539 res!966405) b!1432533))

(assert (= (and b!1432533 res!966394) b!1432534))

(assert (= (and b!1432534 res!966402) b!1432541))

(assert (= (and b!1432541 res!966400) b!1432529))

(assert (= (and b!1432529 res!966393) b!1432535))

(assert (= (and b!1432529 (not res!966403)) b!1432536))

(declare-fun m!1322341 () Bool)

(assert (=> b!1432542 m!1322341))

(declare-fun m!1322343 () Bool)

(assert (=> b!1432533 m!1322343))

(assert (=> b!1432533 m!1322343))

(declare-fun m!1322345 () Bool)

(assert (=> b!1432533 m!1322345))

(declare-fun m!1322347 () Bool)

(assert (=> b!1432532 m!1322347))

(assert (=> b!1432532 m!1322347))

(declare-fun m!1322349 () Bool)

(assert (=> b!1432532 m!1322349))

(assert (=> b!1432538 m!1322343))

(assert (=> b!1432538 m!1322343))

(declare-fun m!1322351 () Bool)

(assert (=> b!1432538 m!1322351))

(assert (=> b!1432538 m!1322351))

(assert (=> b!1432538 m!1322343))

(declare-fun m!1322353 () Bool)

(assert (=> b!1432538 m!1322353))

(declare-fun m!1322355 () Bool)

(assert (=> b!1432536 m!1322355))

(declare-fun m!1322357 () Bool)

(assert (=> b!1432529 m!1322357))

(declare-fun m!1322359 () Bool)

(assert (=> b!1432529 m!1322359))

(declare-fun m!1322361 () Bool)

(assert (=> b!1432529 m!1322361))

(declare-fun m!1322363 () Bool)

(assert (=> b!1432529 m!1322363))

(assert (=> b!1432529 m!1322343))

(declare-fun m!1322365 () Bool)

(assert (=> b!1432529 m!1322365))

(assert (=> b!1432535 m!1322343))

(assert (=> b!1432535 m!1322343))

(declare-fun m!1322367 () Bool)

(assert (=> b!1432535 m!1322367))

(assert (=> b!1432537 m!1322343))

(assert (=> b!1432537 m!1322343))

(declare-fun m!1322369 () Bool)

(assert (=> b!1432537 m!1322369))

(declare-fun m!1322371 () Bool)

(assert (=> start!123556 m!1322371))

(declare-fun m!1322373 () Bool)

(assert (=> start!123556 m!1322373))

(declare-fun m!1322375 () Bool)

(assert (=> b!1432539 m!1322375))

(assert (=> b!1432539 m!1322375))

(declare-fun m!1322377 () Bool)

(assert (=> b!1432539 m!1322377))

(assert (=> b!1432539 m!1322357))

(declare-fun m!1322379 () Bool)

(assert (=> b!1432539 m!1322379))

(declare-fun m!1322381 () Bool)

(assert (=> b!1432534 m!1322381))

(declare-fun m!1322383 () Bool)

(assert (=> b!1432531 m!1322383))

(push 1)

