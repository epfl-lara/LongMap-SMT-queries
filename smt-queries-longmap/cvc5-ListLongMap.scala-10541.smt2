; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124342 () Bool)

(assert start!124342)

(declare-fun b!1438719 () Bool)

(declare-fun res!971274 () Bool)

(declare-fun e!811562 () Bool)

(assert (=> b!1438719 (=> (not res!971274) (not e!811562))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97829 0))(
  ( (array!97830 (arr!47204 (Array (_ BitVec 32) (_ BitVec 64))) (size!47754 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97829)

(assert (=> b!1438719 (= res!971274 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47754 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47754 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47754 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47204 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438720 () Bool)

(declare-fun res!971269 () Bool)

(assert (=> b!1438720 (=> (not res!971269) (not e!811562))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97829 (_ BitVec 32)) Bool)

(assert (=> b!1438720 (= res!971269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438721 () Bool)

(declare-fun res!971272 () Bool)

(assert (=> b!1438721 (=> (not res!971272) (not e!811562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438721 (= res!971272 (validKeyInArray!0 (select (arr!47204 a!2862) i!1006)))))

(declare-fun b!1438722 () Bool)

(declare-fun res!971270 () Bool)

(assert (=> b!1438722 (=> (not res!971270) (not e!811562))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1438722 (= res!971270 (validKeyInArray!0 (select (arr!47204 a!2862) j!93)))))

(declare-fun b!1438723 () Bool)

(declare-fun res!971277 () Bool)

(declare-fun e!811560 () Bool)

(assert (=> b!1438723 (=> (not res!971277) (not e!811560))))

(declare-datatypes ((SeekEntryResult!11456 0))(
  ( (MissingZero!11456 (index!48216 (_ BitVec 32))) (Found!11456 (index!48217 (_ BitVec 32))) (Intermediate!11456 (undefined!12268 Bool) (index!48218 (_ BitVec 32)) (x!129955 (_ BitVec 32))) (Undefined!11456) (MissingVacant!11456 (index!48219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97829 (_ BitVec 32)) SeekEntryResult!11456)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438723 (= res!971277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47204 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47204 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97830 (store (arr!47204 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47754 a!2862)) mask!2687) (Intermediate!11456 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438724 () Bool)

(declare-fun res!971273 () Bool)

(assert (=> b!1438724 (=> (not res!971273) (not e!811562))))

(assert (=> b!1438724 (= res!971273 (and (= (size!47754 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47754 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47754 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438726 () Bool)

(declare-fun res!971271 () Bool)

(assert (=> b!1438726 (=> (not res!971271) (not e!811560))))

(declare-fun lt!632637 () SeekEntryResult!11456)

(assert (=> b!1438726 (= res!971271 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47204 a!2862) j!93) a!2862 mask!2687) lt!632637))))

(declare-fun b!1438727 () Bool)

(assert (=> b!1438727 (= e!811560 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438728 () Bool)

(declare-fun res!971276 () Bool)

(assert (=> b!1438728 (=> (not res!971276) (not e!811562))))

(declare-datatypes ((List!33705 0))(
  ( (Nil!33702) (Cons!33701 (h!35048 (_ BitVec 64)) (t!48399 List!33705)) )
))
(declare-fun arrayNoDuplicates!0 (array!97829 (_ BitVec 32) List!33705) Bool)

(assert (=> b!1438728 (= res!971276 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33702))))

(declare-fun b!1438725 () Bool)

(assert (=> b!1438725 (= e!811562 e!811560)))

(declare-fun res!971275 () Bool)

(assert (=> b!1438725 (=> (not res!971275) (not e!811560))))

(assert (=> b!1438725 (= res!971275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47204 a!2862) j!93) mask!2687) (select (arr!47204 a!2862) j!93) a!2862 mask!2687) lt!632637))))

(assert (=> b!1438725 (= lt!632637 (Intermediate!11456 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!971278 () Bool)

(assert (=> start!124342 (=> (not res!971278) (not e!811562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124342 (= res!971278 (validMask!0 mask!2687))))

(assert (=> start!124342 e!811562))

(assert (=> start!124342 true))

(declare-fun array_inv!36232 (array!97829) Bool)

(assert (=> start!124342 (array_inv!36232 a!2862)))

(assert (= (and start!124342 res!971278) b!1438724))

(assert (= (and b!1438724 res!971273) b!1438721))

(assert (= (and b!1438721 res!971272) b!1438722))

(assert (= (and b!1438722 res!971270) b!1438720))

(assert (= (and b!1438720 res!971269) b!1438728))

(assert (= (and b!1438728 res!971276) b!1438719))

(assert (= (and b!1438719 res!971274) b!1438725))

(assert (= (and b!1438725 res!971275) b!1438726))

(assert (= (and b!1438726 res!971271) b!1438723))

(assert (= (and b!1438723 res!971277) b!1438727))

(declare-fun m!1327831 () Bool)

(assert (=> start!124342 m!1327831))

(declare-fun m!1327833 () Bool)

(assert (=> start!124342 m!1327833))

(declare-fun m!1327835 () Bool)

(assert (=> b!1438721 m!1327835))

(assert (=> b!1438721 m!1327835))

(declare-fun m!1327837 () Bool)

(assert (=> b!1438721 m!1327837))

(declare-fun m!1327839 () Bool)

(assert (=> b!1438725 m!1327839))

(assert (=> b!1438725 m!1327839))

(declare-fun m!1327841 () Bool)

(assert (=> b!1438725 m!1327841))

(assert (=> b!1438725 m!1327841))

(assert (=> b!1438725 m!1327839))

(declare-fun m!1327843 () Bool)

(assert (=> b!1438725 m!1327843))

(declare-fun m!1327845 () Bool)

(assert (=> b!1438719 m!1327845))

(declare-fun m!1327847 () Bool)

(assert (=> b!1438719 m!1327847))

(assert (=> b!1438726 m!1327839))

(assert (=> b!1438726 m!1327839))

(declare-fun m!1327849 () Bool)

(assert (=> b!1438726 m!1327849))

(declare-fun m!1327851 () Bool)

(assert (=> b!1438728 m!1327851))

(declare-fun m!1327853 () Bool)

(assert (=> b!1438720 m!1327853))

(assert (=> b!1438722 m!1327839))

(assert (=> b!1438722 m!1327839))

(declare-fun m!1327855 () Bool)

(assert (=> b!1438722 m!1327855))

(assert (=> b!1438723 m!1327845))

(declare-fun m!1327857 () Bool)

(assert (=> b!1438723 m!1327857))

(assert (=> b!1438723 m!1327857))

(declare-fun m!1327859 () Bool)

(assert (=> b!1438723 m!1327859))

(assert (=> b!1438723 m!1327859))

(assert (=> b!1438723 m!1327857))

(declare-fun m!1327861 () Bool)

(assert (=> b!1438723 m!1327861))

(push 1)

