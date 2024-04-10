; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124114 () Bool)

(assert start!124114)

(declare-fun b!1436805 () Bool)

(declare-fun res!969689 () Bool)

(declare-fun e!810761 () Bool)

(assert (=> b!1436805 (=> (not res!969689) (not e!810761))))

(declare-datatypes ((array!97718 0))(
  ( (array!97719 (arr!47153 (Array (_ BitVec 32) (_ BitVec 64))) (size!47703 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97718)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97718 (_ BitVec 32)) Bool)

(assert (=> b!1436805 (= res!969689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969694 () Bool)

(assert (=> start!124114 (=> (not res!969694) (not e!810761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124114 (= res!969694 (validMask!0 mask!2687))))

(assert (=> start!124114 e!810761))

(assert (=> start!124114 true))

(declare-fun array_inv!36181 (array!97718) Bool)

(assert (=> start!124114 (array_inv!36181 a!2862)))

(declare-fun b!1436806 () Bool)

(declare-fun res!969690 () Bool)

(assert (=> b!1436806 (=> (not res!969690) (not e!810761))))

(declare-datatypes ((List!33654 0))(
  ( (Nil!33651) (Cons!33650 (h!34988 (_ BitVec 64)) (t!48348 List!33654)) )
))
(declare-fun arrayNoDuplicates!0 (array!97718 (_ BitVec 32) List!33654) Bool)

(assert (=> b!1436806 (= res!969690 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33651))))

(declare-fun b!1436807 () Bool)

(declare-fun res!969691 () Bool)

(assert (=> b!1436807 (=> (not res!969691) (not e!810761))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436807 (= res!969691 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47703 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47703 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47703 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47153 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436808 () Bool)

(assert (=> b!1436808 (= e!810761 false)))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11405 0))(
  ( (MissingZero!11405 (index!48012 (_ BitVec 32))) (Found!11405 (index!48013 (_ BitVec 32))) (Intermediate!11405 (undefined!12217 Bool) (index!48014 (_ BitVec 32)) (x!129750 (_ BitVec 32))) (Undefined!11405) (MissingVacant!11405 (index!48015 (_ BitVec 32))) )
))
(declare-fun lt!632214 () SeekEntryResult!11405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97718 (_ BitVec 32)) SeekEntryResult!11405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436808 (= lt!632214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47153 a!2862) j!93) mask!2687) (select (arr!47153 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436809 () Bool)

(declare-fun res!969693 () Bool)

(assert (=> b!1436809 (=> (not res!969693) (not e!810761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436809 (= res!969693 (validKeyInArray!0 (select (arr!47153 a!2862) j!93)))))

(declare-fun b!1436810 () Bool)

(declare-fun res!969688 () Bool)

(assert (=> b!1436810 (=> (not res!969688) (not e!810761))))

(assert (=> b!1436810 (= res!969688 (validKeyInArray!0 (select (arr!47153 a!2862) i!1006)))))

(declare-fun b!1436811 () Bool)

(declare-fun res!969692 () Bool)

(assert (=> b!1436811 (=> (not res!969692) (not e!810761))))

(assert (=> b!1436811 (= res!969692 (and (= (size!47703 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47703 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47703 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124114 res!969694) b!1436811))

(assert (= (and b!1436811 res!969692) b!1436810))

(assert (= (and b!1436810 res!969688) b!1436809))

(assert (= (and b!1436809 res!969693) b!1436805))

(assert (= (and b!1436805 res!969689) b!1436806))

(assert (= (and b!1436806 res!969690) b!1436807))

(assert (= (and b!1436807 res!969691) b!1436808))

(declare-fun m!1326097 () Bool)

(assert (=> b!1436809 m!1326097))

(assert (=> b!1436809 m!1326097))

(declare-fun m!1326099 () Bool)

(assert (=> b!1436809 m!1326099))

(assert (=> b!1436808 m!1326097))

(assert (=> b!1436808 m!1326097))

(declare-fun m!1326101 () Bool)

(assert (=> b!1436808 m!1326101))

(assert (=> b!1436808 m!1326101))

(assert (=> b!1436808 m!1326097))

(declare-fun m!1326103 () Bool)

(assert (=> b!1436808 m!1326103))

(declare-fun m!1326105 () Bool)

(assert (=> b!1436807 m!1326105))

(declare-fun m!1326107 () Bool)

(assert (=> b!1436807 m!1326107))

(declare-fun m!1326109 () Bool)

(assert (=> b!1436805 m!1326109))

(declare-fun m!1326111 () Bool)

(assert (=> b!1436810 m!1326111))

(assert (=> b!1436810 m!1326111))

(declare-fun m!1326113 () Bool)

(assert (=> b!1436810 m!1326113))

(declare-fun m!1326115 () Bool)

(assert (=> start!124114 m!1326115))

(declare-fun m!1326117 () Bool)

(assert (=> start!124114 m!1326117))

(declare-fun m!1326119 () Bool)

(assert (=> b!1436806 m!1326119))

(push 1)

(assert (not b!1436810))

(assert (not b!1436805))

(assert (not start!124114))

(assert (not b!1436806))

(assert (not b!1436808))

(assert (not b!1436809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

