; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124142 () Bool)

(assert start!124142)

(declare-fun b!1437117 () Bool)

(declare-fun res!970004 () Bool)

(declare-fun e!810845 () Bool)

(assert (=> b!1437117 (=> (not res!970004) (not e!810845))))

(declare-datatypes ((array!97746 0))(
  ( (array!97747 (arr!47167 (Array (_ BitVec 32) (_ BitVec 64))) (size!47717 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97746)

(declare-datatypes ((List!33668 0))(
  ( (Nil!33665) (Cons!33664 (h!35002 (_ BitVec 64)) (t!48362 List!33668)) )
))
(declare-fun arrayNoDuplicates!0 (array!97746 (_ BitVec 32) List!33668) Bool)

(assert (=> b!1437117 (= res!970004 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33665))))

(declare-fun b!1437118 () Bool)

(declare-fun res!970006 () Bool)

(assert (=> b!1437118 (=> (not res!970006) (not e!810845))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437118 (= res!970006 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47717 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47717 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47717 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437119 () Bool)

(declare-fun res!970001 () Bool)

(assert (=> b!1437119 (=> (not res!970001) (not e!810845))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97746 (_ BitVec 32)) Bool)

(assert (=> b!1437119 (= res!970001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437120 () Bool)

(declare-fun res!970003 () Bool)

(assert (=> b!1437120 (=> (not res!970003) (not e!810845))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1437120 (= res!970003 (and (= (size!47717 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47717 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47717 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437121 () Bool)

(assert (=> b!1437121 (= e!810845 false)))

(declare-datatypes ((SeekEntryResult!11419 0))(
  ( (MissingZero!11419 (index!48068 (_ BitVec 32))) (Found!11419 (index!48069 (_ BitVec 32))) (Intermediate!11419 (undefined!12231 Bool) (index!48070 (_ BitVec 32)) (x!129796 (_ BitVec 32))) (Undefined!11419) (MissingVacant!11419 (index!48071 (_ BitVec 32))) )
))
(declare-fun lt!632238 () SeekEntryResult!11419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97746 (_ BitVec 32)) SeekEntryResult!11419)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437121 (= lt!632238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47167 a!2862) j!93) mask!2687) (select (arr!47167 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!970002 () Bool)

(assert (=> start!124142 (=> (not res!970002) (not e!810845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124142 (= res!970002 (validMask!0 mask!2687))))

(assert (=> start!124142 e!810845))

(assert (=> start!124142 true))

(declare-fun array_inv!36195 (array!97746) Bool)

(assert (=> start!124142 (array_inv!36195 a!2862)))

(declare-fun b!1437122 () Bool)

(declare-fun res!970000 () Bool)

(assert (=> b!1437122 (=> (not res!970000) (not e!810845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437122 (= res!970000 (validKeyInArray!0 (select (arr!47167 a!2862) j!93)))))

(declare-fun b!1437123 () Bool)

(declare-fun res!970005 () Bool)

(assert (=> b!1437123 (=> (not res!970005) (not e!810845))))

(assert (=> b!1437123 (= res!970005 (validKeyInArray!0 (select (arr!47167 a!2862) i!1006)))))

(assert (= (and start!124142 res!970002) b!1437120))

(assert (= (and b!1437120 res!970003) b!1437123))

(assert (= (and b!1437123 res!970005) b!1437122))

(assert (= (and b!1437122 res!970000) b!1437119))

(assert (= (and b!1437119 res!970001) b!1437117))

(assert (= (and b!1437117 res!970004) b!1437118))

(assert (= (and b!1437118 res!970006) b!1437121))

(declare-fun m!1326433 () Bool)

(assert (=> start!124142 m!1326433))

(declare-fun m!1326435 () Bool)

(assert (=> start!124142 m!1326435))

(declare-fun m!1326437 () Bool)

(assert (=> b!1437119 m!1326437))

(declare-fun m!1326439 () Bool)

(assert (=> b!1437123 m!1326439))

(assert (=> b!1437123 m!1326439))

(declare-fun m!1326441 () Bool)

(assert (=> b!1437123 m!1326441))

(declare-fun m!1326443 () Bool)

(assert (=> b!1437117 m!1326443))

(declare-fun m!1326445 () Bool)

(assert (=> b!1437122 m!1326445))

(assert (=> b!1437122 m!1326445))

(declare-fun m!1326447 () Bool)

(assert (=> b!1437122 m!1326447))

(declare-fun m!1326449 () Bool)

(assert (=> b!1437118 m!1326449))

(declare-fun m!1326451 () Bool)

(assert (=> b!1437118 m!1326451))

(assert (=> b!1437121 m!1326445))

(assert (=> b!1437121 m!1326445))

(declare-fun m!1326453 () Bool)

(assert (=> b!1437121 m!1326453))

(assert (=> b!1437121 m!1326453))

(assert (=> b!1437121 m!1326445))

(declare-fun m!1326455 () Bool)

(assert (=> b!1437121 m!1326455))

(push 1)

(assert (not b!1437119))

(assert (not b!1437122))

(assert (not b!1437121))

(assert (not b!1437117))

(assert (not start!124142))

(assert (not b!1437123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

