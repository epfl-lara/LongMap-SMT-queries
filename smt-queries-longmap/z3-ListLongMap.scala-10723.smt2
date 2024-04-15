; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125446 () Bool)

(assert start!125446)

(declare-fun b!1467745 () Bool)

(declare-fun res!996406 () Bool)

(declare-fun e!824300 () Bool)

(assert (=> b!1467745 (=> (not res!996406) (not e!824300))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98872 0))(
  ( (array!98873 (arr!47725 (Array (_ BitVec 32) (_ BitVec 64))) (size!48277 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98872)

(assert (=> b!1467745 (= res!996406 (and (= (size!48277 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48277 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48277 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467746 () Bool)

(declare-fun res!996402 () Bool)

(assert (=> b!1467746 (=> (not res!996402) (not e!824300))))

(declare-datatypes ((List!34304 0))(
  ( (Nil!34301) (Cons!34300 (h!35650 (_ BitVec 64)) (t!48990 List!34304)) )
))
(declare-fun arrayNoDuplicates!0 (array!98872 (_ BitVec 32) List!34304) Bool)

(assert (=> b!1467746 (= res!996402 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34301))))

(declare-fun res!996408 () Bool)

(assert (=> start!125446 (=> (not res!996408) (not e!824300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125446 (= res!996408 (validMask!0 mask!2687))))

(assert (=> start!125446 e!824300))

(assert (=> start!125446 true))

(declare-fun array_inv!36958 (array!98872) Bool)

(assert (=> start!125446 (array_inv!36958 a!2862)))

(declare-fun b!1467747 () Bool)

(declare-fun res!996409 () Bool)

(assert (=> b!1467747 (=> (not res!996409) (not e!824300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467747 (= res!996409 (validKeyInArray!0 (select (arr!47725 a!2862) i!1006)))))

(declare-fun b!1467748 () Bool)

(declare-fun res!996407 () Bool)

(assert (=> b!1467748 (=> (not res!996407) (not e!824300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98872 (_ BitVec 32)) Bool)

(assert (=> b!1467748 (= res!996407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467749 () Bool)

(declare-fun e!824301 () Bool)

(assert (=> b!1467749 (= e!824300 e!824301)))

(declare-fun res!996404 () Bool)

(assert (=> b!1467749 (=> (not res!996404) (not e!824301))))

(declare-datatypes ((SeekEntryResult!11990 0))(
  ( (MissingZero!11990 (index!50352 (_ BitVec 32))) (Found!11990 (index!50353 (_ BitVec 32))) (Intermediate!11990 (undefined!12802 Bool) (index!50354 (_ BitVec 32)) (x!131946 (_ BitVec 32))) (Undefined!11990) (MissingVacant!11990 (index!50355 (_ BitVec 32))) )
))
(declare-fun lt!641945 () SeekEntryResult!11990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98872 (_ BitVec 32)) SeekEntryResult!11990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467749 (= res!996404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47725 a!2862) j!93) mask!2687) (select (arr!47725 a!2862) j!93) a!2862 mask!2687) lt!641945))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467749 (= lt!641945 (Intermediate!11990 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467750 () Bool)

(declare-fun res!996405 () Bool)

(assert (=> b!1467750 (=> (not res!996405) (not e!824300))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467750 (= res!996405 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48277 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48277 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48277 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467751 () Bool)

(declare-fun res!996403 () Bool)

(assert (=> b!1467751 (=> (not res!996403) (not e!824300))))

(assert (=> b!1467751 (= res!996403 (validKeyInArray!0 (select (arr!47725 a!2862) j!93)))))

(declare-fun b!1467752 () Bool)

(declare-fun res!996401 () Bool)

(assert (=> b!1467752 (=> (not res!996401) (not e!824301))))

(assert (=> b!1467752 (= res!996401 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47725 a!2862) j!93) a!2862 mask!2687) lt!641945))))

(declare-fun b!1467753 () Bool)

(assert (=> b!1467753 (= e!824301 false)))

(declare-fun lt!641946 () (_ BitVec 32))

(assert (=> b!1467753 (= lt!641946 (toIndex!0 (select (store (arr!47725 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!125446 res!996408) b!1467745))

(assert (= (and b!1467745 res!996406) b!1467747))

(assert (= (and b!1467747 res!996409) b!1467751))

(assert (= (and b!1467751 res!996403) b!1467748))

(assert (= (and b!1467748 res!996407) b!1467746))

(assert (= (and b!1467746 res!996402) b!1467750))

(assert (= (and b!1467750 res!996405) b!1467749))

(assert (= (and b!1467749 res!996404) b!1467752))

(assert (= (and b!1467752 res!996401) b!1467753))

(declare-fun m!1354239 () Bool)

(assert (=> b!1467751 m!1354239))

(assert (=> b!1467751 m!1354239))

(declare-fun m!1354241 () Bool)

(assert (=> b!1467751 m!1354241))

(declare-fun m!1354243 () Bool)

(assert (=> b!1467753 m!1354243))

(declare-fun m!1354245 () Bool)

(assert (=> b!1467753 m!1354245))

(assert (=> b!1467753 m!1354245))

(declare-fun m!1354247 () Bool)

(assert (=> b!1467753 m!1354247))

(declare-fun m!1354249 () Bool)

(assert (=> b!1467747 m!1354249))

(assert (=> b!1467747 m!1354249))

(declare-fun m!1354251 () Bool)

(assert (=> b!1467747 m!1354251))

(assert (=> b!1467750 m!1354243))

(declare-fun m!1354253 () Bool)

(assert (=> b!1467750 m!1354253))

(assert (=> b!1467752 m!1354239))

(assert (=> b!1467752 m!1354239))

(declare-fun m!1354255 () Bool)

(assert (=> b!1467752 m!1354255))

(declare-fun m!1354257 () Bool)

(assert (=> start!125446 m!1354257))

(declare-fun m!1354259 () Bool)

(assert (=> start!125446 m!1354259))

(declare-fun m!1354261 () Bool)

(assert (=> b!1467746 m!1354261))

(declare-fun m!1354263 () Bool)

(assert (=> b!1467748 m!1354263))

(assert (=> b!1467749 m!1354239))

(assert (=> b!1467749 m!1354239))

(declare-fun m!1354265 () Bool)

(assert (=> b!1467749 m!1354265))

(assert (=> b!1467749 m!1354265))

(assert (=> b!1467749 m!1354239))

(declare-fun m!1354267 () Bool)

(assert (=> b!1467749 m!1354267))

(check-sat (not b!1467747) (not b!1467752) (not start!125446) (not b!1467751) (not b!1467749) (not b!1467753) (not b!1467746) (not b!1467748))
(check-sat)
