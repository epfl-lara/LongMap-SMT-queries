; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124390 () Bool)

(assert start!124390)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1439262 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!811763 () Bool)

(assert (=> b!1439262 (= e!811763 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439263 () Bool)

(declare-fun res!971810 () Bool)

(declare-fun e!811762 () Bool)

(assert (=> b!1439263 (=> (not res!971810) (not e!811762))))

(declare-datatypes ((array!97816 0))(
  ( (array!97817 (arr!47197 (Array (_ BitVec 32) (_ BitVec 64))) (size!47749 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97816)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439263 (= res!971810 (validKeyInArray!0 (select (arr!47197 a!2862) j!93)))))

(declare-fun b!1439264 () Bool)

(declare-fun res!971806 () Bool)

(assert (=> b!1439264 (=> (not res!971806) (not e!811762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97816 (_ BitVec 32)) Bool)

(assert (=> b!1439264 (= res!971806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439265 () Bool)

(declare-fun res!971807 () Bool)

(assert (=> b!1439265 (=> (not res!971807) (not e!811762))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439265 (= res!971807 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47749 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47749 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47749 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971815 () Bool)

(assert (=> start!124390 (=> (not res!971815) (not e!811762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124390 (= res!971815 (validMask!0 mask!2687))))

(assert (=> start!124390 e!811762))

(assert (=> start!124390 true))

(declare-fun array_inv!36430 (array!97816) Bool)

(assert (=> start!124390 (array_inv!36430 a!2862)))

(declare-fun b!1439266 () Bool)

(assert (=> b!1439266 (= e!811762 e!811763)))

(declare-fun res!971814 () Bool)

(assert (=> b!1439266 (=> (not res!971814) (not e!811763))))

(declare-datatypes ((SeekEntryResult!11474 0))(
  ( (MissingZero!11474 (index!48288 (_ BitVec 32))) (Found!11474 (index!48289 (_ BitVec 32))) (Intermediate!11474 (undefined!12286 Bool) (index!48290 (_ BitVec 32)) (x!130022 (_ BitVec 32))) (Undefined!11474) (MissingVacant!11474 (index!48291 (_ BitVec 32))) )
))
(declare-fun lt!632583 () SeekEntryResult!11474)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97816 (_ BitVec 32)) SeekEntryResult!11474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439266 (= res!971814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47197 a!2862) j!93) mask!2687) (select (arr!47197 a!2862) j!93) a!2862 mask!2687) lt!632583))))

(assert (=> b!1439266 (= lt!632583 (Intermediate!11474 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439267 () Bool)

(declare-fun res!971811 () Bool)

(assert (=> b!1439267 (=> (not res!971811) (not e!811762))))

(declare-datatypes ((List!33776 0))(
  ( (Nil!33773) (Cons!33772 (h!35122 (_ BitVec 64)) (t!48462 List!33776)) )
))
(declare-fun arrayNoDuplicates!0 (array!97816 (_ BitVec 32) List!33776) Bool)

(assert (=> b!1439267 (= res!971811 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33773))))

(declare-fun b!1439268 () Bool)

(declare-fun res!971812 () Bool)

(assert (=> b!1439268 (=> (not res!971812) (not e!811762))))

(assert (=> b!1439268 (= res!971812 (and (= (size!47749 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47749 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47749 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439269 () Bool)

(declare-fun res!971808 () Bool)

(assert (=> b!1439269 (=> (not res!971808) (not e!811763))))

(assert (=> b!1439269 (= res!971808 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47197 a!2862) j!93) a!2862 mask!2687) lt!632583))))

(declare-fun b!1439270 () Bool)

(declare-fun res!971809 () Bool)

(assert (=> b!1439270 (=> (not res!971809) (not e!811763))))

(assert (=> b!1439270 (= res!971809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97817 (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)) mask!2687) (Intermediate!11474 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439271 () Bool)

(declare-fun res!971813 () Bool)

(assert (=> b!1439271 (=> (not res!971813) (not e!811762))))

(assert (=> b!1439271 (= res!971813 (validKeyInArray!0 (select (arr!47197 a!2862) i!1006)))))

(assert (= (and start!124390 res!971815) b!1439268))

(assert (= (and b!1439268 res!971812) b!1439271))

(assert (= (and b!1439271 res!971813) b!1439263))

(assert (= (and b!1439263 res!971810) b!1439264))

(assert (= (and b!1439264 res!971806) b!1439267))

(assert (= (and b!1439267 res!971811) b!1439265))

(assert (= (and b!1439265 res!971807) b!1439266))

(assert (= (and b!1439266 res!971814) b!1439269))

(assert (= (and b!1439269 res!971808) b!1439270))

(assert (= (and b!1439270 res!971809) b!1439262))

(declare-fun m!1327857 () Bool)

(assert (=> b!1439270 m!1327857))

(declare-fun m!1327859 () Bool)

(assert (=> b!1439270 m!1327859))

(assert (=> b!1439270 m!1327859))

(declare-fun m!1327861 () Bool)

(assert (=> b!1439270 m!1327861))

(assert (=> b!1439270 m!1327861))

(assert (=> b!1439270 m!1327859))

(declare-fun m!1327863 () Bool)

(assert (=> b!1439270 m!1327863))

(assert (=> b!1439265 m!1327857))

(declare-fun m!1327865 () Bool)

(assert (=> b!1439265 m!1327865))

(declare-fun m!1327867 () Bool)

(assert (=> b!1439267 m!1327867))

(declare-fun m!1327869 () Bool)

(assert (=> start!124390 m!1327869))

(declare-fun m!1327871 () Bool)

(assert (=> start!124390 m!1327871))

(declare-fun m!1327873 () Bool)

(assert (=> b!1439263 m!1327873))

(assert (=> b!1439263 m!1327873))

(declare-fun m!1327875 () Bool)

(assert (=> b!1439263 m!1327875))

(assert (=> b!1439269 m!1327873))

(assert (=> b!1439269 m!1327873))

(declare-fun m!1327877 () Bool)

(assert (=> b!1439269 m!1327877))

(declare-fun m!1327879 () Bool)

(assert (=> b!1439271 m!1327879))

(assert (=> b!1439271 m!1327879))

(declare-fun m!1327881 () Bool)

(assert (=> b!1439271 m!1327881))

(assert (=> b!1439266 m!1327873))

(assert (=> b!1439266 m!1327873))

(declare-fun m!1327883 () Bool)

(assert (=> b!1439266 m!1327883))

(assert (=> b!1439266 m!1327883))

(assert (=> b!1439266 m!1327873))

(declare-fun m!1327885 () Bool)

(assert (=> b!1439266 m!1327885))

(declare-fun m!1327887 () Bool)

(assert (=> b!1439264 m!1327887))

(check-sat (not start!124390) (not b!1439266) (not b!1439267) (not b!1439270) (not b!1439264) (not b!1439271) (not b!1439269) (not b!1439263))
(check-sat)
