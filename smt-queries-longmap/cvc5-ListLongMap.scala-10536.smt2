; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124270 () Bool)

(assert start!124270)

(declare-fun b!1438069 () Bool)

(declare-fun res!970750 () Bool)

(declare-fun e!811278 () Bool)

(assert (=> b!1438069 (=> (not res!970750) (not e!811278))))

(declare-datatypes ((array!97796 0))(
  ( (array!97797 (arr!47189 (Array (_ BitVec 32) (_ BitVec 64))) (size!47739 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97796)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438069 (= res!970750 (validKeyInArray!0 (select (arr!47189 a!2862) i!1006)))))

(declare-fun b!1438070 () Bool)

(declare-fun res!970746 () Bool)

(declare-fun e!811280 () Bool)

(assert (=> b!1438070 (=> (not res!970746) (not e!811280))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11441 0))(
  ( (MissingZero!11441 (index!48156 (_ BitVec 32))) (Found!11441 (index!48157 (_ BitVec 32))) (Intermediate!11441 (undefined!12253 Bool) (index!48158 (_ BitVec 32)) (x!129894 (_ BitVec 32))) (Undefined!11441) (MissingVacant!11441 (index!48159 (_ BitVec 32))) )
))
(declare-fun lt!632486 () SeekEntryResult!11441)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97796 (_ BitVec 32)) SeekEntryResult!11441)

(assert (=> b!1438070 (= res!970746 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47189 a!2862) j!93) a!2862 mask!2687) lt!632486))))

(declare-fun res!970748 () Bool)

(assert (=> start!124270 (=> (not res!970748) (not e!811278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124270 (= res!970748 (validMask!0 mask!2687))))

(assert (=> start!124270 e!811278))

(assert (=> start!124270 true))

(declare-fun array_inv!36217 (array!97796) Bool)

(assert (=> start!124270 (array_inv!36217 a!2862)))

(declare-fun b!1438071 () Bool)

(declare-fun res!970749 () Bool)

(assert (=> b!1438071 (=> (not res!970749) (not e!811278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97796 (_ BitVec 32)) Bool)

(assert (=> b!1438071 (= res!970749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438072 () Bool)

(declare-fun res!970747 () Bool)

(assert (=> b!1438072 (=> (not res!970747) (not e!811278))))

(declare-datatypes ((List!33690 0))(
  ( (Nil!33687) (Cons!33686 (h!35030 (_ BitVec 64)) (t!48384 List!33690)) )
))
(declare-fun arrayNoDuplicates!0 (array!97796 (_ BitVec 32) List!33690) Bool)

(assert (=> b!1438072 (= res!970747 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33687))))

(declare-fun b!1438073 () Bool)

(declare-fun res!970743 () Bool)

(assert (=> b!1438073 (=> (not res!970743) (not e!811278))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438073 (= res!970743 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47739 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47739 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47739 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47189 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438074 () Bool)

(declare-fun res!970742 () Bool)

(assert (=> b!1438074 (=> (not res!970742) (not e!811278))))

(assert (=> b!1438074 (= res!970742 (and (= (size!47739 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47739 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47739 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438075 () Bool)

(assert (=> b!1438075 (= e!811278 e!811280)))

(declare-fun res!970745 () Bool)

(assert (=> b!1438075 (=> (not res!970745) (not e!811280))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438075 (= res!970745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47189 a!2862) j!93) mask!2687) (select (arr!47189 a!2862) j!93) a!2862 mask!2687) lt!632486))))

(assert (=> b!1438075 (= lt!632486 (Intermediate!11441 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438076 () Bool)

(assert (=> b!1438076 (= e!811280 false)))

(declare-fun lt!632487 () (_ BitVec 32))

(assert (=> b!1438076 (= lt!632487 (toIndex!0 (select (store (arr!47189 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438077 () Bool)

(declare-fun res!970744 () Bool)

(assert (=> b!1438077 (=> (not res!970744) (not e!811278))))

(assert (=> b!1438077 (= res!970744 (validKeyInArray!0 (select (arr!47189 a!2862) j!93)))))

(assert (= (and start!124270 res!970748) b!1438074))

(assert (= (and b!1438074 res!970742) b!1438069))

(assert (= (and b!1438069 res!970750) b!1438077))

(assert (= (and b!1438077 res!970744) b!1438071))

(assert (= (and b!1438071 res!970749) b!1438072))

(assert (= (and b!1438072 res!970747) b!1438073))

(assert (= (and b!1438073 res!970743) b!1438075))

(assert (= (and b!1438075 res!970745) b!1438070))

(assert (= (and b!1438070 res!970746) b!1438076))

(declare-fun m!1327237 () Bool)

(assert (=> b!1438076 m!1327237))

(declare-fun m!1327239 () Bool)

(assert (=> b!1438076 m!1327239))

(assert (=> b!1438076 m!1327239))

(declare-fun m!1327241 () Bool)

(assert (=> b!1438076 m!1327241))

(declare-fun m!1327243 () Bool)

(assert (=> b!1438075 m!1327243))

(assert (=> b!1438075 m!1327243))

(declare-fun m!1327245 () Bool)

(assert (=> b!1438075 m!1327245))

(assert (=> b!1438075 m!1327245))

(assert (=> b!1438075 m!1327243))

(declare-fun m!1327247 () Bool)

(assert (=> b!1438075 m!1327247))

(declare-fun m!1327249 () Bool)

(assert (=> b!1438072 m!1327249))

(declare-fun m!1327251 () Bool)

(assert (=> start!124270 m!1327251))

(declare-fun m!1327253 () Bool)

(assert (=> start!124270 m!1327253))

(assert (=> b!1438073 m!1327237))

(declare-fun m!1327255 () Bool)

(assert (=> b!1438073 m!1327255))

(assert (=> b!1438077 m!1327243))

(assert (=> b!1438077 m!1327243))

(declare-fun m!1327257 () Bool)

(assert (=> b!1438077 m!1327257))

(assert (=> b!1438070 m!1327243))

(assert (=> b!1438070 m!1327243))

(declare-fun m!1327259 () Bool)

(assert (=> b!1438070 m!1327259))

(declare-fun m!1327261 () Bool)

(assert (=> b!1438071 m!1327261))

(declare-fun m!1327263 () Bool)

(assert (=> b!1438069 m!1327263))

(assert (=> b!1438069 m!1327263))

(declare-fun m!1327265 () Bool)

(assert (=> b!1438069 m!1327265))

(push 1)

