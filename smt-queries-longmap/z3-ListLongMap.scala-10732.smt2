; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125532 () Bool)

(assert start!125532)

(declare-fun b!1468696 () Bool)

(declare-fun res!997237 () Bool)

(declare-fun e!824669 () Bool)

(assert (=> b!1468696 (=> (not res!997237) (not e!824669))))

(declare-datatypes ((array!98980 0))(
  ( (array!98981 (arr!47778 (Array (_ BitVec 32) (_ BitVec 64))) (size!48328 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98980)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98980 (_ BitVec 32)) Bool)

(assert (=> b!1468696 (= res!997237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997241 () Bool)

(assert (=> start!125532 (=> (not res!997241) (not e!824669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125532 (= res!997241 (validMask!0 mask!2687))))

(assert (=> start!125532 e!824669))

(assert (=> start!125532 true))

(declare-fun array_inv!36806 (array!98980) Bool)

(assert (=> start!125532 (array_inv!36806 a!2862)))

(declare-fun b!1468697 () Bool)

(declare-fun e!824667 () Bool)

(assert (=> b!1468697 (= e!824669 e!824667)))

(declare-fun res!997243 () Bool)

(assert (=> b!1468697 (=> (not res!997243) (not e!824667))))

(declare-datatypes ((SeekEntryResult!12018 0))(
  ( (MissingZero!12018 (index!50464 (_ BitVec 32))) (Found!12018 (index!50465 (_ BitVec 32))) (Intermediate!12018 (undefined!12830 Bool) (index!50466 (_ BitVec 32)) (x!132051 (_ BitVec 32))) (Undefined!12018) (MissingVacant!12018 (index!50467 (_ BitVec 32))) )
))
(declare-fun lt!642347 () SeekEntryResult!12018)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!12018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468697 (= res!997243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47778 a!2862) j!93) mask!2687) (select (arr!47778 a!2862) j!93) a!2862 mask!2687) lt!642347))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468697 (= lt!642347 (Intermediate!12018 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468698 () Bool)

(declare-fun res!997242 () Bool)

(assert (=> b!1468698 (=> (not res!997242) (not e!824669))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468698 (= res!997242 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48328 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48328 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48328 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47778 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468699 () Bool)

(declare-fun res!997239 () Bool)

(assert (=> b!1468699 (=> (not res!997239) (not e!824669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468699 (= res!997239 (validKeyInArray!0 (select (arr!47778 a!2862) j!93)))))

(declare-fun b!1468700 () Bool)

(declare-fun res!997236 () Bool)

(assert (=> b!1468700 (=> (not res!997236) (not e!824669))))

(assert (=> b!1468700 (= res!997236 (validKeyInArray!0 (select (arr!47778 a!2862) i!1006)))))

(declare-fun b!1468701 () Bool)

(declare-fun res!997238 () Bool)

(assert (=> b!1468701 (=> (not res!997238) (not e!824669))))

(declare-datatypes ((List!34279 0))(
  ( (Nil!34276) (Cons!34275 (h!35625 (_ BitVec 64)) (t!48973 List!34279)) )
))
(declare-fun arrayNoDuplicates!0 (array!98980 (_ BitVec 32) List!34279) Bool)

(assert (=> b!1468701 (= res!997238 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34276))))

(declare-fun b!1468702 () Bool)

(declare-fun res!997240 () Bool)

(assert (=> b!1468702 (=> (not res!997240) (not e!824667))))

(assert (=> b!1468702 (= res!997240 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47778 a!2862) j!93) a!2862 mask!2687) lt!642347))))

(declare-fun b!1468703 () Bool)

(declare-fun res!997235 () Bool)

(assert (=> b!1468703 (=> (not res!997235) (not e!824669))))

(assert (=> b!1468703 (= res!997235 (and (= (size!48328 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48328 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48328 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468704 () Bool)

(assert (=> b!1468704 (= e!824667 false)))

(declare-fun lt!642348 () SeekEntryResult!12018)

(assert (=> b!1468704 (= lt!642348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47778 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47778 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98981 (store (arr!47778 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48328 a!2862)) mask!2687))))

(assert (= (and start!125532 res!997241) b!1468703))

(assert (= (and b!1468703 res!997235) b!1468700))

(assert (= (and b!1468700 res!997236) b!1468699))

(assert (= (and b!1468699 res!997239) b!1468696))

(assert (= (and b!1468696 res!997237) b!1468701))

(assert (= (and b!1468701 res!997238) b!1468698))

(assert (= (and b!1468698 res!997242) b!1468697))

(assert (= (and b!1468697 res!997243) b!1468702))

(assert (= (and b!1468702 res!997240) b!1468704))

(declare-fun m!1355805 () Bool)

(assert (=> start!125532 m!1355805))

(declare-fun m!1355807 () Bool)

(assert (=> start!125532 m!1355807))

(declare-fun m!1355809 () Bool)

(assert (=> b!1468698 m!1355809))

(declare-fun m!1355811 () Bool)

(assert (=> b!1468698 m!1355811))

(declare-fun m!1355813 () Bool)

(assert (=> b!1468697 m!1355813))

(assert (=> b!1468697 m!1355813))

(declare-fun m!1355815 () Bool)

(assert (=> b!1468697 m!1355815))

(assert (=> b!1468697 m!1355815))

(assert (=> b!1468697 m!1355813))

(declare-fun m!1355817 () Bool)

(assert (=> b!1468697 m!1355817))

(declare-fun m!1355819 () Bool)

(assert (=> b!1468700 m!1355819))

(assert (=> b!1468700 m!1355819))

(declare-fun m!1355821 () Bool)

(assert (=> b!1468700 m!1355821))

(assert (=> b!1468699 m!1355813))

(assert (=> b!1468699 m!1355813))

(declare-fun m!1355823 () Bool)

(assert (=> b!1468699 m!1355823))

(declare-fun m!1355825 () Bool)

(assert (=> b!1468696 m!1355825))

(assert (=> b!1468702 m!1355813))

(assert (=> b!1468702 m!1355813))

(declare-fun m!1355827 () Bool)

(assert (=> b!1468702 m!1355827))

(declare-fun m!1355829 () Bool)

(assert (=> b!1468701 m!1355829))

(assert (=> b!1468704 m!1355809))

(declare-fun m!1355831 () Bool)

(assert (=> b!1468704 m!1355831))

(assert (=> b!1468704 m!1355831))

(declare-fun m!1355833 () Bool)

(assert (=> b!1468704 m!1355833))

(assert (=> b!1468704 m!1355833))

(assert (=> b!1468704 m!1355831))

(declare-fun m!1355835 () Bool)

(assert (=> b!1468704 m!1355835))

(check-sat (not b!1468699) (not b!1468704) (not start!125532) (not b!1468701) (not b!1468700) (not b!1468697) (not b!1468696) (not b!1468702))
(check-sat)
