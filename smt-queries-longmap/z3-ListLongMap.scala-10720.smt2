; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125460 () Bool)

(assert start!125460)

(declare-fun b!1467737 () Bool)

(declare-fun res!996279 () Bool)

(declare-fun e!824357 () Bool)

(assert (=> b!1467737 (=> (not res!996279) (not e!824357))))

(declare-datatypes ((array!98908 0))(
  ( (array!98909 (arr!47742 (Array (_ BitVec 32) (_ BitVec 64))) (size!48292 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98908)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467737 (= res!996279 (validKeyInArray!0 (select (arr!47742 a!2862) j!93)))))

(declare-fun b!1467738 () Bool)

(declare-fun res!996282 () Bool)

(assert (=> b!1467738 (=> (not res!996282) (not e!824357))))

(declare-datatypes ((List!34243 0))(
  ( (Nil!34240) (Cons!34239 (h!35589 (_ BitVec 64)) (t!48937 List!34243)) )
))
(declare-fun arrayNoDuplicates!0 (array!98908 (_ BitVec 32) List!34243) Bool)

(assert (=> b!1467738 (= res!996282 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34240))))

(declare-fun b!1467739 () Bool)

(declare-fun res!996283 () Bool)

(assert (=> b!1467739 (=> (not res!996283) (not e!824357))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467739 (= res!996283 (validKeyInArray!0 (select (arr!47742 a!2862) i!1006)))))

(declare-fun res!996281 () Bool)

(assert (=> start!125460 (=> (not res!996281) (not e!824357))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125460 (= res!996281 (validMask!0 mask!2687))))

(assert (=> start!125460 e!824357))

(assert (=> start!125460 true))

(declare-fun array_inv!36770 (array!98908) Bool)

(assert (=> start!125460 (array_inv!36770 a!2862)))

(declare-fun b!1467740 () Bool)

(declare-fun res!996276 () Bool)

(assert (=> b!1467740 (=> (not res!996276) (not e!824357))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11982 0))(
  ( (MissingZero!11982 (index!50320 (_ BitVec 32))) (Found!11982 (index!50321 (_ BitVec 32))) (Intermediate!11982 (undefined!12794 Bool) (index!50322 (_ BitVec 32)) (x!131919 (_ BitVec 32))) (Undefined!11982) (MissingVacant!11982 (index!50323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98908 (_ BitVec 32)) SeekEntryResult!11982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467740 (= res!996276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47742 a!2862) j!93) mask!2687) (select (arr!47742 a!2862) j!93) a!2862 mask!2687) (Intermediate!11982 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467741 () Bool)

(assert (=> b!1467741 (= e!824357 false)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642144 () SeekEntryResult!11982)

(assert (=> b!1467741 (= lt!642144 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47742 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467742 () Bool)

(declare-fun res!996280 () Bool)

(assert (=> b!1467742 (=> (not res!996280) (not e!824357))))

(assert (=> b!1467742 (= res!996280 (and (= (size!48292 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48292 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48292 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467743 () Bool)

(declare-fun res!996278 () Bool)

(assert (=> b!1467743 (=> (not res!996278) (not e!824357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98908 (_ BitVec 32)) Bool)

(assert (=> b!1467743 (= res!996278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467744 () Bool)

(declare-fun res!996277 () Bool)

(assert (=> b!1467744 (=> (not res!996277) (not e!824357))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467744 (= res!996277 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48292 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48292 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48292 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47742 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125460 res!996281) b!1467742))

(assert (= (and b!1467742 res!996280) b!1467739))

(assert (= (and b!1467739 res!996283) b!1467737))

(assert (= (and b!1467737 res!996279) b!1467743))

(assert (= (and b!1467743 res!996278) b!1467738))

(assert (= (and b!1467738 res!996282) b!1467744))

(assert (= (and b!1467744 res!996277) b!1467740))

(assert (= (and b!1467740 res!996276) b!1467741))

(declare-fun m!1354695 () Bool)

(assert (=> b!1467740 m!1354695))

(assert (=> b!1467740 m!1354695))

(declare-fun m!1354697 () Bool)

(assert (=> b!1467740 m!1354697))

(assert (=> b!1467740 m!1354697))

(assert (=> b!1467740 m!1354695))

(declare-fun m!1354699 () Bool)

(assert (=> b!1467740 m!1354699))

(declare-fun m!1354701 () Bool)

(assert (=> b!1467738 m!1354701))

(declare-fun m!1354703 () Bool)

(assert (=> b!1467739 m!1354703))

(assert (=> b!1467739 m!1354703))

(declare-fun m!1354705 () Bool)

(assert (=> b!1467739 m!1354705))

(declare-fun m!1354707 () Bool)

(assert (=> b!1467744 m!1354707))

(declare-fun m!1354709 () Bool)

(assert (=> b!1467744 m!1354709))

(assert (=> b!1467741 m!1354695))

(assert (=> b!1467741 m!1354695))

(declare-fun m!1354711 () Bool)

(assert (=> b!1467741 m!1354711))

(assert (=> b!1467737 m!1354695))

(assert (=> b!1467737 m!1354695))

(declare-fun m!1354713 () Bool)

(assert (=> b!1467737 m!1354713))

(declare-fun m!1354715 () Bool)

(assert (=> start!125460 m!1354715))

(declare-fun m!1354717 () Bool)

(assert (=> start!125460 m!1354717))

(declare-fun m!1354719 () Bool)

(assert (=> b!1467743 m!1354719))

(check-sat (not b!1467741) (not b!1467737) (not start!125460) (not b!1467740) (not b!1467738) (not b!1467743) (not b!1467739))
