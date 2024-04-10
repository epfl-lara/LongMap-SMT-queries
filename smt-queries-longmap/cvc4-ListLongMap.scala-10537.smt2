; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124280 () Bool)

(assert start!124280)

(declare-fun b!1438212 () Bool)

(declare-fun res!970892 () Bool)

(declare-fun e!811332 () Bool)

(assert (=> b!1438212 (=> (not res!970892) (not e!811332))))

(declare-datatypes ((array!97806 0))(
  ( (array!97807 (arr!47194 (Array (_ BitVec 32) (_ BitVec 64))) (size!47744 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97806)

(declare-datatypes ((List!33695 0))(
  ( (Nil!33692) (Cons!33691 (h!35035 (_ BitVec 64)) (t!48389 List!33695)) )
))
(declare-fun arrayNoDuplicates!0 (array!97806 (_ BitVec 32) List!33695) Bool)

(assert (=> b!1438212 (= res!970892 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33692))))

(declare-fun b!1438213 () Bool)

(declare-fun res!970886 () Bool)

(declare-fun e!811331 () Bool)

(assert (=> b!1438213 (=> (not res!970886) (not e!811331))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11446 0))(
  ( (MissingZero!11446 (index!48176 (_ BitVec 32))) (Found!11446 (index!48177 (_ BitVec 32))) (Intermediate!11446 (undefined!12258 Bool) (index!48178 (_ BitVec 32)) (x!129907 (_ BitVec 32))) (Undefined!11446) (MissingVacant!11446 (index!48179 (_ BitVec 32))) )
))
(declare-fun lt!632516 () SeekEntryResult!11446)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97806 (_ BitVec 32)) SeekEntryResult!11446)

(assert (=> b!1438213 (= res!970886 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47194 a!2862) j!93) a!2862 mask!2687) lt!632516))))

(declare-fun b!1438214 () Bool)

(declare-fun res!970887 () Bool)

(assert (=> b!1438214 (=> (not res!970887) (not e!811332))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438214 (= res!970887 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47744 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47744 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47744 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970894 () Bool)

(assert (=> start!124280 (=> (not res!970894) (not e!811332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124280 (= res!970894 (validMask!0 mask!2687))))

(assert (=> start!124280 e!811332))

(assert (=> start!124280 true))

(declare-fun array_inv!36222 (array!97806) Bool)

(assert (=> start!124280 (array_inv!36222 a!2862)))

(declare-fun b!1438215 () Bool)

(declare-fun res!970889 () Bool)

(assert (=> b!1438215 (=> (not res!970889) (not e!811332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438215 (= res!970889 (validKeyInArray!0 (select (arr!47194 a!2862) i!1006)))))

(declare-fun b!1438216 () Bool)

(assert (=> b!1438216 (= e!811332 e!811331)))

(declare-fun res!970890 () Bool)

(assert (=> b!1438216 (=> (not res!970890) (not e!811331))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438216 (= res!970890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47194 a!2862) j!93) mask!2687) (select (arr!47194 a!2862) j!93) a!2862 mask!2687) lt!632516))))

(assert (=> b!1438216 (= lt!632516 (Intermediate!11446 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438217 () Bool)

(declare-fun res!970888 () Bool)

(assert (=> b!1438217 (=> (not res!970888) (not e!811332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97806 (_ BitVec 32)) Bool)

(assert (=> b!1438217 (= res!970888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!811334 () Bool)

(declare-fun b!1438218 () Bool)

(assert (=> b!1438218 (= e!811334 (not (validKeyInArray!0 (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1438219 () Bool)

(declare-fun res!970891 () Bool)

(assert (=> b!1438219 (=> (not res!970891) (not e!811332))))

(assert (=> b!1438219 (= res!970891 (validKeyInArray!0 (select (arr!47194 a!2862) j!93)))))

(declare-fun b!1438220 () Bool)

(declare-fun res!970885 () Bool)

(assert (=> b!1438220 (=> (not res!970885) (not e!811332))))

(assert (=> b!1438220 (= res!970885 (and (= (size!47744 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47744 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47744 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438221 () Bool)

(assert (=> b!1438221 (= e!811331 e!811334)))

(declare-fun res!970893 () Bool)

(assert (=> b!1438221 (=> (not res!970893) (not e!811334))))

(declare-fun lt!632517 () (_ BitVec 32))

(assert (=> b!1438221 (= res!970893 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632517 #b00000000000000000000000000000000) (bvslt lt!632517 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1438221 (= lt!632517 (toIndex!0 (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124280 res!970894) b!1438220))

(assert (= (and b!1438220 res!970885) b!1438215))

(assert (= (and b!1438215 res!970889) b!1438219))

(assert (= (and b!1438219 res!970891) b!1438217))

(assert (= (and b!1438217 res!970888) b!1438212))

(assert (= (and b!1438212 res!970892) b!1438214))

(assert (= (and b!1438214 res!970887) b!1438216))

(assert (= (and b!1438216 res!970890) b!1438213))

(assert (= (and b!1438213 res!970886) b!1438221))

(assert (= (and b!1438221 res!970893) b!1438218))

(declare-fun m!1327391 () Bool)

(assert (=> b!1438214 m!1327391))

(declare-fun m!1327393 () Bool)

(assert (=> b!1438214 m!1327393))

(declare-fun m!1327395 () Bool)

(assert (=> b!1438215 m!1327395))

(assert (=> b!1438215 m!1327395))

(declare-fun m!1327397 () Bool)

(assert (=> b!1438215 m!1327397))

(declare-fun m!1327399 () Bool)

(assert (=> b!1438212 m!1327399))

(assert (=> b!1438221 m!1327391))

(declare-fun m!1327401 () Bool)

(assert (=> b!1438221 m!1327401))

(assert (=> b!1438221 m!1327401))

(declare-fun m!1327403 () Bool)

(assert (=> b!1438221 m!1327403))

(declare-fun m!1327405 () Bool)

(assert (=> b!1438219 m!1327405))

(assert (=> b!1438219 m!1327405))

(declare-fun m!1327407 () Bool)

(assert (=> b!1438219 m!1327407))

(declare-fun m!1327409 () Bool)

(assert (=> start!124280 m!1327409))

(declare-fun m!1327411 () Bool)

(assert (=> start!124280 m!1327411))

(assert (=> b!1438213 m!1327405))

(assert (=> b!1438213 m!1327405))

(declare-fun m!1327413 () Bool)

(assert (=> b!1438213 m!1327413))

(declare-fun m!1327415 () Bool)

(assert (=> b!1438217 m!1327415))

(assert (=> b!1438216 m!1327405))

(assert (=> b!1438216 m!1327405))

(declare-fun m!1327417 () Bool)

(assert (=> b!1438216 m!1327417))

(assert (=> b!1438216 m!1327417))

(assert (=> b!1438216 m!1327405))

(declare-fun m!1327419 () Bool)

(assert (=> b!1438216 m!1327419))

(assert (=> b!1438218 m!1327391))

(assert (=> b!1438218 m!1327401))

(assert (=> b!1438218 m!1327401))

(declare-fun m!1327421 () Bool)

(assert (=> b!1438218 m!1327421))

(push 1)

(assert (not b!1438215))

(assert (not b!1438212))

(assert (not b!1438219))

(assert (not b!1438217))

(assert (not b!1438218))

(assert (not b!1438221))

(assert (not start!124280))

(assert (not b!1438213))

(assert (not b!1438216))

(check-sat)

