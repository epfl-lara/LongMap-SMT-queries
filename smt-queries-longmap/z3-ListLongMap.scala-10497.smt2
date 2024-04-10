; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123560 () Bool)

(assert start!123560)

(declare-fun b!1432613 () Bool)

(declare-fun res!966487 () Bool)

(declare-fun e!808677 () Bool)

(assert (=> b!1432613 (=> (not res!966487) (not e!808677))))

(declare-datatypes ((array!97532 0))(
  ( (array!97533 (arr!47073 (Array (_ BitVec 32) (_ BitVec 64))) (size!47623 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97532)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432613 (= res!966487 (validKeyInArray!0 (select (arr!47073 a!2831) i!982)))))

(declare-fun b!1432614 () Bool)

(declare-fun e!808678 () Bool)

(declare-fun e!808679 () Bool)

(assert (=> b!1432614 (= e!808678 (not e!808679))))

(declare-fun res!966482 () Bool)

(assert (=> b!1432614 (=> res!966482 e!808679)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432614 (= res!966482 (or (= (select (arr!47073 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47073 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47073 a!2831) index!585) (select (arr!47073 a!2831) j!81)) (= (select (store (arr!47073 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808674 () Bool)

(assert (=> b!1432614 e!808674))

(declare-fun res!966486 () Bool)

(assert (=> b!1432614 (=> (not res!966486) (not e!808674))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97532 (_ BitVec 32)) Bool)

(assert (=> b!1432614 (= res!966486 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48450 0))(
  ( (Unit!48451) )
))
(declare-fun lt!630670 () Unit!48450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48450)

(assert (=> b!1432614 (= lt!630670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432615 () Bool)

(declare-fun e!808675 () Bool)

(assert (=> b!1432615 (= e!808677 e!808675)))

(declare-fun res!966478 () Bool)

(assert (=> b!1432615 (=> (not res!966478) (not e!808675))))

(declare-datatypes ((SeekEntryResult!11352 0))(
  ( (MissingZero!11352 (index!47800 (_ BitVec 32))) (Found!11352 (index!47801 (_ BitVec 32))) (Intermediate!11352 (undefined!12164 Bool) (index!47802 (_ BitVec 32)) (x!129442 (_ BitVec 32))) (Undefined!11352) (MissingVacant!11352 (index!47803 (_ BitVec 32))) )
))
(declare-fun lt!630671 () SeekEntryResult!11352)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97532 (_ BitVec 32)) SeekEntryResult!11352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432615 (= res!966478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47073 a!2831) j!81) mask!2608) (select (arr!47073 a!2831) j!81) a!2831 mask!2608) lt!630671))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432615 (= lt!630671 (Intermediate!11352 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432616 () Bool)

(declare-fun res!966479 () Bool)

(assert (=> b!1432616 (=> (not res!966479) (not e!808677))))

(assert (=> b!1432616 (= res!966479 (validKeyInArray!0 (select (arr!47073 a!2831) j!81)))))

(declare-fun b!1432617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97532 (_ BitVec 32)) SeekEntryResult!11352)

(assert (=> b!1432617 (= e!808674 (= (seekEntryOrOpen!0 (select (arr!47073 a!2831) j!81) a!2831 mask!2608) (Found!11352 j!81)))))

(declare-fun b!1432618 () Bool)

(declare-fun res!966477 () Bool)

(assert (=> b!1432618 (=> (not res!966477) (not e!808677))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432618 (= res!966477 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47623 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47623 a!2831))))))

(declare-fun b!1432620 () Bool)

(declare-fun res!966480 () Bool)

(assert (=> b!1432620 (=> (not res!966480) (not e!808678))))

(assert (=> b!1432620 (= res!966480 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47073 a!2831) j!81) a!2831 mask!2608) lt!630671))))

(declare-fun b!1432621 () Bool)

(assert (=> b!1432621 (= e!808675 e!808678)))

(declare-fun res!966488 () Bool)

(assert (=> b!1432621 (=> (not res!966488) (not e!808678))))

(declare-fun lt!630667 () (_ BitVec 64))

(declare-fun lt!630669 () array!97532)

(declare-fun lt!630668 () SeekEntryResult!11352)

(assert (=> b!1432621 (= res!966488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630667 mask!2608) lt!630667 lt!630669 mask!2608) lt!630668))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432621 (= lt!630668 (Intermediate!11352 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432621 (= lt!630667 (select (store (arr!47073 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432621 (= lt!630669 (array!97533 (store (arr!47073 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47623 a!2831)))))

(declare-fun b!1432622 () Bool)

(declare-fun res!966481 () Bool)

(assert (=> b!1432622 (=> (not res!966481) (not e!808677))))

(declare-datatypes ((List!33583 0))(
  ( (Nil!33580) (Cons!33579 (h!34902 (_ BitVec 64)) (t!48277 List!33583)) )
))
(declare-fun arrayNoDuplicates!0 (array!97532 (_ BitVec 32) List!33583) Bool)

(assert (=> b!1432622 (= res!966481 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33580))))

(declare-fun b!1432623 () Bool)

(declare-fun res!966489 () Bool)

(assert (=> b!1432623 (=> (not res!966489) (not e!808677))))

(assert (=> b!1432623 (= res!966489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432624 () Bool)

(declare-fun res!966484 () Bool)

(assert (=> b!1432624 (=> (not res!966484) (not e!808678))))

(assert (=> b!1432624 (= res!966484 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630667 lt!630669 mask!2608) lt!630668))))

(declare-fun b!1432619 () Bool)

(assert (=> b!1432619 (= e!808679 true)))

(declare-fun lt!630672 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432619 (= lt!630672 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!966483 () Bool)

(assert (=> start!123560 (=> (not res!966483) (not e!808677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123560 (= res!966483 (validMask!0 mask!2608))))

(assert (=> start!123560 e!808677))

(assert (=> start!123560 true))

(declare-fun array_inv!36101 (array!97532) Bool)

(assert (=> start!123560 (array_inv!36101 a!2831)))

(declare-fun b!1432625 () Bool)

(declare-fun res!966490 () Bool)

(assert (=> b!1432625 (=> (not res!966490) (not e!808678))))

(assert (=> b!1432625 (= res!966490 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432626 () Bool)

(declare-fun res!966485 () Bool)

(assert (=> b!1432626 (=> (not res!966485) (not e!808677))))

(assert (=> b!1432626 (= res!966485 (and (= (size!47623 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47623 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47623 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123560 res!966483) b!1432626))

(assert (= (and b!1432626 res!966485) b!1432613))

(assert (= (and b!1432613 res!966487) b!1432616))

(assert (= (and b!1432616 res!966479) b!1432623))

(assert (= (and b!1432623 res!966489) b!1432622))

(assert (= (and b!1432622 res!966481) b!1432618))

(assert (= (and b!1432618 res!966477) b!1432615))

(assert (= (and b!1432615 res!966478) b!1432621))

(assert (= (and b!1432621 res!966488) b!1432620))

(assert (= (and b!1432620 res!966480) b!1432624))

(assert (= (and b!1432624 res!966484) b!1432625))

(assert (= (and b!1432625 res!966490) b!1432614))

(assert (= (and b!1432614 res!966486) b!1432617))

(assert (= (and b!1432614 (not res!966482)) b!1432619))

(declare-fun m!1322429 () Bool)

(assert (=> b!1432624 m!1322429))

(declare-fun m!1322431 () Bool)

(assert (=> b!1432617 m!1322431))

(assert (=> b!1432617 m!1322431))

(declare-fun m!1322433 () Bool)

(assert (=> b!1432617 m!1322433))

(declare-fun m!1322435 () Bool)

(assert (=> start!123560 m!1322435))

(declare-fun m!1322437 () Bool)

(assert (=> start!123560 m!1322437))

(assert (=> b!1432615 m!1322431))

(assert (=> b!1432615 m!1322431))

(declare-fun m!1322439 () Bool)

(assert (=> b!1432615 m!1322439))

(assert (=> b!1432615 m!1322439))

(assert (=> b!1432615 m!1322431))

(declare-fun m!1322441 () Bool)

(assert (=> b!1432615 m!1322441))

(declare-fun m!1322443 () Bool)

(assert (=> b!1432619 m!1322443))

(declare-fun m!1322445 () Bool)

(assert (=> b!1432621 m!1322445))

(assert (=> b!1432621 m!1322445))

(declare-fun m!1322447 () Bool)

(assert (=> b!1432621 m!1322447))

(declare-fun m!1322449 () Bool)

(assert (=> b!1432621 m!1322449))

(declare-fun m!1322451 () Bool)

(assert (=> b!1432621 m!1322451))

(assert (=> b!1432616 m!1322431))

(assert (=> b!1432616 m!1322431))

(declare-fun m!1322453 () Bool)

(assert (=> b!1432616 m!1322453))

(declare-fun m!1322455 () Bool)

(assert (=> b!1432613 m!1322455))

(assert (=> b!1432613 m!1322455))

(declare-fun m!1322457 () Bool)

(assert (=> b!1432613 m!1322457))

(declare-fun m!1322459 () Bool)

(assert (=> b!1432623 m!1322459))

(assert (=> b!1432614 m!1322449))

(declare-fun m!1322461 () Bool)

(assert (=> b!1432614 m!1322461))

(declare-fun m!1322463 () Bool)

(assert (=> b!1432614 m!1322463))

(declare-fun m!1322465 () Bool)

(assert (=> b!1432614 m!1322465))

(assert (=> b!1432614 m!1322431))

(declare-fun m!1322467 () Bool)

(assert (=> b!1432614 m!1322467))

(assert (=> b!1432620 m!1322431))

(assert (=> b!1432620 m!1322431))

(declare-fun m!1322469 () Bool)

(assert (=> b!1432620 m!1322469))

(declare-fun m!1322471 () Bool)

(assert (=> b!1432622 m!1322471))

(check-sat (not b!1432616) (not b!1432615) (not b!1432614) (not b!1432613) (not b!1432620) (not b!1432617) (not start!123560) (not b!1432622) (not b!1432621) (not b!1432623) (not b!1432619) (not b!1432624))
(check-sat)
