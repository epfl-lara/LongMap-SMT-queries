; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125538 () Bool)

(assert start!125538)

(declare-fun b!1468777 () Bool)

(declare-fun e!824695 () Bool)

(declare-fun e!824696 () Bool)

(assert (=> b!1468777 (= e!824695 e!824696)))

(declare-fun res!997320 () Bool)

(assert (=> b!1468777 (=> (not res!997320) (not e!824696))))

(declare-datatypes ((SeekEntryResult!12021 0))(
  ( (MissingZero!12021 (index!50476 (_ BitVec 32))) (Found!12021 (index!50477 (_ BitVec 32))) (Intermediate!12021 (undefined!12833 Bool) (index!50478 (_ BitVec 32)) (x!132062 (_ BitVec 32))) (Undefined!12021) (MissingVacant!12021 (index!50479 (_ BitVec 32))) )
))
(declare-fun lt!642365 () SeekEntryResult!12021)

(declare-datatypes ((array!98986 0))(
  ( (array!98987 (arr!47781 (Array (_ BitVec 32) (_ BitVec 64))) (size!48331 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98986)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98986 (_ BitVec 32)) SeekEntryResult!12021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468777 (= res!997320 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47781 a!2862) j!93) mask!2687) (select (arr!47781 a!2862) j!93) a!2862 mask!2687) lt!642365))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468777 (= lt!642365 (Intermediate!12021 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468778 () Bool)

(declare-fun res!997324 () Bool)

(assert (=> b!1468778 (=> (not res!997324) (not e!824695))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468778 (= res!997324 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48331 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48331 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48331 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47781 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468779 () Bool)

(declare-fun res!997318 () Bool)

(assert (=> b!1468779 (=> (not res!997318) (not e!824695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468779 (= res!997318 (validKeyInArray!0 (select (arr!47781 a!2862) j!93)))))

(declare-fun res!997323 () Bool)

(assert (=> start!125538 (=> (not res!997323) (not e!824695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125538 (= res!997323 (validMask!0 mask!2687))))

(assert (=> start!125538 e!824695))

(assert (=> start!125538 true))

(declare-fun array_inv!36809 (array!98986) Bool)

(assert (=> start!125538 (array_inv!36809 a!2862)))

(declare-fun b!1468780 () Bool)

(declare-fun res!997317 () Bool)

(assert (=> b!1468780 (=> (not res!997317) (not e!824695))))

(declare-datatypes ((List!34282 0))(
  ( (Nil!34279) (Cons!34278 (h!35628 (_ BitVec 64)) (t!48976 List!34282)) )
))
(declare-fun arrayNoDuplicates!0 (array!98986 (_ BitVec 32) List!34282) Bool)

(assert (=> b!1468780 (= res!997317 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34279))))

(declare-fun b!1468781 () Bool)

(declare-fun res!997319 () Bool)

(assert (=> b!1468781 (=> (not res!997319) (not e!824695))))

(assert (=> b!1468781 (= res!997319 (and (= (size!48331 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48331 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48331 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468782 () Bool)

(declare-fun res!997321 () Bool)

(assert (=> b!1468782 (=> (not res!997321) (not e!824696))))

(assert (=> b!1468782 (= res!997321 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47781 a!2862) j!93) a!2862 mask!2687) lt!642365))))

(declare-fun b!1468783 () Bool)

(assert (=> b!1468783 (= e!824696 false)))

(declare-fun lt!642366 () SeekEntryResult!12021)

(assert (=> b!1468783 (= lt!642366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47781 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47781 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98987 (store (arr!47781 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48331 a!2862)) mask!2687))))

(declare-fun b!1468784 () Bool)

(declare-fun res!997316 () Bool)

(assert (=> b!1468784 (=> (not res!997316) (not e!824695))))

(assert (=> b!1468784 (= res!997316 (validKeyInArray!0 (select (arr!47781 a!2862) i!1006)))))

(declare-fun b!1468785 () Bool)

(declare-fun res!997322 () Bool)

(assert (=> b!1468785 (=> (not res!997322) (not e!824695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98986 (_ BitVec 32)) Bool)

(assert (=> b!1468785 (= res!997322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125538 res!997323) b!1468781))

(assert (= (and b!1468781 res!997319) b!1468784))

(assert (= (and b!1468784 res!997316) b!1468779))

(assert (= (and b!1468779 res!997318) b!1468785))

(assert (= (and b!1468785 res!997322) b!1468780))

(assert (= (and b!1468780 res!997317) b!1468778))

(assert (= (and b!1468778 res!997324) b!1468777))

(assert (= (and b!1468777 res!997320) b!1468782))

(assert (= (and b!1468782 res!997321) b!1468783))

(declare-fun m!1355901 () Bool)

(assert (=> b!1468779 m!1355901))

(assert (=> b!1468779 m!1355901))

(declare-fun m!1355903 () Bool)

(assert (=> b!1468779 m!1355903))

(declare-fun m!1355905 () Bool)

(assert (=> b!1468785 m!1355905))

(declare-fun m!1355907 () Bool)

(assert (=> b!1468784 m!1355907))

(assert (=> b!1468784 m!1355907))

(declare-fun m!1355909 () Bool)

(assert (=> b!1468784 m!1355909))

(declare-fun m!1355911 () Bool)

(assert (=> b!1468783 m!1355911))

(declare-fun m!1355913 () Bool)

(assert (=> b!1468783 m!1355913))

(assert (=> b!1468783 m!1355913))

(declare-fun m!1355915 () Bool)

(assert (=> b!1468783 m!1355915))

(assert (=> b!1468783 m!1355915))

(assert (=> b!1468783 m!1355913))

(declare-fun m!1355917 () Bool)

(assert (=> b!1468783 m!1355917))

(declare-fun m!1355919 () Bool)

(assert (=> start!125538 m!1355919))

(declare-fun m!1355921 () Bool)

(assert (=> start!125538 m!1355921))

(assert (=> b!1468782 m!1355901))

(assert (=> b!1468782 m!1355901))

(declare-fun m!1355923 () Bool)

(assert (=> b!1468782 m!1355923))

(declare-fun m!1355925 () Bool)

(assert (=> b!1468780 m!1355925))

(assert (=> b!1468778 m!1355911))

(declare-fun m!1355927 () Bool)

(assert (=> b!1468778 m!1355927))

(assert (=> b!1468777 m!1355901))

(assert (=> b!1468777 m!1355901))

(declare-fun m!1355929 () Bool)

(assert (=> b!1468777 m!1355929))

(assert (=> b!1468777 m!1355929))

(assert (=> b!1468777 m!1355901))

(declare-fun m!1355931 () Bool)

(assert (=> b!1468777 m!1355931))

(check-sat (not b!1468782) (not b!1468783) (not start!125538) (not b!1468784) (not b!1468785) (not b!1468777) (not b!1468779) (not b!1468780))
(check-sat)
