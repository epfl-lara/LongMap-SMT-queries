; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123274 () Bool)

(assert start!123274)

(declare-fun b!1429605 () Bool)

(declare-fun e!807206 () Bool)

(declare-fun e!807205 () Bool)

(assert (=> b!1429605 (= e!807206 e!807205)))

(declare-fun res!964244 () Bool)

(assert (=> b!1429605 (=> (not res!964244) (not e!807205))))

(declare-datatypes ((array!97435 0))(
  ( (array!97436 (arr!47029 (Array (_ BitVec 32) (_ BitVec 64))) (size!47579 (_ BitVec 32))) )
))
(declare-fun lt!629429 () array!97435)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11308 0))(
  ( (MissingZero!11308 (index!47624 (_ BitVec 32))) (Found!11308 (index!47625 (_ BitVec 32))) (Intermediate!11308 (undefined!12120 Bool) (index!47626 (_ BitVec 32)) (x!129254 (_ BitVec 32))) (Undefined!11308) (MissingVacant!11308 (index!47627 (_ BitVec 32))) )
))
(declare-fun lt!629433 () SeekEntryResult!11308)

(declare-fun lt!629430 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97435 (_ BitVec 32)) SeekEntryResult!11308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429605 (= res!964244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629430 mask!2608) lt!629430 lt!629429 mask!2608) lt!629433))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429605 (= lt!629433 (Intermediate!11308 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97435)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429605 (= lt!629430 (select (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429605 (= lt!629429 (array!97436 (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47579 a!2831)))))

(declare-fun b!1429606 () Bool)

(declare-fun res!964236 () Bool)

(assert (=> b!1429606 (=> (not res!964236) (not e!807205))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1429606 (= res!964236 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629430 lt!629429 mask!2608) lt!629433))))

(declare-fun b!1429607 () Bool)

(declare-fun res!964240 () Bool)

(declare-fun e!807202 () Bool)

(assert (=> b!1429607 (=> (not res!964240) (not e!807202))))

(assert (=> b!1429607 (= res!964240 (and (= (size!47579 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47579 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47579 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429608 () Bool)

(declare-fun res!964238 () Bool)

(assert (=> b!1429608 (=> (not res!964238) (not e!807202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429608 (= res!964238 (validKeyInArray!0 (select (arr!47029 a!2831) j!81)))))

(declare-fun b!1429609 () Bool)

(assert (=> b!1429609 (= e!807202 e!807206)))

(declare-fun res!964234 () Bool)

(assert (=> b!1429609 (=> (not res!964234) (not e!807206))))

(declare-fun lt!629432 () SeekEntryResult!11308)

(assert (=> b!1429609 (= res!964234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!629432))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429609 (= lt!629432 (Intermediate!11308 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429610 () Bool)

(declare-fun res!964243 () Bool)

(assert (=> b!1429610 (=> (not res!964243) (not e!807205))))

(assert (=> b!1429610 (= res!964243 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!629432))))

(declare-fun b!1429611 () Bool)

(declare-fun res!964239 () Bool)

(assert (=> b!1429611 (=> (not res!964239) (not e!807202))))

(assert (=> b!1429611 (= res!964239 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47579 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47579 a!2831))))))

(declare-fun b!1429612 () Bool)

(declare-fun res!964245 () Bool)

(assert (=> b!1429612 (=> (not res!964245) (not e!807205))))

(assert (=> b!1429612 (= res!964245 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun e!807203 () Bool)

(declare-fun b!1429613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97435 (_ BitVec 32)) SeekEntryResult!11308)

(assert (=> b!1429613 (= e!807203 (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) (Found!11308 j!81)))))

(declare-fun b!1429614 () Bool)

(declare-fun res!964235 () Bool)

(assert (=> b!1429614 (=> (not res!964235) (not e!807202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97435 (_ BitVec 32)) Bool)

(assert (=> b!1429614 (= res!964235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429615 () Bool)

(declare-fun res!964237 () Bool)

(assert (=> b!1429615 (=> (not res!964237) (not e!807202))))

(declare-datatypes ((List!33539 0))(
  ( (Nil!33536) (Cons!33535 (h!34849 (_ BitVec 64)) (t!48233 List!33539)) )
))
(declare-fun arrayNoDuplicates!0 (array!97435 (_ BitVec 32) List!33539) Bool)

(assert (=> b!1429615 (= res!964237 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33536))))

(declare-fun res!964246 () Bool)

(assert (=> start!123274 (=> (not res!964246) (not e!807202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123274 (= res!964246 (validMask!0 mask!2608))))

(assert (=> start!123274 e!807202))

(assert (=> start!123274 true))

(declare-fun array_inv!36057 (array!97435) Bool)

(assert (=> start!123274 (array_inv!36057 a!2831)))

(declare-fun b!1429616 () Bool)

(declare-fun res!964241 () Bool)

(assert (=> b!1429616 (=> (not res!964241) (not e!807202))))

(assert (=> b!1429616 (= res!964241 (validKeyInArray!0 (select (arr!47029 a!2831) i!982)))))

(declare-fun b!1429617 () Bool)

(assert (=> b!1429617 (= e!807205 (not true))))

(assert (=> b!1429617 e!807203))

(declare-fun res!964242 () Bool)

(assert (=> b!1429617 (=> (not res!964242) (not e!807203))))

(assert (=> b!1429617 (= res!964242 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48362 0))(
  ( (Unit!48363) )
))
(declare-fun lt!629431 () Unit!48362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48362)

(assert (=> b!1429617 (= lt!629431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123274 res!964246) b!1429607))

(assert (= (and b!1429607 res!964240) b!1429616))

(assert (= (and b!1429616 res!964241) b!1429608))

(assert (= (and b!1429608 res!964238) b!1429614))

(assert (= (and b!1429614 res!964235) b!1429615))

(assert (= (and b!1429615 res!964237) b!1429611))

(assert (= (and b!1429611 res!964239) b!1429609))

(assert (= (and b!1429609 res!964234) b!1429605))

(assert (= (and b!1429605 res!964244) b!1429610))

(assert (= (and b!1429610 res!964243) b!1429606))

(assert (= (and b!1429606 res!964236) b!1429612))

(assert (= (and b!1429612 res!964245) b!1429617))

(assert (= (and b!1429617 res!964242) b!1429613))

(declare-fun m!1319701 () Bool)

(assert (=> b!1429614 m!1319701))

(declare-fun m!1319703 () Bool)

(assert (=> b!1429608 m!1319703))

(assert (=> b!1429608 m!1319703))

(declare-fun m!1319705 () Bool)

(assert (=> b!1429608 m!1319705))

(declare-fun m!1319707 () Bool)

(assert (=> start!123274 m!1319707))

(declare-fun m!1319709 () Bool)

(assert (=> start!123274 m!1319709))

(declare-fun m!1319711 () Bool)

(assert (=> b!1429616 m!1319711))

(assert (=> b!1429616 m!1319711))

(declare-fun m!1319713 () Bool)

(assert (=> b!1429616 m!1319713))

(assert (=> b!1429613 m!1319703))

(assert (=> b!1429613 m!1319703))

(declare-fun m!1319715 () Bool)

(assert (=> b!1429613 m!1319715))

(declare-fun m!1319717 () Bool)

(assert (=> b!1429615 m!1319717))

(declare-fun m!1319719 () Bool)

(assert (=> b!1429606 m!1319719))

(declare-fun m!1319721 () Bool)

(assert (=> b!1429605 m!1319721))

(assert (=> b!1429605 m!1319721))

(declare-fun m!1319723 () Bool)

(assert (=> b!1429605 m!1319723))

(declare-fun m!1319725 () Bool)

(assert (=> b!1429605 m!1319725))

(declare-fun m!1319727 () Bool)

(assert (=> b!1429605 m!1319727))

(assert (=> b!1429610 m!1319703))

(assert (=> b!1429610 m!1319703))

(declare-fun m!1319729 () Bool)

(assert (=> b!1429610 m!1319729))

(assert (=> b!1429609 m!1319703))

(assert (=> b!1429609 m!1319703))

(declare-fun m!1319731 () Bool)

(assert (=> b!1429609 m!1319731))

(assert (=> b!1429609 m!1319731))

(assert (=> b!1429609 m!1319703))

(declare-fun m!1319733 () Bool)

(assert (=> b!1429609 m!1319733))

(declare-fun m!1319735 () Bool)

(assert (=> b!1429617 m!1319735))

(declare-fun m!1319737 () Bool)

(assert (=> b!1429617 m!1319737))

(push 1)

