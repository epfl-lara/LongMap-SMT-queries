; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124138 () Bool)

(assert start!124138)

(declare-fun b!1437076 () Bool)

(declare-fun res!969959 () Bool)

(declare-fun e!810832 () Bool)

(assert (=> b!1437076 (=> (not res!969959) (not e!810832))))

(declare-datatypes ((array!97742 0))(
  ( (array!97743 (arr!47165 (Array (_ BitVec 32) (_ BitVec 64))) (size!47715 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97742)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437076 (= res!969959 (validKeyInArray!0 (select (arr!47165 a!2862) j!93)))))

(declare-fun b!1437077 () Bool)

(declare-fun res!969962 () Bool)

(assert (=> b!1437077 (=> (not res!969962) (not e!810832))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437077 (= res!969962 (and (= (size!47715 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47715 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47715 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437078 () Bool)

(assert (=> b!1437078 (= e!810832 false)))

(declare-datatypes ((SeekEntryResult!11417 0))(
  ( (MissingZero!11417 (index!48060 (_ BitVec 32))) (Found!11417 (index!48061 (_ BitVec 32))) (Intermediate!11417 (undefined!12229 Bool) (index!48062 (_ BitVec 32)) (x!129794 (_ BitVec 32))) (Undefined!11417) (MissingVacant!11417 (index!48063 (_ BitVec 32))) )
))
(declare-fun lt!632232 () SeekEntryResult!11417)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97742 (_ BitVec 32)) SeekEntryResult!11417)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437078 (= lt!632232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47165 a!2862) j!93) mask!2687) (select (arr!47165 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437079 () Bool)

(declare-fun res!969964 () Bool)

(assert (=> b!1437079 (=> (not res!969964) (not e!810832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97742 (_ BitVec 32)) Bool)

(assert (=> b!1437079 (= res!969964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437080 () Bool)

(declare-fun res!969960 () Bool)

(assert (=> b!1437080 (=> (not res!969960) (not e!810832))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437080 (= res!969960 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47715 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47715 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47715 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47165 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437081 () Bool)

(declare-fun res!969961 () Bool)

(assert (=> b!1437081 (=> (not res!969961) (not e!810832))))

(assert (=> b!1437081 (= res!969961 (validKeyInArray!0 (select (arr!47165 a!2862) i!1006)))))

(declare-fun b!1437075 () Bool)

(declare-fun res!969963 () Bool)

(assert (=> b!1437075 (=> (not res!969963) (not e!810832))))

(declare-datatypes ((List!33666 0))(
  ( (Nil!33663) (Cons!33662 (h!35000 (_ BitVec 64)) (t!48360 List!33666)) )
))
(declare-fun arrayNoDuplicates!0 (array!97742 (_ BitVec 32) List!33666) Bool)

(assert (=> b!1437075 (= res!969963 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33663))))

(declare-fun res!969958 () Bool)

(assert (=> start!124138 (=> (not res!969958) (not e!810832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124138 (= res!969958 (validMask!0 mask!2687))))

(assert (=> start!124138 e!810832))

(assert (=> start!124138 true))

(declare-fun array_inv!36193 (array!97742) Bool)

(assert (=> start!124138 (array_inv!36193 a!2862)))

(assert (= (and start!124138 res!969958) b!1437077))

(assert (= (and b!1437077 res!969962) b!1437081))

(assert (= (and b!1437081 res!969961) b!1437076))

(assert (= (and b!1437076 res!969959) b!1437079))

(assert (= (and b!1437079 res!969964) b!1437075))

(assert (= (and b!1437075 res!969963) b!1437080))

(assert (= (and b!1437080 res!969960) b!1437078))

(declare-fun m!1326385 () Bool)

(assert (=> b!1437080 m!1326385))

(declare-fun m!1326387 () Bool)

(assert (=> b!1437080 m!1326387))

(declare-fun m!1326389 () Bool)

(assert (=> b!1437078 m!1326389))

(assert (=> b!1437078 m!1326389))

(declare-fun m!1326391 () Bool)

(assert (=> b!1437078 m!1326391))

(assert (=> b!1437078 m!1326391))

(assert (=> b!1437078 m!1326389))

(declare-fun m!1326393 () Bool)

(assert (=> b!1437078 m!1326393))

(declare-fun m!1326395 () Bool)

(assert (=> b!1437081 m!1326395))

(assert (=> b!1437081 m!1326395))

(declare-fun m!1326397 () Bool)

(assert (=> b!1437081 m!1326397))

(assert (=> b!1437076 m!1326389))

(assert (=> b!1437076 m!1326389))

(declare-fun m!1326399 () Bool)

(assert (=> b!1437076 m!1326399))

(declare-fun m!1326401 () Bool)

(assert (=> b!1437075 m!1326401))

(declare-fun m!1326403 () Bool)

(assert (=> b!1437079 m!1326403))

(declare-fun m!1326405 () Bool)

(assert (=> start!124138 m!1326405))

(declare-fun m!1326407 () Bool)

(assert (=> start!124138 m!1326407))

(push 1)

(assert (not b!1437078))

(assert (not b!1437076))

(assert (not b!1437075))

(assert (not b!1437081))

(assert (not start!124138))

(assert (not b!1437079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

