; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124402 () Bool)

(assert start!124402)

(declare-fun b!1439194 () Bool)

(declare-fun res!971627 () Bool)

(declare-fun e!811788 () Bool)

(assert (=> b!1439194 (=> (not res!971627) (not e!811788))))

(declare-datatypes ((array!97850 0))(
  ( (array!97851 (arr!47213 (Array (_ BitVec 32) (_ BitVec 64))) (size!47763 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97850)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439194 (= res!971627 (validKeyInArray!0 (select (arr!47213 a!2862) i!1006)))))

(declare-fun b!1439195 () Bool)

(declare-fun e!811789 () Bool)

(assert (=> b!1439195 (= e!811789 false)))

(declare-datatypes ((SeekEntryResult!11465 0))(
  ( (MissingZero!11465 (index!48252 (_ BitVec 32))) (Found!11465 (index!48253 (_ BitVec 32))) (Intermediate!11465 (undefined!12277 Bool) (index!48254 (_ BitVec 32)) (x!129994 (_ BitVec 32))) (Undefined!11465) (MissingVacant!11465 (index!48255 (_ BitVec 32))) )
))
(declare-fun lt!632765 () SeekEntryResult!11465)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97850 (_ BitVec 32)) SeekEntryResult!11465)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439195 (= lt!632765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47213 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47213 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97851 (store (arr!47213 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47763 a!2862)) mask!2687))))

(declare-fun b!1439196 () Bool)

(declare-fun res!971628 () Bool)

(assert (=> b!1439196 (=> (not res!971628) (not e!811788))))

(assert (=> b!1439196 (= res!971628 (and (= (size!47763 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47763 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47763 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439197 () Bool)

(declare-fun res!971626 () Bool)

(assert (=> b!1439197 (=> (not res!971626) (not e!811788))))

(declare-datatypes ((List!33714 0))(
  ( (Nil!33711) (Cons!33710 (h!35060 (_ BitVec 64)) (t!48408 List!33714)) )
))
(declare-fun arrayNoDuplicates!0 (array!97850 (_ BitVec 32) List!33714) Bool)

(assert (=> b!1439197 (= res!971626 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33711))))

(declare-fun b!1439198 () Bool)

(assert (=> b!1439198 (= e!811788 e!811789)))

(declare-fun res!971624 () Bool)

(assert (=> b!1439198 (=> (not res!971624) (not e!811789))))

(declare-fun lt!632766 () SeekEntryResult!11465)

(assert (=> b!1439198 (= res!971624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47213 a!2862) j!93) mask!2687) (select (arr!47213 a!2862) j!93) a!2862 mask!2687) lt!632766))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439198 (= lt!632766 (Intermediate!11465 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439199 () Bool)

(declare-fun res!971623 () Bool)

(assert (=> b!1439199 (=> (not res!971623) (not e!811789))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439199 (= res!971623 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47213 a!2862) j!93) a!2862 mask!2687) lt!632766))))

(declare-fun b!1439200 () Bool)

(declare-fun res!971621 () Bool)

(assert (=> b!1439200 (=> (not res!971621) (not e!811788))))

(assert (=> b!1439200 (= res!971621 (validKeyInArray!0 (select (arr!47213 a!2862) j!93)))))

(declare-fun b!1439201 () Bool)

(declare-fun res!971625 () Bool)

(assert (=> b!1439201 (=> (not res!971625) (not e!811788))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439201 (= res!971625 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47763 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47763 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47763 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47213 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439202 () Bool)

(declare-fun res!971622 () Bool)

(assert (=> b!1439202 (=> (not res!971622) (not e!811788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97850 (_ BitVec 32)) Bool)

(assert (=> b!1439202 (= res!971622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971629 () Bool)

(assert (=> start!124402 (=> (not res!971629) (not e!811788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124402 (= res!971629 (validMask!0 mask!2687))))

(assert (=> start!124402 e!811788))

(assert (=> start!124402 true))

(declare-fun array_inv!36241 (array!97850) Bool)

(assert (=> start!124402 (array_inv!36241 a!2862)))

(assert (= (and start!124402 res!971629) b!1439196))

(assert (= (and b!1439196 res!971628) b!1439194))

(assert (= (and b!1439194 res!971627) b!1439200))

(assert (= (and b!1439200 res!971621) b!1439202))

(assert (= (and b!1439202 res!971622) b!1439197))

(assert (= (and b!1439197 res!971626) b!1439201))

(assert (= (and b!1439201 res!971625) b!1439198))

(assert (= (and b!1439198 res!971624) b!1439199))

(assert (= (and b!1439199 res!971623) b!1439195))

(declare-fun m!1328239 () Bool)

(assert (=> b!1439197 m!1328239))

(declare-fun m!1328241 () Bool)

(assert (=> start!124402 m!1328241))

(declare-fun m!1328243 () Bool)

(assert (=> start!124402 m!1328243))

(declare-fun m!1328245 () Bool)

(assert (=> b!1439199 m!1328245))

(assert (=> b!1439199 m!1328245))

(declare-fun m!1328247 () Bool)

(assert (=> b!1439199 m!1328247))

(declare-fun m!1328249 () Bool)

(assert (=> b!1439202 m!1328249))

(assert (=> b!1439198 m!1328245))

(assert (=> b!1439198 m!1328245))

(declare-fun m!1328251 () Bool)

(assert (=> b!1439198 m!1328251))

(assert (=> b!1439198 m!1328251))

(assert (=> b!1439198 m!1328245))

(declare-fun m!1328253 () Bool)

(assert (=> b!1439198 m!1328253))

(declare-fun m!1328255 () Bool)

(assert (=> b!1439201 m!1328255))

(declare-fun m!1328257 () Bool)

(assert (=> b!1439201 m!1328257))

(assert (=> b!1439200 m!1328245))

(assert (=> b!1439200 m!1328245))

(declare-fun m!1328259 () Bool)

(assert (=> b!1439200 m!1328259))

(assert (=> b!1439195 m!1328255))

(declare-fun m!1328261 () Bool)

(assert (=> b!1439195 m!1328261))

(assert (=> b!1439195 m!1328261))

(declare-fun m!1328263 () Bool)

(assert (=> b!1439195 m!1328263))

(assert (=> b!1439195 m!1328263))

(assert (=> b!1439195 m!1328261))

(declare-fun m!1328265 () Bool)

(assert (=> b!1439195 m!1328265))

(declare-fun m!1328267 () Bool)

(assert (=> b!1439194 m!1328267))

(assert (=> b!1439194 m!1328267))

(declare-fun m!1328269 () Bool)

(assert (=> b!1439194 m!1328269))

(push 1)

