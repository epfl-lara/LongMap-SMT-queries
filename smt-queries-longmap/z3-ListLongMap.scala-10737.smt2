; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125530 () Bool)

(assert start!125530)

(declare-fun res!997538 () Bool)

(declare-fun e!824679 () Bool)

(assert (=> start!125530 (=> (not res!997538) (not e!824679))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125530 (= res!997538 (validMask!0 mask!2687))))

(assert (=> start!125530 e!824679))

(assert (=> start!125530 true))

(declare-datatypes ((array!98956 0))(
  ( (array!98957 (arr!47767 (Array (_ BitVec 32) (_ BitVec 64))) (size!48319 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98956)

(declare-fun array_inv!37000 (array!98956) Bool)

(assert (=> start!125530 (array_inv!37000 a!2862)))

(declare-fun b!1468879 () Bool)

(declare-fun res!997541 () Bool)

(assert (=> b!1468879 (=> (not res!997541) (not e!824679))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468879 (= res!997541 (validKeyInArray!0 (select (arr!47767 a!2862) j!93)))))

(declare-fun b!1468880 () Bool)

(declare-fun res!997535 () Bool)

(assert (=> b!1468880 (=> (not res!997535) (not e!824679))))

(declare-datatypes ((List!34346 0))(
  ( (Nil!34343) (Cons!34342 (h!35692 (_ BitVec 64)) (t!49032 List!34346)) )
))
(declare-fun arrayNoDuplicates!0 (array!98956 (_ BitVec 32) List!34346) Bool)

(assert (=> b!1468880 (= res!997535 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34343))))

(declare-fun b!1468881 () Bool)

(declare-fun res!997540 () Bool)

(assert (=> b!1468881 (=> (not res!997540) (not e!824679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98956 (_ BitVec 32)) Bool)

(assert (=> b!1468881 (= res!997540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468882 () Bool)

(declare-fun e!824678 () Bool)

(assert (=> b!1468882 (= e!824678 false)))

(declare-datatypes ((SeekEntryResult!12032 0))(
  ( (MissingZero!12032 (index!50520 (_ BitVec 32))) (Found!12032 (index!50521 (_ BitVec 32))) (Intermediate!12032 (undefined!12844 Bool) (index!50522 (_ BitVec 32)) (x!132100 (_ BitVec 32))) (Undefined!12032) (MissingVacant!12032 (index!50523 (_ BitVec 32))) )
))
(declare-fun lt!642197 () SeekEntryResult!12032)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98956 (_ BitVec 32)) SeekEntryResult!12032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468882 (= lt!642197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98957 (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48319 a!2862)) mask!2687))))

(declare-fun b!1468883 () Bool)

(declare-fun res!997539 () Bool)

(assert (=> b!1468883 (=> (not res!997539) (not e!824679))))

(assert (=> b!1468883 (= res!997539 (validKeyInArray!0 (select (arr!47767 a!2862) i!1006)))))

(declare-fun b!1468884 () Bool)

(declare-fun res!997542 () Bool)

(assert (=> b!1468884 (=> (not res!997542) (not e!824679))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468884 (= res!997542 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48319 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48319 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48319 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468885 () Bool)

(declare-fun res!997536 () Bool)

(assert (=> b!1468885 (=> (not res!997536) (not e!824679))))

(assert (=> b!1468885 (= res!997536 (and (= (size!48319 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48319 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48319 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468886 () Bool)

(assert (=> b!1468886 (= e!824679 e!824678)))

(declare-fun res!997543 () Bool)

(assert (=> b!1468886 (=> (not res!997543) (not e!824678))))

(declare-fun lt!642198 () SeekEntryResult!12032)

(assert (=> b!1468886 (= res!997543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47767 a!2862) j!93) mask!2687) (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642198))))

(assert (=> b!1468886 (= lt!642198 (Intermediate!12032 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468887 () Bool)

(declare-fun res!997537 () Bool)

(assert (=> b!1468887 (=> (not res!997537) (not e!824678))))

(assert (=> b!1468887 (= res!997537 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642198))))

(assert (= (and start!125530 res!997538) b!1468885))

(assert (= (and b!1468885 res!997536) b!1468883))

(assert (= (and b!1468883 res!997539) b!1468879))

(assert (= (and b!1468879 res!997541) b!1468881))

(assert (= (and b!1468881 res!997540) b!1468880))

(assert (= (and b!1468880 res!997535) b!1468884))

(assert (= (and b!1468884 res!997542) b!1468886))

(assert (= (and b!1468886 res!997543) b!1468887))

(assert (= (and b!1468887 res!997537) b!1468882))

(declare-fun m!1355577 () Bool)

(assert (=> b!1468879 m!1355577))

(assert (=> b!1468879 m!1355577))

(declare-fun m!1355579 () Bool)

(assert (=> b!1468879 m!1355579))

(declare-fun m!1355581 () Bool)

(assert (=> b!1468880 m!1355581))

(assert (=> b!1468886 m!1355577))

(assert (=> b!1468886 m!1355577))

(declare-fun m!1355583 () Bool)

(assert (=> b!1468886 m!1355583))

(assert (=> b!1468886 m!1355583))

(assert (=> b!1468886 m!1355577))

(declare-fun m!1355585 () Bool)

(assert (=> b!1468886 m!1355585))

(declare-fun m!1355587 () Bool)

(assert (=> b!1468882 m!1355587))

(declare-fun m!1355589 () Bool)

(assert (=> b!1468882 m!1355589))

(assert (=> b!1468882 m!1355589))

(declare-fun m!1355591 () Bool)

(assert (=> b!1468882 m!1355591))

(assert (=> b!1468882 m!1355591))

(assert (=> b!1468882 m!1355589))

(declare-fun m!1355593 () Bool)

(assert (=> b!1468882 m!1355593))

(declare-fun m!1355595 () Bool)

(assert (=> b!1468881 m!1355595))

(declare-fun m!1355597 () Bool)

(assert (=> start!125530 m!1355597))

(declare-fun m!1355599 () Bool)

(assert (=> start!125530 m!1355599))

(assert (=> b!1468884 m!1355587))

(declare-fun m!1355601 () Bool)

(assert (=> b!1468884 m!1355601))

(declare-fun m!1355603 () Bool)

(assert (=> b!1468883 m!1355603))

(assert (=> b!1468883 m!1355603))

(declare-fun m!1355605 () Bool)

(assert (=> b!1468883 m!1355605))

(assert (=> b!1468887 m!1355577))

(assert (=> b!1468887 m!1355577))

(declare-fun m!1355607 () Bool)

(assert (=> b!1468887 m!1355607))

(check-sat (not b!1468880) (not b!1468881) (not b!1468883) (not b!1468879) (not b!1468887) (not start!125530) (not b!1468886) (not b!1468882))
(check-sat)
