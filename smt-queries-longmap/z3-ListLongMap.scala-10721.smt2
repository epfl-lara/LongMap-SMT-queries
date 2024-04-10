; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125466 () Bool)

(assert start!125466)

(declare-fun b!1467809 () Bool)

(declare-fun res!996355 () Bool)

(declare-fun e!824374 () Bool)

(assert (=> b!1467809 (=> (not res!996355) (not e!824374))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98914 0))(
  ( (array!98915 (arr!47745 (Array (_ BitVec 32) (_ BitVec 64))) (size!48295 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98914)

(assert (=> b!1467809 (= res!996355 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48295 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48295 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48295 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47745 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467810 () Bool)

(declare-fun res!996348 () Bool)

(assert (=> b!1467810 (=> (not res!996348) (not e!824374))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467810 (= res!996348 (validKeyInArray!0 (select (arr!47745 a!2862) j!93)))))

(declare-fun b!1467811 () Bool)

(declare-fun res!996353 () Bool)

(assert (=> b!1467811 (=> (not res!996353) (not e!824374))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11985 0))(
  ( (MissingZero!11985 (index!50332 (_ BitVec 32))) (Found!11985 (index!50333 (_ BitVec 32))) (Intermediate!11985 (undefined!12797 Bool) (index!50334 (_ BitVec 32)) (x!131930 (_ BitVec 32))) (Undefined!11985) (MissingVacant!11985 (index!50335 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98914 (_ BitVec 32)) SeekEntryResult!11985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467811 (= res!996353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47745 a!2862) j!93) mask!2687) (select (arr!47745 a!2862) j!93) a!2862 mask!2687) (Intermediate!11985 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467812 () Bool)

(declare-fun res!996351 () Bool)

(assert (=> b!1467812 (=> (not res!996351) (not e!824374))))

(assert (=> b!1467812 (= res!996351 (validKeyInArray!0 (select (arr!47745 a!2862) i!1006)))))

(declare-fun b!1467814 () Bool)

(declare-fun res!996352 () Bool)

(assert (=> b!1467814 (=> (not res!996352) (not e!824374))))

(assert (=> b!1467814 (= res!996352 (and (= (size!48295 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48295 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48295 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467815 () Bool)

(declare-fun res!996350 () Bool)

(assert (=> b!1467815 (=> (not res!996350) (not e!824374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98914 (_ BitVec 32)) Bool)

(assert (=> b!1467815 (= res!996350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467816 () Bool)

(assert (=> b!1467816 (= e!824374 false)))

(declare-fun lt!642153 () SeekEntryResult!11985)

(assert (=> b!1467816 (= lt!642153 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47745 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!996349 () Bool)

(assert (=> start!125466 (=> (not res!996349) (not e!824374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125466 (= res!996349 (validMask!0 mask!2687))))

(assert (=> start!125466 e!824374))

(assert (=> start!125466 true))

(declare-fun array_inv!36773 (array!98914) Bool)

(assert (=> start!125466 (array_inv!36773 a!2862)))

(declare-fun b!1467813 () Bool)

(declare-fun res!996354 () Bool)

(assert (=> b!1467813 (=> (not res!996354) (not e!824374))))

(declare-datatypes ((List!34246 0))(
  ( (Nil!34243) (Cons!34242 (h!35592 (_ BitVec 64)) (t!48940 List!34246)) )
))
(declare-fun arrayNoDuplicates!0 (array!98914 (_ BitVec 32) List!34246) Bool)

(assert (=> b!1467813 (= res!996354 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34243))))

(assert (= (and start!125466 res!996349) b!1467814))

(assert (= (and b!1467814 res!996352) b!1467812))

(assert (= (and b!1467812 res!996351) b!1467810))

(assert (= (and b!1467810 res!996348) b!1467815))

(assert (= (and b!1467815 res!996350) b!1467813))

(assert (= (and b!1467813 res!996354) b!1467809))

(assert (= (and b!1467809 res!996355) b!1467811))

(assert (= (and b!1467811 res!996353) b!1467816))

(declare-fun m!1354773 () Bool)

(assert (=> start!125466 m!1354773))

(declare-fun m!1354775 () Bool)

(assert (=> start!125466 m!1354775))

(declare-fun m!1354777 () Bool)

(assert (=> b!1467809 m!1354777))

(declare-fun m!1354779 () Bool)

(assert (=> b!1467809 m!1354779))

(declare-fun m!1354781 () Bool)

(assert (=> b!1467811 m!1354781))

(assert (=> b!1467811 m!1354781))

(declare-fun m!1354783 () Bool)

(assert (=> b!1467811 m!1354783))

(assert (=> b!1467811 m!1354783))

(assert (=> b!1467811 m!1354781))

(declare-fun m!1354785 () Bool)

(assert (=> b!1467811 m!1354785))

(declare-fun m!1354787 () Bool)

(assert (=> b!1467815 m!1354787))

(assert (=> b!1467810 m!1354781))

(assert (=> b!1467810 m!1354781))

(declare-fun m!1354789 () Bool)

(assert (=> b!1467810 m!1354789))

(assert (=> b!1467816 m!1354781))

(assert (=> b!1467816 m!1354781))

(declare-fun m!1354791 () Bool)

(assert (=> b!1467816 m!1354791))

(declare-fun m!1354793 () Bool)

(assert (=> b!1467812 m!1354793))

(assert (=> b!1467812 m!1354793))

(declare-fun m!1354795 () Bool)

(assert (=> b!1467812 m!1354795))

(declare-fun m!1354797 () Bool)

(assert (=> b!1467813 m!1354797))

(check-sat (not start!125466) (not b!1467812) (not b!1467811) (not b!1467813) (not b!1467810) (not b!1467815) (not b!1467816))
