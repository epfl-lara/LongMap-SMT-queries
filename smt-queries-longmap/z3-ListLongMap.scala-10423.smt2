; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122696 () Bool)

(assert start!122696)

(declare-fun b!1421460 () Bool)

(declare-fun e!803732 () Bool)

(declare-fun e!803731 () Bool)

(assert (=> b!1421460 (= e!803732 e!803731)))

(declare-fun res!956949 () Bool)

(assert (=> b!1421460 (=> (not res!956949) (not e!803731))))

(declare-datatypes ((array!97014 0))(
  ( (array!97015 (arr!46825 (Array (_ BitVec 32) (_ BitVec 64))) (size!47377 (_ BitVec 32))) )
))
(declare-fun lt!626120 () array!97014)

(declare-datatypes ((SeekEntryResult!11137 0))(
  ( (MissingZero!11137 (index!46940 (_ BitVec 32))) (Found!11137 (index!46941 (_ BitVec 32))) (Intermediate!11137 (undefined!11949 Bool) (index!46942 (_ BitVec 32)) (x!128584 (_ BitVec 32))) (Undefined!11137) (MissingVacant!11137 (index!46943 (_ BitVec 32))) )
))
(declare-fun lt!626119 () SeekEntryResult!11137)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626116 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97014 (_ BitVec 32)) SeekEntryResult!11137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421460 (= res!956949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626116 mask!2608) lt!626116 lt!626120 mask!2608) lt!626119))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421460 (= lt!626119 (Intermediate!11137 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97014)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421460 (= lt!626116 (select (store (arr!46825 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421460 (= lt!626120 (array!97015 (store (arr!46825 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47377 a!2831)))))

(declare-fun b!1421461 () Bool)

(declare-fun e!803735 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97014 (_ BitVec 32)) SeekEntryResult!11137)

(assert (=> b!1421461 (= e!803735 (= (seekEntryOrOpen!0 (select (arr!46825 a!2831) j!81) a!2831 mask!2608) (Found!11137 j!81)))))

(declare-fun b!1421462 () Bool)

(declare-fun res!956954 () Bool)

(declare-fun e!803733 () Bool)

(assert (=> b!1421462 (=> (not res!956954) (not e!803733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421462 (= res!956954 (validKeyInArray!0 (select (arr!46825 a!2831) j!81)))))

(declare-fun b!1421463 () Bool)

(declare-fun res!956952 () Bool)

(assert (=> b!1421463 (=> (not res!956952) (not e!803733))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421463 (= res!956952 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47377 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47377 a!2831))))))

(declare-fun b!1421464 () Bool)

(declare-fun res!956953 () Bool)

(assert (=> b!1421464 (=> (not res!956953) (not e!803733))))

(assert (=> b!1421464 (= res!956953 (validKeyInArray!0 (select (arr!46825 a!2831) i!982)))))

(declare-fun b!1421465 () Bool)

(declare-fun res!956951 () Bool)

(assert (=> b!1421465 (=> (not res!956951) (not e!803733))))

(assert (=> b!1421465 (= res!956951 (and (= (size!47377 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47377 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47377 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421466 () Bool)

(declare-fun res!956946 () Bool)

(assert (=> b!1421466 (=> (not res!956946) (not e!803733))))

(declare-datatypes ((List!33413 0))(
  ( (Nil!33410) (Cons!33409 (h!34711 (_ BitVec 64)) (t!48099 List!33413)) )
))
(declare-fun arrayNoDuplicates!0 (array!97014 (_ BitVec 32) List!33413) Bool)

(assert (=> b!1421466 (= res!956946 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33410))))

(declare-fun b!1421467 () Bool)

(declare-fun res!956948 () Bool)

(assert (=> b!1421467 (=> (not res!956948) (not e!803731))))

(declare-fun lt!626118 () SeekEntryResult!11137)

(assert (=> b!1421467 (= res!956948 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46825 a!2831) j!81) a!2831 mask!2608) lt!626118))))

(declare-fun b!1421468 () Bool)

(declare-fun res!956944 () Bool)

(assert (=> b!1421468 (=> (not res!956944) (not e!803731))))

(assert (=> b!1421468 (= res!956944 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626116 lt!626120 mask!2608) lt!626119))))

(declare-fun b!1421469 () Bool)

(assert (=> b!1421469 (= e!803731 (not true))))

(assert (=> b!1421469 e!803735))

(declare-fun res!956945 () Bool)

(assert (=> b!1421469 (=> (not res!956945) (not e!803735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97014 (_ BitVec 32)) Bool)

(assert (=> b!1421469 (= res!956945 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47949 0))(
  ( (Unit!47950) )
))
(declare-fun lt!626117 () Unit!47949)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47949)

(assert (=> b!1421469 (= lt!626117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421470 () Bool)

(declare-fun res!956947 () Bool)

(assert (=> b!1421470 (=> (not res!956947) (not e!803731))))

(assert (=> b!1421470 (= res!956947 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421471 () Bool)

(assert (=> b!1421471 (= e!803733 e!803732)))

(declare-fun res!956950 () Bool)

(assert (=> b!1421471 (=> (not res!956950) (not e!803732))))

(assert (=> b!1421471 (= res!956950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46825 a!2831) j!81) mask!2608) (select (arr!46825 a!2831) j!81) a!2831 mask!2608) lt!626118))))

(assert (=> b!1421471 (= lt!626118 (Intermediate!11137 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421472 () Bool)

(declare-fun res!956956 () Bool)

(assert (=> b!1421472 (=> (not res!956956) (not e!803733))))

(assert (=> b!1421472 (= res!956956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956955 () Bool)

(assert (=> start!122696 (=> (not res!956955) (not e!803733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122696 (= res!956955 (validMask!0 mask!2608))))

(assert (=> start!122696 e!803733))

(assert (=> start!122696 true))

(declare-fun array_inv!36058 (array!97014) Bool)

(assert (=> start!122696 (array_inv!36058 a!2831)))

(assert (= (and start!122696 res!956955) b!1421465))

(assert (= (and b!1421465 res!956951) b!1421464))

(assert (= (and b!1421464 res!956953) b!1421462))

(assert (= (and b!1421462 res!956954) b!1421472))

(assert (= (and b!1421472 res!956956) b!1421466))

(assert (= (and b!1421466 res!956946) b!1421463))

(assert (= (and b!1421463 res!956952) b!1421471))

(assert (= (and b!1421471 res!956950) b!1421460))

(assert (= (and b!1421460 res!956949) b!1421467))

(assert (= (and b!1421467 res!956948) b!1421468))

(assert (= (and b!1421468 res!956944) b!1421470))

(assert (= (and b!1421470 res!956947) b!1421469))

(assert (= (and b!1421469 res!956945) b!1421461))

(declare-fun m!1311531 () Bool)

(assert (=> b!1421462 m!1311531))

(assert (=> b!1421462 m!1311531))

(declare-fun m!1311533 () Bool)

(assert (=> b!1421462 m!1311533))

(declare-fun m!1311535 () Bool)

(assert (=> b!1421464 m!1311535))

(assert (=> b!1421464 m!1311535))

(declare-fun m!1311537 () Bool)

(assert (=> b!1421464 m!1311537))

(declare-fun m!1311539 () Bool)

(assert (=> b!1421472 m!1311539))

(declare-fun m!1311541 () Bool)

(assert (=> start!122696 m!1311541))

(declare-fun m!1311543 () Bool)

(assert (=> start!122696 m!1311543))

(assert (=> b!1421467 m!1311531))

(assert (=> b!1421467 m!1311531))

(declare-fun m!1311545 () Bool)

(assert (=> b!1421467 m!1311545))

(declare-fun m!1311547 () Bool)

(assert (=> b!1421466 m!1311547))

(declare-fun m!1311549 () Bool)

(assert (=> b!1421469 m!1311549))

(declare-fun m!1311551 () Bool)

(assert (=> b!1421469 m!1311551))

(declare-fun m!1311553 () Bool)

(assert (=> b!1421468 m!1311553))

(assert (=> b!1421471 m!1311531))

(assert (=> b!1421471 m!1311531))

(declare-fun m!1311555 () Bool)

(assert (=> b!1421471 m!1311555))

(assert (=> b!1421471 m!1311555))

(assert (=> b!1421471 m!1311531))

(declare-fun m!1311557 () Bool)

(assert (=> b!1421471 m!1311557))

(assert (=> b!1421461 m!1311531))

(assert (=> b!1421461 m!1311531))

(declare-fun m!1311559 () Bool)

(assert (=> b!1421461 m!1311559))

(declare-fun m!1311561 () Bool)

(assert (=> b!1421460 m!1311561))

(assert (=> b!1421460 m!1311561))

(declare-fun m!1311563 () Bool)

(assert (=> b!1421460 m!1311563))

(declare-fun m!1311565 () Bool)

(assert (=> b!1421460 m!1311565))

(declare-fun m!1311567 () Bool)

(assert (=> b!1421460 m!1311567))

(check-sat (not b!1421472) (not b!1421460) (not start!122696) (not b!1421462) (not b!1421466) (not b!1421468) (not b!1421464) (not b!1421469) (not b!1421467) (not b!1421461) (not b!1421471))
(check-sat)
