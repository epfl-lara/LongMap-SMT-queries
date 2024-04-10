; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124410 () Bool)

(assert start!124410)

(declare-fun b!1439312 () Bool)

(declare-fun res!971741 () Bool)

(declare-fun e!811830 () Bool)

(assert (=> b!1439312 (=> (not res!971741) (not e!811830))))

(declare-datatypes ((array!97858 0))(
  ( (array!97859 (arr!47217 (Array (_ BitVec 32) (_ BitVec 64))) (size!47767 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97858)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439312 (= res!971741 (validKeyInArray!0 (select (arr!47217 a!2862) i!1006)))))

(declare-fun b!1439313 () Bool)

(declare-fun e!811831 () Bool)

(assert (=> b!1439313 (= e!811830 e!811831)))

(declare-fun res!971746 () Bool)

(assert (=> b!1439313 (=> (not res!971746) (not e!811831))))

(declare-datatypes ((SeekEntryResult!11469 0))(
  ( (MissingZero!11469 (index!48268 (_ BitVec 32))) (Found!11469 (index!48269 (_ BitVec 32))) (Intermediate!11469 (undefined!12281 Bool) (index!48270 (_ BitVec 32)) (x!130006 (_ BitVec 32))) (Undefined!11469) (MissingVacant!11469 (index!48271 (_ BitVec 32))) )
))
(declare-fun lt!632790 () SeekEntryResult!11469)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97858 (_ BitVec 32)) SeekEntryResult!11469)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439313 (= res!971746 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47217 a!2862) j!93) mask!2687) (select (arr!47217 a!2862) j!93) a!2862 mask!2687) lt!632790))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439313 (= lt!632790 (Intermediate!11469 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439314 () Bool)

(declare-fun res!971743 () Bool)

(assert (=> b!1439314 (=> (not res!971743) (not e!811830))))

(assert (=> b!1439314 (= res!971743 (validKeyInArray!0 (select (arr!47217 a!2862) j!93)))))

(declare-fun b!1439315 () Bool)

(declare-fun res!971739 () Bool)

(assert (=> b!1439315 (=> (not res!971739) (not e!811830))))

(declare-datatypes ((List!33718 0))(
  ( (Nil!33715) (Cons!33714 (h!35064 (_ BitVec 64)) (t!48412 List!33718)) )
))
(declare-fun arrayNoDuplicates!0 (array!97858 (_ BitVec 32) List!33718) Bool)

(assert (=> b!1439315 (= res!971739 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33715))))

(declare-fun b!1439316 () Bool)

(declare-fun res!971742 () Bool)

(assert (=> b!1439316 (=> (not res!971742) (not e!811830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97858 (_ BitVec 32)) Bool)

(assert (=> b!1439316 (= res!971742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971747 () Bool)

(assert (=> start!124410 (=> (not res!971747) (not e!811830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124410 (= res!971747 (validMask!0 mask!2687))))

(assert (=> start!124410 e!811830))

(assert (=> start!124410 true))

(declare-fun array_inv!36245 (array!97858) Bool)

(assert (=> start!124410 (array_inv!36245 a!2862)))

(declare-fun b!1439317 () Bool)

(declare-fun res!971740 () Bool)

(assert (=> b!1439317 (=> (not res!971740) (not e!811830))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439317 (= res!971740 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47767 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47767 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47767 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439318 () Bool)

(declare-fun res!971745 () Bool)

(declare-fun e!811832 () Bool)

(assert (=> b!1439318 (=> (not res!971745) (not e!811832))))

(declare-fun lt!632789 () (_ BitVec 32))

(assert (=> b!1439318 (= res!971745 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632789 #b00000000000000000000000000000000) (bvslt lt!632789 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439319 () Bool)

(assert (=> b!1439319 (= e!811831 e!811832)))

(declare-fun res!971744 () Bool)

(assert (=> b!1439319 (=> (not res!971744) (not e!811832))))

(assert (=> b!1439319 (= res!971744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632789 (select (store (arr!47217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97859 (store (arr!47217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47767 a!2862)) mask!2687) (Intermediate!11469 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1439319 (= lt!632789 (toIndex!0 (select (store (arr!47217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439320 () Bool)

(declare-fun res!971749 () Bool)

(assert (=> b!1439320 (=> (not res!971749) (not e!811831))))

(assert (=> b!1439320 (= res!971749 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47217 a!2862) j!93) a!2862 mask!2687) lt!632790))))

(declare-fun b!1439321 () Bool)

(declare-fun res!971748 () Bool)

(assert (=> b!1439321 (=> (not res!971748) (not e!811830))))

(assert (=> b!1439321 (= res!971748 (and (= (size!47767 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47767 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47767 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439322 () Bool)

(assert (=> b!1439322 (= e!811832 (not (validKeyInArray!0 (select (store (arr!47217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(assert (= (and start!124410 res!971747) b!1439321))

(assert (= (and b!1439321 res!971748) b!1439312))

(assert (= (and b!1439312 res!971741) b!1439314))

(assert (= (and b!1439314 res!971743) b!1439316))

(assert (= (and b!1439316 res!971742) b!1439315))

(assert (= (and b!1439315 res!971739) b!1439317))

(assert (= (and b!1439317 res!971740) b!1439313))

(assert (= (and b!1439313 res!971746) b!1439320))

(assert (= (and b!1439320 res!971749) b!1439319))

(assert (= (and b!1439319 res!971744) b!1439318))

(assert (= (and b!1439318 res!971745) b!1439322))

(declare-fun m!1328369 () Bool)

(assert (=> b!1439316 m!1328369))

(declare-fun m!1328371 () Bool)

(assert (=> b!1439315 m!1328371))

(declare-fun m!1328373 () Bool)

(assert (=> b!1439312 m!1328373))

(assert (=> b!1439312 m!1328373))

(declare-fun m!1328375 () Bool)

(assert (=> b!1439312 m!1328375))

(declare-fun m!1328377 () Bool)

(assert (=> b!1439317 m!1328377))

(declare-fun m!1328379 () Bool)

(assert (=> b!1439317 m!1328379))

(declare-fun m!1328381 () Bool)

(assert (=> b!1439320 m!1328381))

(assert (=> b!1439320 m!1328381))

(declare-fun m!1328383 () Bool)

(assert (=> b!1439320 m!1328383))

(assert (=> b!1439319 m!1328377))

(declare-fun m!1328385 () Bool)

(assert (=> b!1439319 m!1328385))

(assert (=> b!1439319 m!1328385))

(declare-fun m!1328387 () Bool)

(assert (=> b!1439319 m!1328387))

(assert (=> b!1439319 m!1328385))

(declare-fun m!1328389 () Bool)

(assert (=> b!1439319 m!1328389))

(assert (=> b!1439322 m!1328377))

(assert (=> b!1439322 m!1328385))

(assert (=> b!1439322 m!1328385))

(declare-fun m!1328391 () Bool)

(assert (=> b!1439322 m!1328391))

(declare-fun m!1328393 () Bool)

(assert (=> start!124410 m!1328393))

(declare-fun m!1328395 () Bool)

(assert (=> start!124410 m!1328395))

(assert (=> b!1439314 m!1328381))

(assert (=> b!1439314 m!1328381))

(declare-fun m!1328397 () Bool)

(assert (=> b!1439314 m!1328397))

(assert (=> b!1439313 m!1328381))

(assert (=> b!1439313 m!1328381))

(declare-fun m!1328399 () Bool)

(assert (=> b!1439313 m!1328399))

(assert (=> b!1439313 m!1328399))

(assert (=> b!1439313 m!1328381))

(declare-fun m!1328401 () Bool)

(assert (=> b!1439313 m!1328401))

(check-sat (not b!1439315) (not start!124410) (not b!1439319) (not b!1439314) (not b!1439322) (not b!1439313) (not b!1439320) (not b!1439312) (not b!1439316))
(check-sat)
