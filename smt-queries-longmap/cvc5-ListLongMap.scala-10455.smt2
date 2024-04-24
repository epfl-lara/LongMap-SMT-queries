; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123138 () Bool)

(assert start!123138)

(declare-fun b!1426897 () Bool)

(declare-fun res!961445 () Bool)

(declare-fun e!806288 () Bool)

(assert (=> b!1426897 (=> (not res!961445) (not e!806288))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97374 0))(
  ( (array!97375 (arr!47001 (Array (_ BitVec 32) (_ BitVec 64))) (size!47552 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97374)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11182 0))(
  ( (MissingZero!11182 (index!47120 (_ BitVec 32))) (Found!11182 (index!47121 (_ BitVec 32))) (Intermediate!11182 (undefined!11994 Bool) (index!47122 (_ BitVec 32)) (x!128913 (_ BitVec 32))) (Undefined!11182) (MissingVacant!11182 (index!47123 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97374 (_ BitVec 32)) SeekEntryResult!11182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426897 (= res!961445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47001 a!2831) j!81) mask!2608) (select (arr!47001 a!2831) j!81) a!2831 mask!2608) (Intermediate!11182 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1426898 () Bool)

(declare-fun res!961453 () Bool)

(assert (=> b!1426898 (=> (not res!961453) (not e!806288))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426898 (= res!961453 (validKeyInArray!0 (select (arr!47001 a!2831) i!982)))))

(declare-fun b!1426899 () Bool)

(declare-fun res!961450 () Bool)

(assert (=> b!1426899 (=> (not res!961450) (not e!806288))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426899 (= res!961450 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47552 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47552 a!2831))))))

(declare-fun b!1426900 () Bool)

(declare-fun res!961448 () Bool)

(assert (=> b!1426900 (=> (not res!961448) (not e!806288))))

(assert (=> b!1426900 (= res!961448 (and (= (size!47552 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47552 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47552 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426901 () Bool)

(assert (=> b!1426901 (= e!806288 false)))

(declare-fun lt!628346 () SeekEntryResult!11182)

(assert (=> b!1426901 (= lt!628346 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47001 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426902 () Bool)

(declare-fun res!961451 () Bool)

(assert (=> b!1426902 (=> (not res!961451) (not e!806288))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1426902 (= res!961451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47001 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!47001 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97375 (store (arr!47001 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47552 a!2831)) mask!2608) (Intermediate!11182 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1426903 () Bool)

(declare-fun res!961446 () Bool)

(assert (=> b!1426903 (=> (not res!961446) (not e!806288))))

(assert (=> b!1426903 (= res!961446 (validKeyInArray!0 (select (arr!47001 a!2831) j!81)))))

(declare-fun res!961452 () Bool)

(assert (=> start!123138 (=> (not res!961452) (not e!806288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123138 (= res!961452 (validMask!0 mask!2608))))

(assert (=> start!123138 e!806288))

(assert (=> start!123138 true))

(declare-fun array_inv!36282 (array!97374) Bool)

(assert (=> start!123138 (array_inv!36282 a!2831)))

(declare-fun b!1426904 () Bool)

(declare-fun res!961449 () Bool)

(assert (=> b!1426904 (=> (not res!961449) (not e!806288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97374 (_ BitVec 32)) Bool)

(assert (=> b!1426904 (= res!961449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426905 () Bool)

(declare-fun res!961447 () Bool)

(assert (=> b!1426905 (=> (not res!961447) (not e!806288))))

(declare-datatypes ((List!33498 0))(
  ( (Nil!33495) (Cons!33494 (h!34807 (_ BitVec 64)) (t!48184 List!33498)) )
))
(declare-fun arrayNoDuplicates!0 (array!97374 (_ BitVec 32) List!33498) Bool)

(assert (=> b!1426905 (= res!961447 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33495))))

(assert (= (and start!123138 res!961452) b!1426900))

(assert (= (and b!1426900 res!961448) b!1426898))

(assert (= (and b!1426898 res!961453) b!1426903))

(assert (= (and b!1426903 res!961446) b!1426904))

(assert (= (and b!1426904 res!961449) b!1426905))

(assert (= (and b!1426905 res!961447) b!1426899))

(assert (= (and b!1426899 res!961450) b!1426897))

(assert (= (and b!1426897 res!961445) b!1426902))

(assert (= (and b!1426902 res!961451) b!1426901))

(declare-fun m!1317591 () Bool)

(assert (=> b!1426903 m!1317591))

(assert (=> b!1426903 m!1317591))

(declare-fun m!1317593 () Bool)

(assert (=> b!1426903 m!1317593))

(declare-fun m!1317595 () Bool)

(assert (=> b!1426898 m!1317595))

(assert (=> b!1426898 m!1317595))

(declare-fun m!1317597 () Bool)

(assert (=> b!1426898 m!1317597))

(assert (=> b!1426901 m!1317591))

(assert (=> b!1426901 m!1317591))

(declare-fun m!1317599 () Bool)

(assert (=> b!1426901 m!1317599))

(declare-fun m!1317601 () Bool)

(assert (=> b!1426904 m!1317601))

(declare-fun m!1317603 () Bool)

(assert (=> b!1426905 m!1317603))

(declare-fun m!1317605 () Bool)

(assert (=> start!123138 m!1317605))

(declare-fun m!1317607 () Bool)

(assert (=> start!123138 m!1317607))

(assert (=> b!1426897 m!1317591))

(assert (=> b!1426897 m!1317591))

(declare-fun m!1317609 () Bool)

(assert (=> b!1426897 m!1317609))

(assert (=> b!1426897 m!1317609))

(assert (=> b!1426897 m!1317591))

(declare-fun m!1317611 () Bool)

(assert (=> b!1426897 m!1317611))

(declare-fun m!1317613 () Bool)

(assert (=> b!1426902 m!1317613))

(declare-fun m!1317615 () Bool)

(assert (=> b!1426902 m!1317615))

(assert (=> b!1426902 m!1317615))

(declare-fun m!1317617 () Bool)

(assert (=> b!1426902 m!1317617))

(assert (=> b!1426902 m!1317617))

(assert (=> b!1426902 m!1317615))

(declare-fun m!1317619 () Bool)

(assert (=> b!1426902 m!1317619))

(push 1)

(assert (not start!123138))

(assert (not b!1426904))

(assert (not b!1426902))

(assert (not b!1426898))

(assert (not b!1426903))

(assert (not b!1426897))

(assert (not b!1426901))

(assert (not b!1426905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

