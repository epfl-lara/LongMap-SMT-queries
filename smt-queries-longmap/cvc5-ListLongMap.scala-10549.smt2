; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124432 () Bool)

(assert start!124432)

(declare-fun b!1439628 () Bool)

(declare-fun res!972057 () Bool)

(declare-fun e!811933 () Bool)

(assert (=> b!1439628 (=> (not res!972057) (not e!811933))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97880 0))(
  ( (array!97881 (arr!47228 (Array (_ BitVec 32) (_ BitVec 64))) (size!47778 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97880)

(declare-datatypes ((SeekEntryResult!11480 0))(
  ( (MissingZero!11480 (index!48312 (_ BitVec 32))) (Found!11480 (index!48313 (_ BitVec 32))) (Intermediate!11480 (undefined!12292 Bool) (index!48314 (_ BitVec 32)) (x!130049 (_ BitVec 32))) (Undefined!11480) (MissingVacant!11480 (index!48315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97880 (_ BitVec 32)) SeekEntryResult!11480)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439628 (= res!972057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47228 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47228 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97881 (store (arr!47228 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47778 a!2862)) mask!2687) (Intermediate!11480 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439629 () Bool)

(declare-fun res!972056 () Bool)

(declare-fun e!811932 () Bool)

(assert (=> b!1439629 (=> (not res!972056) (not e!811932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97880 (_ BitVec 32)) Bool)

(assert (=> b!1439629 (= res!972056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439630 () Bool)

(declare-fun res!972058 () Bool)

(assert (=> b!1439630 (=> (not res!972058) (not e!811932))))

(assert (=> b!1439630 (= res!972058 (and (= (size!47778 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47778 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47778 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!972059 () Bool)

(assert (=> start!124432 (=> (not res!972059) (not e!811932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124432 (= res!972059 (validMask!0 mask!2687))))

(assert (=> start!124432 e!811932))

(assert (=> start!124432 true))

(declare-fun array_inv!36256 (array!97880) Bool)

(assert (=> start!124432 (array_inv!36256 a!2862)))

(declare-fun b!1439631 () Bool)

(declare-fun res!972061 () Bool)

(assert (=> b!1439631 (=> (not res!972061) (not e!811932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439631 (= res!972061 (validKeyInArray!0 (select (arr!47228 a!2862) j!93)))))

(declare-fun b!1439632 () Bool)

(declare-fun res!972063 () Bool)

(assert (=> b!1439632 (=> (not res!972063) (not e!811932))))

(assert (=> b!1439632 (= res!972063 (validKeyInArray!0 (select (arr!47228 a!2862) i!1006)))))

(declare-fun b!1439633 () Bool)

(declare-fun res!972060 () Bool)

(assert (=> b!1439633 (=> (not res!972060) (not e!811933))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632844 () SeekEntryResult!11480)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439633 (= res!972060 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47228 a!2862) j!93) a!2862 mask!2687) lt!632844))))

(declare-fun b!1439634 () Bool)

(declare-fun res!972055 () Bool)

(assert (=> b!1439634 (=> (not res!972055) (not e!811932))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439634 (= res!972055 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47778 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47778 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47778 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47228 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439635 () Bool)

(assert (=> b!1439635 (= e!811932 e!811933)))

(declare-fun res!972064 () Bool)

(assert (=> b!1439635 (=> (not res!972064) (not e!811933))))

(assert (=> b!1439635 (= res!972064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47228 a!2862) j!93) mask!2687) (select (arr!47228 a!2862) j!93) a!2862 mask!2687) lt!632844))))

(assert (=> b!1439635 (= lt!632844 (Intermediate!11480 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439636 () Bool)

(assert (=> b!1439636 (= e!811933 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439637 () Bool)

(declare-fun res!972062 () Bool)

(assert (=> b!1439637 (=> (not res!972062) (not e!811932))))

(declare-datatypes ((List!33729 0))(
  ( (Nil!33726) (Cons!33725 (h!35075 (_ BitVec 64)) (t!48423 List!33729)) )
))
(declare-fun arrayNoDuplicates!0 (array!97880 (_ BitVec 32) List!33729) Bool)

(assert (=> b!1439637 (= res!972062 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33726))))

(assert (= (and start!124432 res!972059) b!1439630))

(assert (= (and b!1439630 res!972058) b!1439632))

(assert (= (and b!1439632 res!972063) b!1439631))

(assert (= (and b!1439631 res!972061) b!1439629))

(assert (= (and b!1439629 res!972056) b!1439637))

(assert (= (and b!1439637 res!972062) b!1439634))

(assert (= (and b!1439634 res!972055) b!1439635))

(assert (= (and b!1439635 res!972064) b!1439633))

(assert (= (and b!1439633 res!972060) b!1439628))

(assert (= (and b!1439628 res!972057) b!1439636))

(declare-fun m!1328725 () Bool)

(assert (=> b!1439631 m!1328725))

(assert (=> b!1439631 m!1328725))

(declare-fun m!1328727 () Bool)

(assert (=> b!1439631 m!1328727))

(declare-fun m!1328729 () Bool)

(assert (=> b!1439632 m!1328729))

(assert (=> b!1439632 m!1328729))

(declare-fun m!1328731 () Bool)

(assert (=> b!1439632 m!1328731))

(declare-fun m!1328733 () Bool)

(assert (=> b!1439637 m!1328733))

(declare-fun m!1328735 () Bool)

(assert (=> b!1439629 m!1328735))

(declare-fun m!1328737 () Bool)

(assert (=> b!1439628 m!1328737))

(declare-fun m!1328739 () Bool)

(assert (=> b!1439628 m!1328739))

(assert (=> b!1439628 m!1328739))

(declare-fun m!1328741 () Bool)

(assert (=> b!1439628 m!1328741))

(assert (=> b!1439628 m!1328741))

(assert (=> b!1439628 m!1328739))

(declare-fun m!1328743 () Bool)

(assert (=> b!1439628 m!1328743))

(assert (=> b!1439635 m!1328725))

(assert (=> b!1439635 m!1328725))

(declare-fun m!1328745 () Bool)

(assert (=> b!1439635 m!1328745))

(assert (=> b!1439635 m!1328745))

(assert (=> b!1439635 m!1328725))

(declare-fun m!1328747 () Bool)

(assert (=> b!1439635 m!1328747))

(assert (=> b!1439633 m!1328725))

(assert (=> b!1439633 m!1328725))

(declare-fun m!1328749 () Bool)

(assert (=> b!1439633 m!1328749))

(declare-fun m!1328751 () Bool)

(assert (=> start!124432 m!1328751))

(declare-fun m!1328753 () Bool)

(assert (=> start!124432 m!1328753))

(assert (=> b!1439634 m!1328737))

(declare-fun m!1328755 () Bool)

(assert (=> b!1439634 m!1328755))

(push 1)

(assert (not b!1439637))

(assert (not b!1439632))

(assert (not b!1439629))

(assert (not b!1439633))

(assert (not b!1439635))

(assert (not start!124432))

(assert (not b!1439631))

(assert (not b!1439628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

