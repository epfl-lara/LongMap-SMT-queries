; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125512 () Bool)

(assert start!125512)

(declare-fun b!1468636 () Bool)

(declare-fun res!997292 () Bool)

(declare-fun e!824597 () Bool)

(assert (=> b!1468636 (=> (not res!997292) (not e!824597))))

(declare-datatypes ((array!98938 0))(
  ( (array!98939 (arr!47758 (Array (_ BitVec 32) (_ BitVec 64))) (size!48310 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98938)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468636 (= res!997292 (validKeyInArray!0 (select (arr!47758 a!2862) j!93)))))

(declare-fun b!1468637 () Bool)

(declare-fun res!997295 () Bool)

(declare-fun e!824596 () Bool)

(assert (=> b!1468637 (=> (not res!997295) (not e!824596))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12023 0))(
  ( (MissingZero!12023 (index!50484 (_ BitVec 32))) (Found!12023 (index!50485 (_ BitVec 32))) (Intermediate!12023 (undefined!12835 Bool) (index!50486 (_ BitVec 32)) (x!132067 (_ BitVec 32))) (Undefined!12023) (MissingVacant!12023 (index!50487 (_ BitVec 32))) )
))
(declare-fun lt!642144 () SeekEntryResult!12023)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98938 (_ BitVec 32)) SeekEntryResult!12023)

(assert (=> b!1468637 (= res!997295 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642144))))

(declare-fun b!1468638 () Bool)

(declare-fun res!997300 () Bool)

(assert (=> b!1468638 (=> (not res!997300) (not e!824597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98938 (_ BitVec 32)) Bool)

(assert (=> b!1468638 (= res!997300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468639 () Bool)

(declare-fun res!997298 () Bool)

(assert (=> b!1468639 (=> (not res!997298) (not e!824597))))

(declare-datatypes ((List!34337 0))(
  ( (Nil!34334) (Cons!34333 (h!35683 (_ BitVec 64)) (t!49023 List!34337)) )
))
(declare-fun arrayNoDuplicates!0 (array!98938 (_ BitVec 32) List!34337) Bool)

(assert (=> b!1468639 (= res!997298 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34334))))

(declare-fun b!1468641 () Bool)

(assert (=> b!1468641 (= e!824597 e!824596)))

(declare-fun res!997294 () Bool)

(assert (=> b!1468641 (=> (not res!997294) (not e!824596))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468641 (= res!997294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47758 a!2862) j!93) mask!2687) (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642144))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468641 (= lt!642144 (Intermediate!12023 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468642 () Bool)

(declare-fun res!997297 () Bool)

(assert (=> b!1468642 (=> (not res!997297) (not e!824597))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468642 (= res!997297 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48310 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48310 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48310 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468643 () Bool)

(assert (=> b!1468643 (= e!824596 false)))

(declare-fun lt!642143 () SeekEntryResult!12023)

(assert (=> b!1468643 (= lt!642143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98939 (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48310 a!2862)) mask!2687))))

(declare-fun b!1468644 () Bool)

(declare-fun res!997299 () Bool)

(assert (=> b!1468644 (=> (not res!997299) (not e!824597))))

(assert (=> b!1468644 (= res!997299 (validKeyInArray!0 (select (arr!47758 a!2862) i!1006)))))

(declare-fun res!997296 () Bool)

(assert (=> start!125512 (=> (not res!997296) (not e!824597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125512 (= res!997296 (validMask!0 mask!2687))))

(assert (=> start!125512 e!824597))

(assert (=> start!125512 true))

(declare-fun array_inv!36991 (array!98938) Bool)

(assert (=> start!125512 (array_inv!36991 a!2862)))

(declare-fun b!1468640 () Bool)

(declare-fun res!997293 () Bool)

(assert (=> b!1468640 (=> (not res!997293) (not e!824597))))

(assert (=> b!1468640 (= res!997293 (and (= (size!48310 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48310 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48310 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125512 res!997296) b!1468640))

(assert (= (and b!1468640 res!997293) b!1468644))

(assert (= (and b!1468644 res!997299) b!1468636))

(assert (= (and b!1468636 res!997292) b!1468638))

(assert (= (and b!1468638 res!997300) b!1468639))

(assert (= (and b!1468639 res!997298) b!1468642))

(assert (= (and b!1468642 res!997297) b!1468641))

(assert (= (and b!1468641 res!997294) b!1468637))

(assert (= (and b!1468637 res!997295) b!1468643))

(declare-fun m!1355289 () Bool)

(assert (=> b!1468637 m!1355289))

(assert (=> b!1468637 m!1355289))

(declare-fun m!1355291 () Bool)

(assert (=> b!1468637 m!1355291))

(assert (=> b!1468636 m!1355289))

(assert (=> b!1468636 m!1355289))

(declare-fun m!1355293 () Bool)

(assert (=> b!1468636 m!1355293))

(assert (=> b!1468641 m!1355289))

(assert (=> b!1468641 m!1355289))

(declare-fun m!1355295 () Bool)

(assert (=> b!1468641 m!1355295))

(assert (=> b!1468641 m!1355295))

(assert (=> b!1468641 m!1355289))

(declare-fun m!1355297 () Bool)

(assert (=> b!1468641 m!1355297))

(declare-fun m!1355299 () Bool)

(assert (=> b!1468644 m!1355299))

(assert (=> b!1468644 m!1355299))

(declare-fun m!1355301 () Bool)

(assert (=> b!1468644 m!1355301))

(declare-fun m!1355303 () Bool)

(assert (=> b!1468639 m!1355303))

(declare-fun m!1355305 () Bool)

(assert (=> b!1468638 m!1355305))

(declare-fun m!1355307 () Bool)

(assert (=> b!1468643 m!1355307))

(declare-fun m!1355309 () Bool)

(assert (=> b!1468643 m!1355309))

(assert (=> b!1468643 m!1355309))

(declare-fun m!1355311 () Bool)

(assert (=> b!1468643 m!1355311))

(assert (=> b!1468643 m!1355311))

(assert (=> b!1468643 m!1355309))

(declare-fun m!1355313 () Bool)

(assert (=> b!1468643 m!1355313))

(declare-fun m!1355315 () Bool)

(assert (=> start!125512 m!1355315))

(declare-fun m!1355317 () Bool)

(assert (=> start!125512 m!1355317))

(assert (=> b!1468642 m!1355307))

(declare-fun m!1355319 () Bool)

(assert (=> b!1468642 m!1355319))

(check-sat (not b!1468643) (not b!1468641) (not b!1468636) (not b!1468639) (not b!1468644) (not start!125512) (not b!1468637) (not b!1468638))
(check-sat)
