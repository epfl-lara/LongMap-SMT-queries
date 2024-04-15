; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124414 () Bool)

(assert start!124414)

(declare-fun b!1439606 () Bool)

(declare-fun res!972157 () Bool)

(declare-fun e!811870 () Bool)

(assert (=> b!1439606 (=> (not res!972157) (not e!811870))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97840 0))(
  ( (array!97841 (arr!47209 (Array (_ BitVec 32) (_ BitVec 64))) (size!47761 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97840)

(assert (=> b!1439606 (= res!972157 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47761 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47761 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47761 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!811871 () Bool)

(declare-fun b!1439607 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439607 (= e!811871 (not (validKeyInArray!0 (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439608 () Bool)

(declare-fun res!972151 () Bool)

(assert (=> b!1439608 (=> (not res!972151) (not e!811870))))

(declare-datatypes ((List!33788 0))(
  ( (Nil!33785) (Cons!33784 (h!35134 (_ BitVec 64)) (t!48474 List!33788)) )
))
(declare-fun arrayNoDuplicates!0 (array!97840 (_ BitVec 32) List!33788) Bool)

(assert (=> b!1439608 (= res!972151 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33785))))

(declare-fun b!1439609 () Bool)

(declare-fun res!972150 () Bool)

(assert (=> b!1439609 (=> (not res!972150) (not e!811870))))

(assert (=> b!1439609 (= res!972150 (validKeyInArray!0 (select (arr!47209 a!2862) j!93)))))

(declare-fun b!1439610 () Bool)

(declare-fun res!972155 () Bool)

(assert (=> b!1439610 (=> (not res!972155) (not e!811870))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97840 (_ BitVec 32)) Bool)

(assert (=> b!1439610 (= res!972155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439611 () Bool)

(assert (=> b!1439611 (= e!811870 e!811871)))

(declare-fun res!972160 () Bool)

(assert (=> b!1439611 (=> (not res!972160) (not e!811871))))

(declare-datatypes ((SeekEntryResult!11486 0))(
  ( (MissingZero!11486 (index!48336 (_ BitVec 32))) (Found!11486 (index!48337 (_ BitVec 32))) (Intermediate!11486 (undefined!12298 Bool) (index!48338 (_ BitVec 32)) (x!130066 (_ BitVec 32))) (Undefined!11486) (MissingVacant!11486 (index!48339 (_ BitVec 32))) )
))
(declare-fun lt!632637 () SeekEntryResult!11486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97840 (_ BitVec 32)) SeekEntryResult!11486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439611 (= res!972160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47209 a!2862) j!93) mask!2687) (select (arr!47209 a!2862) j!93) a!2862 mask!2687) lt!632637))))

(assert (=> b!1439611 (= lt!632637 (Intermediate!11486 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439612 () Bool)

(declare-fun res!972154 () Bool)

(assert (=> b!1439612 (=> (not res!972154) (not e!811870))))

(assert (=> b!1439612 (= res!972154 (and (= (size!47761 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47761 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47761 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!972156 () Bool)

(assert (=> start!124414 (=> (not res!972156) (not e!811870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124414 (= res!972156 (validMask!0 mask!2687))))

(assert (=> start!124414 e!811870))

(assert (=> start!124414 true))

(declare-fun array_inv!36442 (array!97840) Bool)

(assert (=> start!124414 (array_inv!36442 a!2862)))

(declare-fun b!1439613 () Bool)

(declare-fun res!972152 () Bool)

(assert (=> b!1439613 (=> (not res!972152) (not e!811871))))

(assert (=> b!1439613 (= res!972152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97841 (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)) mask!2687) (Intermediate!11486 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439614 () Bool)

(declare-fun res!972153 () Bool)

(assert (=> b!1439614 (=> (not res!972153) (not e!811871))))

(assert (=> b!1439614 (= res!972153 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47209 a!2862) j!93) a!2862 mask!2687) lt!632637))))

(declare-fun b!1439615 () Bool)

(declare-fun res!972159 () Bool)

(assert (=> b!1439615 (=> (not res!972159) (not e!811870))))

(assert (=> b!1439615 (= res!972159 (validKeyInArray!0 (select (arr!47209 a!2862) i!1006)))))

(declare-fun b!1439616 () Bool)

(declare-fun res!972158 () Bool)

(assert (=> b!1439616 (=> (not res!972158) (not e!811871))))

(assert (=> b!1439616 (= res!972158 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (= (and start!124414 res!972156) b!1439612))

(assert (= (and b!1439612 res!972154) b!1439615))

(assert (= (and b!1439615 res!972159) b!1439609))

(assert (= (and b!1439609 res!972150) b!1439610))

(assert (= (and b!1439610 res!972155) b!1439608))

(assert (= (and b!1439608 res!972151) b!1439606))

(assert (= (and b!1439606 res!972157) b!1439611))

(assert (= (and b!1439611 res!972160) b!1439614))

(assert (= (and b!1439614 res!972153) b!1439613))

(assert (= (and b!1439613 res!972152) b!1439616))

(assert (= (and b!1439616 res!972158) b!1439607))

(declare-fun m!1328241 () Bool)

(assert (=> b!1439614 m!1328241))

(assert (=> b!1439614 m!1328241))

(declare-fun m!1328243 () Bool)

(assert (=> b!1439614 m!1328243))

(assert (=> b!1439609 m!1328241))

(assert (=> b!1439609 m!1328241))

(declare-fun m!1328245 () Bool)

(assert (=> b!1439609 m!1328245))

(declare-fun m!1328247 () Bool)

(assert (=> b!1439606 m!1328247))

(declare-fun m!1328249 () Bool)

(assert (=> b!1439606 m!1328249))

(assert (=> b!1439607 m!1328247))

(declare-fun m!1328251 () Bool)

(assert (=> b!1439607 m!1328251))

(assert (=> b!1439607 m!1328251))

(declare-fun m!1328253 () Bool)

(assert (=> b!1439607 m!1328253))

(declare-fun m!1328255 () Bool)

(assert (=> b!1439615 m!1328255))

(assert (=> b!1439615 m!1328255))

(declare-fun m!1328257 () Bool)

(assert (=> b!1439615 m!1328257))

(assert (=> b!1439611 m!1328241))

(assert (=> b!1439611 m!1328241))

(declare-fun m!1328259 () Bool)

(assert (=> b!1439611 m!1328259))

(assert (=> b!1439611 m!1328259))

(assert (=> b!1439611 m!1328241))

(declare-fun m!1328261 () Bool)

(assert (=> b!1439611 m!1328261))

(declare-fun m!1328263 () Bool)

(assert (=> b!1439610 m!1328263))

(declare-fun m!1328265 () Bool)

(assert (=> b!1439608 m!1328265))

(assert (=> b!1439613 m!1328247))

(assert (=> b!1439613 m!1328251))

(assert (=> b!1439613 m!1328251))

(declare-fun m!1328267 () Bool)

(assert (=> b!1439613 m!1328267))

(assert (=> b!1439613 m!1328267))

(assert (=> b!1439613 m!1328251))

(declare-fun m!1328269 () Bool)

(assert (=> b!1439613 m!1328269))

(declare-fun m!1328271 () Bool)

(assert (=> start!124414 m!1328271))

(declare-fun m!1328273 () Bool)

(assert (=> start!124414 m!1328273))

(check-sat (not b!1439610) (not b!1439611) (not b!1439614) (not start!124414) (not b!1439608) (not b!1439615) (not b!1439613) (not b!1439607) (not b!1439609))
(check-sat)
