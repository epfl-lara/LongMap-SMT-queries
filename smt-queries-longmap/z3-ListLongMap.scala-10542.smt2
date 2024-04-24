; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124566 () Bool)

(assert start!124566)

(declare-fun b!1440135 () Bool)

(declare-fun res!971864 () Bool)

(declare-fun e!812427 () Bool)

(assert (=> b!1440135 (=> (not res!971864) (not e!812427))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97948 0))(
  ( (array!97949 (arr!47260 (Array (_ BitVec 32) (_ BitVec 64))) (size!47811 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97948)

(assert (=> b!1440135 (= res!971864 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47811 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47811 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47811 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440136 () Bool)

(declare-fun e!812425 () Bool)

(assert (=> b!1440136 (= e!812425 false)))

(declare-datatypes ((SeekEntryResult!11409 0))(
  ( (MissingZero!11409 (index!48028 (_ BitVec 32))) (Found!11409 (index!48029 (_ BitVec 32))) (Intermediate!11409 (undefined!12221 Bool) (index!48030 (_ BitVec 32)) (x!129940 (_ BitVec 32))) (Undefined!11409) (MissingVacant!11409 (index!48031 (_ BitVec 32))) )
))
(declare-fun lt!633126 () SeekEntryResult!11409)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97948 (_ BitVec 32)) SeekEntryResult!11409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440136 (= lt!633126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97949 (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47811 a!2862)) mask!2687))))

(declare-fun b!1440137 () Bool)

(declare-fun res!971863 () Bool)

(assert (=> b!1440137 (=> (not res!971863) (not e!812427))))

(declare-datatypes ((List!33748 0))(
  ( (Nil!33745) (Cons!33744 (h!35102 (_ BitVec 64)) (t!48434 List!33748)) )
))
(declare-fun arrayNoDuplicates!0 (array!97948 (_ BitVec 32) List!33748) Bool)

(assert (=> b!1440137 (= res!971863 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33745))))

(declare-fun b!1440138 () Bool)

(declare-fun res!971867 () Bool)

(assert (=> b!1440138 (=> (not res!971867) (not e!812427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440138 (= res!971867 (validKeyInArray!0 (select (arr!47260 a!2862) j!93)))))

(declare-fun b!1440139 () Bool)

(declare-fun res!971861 () Bool)

(assert (=> b!1440139 (=> (not res!971861) (not e!812427))))

(assert (=> b!1440139 (= res!971861 (validKeyInArray!0 (select (arr!47260 a!2862) i!1006)))))

(declare-fun b!1440140 () Bool)

(declare-fun res!971860 () Bool)

(assert (=> b!1440140 (=> (not res!971860) (not e!812427))))

(assert (=> b!1440140 (= res!971860 (and (= (size!47811 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47811 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47811 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!971866 () Bool)

(assert (=> start!124566 (=> (not res!971866) (not e!812427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124566 (= res!971866 (validMask!0 mask!2687))))

(assert (=> start!124566 e!812427))

(assert (=> start!124566 true))

(declare-fun array_inv!36541 (array!97948) Bool)

(assert (=> start!124566 (array_inv!36541 a!2862)))

(declare-fun b!1440134 () Bool)

(declare-fun res!971865 () Bool)

(assert (=> b!1440134 (=> (not res!971865) (not e!812425))))

(declare-fun lt!633127 () SeekEntryResult!11409)

(assert (=> b!1440134 (= res!971865 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!633127))))

(declare-fun b!1440141 () Bool)

(declare-fun res!971862 () Bool)

(assert (=> b!1440141 (=> (not res!971862) (not e!812427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97948 (_ BitVec 32)) Bool)

(assert (=> b!1440141 (= res!971862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440142 () Bool)

(assert (=> b!1440142 (= e!812427 e!812425)))

(declare-fun res!971859 () Bool)

(assert (=> b!1440142 (=> (not res!971859) (not e!812425))))

(assert (=> b!1440142 (= res!971859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47260 a!2862) j!93) mask!2687) (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!633127))))

(assert (=> b!1440142 (= lt!633127 (Intermediate!11409 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124566 res!971866) b!1440140))

(assert (= (and b!1440140 res!971860) b!1440139))

(assert (= (and b!1440139 res!971861) b!1440138))

(assert (= (and b!1440138 res!971867) b!1440141))

(assert (= (and b!1440141 res!971862) b!1440137))

(assert (= (and b!1440137 res!971863) b!1440135))

(assert (= (and b!1440135 res!971864) b!1440142))

(assert (= (and b!1440142 res!971859) b!1440134))

(assert (= (and b!1440134 res!971865) b!1440136))

(declare-fun m!1329367 () Bool)

(assert (=> b!1440137 m!1329367))

(declare-fun m!1329369 () Bool)

(assert (=> b!1440142 m!1329369))

(assert (=> b!1440142 m!1329369))

(declare-fun m!1329371 () Bool)

(assert (=> b!1440142 m!1329371))

(assert (=> b!1440142 m!1329371))

(assert (=> b!1440142 m!1329369))

(declare-fun m!1329373 () Bool)

(assert (=> b!1440142 m!1329373))

(declare-fun m!1329375 () Bool)

(assert (=> start!124566 m!1329375))

(declare-fun m!1329377 () Bool)

(assert (=> start!124566 m!1329377))

(declare-fun m!1329379 () Bool)

(assert (=> b!1440135 m!1329379))

(declare-fun m!1329381 () Bool)

(assert (=> b!1440135 m!1329381))

(assert (=> b!1440134 m!1329369))

(assert (=> b!1440134 m!1329369))

(declare-fun m!1329383 () Bool)

(assert (=> b!1440134 m!1329383))

(declare-fun m!1329385 () Bool)

(assert (=> b!1440139 m!1329385))

(assert (=> b!1440139 m!1329385))

(declare-fun m!1329387 () Bool)

(assert (=> b!1440139 m!1329387))

(assert (=> b!1440138 m!1329369))

(assert (=> b!1440138 m!1329369))

(declare-fun m!1329389 () Bool)

(assert (=> b!1440138 m!1329389))

(declare-fun m!1329391 () Bool)

(assert (=> b!1440141 m!1329391))

(assert (=> b!1440136 m!1329379))

(declare-fun m!1329393 () Bool)

(assert (=> b!1440136 m!1329393))

(assert (=> b!1440136 m!1329393))

(declare-fun m!1329395 () Bool)

(assert (=> b!1440136 m!1329395))

(assert (=> b!1440136 m!1329395))

(assert (=> b!1440136 m!1329393))

(declare-fun m!1329397 () Bool)

(assert (=> b!1440136 m!1329397))

(check-sat (not b!1440134) (not start!124566) (not b!1440136) (not b!1440138) (not b!1440142) (not b!1440137) (not b!1440139) (not b!1440141))
(check-sat)
