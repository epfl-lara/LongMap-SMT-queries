; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124440 () Bool)

(assert start!124440)

(declare-fun b!1439743 () Bool)

(declare-fun res!972172 () Bool)

(declare-fun e!811969 () Bool)

(assert (=> b!1439743 (=> (not res!972172) (not e!811969))))

(declare-datatypes ((array!97888 0))(
  ( (array!97889 (arr!47232 (Array (_ BitVec 32) (_ BitVec 64))) (size!47782 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97888)

(declare-datatypes ((List!33733 0))(
  ( (Nil!33730) (Cons!33729 (h!35079 (_ BitVec 64)) (t!48427 List!33733)) )
))
(declare-fun arrayNoDuplicates!0 (array!97888 (_ BitVec 32) List!33733) Bool)

(assert (=> b!1439743 (= res!972172 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33730))))

(declare-fun res!972175 () Bool)

(assert (=> start!124440 (=> (not res!972175) (not e!811969))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124440 (= res!972175 (validMask!0 mask!2687))))

(assert (=> start!124440 e!811969))

(assert (=> start!124440 true))

(declare-fun array_inv!36260 (array!97888) Bool)

(assert (=> start!124440 (array_inv!36260 a!2862)))

(declare-fun b!1439744 () Bool)

(declare-fun res!972178 () Bool)

(assert (=> b!1439744 (=> (not res!972178) (not e!811969))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439744 (= res!972178 (validKeyInArray!0 (select (arr!47232 a!2862) i!1006)))))

(declare-fun b!1439745 () Bool)

(declare-fun res!972171 () Bool)

(assert (=> b!1439745 (=> (not res!972171) (not e!811969))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439745 (= res!972171 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47782 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47782 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47782 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439746 () Bool)

(declare-fun res!972176 () Bool)

(assert (=> b!1439746 (=> (not res!972176) (not e!811969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97888 (_ BitVec 32)) Bool)

(assert (=> b!1439746 (= res!972176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439747 () Bool)

(declare-fun e!811970 () Bool)

(assert (=> b!1439747 (= e!811969 e!811970)))

(declare-fun res!972174 () Bool)

(assert (=> b!1439747 (=> (not res!972174) (not e!811970))))

(declare-datatypes ((SeekEntryResult!11484 0))(
  ( (MissingZero!11484 (index!48328 (_ BitVec 32))) (Found!11484 (index!48329 (_ BitVec 32))) (Intermediate!11484 (undefined!12296 Bool) (index!48330 (_ BitVec 32)) (x!130061 (_ BitVec 32))) (Undefined!11484) (MissingVacant!11484 (index!48331 (_ BitVec 32))) )
))
(declare-fun lt!632861 () SeekEntryResult!11484)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97888 (_ BitVec 32)) SeekEntryResult!11484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439747 (= res!972174 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47232 a!2862) j!93) mask!2687) (select (arr!47232 a!2862) j!93) a!2862 mask!2687) lt!632861))))

(assert (=> b!1439747 (= lt!632861 (Intermediate!11484 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439748 () Bool)

(declare-fun res!972177 () Bool)

(assert (=> b!1439748 (=> (not res!972177) (not e!811970))))

(assert (=> b!1439748 (= res!972177 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47232 a!2862) j!93) a!2862 mask!2687) lt!632861))))

(declare-fun b!1439749 () Bool)

(declare-fun res!972173 () Bool)

(assert (=> b!1439749 (=> (not res!972173) (not e!811969))))

(assert (=> b!1439749 (= res!972173 (and (= (size!47782 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47782 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47782 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439750 () Bool)

(assert (=> b!1439750 (= e!811970 false)))

(declare-fun lt!632862 () SeekEntryResult!11484)

(assert (=> b!1439750 (= lt!632862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97889 (store (arr!47232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47782 a!2862)) mask!2687))))

(declare-fun b!1439751 () Bool)

(declare-fun res!972170 () Bool)

(assert (=> b!1439751 (=> (not res!972170) (not e!811969))))

(assert (=> b!1439751 (= res!972170 (validKeyInArray!0 (select (arr!47232 a!2862) j!93)))))

(assert (= (and start!124440 res!972175) b!1439749))

(assert (= (and b!1439749 res!972173) b!1439744))

(assert (= (and b!1439744 res!972178) b!1439751))

(assert (= (and b!1439751 res!972170) b!1439746))

(assert (= (and b!1439746 res!972176) b!1439743))

(assert (= (and b!1439743 res!972172) b!1439745))

(assert (= (and b!1439745 res!972171) b!1439747))

(assert (= (and b!1439747 res!972174) b!1439748))

(assert (= (and b!1439748 res!972177) b!1439750))

(declare-fun m!1328853 () Bool)

(assert (=> b!1439751 m!1328853))

(assert (=> b!1439751 m!1328853))

(declare-fun m!1328855 () Bool)

(assert (=> b!1439751 m!1328855))

(assert (=> b!1439748 m!1328853))

(assert (=> b!1439748 m!1328853))

(declare-fun m!1328857 () Bool)

(assert (=> b!1439748 m!1328857))

(declare-fun m!1328859 () Bool)

(assert (=> b!1439746 m!1328859))

(declare-fun m!1328861 () Bool)

(assert (=> b!1439745 m!1328861))

(declare-fun m!1328863 () Bool)

(assert (=> b!1439745 m!1328863))

(declare-fun m!1328865 () Bool)

(assert (=> start!124440 m!1328865))

(declare-fun m!1328867 () Bool)

(assert (=> start!124440 m!1328867))

(declare-fun m!1328869 () Bool)

(assert (=> b!1439743 m!1328869))

(declare-fun m!1328871 () Bool)

(assert (=> b!1439744 m!1328871))

(assert (=> b!1439744 m!1328871))

(declare-fun m!1328873 () Bool)

(assert (=> b!1439744 m!1328873))

(assert (=> b!1439750 m!1328861))

(declare-fun m!1328875 () Bool)

(assert (=> b!1439750 m!1328875))

(assert (=> b!1439750 m!1328875))

(declare-fun m!1328877 () Bool)

(assert (=> b!1439750 m!1328877))

(assert (=> b!1439750 m!1328877))

(assert (=> b!1439750 m!1328875))

(declare-fun m!1328879 () Bool)

(assert (=> b!1439750 m!1328879))

(assert (=> b!1439747 m!1328853))

(assert (=> b!1439747 m!1328853))

(declare-fun m!1328881 () Bool)

(assert (=> b!1439747 m!1328881))

(assert (=> b!1439747 m!1328881))

(assert (=> b!1439747 m!1328853))

(declare-fun m!1328883 () Bool)

(assert (=> b!1439747 m!1328883))

(check-sat (not b!1439750) (not b!1439747) (not b!1439746) (not b!1439751) (not start!124440) (not b!1439748) (not b!1439744) (not b!1439743))
(check-sat)
