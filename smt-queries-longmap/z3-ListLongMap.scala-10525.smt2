; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124338 () Bool)

(assert start!124338)

(declare-fun res!970259 () Bool)

(declare-fun e!811617 () Bool)

(assert (=> start!124338 (=> (not res!970259) (not e!811617))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124338 (= res!970259 (validMask!0 mask!2687))))

(assert (=> start!124338 e!811617))

(assert (=> start!124338 true))

(declare-datatypes ((array!97837 0))(
  ( (array!97838 (arr!47209 (Array (_ BitVec 32) (_ BitVec 64))) (size!47760 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97837)

(declare-fun array_inv!36490 (array!97837) Bool)

(assert (=> start!124338 (array_inv!36490 a!2862)))

(declare-fun b!1438197 () Bool)

(declare-fun res!970255 () Bool)

(assert (=> b!1438197 (=> (not res!970255) (not e!811617))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438197 (= res!970255 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47760 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47760 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47760 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438198 () Bool)

(declare-fun res!970256 () Bool)

(assert (=> b!1438198 (=> (not res!970256) (not e!811617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97837 (_ BitVec 32)) Bool)

(assert (=> b!1438198 (= res!970256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438199 () Bool)

(declare-fun res!970258 () Bool)

(assert (=> b!1438199 (=> (not res!970258) (not e!811617))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438199 (= res!970258 (validKeyInArray!0 (select (arr!47209 a!2862) j!93)))))

(declare-fun b!1438200 () Bool)

(declare-fun res!970261 () Bool)

(assert (=> b!1438200 (=> (not res!970261) (not e!811617))))

(assert (=> b!1438200 (= res!970261 (and (= (size!47760 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47760 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47760 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438201 () Bool)

(declare-fun res!970262 () Bool)

(assert (=> b!1438201 (=> (not res!970262) (not e!811617))))

(declare-datatypes ((List!33697 0))(
  ( (Nil!33694) (Cons!33693 (h!35042 (_ BitVec 64)) (t!48383 List!33697)) )
))
(declare-fun arrayNoDuplicates!0 (array!97837 (_ BitVec 32) List!33697) Bool)

(assert (=> b!1438201 (= res!970262 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33694))))

(declare-fun b!1438202 () Bool)

(assert (=> b!1438202 (= e!811617 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1438203 () Bool)

(declare-fun res!970257 () Bool)

(assert (=> b!1438203 (=> (not res!970257) (not e!811617))))

(declare-datatypes ((SeekEntryResult!11358 0))(
  ( (MissingZero!11358 (index!47824 (_ BitVec 32))) (Found!11358 (index!47825 (_ BitVec 32))) (Intermediate!11358 (undefined!12170 Bool) (index!47826 (_ BitVec 32)) (x!129735 (_ BitVec 32))) (Undefined!11358) (MissingVacant!11358 (index!47827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97837 (_ BitVec 32)) SeekEntryResult!11358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438203 (= res!970257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47209 a!2862) j!93) mask!2687) (select (arr!47209 a!2862) j!93) a!2862 mask!2687) (Intermediate!11358 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1438204 () Bool)

(declare-fun res!970260 () Bool)

(assert (=> b!1438204 (=> (not res!970260) (not e!811617))))

(assert (=> b!1438204 (= res!970260 (validKeyInArray!0 (select (arr!47209 a!2862) i!1006)))))

(assert (= (and start!124338 res!970259) b!1438200))

(assert (= (and b!1438200 res!970261) b!1438204))

(assert (= (and b!1438204 res!970260) b!1438199))

(assert (= (and b!1438199 res!970258) b!1438198))

(assert (= (and b!1438198 res!970256) b!1438201))

(assert (= (and b!1438201 res!970262) b!1438197))

(assert (= (and b!1438197 res!970255) b!1438203))

(assert (= (and b!1438203 res!970257) b!1438202))

(declare-fun m!1327609 () Bool)

(assert (=> b!1438199 m!1327609))

(assert (=> b!1438199 m!1327609))

(declare-fun m!1327611 () Bool)

(assert (=> b!1438199 m!1327611))

(assert (=> b!1438203 m!1327609))

(assert (=> b!1438203 m!1327609))

(declare-fun m!1327613 () Bool)

(assert (=> b!1438203 m!1327613))

(assert (=> b!1438203 m!1327613))

(assert (=> b!1438203 m!1327609))

(declare-fun m!1327615 () Bool)

(assert (=> b!1438203 m!1327615))

(declare-fun m!1327617 () Bool)

(assert (=> b!1438197 m!1327617))

(declare-fun m!1327619 () Bool)

(assert (=> b!1438197 m!1327619))

(declare-fun m!1327621 () Bool)

(assert (=> b!1438198 m!1327621))

(declare-fun m!1327623 () Bool)

(assert (=> start!124338 m!1327623))

(declare-fun m!1327625 () Bool)

(assert (=> start!124338 m!1327625))

(declare-fun m!1327627 () Bool)

(assert (=> b!1438201 m!1327627))

(declare-fun m!1327629 () Bool)

(assert (=> b!1438204 m!1327629))

(assert (=> b!1438204 m!1327629))

(declare-fun m!1327631 () Bool)

(assert (=> b!1438204 m!1327631))

(check-sat (not b!1438203) (not b!1438204) (not start!124338) (not b!1438201) (not b!1438199) (not b!1438198))
(check-sat)
