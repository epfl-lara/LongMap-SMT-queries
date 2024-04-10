; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125534 () Bool)

(assert start!125534)

(declare-fun b!1468723 () Bool)

(declare-fun res!997269 () Bool)

(declare-fun e!824677 () Bool)

(assert (=> b!1468723 (=> (not res!997269) (not e!824677))))

(declare-datatypes ((array!98982 0))(
  ( (array!98983 (arr!47779 (Array (_ BitVec 32) (_ BitVec 64))) (size!48329 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98982)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468723 (= res!997269 (validKeyInArray!0 (select (arr!47779 a!2862) j!93)))))

(declare-fun b!1468724 () Bool)

(declare-fun e!824678 () Bool)

(assert (=> b!1468724 (= e!824677 e!824678)))

(declare-fun res!997264 () Bool)

(assert (=> b!1468724 (=> (not res!997264) (not e!824678))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12019 0))(
  ( (MissingZero!12019 (index!50468 (_ BitVec 32))) (Found!12019 (index!50469 (_ BitVec 32))) (Intermediate!12019 (undefined!12831 Bool) (index!50470 (_ BitVec 32)) (x!132052 (_ BitVec 32))) (Undefined!12019) (MissingVacant!12019 (index!50471 (_ BitVec 32))) )
))
(declare-fun lt!642354 () SeekEntryResult!12019)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98982 (_ BitVec 32)) SeekEntryResult!12019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468724 (= res!997264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47779 a!2862) j!93) mask!2687) (select (arr!47779 a!2862) j!93) a!2862 mask!2687) lt!642354))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468724 (= lt!642354 (Intermediate!12019 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468725 () Bool)

(declare-fun res!997263 () Bool)

(assert (=> b!1468725 (=> (not res!997263) (not e!824677))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468725 (= res!997263 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48329 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48329 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48329 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468726 () Bool)

(declare-fun res!997270 () Bool)

(assert (=> b!1468726 (=> (not res!997270) (not e!824677))))

(assert (=> b!1468726 (= res!997270 (validKeyInArray!0 (select (arr!47779 a!2862) i!1006)))))

(declare-fun b!1468727 () Bool)

(assert (=> b!1468727 (= e!824678 false)))

(declare-fun lt!642353 () SeekEntryResult!12019)

(assert (=> b!1468727 (= lt!642353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98983 (store (arr!47779 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48329 a!2862)) mask!2687))))

(declare-fun b!1468728 () Bool)

(declare-fun res!997262 () Bool)

(assert (=> b!1468728 (=> (not res!997262) (not e!824677))))

(declare-datatypes ((List!34280 0))(
  ( (Nil!34277) (Cons!34276 (h!35626 (_ BitVec 64)) (t!48974 List!34280)) )
))
(declare-fun arrayNoDuplicates!0 (array!98982 (_ BitVec 32) List!34280) Bool)

(assert (=> b!1468728 (= res!997262 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34277))))

(declare-fun b!1468729 () Bool)

(declare-fun res!997267 () Bool)

(assert (=> b!1468729 (=> (not res!997267) (not e!824677))))

(assert (=> b!1468729 (= res!997267 (and (= (size!48329 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48329 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48329 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997268 () Bool)

(assert (=> start!125534 (=> (not res!997268) (not e!824677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125534 (= res!997268 (validMask!0 mask!2687))))

(assert (=> start!125534 e!824677))

(assert (=> start!125534 true))

(declare-fun array_inv!36807 (array!98982) Bool)

(assert (=> start!125534 (array_inv!36807 a!2862)))

(declare-fun b!1468730 () Bool)

(declare-fun res!997265 () Bool)

(assert (=> b!1468730 (=> (not res!997265) (not e!824678))))

(assert (=> b!1468730 (= res!997265 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47779 a!2862) j!93) a!2862 mask!2687) lt!642354))))

(declare-fun b!1468731 () Bool)

(declare-fun res!997266 () Bool)

(assert (=> b!1468731 (=> (not res!997266) (not e!824677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98982 (_ BitVec 32)) Bool)

(assert (=> b!1468731 (= res!997266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125534 res!997268) b!1468729))

(assert (= (and b!1468729 res!997267) b!1468726))

(assert (= (and b!1468726 res!997270) b!1468723))

(assert (= (and b!1468723 res!997269) b!1468731))

(assert (= (and b!1468731 res!997266) b!1468728))

(assert (= (and b!1468728 res!997262) b!1468725))

(assert (= (and b!1468725 res!997263) b!1468724))

(assert (= (and b!1468724 res!997264) b!1468730))

(assert (= (and b!1468730 res!997265) b!1468727))

(declare-fun m!1355837 () Bool)

(assert (=> b!1468727 m!1355837))

(declare-fun m!1355839 () Bool)

(assert (=> b!1468727 m!1355839))

(assert (=> b!1468727 m!1355839))

(declare-fun m!1355841 () Bool)

(assert (=> b!1468727 m!1355841))

(assert (=> b!1468727 m!1355841))

(assert (=> b!1468727 m!1355839))

(declare-fun m!1355843 () Bool)

(assert (=> b!1468727 m!1355843))

(declare-fun m!1355845 () Bool)

(assert (=> start!125534 m!1355845))

(declare-fun m!1355847 () Bool)

(assert (=> start!125534 m!1355847))

(declare-fun m!1355849 () Bool)

(assert (=> b!1468726 m!1355849))

(assert (=> b!1468726 m!1355849))

(declare-fun m!1355851 () Bool)

(assert (=> b!1468726 m!1355851))

(declare-fun m!1355853 () Bool)

(assert (=> b!1468728 m!1355853))

(declare-fun m!1355855 () Bool)

(assert (=> b!1468724 m!1355855))

(assert (=> b!1468724 m!1355855))

(declare-fun m!1355857 () Bool)

(assert (=> b!1468724 m!1355857))

(assert (=> b!1468724 m!1355857))

(assert (=> b!1468724 m!1355855))

(declare-fun m!1355859 () Bool)

(assert (=> b!1468724 m!1355859))

(assert (=> b!1468723 m!1355855))

(assert (=> b!1468723 m!1355855))

(declare-fun m!1355861 () Bool)

(assert (=> b!1468723 m!1355861))

(assert (=> b!1468730 m!1355855))

(assert (=> b!1468730 m!1355855))

(declare-fun m!1355863 () Bool)

(assert (=> b!1468730 m!1355863))

(declare-fun m!1355865 () Bool)

(assert (=> b!1468731 m!1355865))

(assert (=> b!1468725 m!1355837))

(declare-fun m!1355867 () Bool)

(assert (=> b!1468725 m!1355867))

(push 1)

(assert (not b!1468724))

(assert (not b!1468728))

(assert (not start!125534))

(assert (not b!1468730))

(assert (not b!1468727))

(assert (not b!1468731))

(assert (not b!1468723))

(assert (not b!1468726))

