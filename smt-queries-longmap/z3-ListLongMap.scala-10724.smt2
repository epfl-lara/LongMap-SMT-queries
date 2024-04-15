; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125452 () Bool)

(assert start!125452)

(declare-fun b!1467826 () Bool)

(declare-fun e!824327 () Bool)

(assert (=> b!1467826 (= e!824327 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11993 0))(
  ( (MissingZero!11993 (index!50364 (_ BitVec 32))) (Found!11993 (index!50365 (_ BitVec 32))) (Intermediate!11993 (undefined!12805 Bool) (index!50366 (_ BitVec 32)) (x!131957 (_ BitVec 32))) (Undefined!11993) (MissingVacant!11993 (index!50367 (_ BitVec 32))) )
))
(declare-fun lt!641964 () SeekEntryResult!11993)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98878 0))(
  ( (array!98879 (arr!47728 (Array (_ BitVec 32) (_ BitVec 64))) (size!48280 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98878)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98878 (_ BitVec 32)) SeekEntryResult!11993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467826 (= lt!641964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98879 (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48280 a!2862)) mask!2687))))

(declare-fun b!1467827 () Bool)

(declare-fun res!996483 () Bool)

(declare-fun e!824328 () Bool)

(assert (=> b!1467827 (=> (not res!996483) (not e!824328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98878 (_ BitVec 32)) Bool)

(assert (=> b!1467827 (= res!996483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467828 () Bool)

(declare-fun res!996485 () Bool)

(assert (=> b!1467828 (=> (not res!996485) (not e!824328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467828 (= res!996485 (validKeyInArray!0 (select (arr!47728 a!2862) j!93)))))

(declare-fun b!1467829 () Bool)

(declare-fun res!996484 () Bool)

(assert (=> b!1467829 (=> (not res!996484) (not e!824327))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641963 () SeekEntryResult!11993)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1467829 (= res!996484 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47728 a!2862) j!93) a!2862 mask!2687) lt!641963))))

(declare-fun b!1467830 () Bool)

(assert (=> b!1467830 (= e!824328 e!824327)))

(declare-fun res!996488 () Bool)

(assert (=> b!1467830 (=> (not res!996488) (not e!824327))))

(assert (=> b!1467830 (= res!996488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47728 a!2862) j!93) mask!2687) (select (arr!47728 a!2862) j!93) a!2862 mask!2687) lt!641963))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467830 (= lt!641963 (Intermediate!11993 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467831 () Bool)

(declare-fun res!996489 () Bool)

(assert (=> b!1467831 (=> (not res!996489) (not e!824328))))

(declare-datatypes ((List!34307 0))(
  ( (Nil!34304) (Cons!34303 (h!35653 (_ BitVec 64)) (t!48993 List!34307)) )
))
(declare-fun arrayNoDuplicates!0 (array!98878 (_ BitVec 32) List!34307) Bool)

(assert (=> b!1467831 (= res!996489 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34304))))

(declare-fun b!1467832 () Bool)

(declare-fun res!996490 () Bool)

(assert (=> b!1467832 (=> (not res!996490) (not e!824328))))

(assert (=> b!1467832 (= res!996490 (validKeyInArray!0 (select (arr!47728 a!2862) i!1006)))))

(declare-fun res!996487 () Bool)

(assert (=> start!125452 (=> (not res!996487) (not e!824328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125452 (= res!996487 (validMask!0 mask!2687))))

(assert (=> start!125452 e!824328))

(assert (=> start!125452 true))

(declare-fun array_inv!36961 (array!98878) Bool)

(assert (=> start!125452 (array_inv!36961 a!2862)))

(declare-fun b!1467833 () Bool)

(declare-fun res!996482 () Bool)

(assert (=> b!1467833 (=> (not res!996482) (not e!824328))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467833 (= res!996482 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48280 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48280 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48280 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467834 () Bool)

(declare-fun res!996486 () Bool)

(assert (=> b!1467834 (=> (not res!996486) (not e!824328))))

(assert (=> b!1467834 (= res!996486 (and (= (size!48280 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48280 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48280 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125452 res!996487) b!1467834))

(assert (= (and b!1467834 res!996486) b!1467832))

(assert (= (and b!1467832 res!996490) b!1467828))

(assert (= (and b!1467828 res!996485) b!1467827))

(assert (= (and b!1467827 res!996483) b!1467831))

(assert (= (and b!1467831 res!996489) b!1467833))

(assert (= (and b!1467833 res!996482) b!1467830))

(assert (= (and b!1467830 res!996488) b!1467829))

(assert (= (and b!1467829 res!996484) b!1467826))

(declare-fun m!1354329 () Bool)

(assert (=> b!1467830 m!1354329))

(assert (=> b!1467830 m!1354329))

(declare-fun m!1354331 () Bool)

(assert (=> b!1467830 m!1354331))

(assert (=> b!1467830 m!1354331))

(assert (=> b!1467830 m!1354329))

(declare-fun m!1354333 () Bool)

(assert (=> b!1467830 m!1354333))

(declare-fun m!1354335 () Bool)

(assert (=> start!125452 m!1354335))

(declare-fun m!1354337 () Bool)

(assert (=> start!125452 m!1354337))

(assert (=> b!1467828 m!1354329))

(assert (=> b!1467828 m!1354329))

(declare-fun m!1354339 () Bool)

(assert (=> b!1467828 m!1354339))

(declare-fun m!1354341 () Bool)

(assert (=> b!1467827 m!1354341))

(assert (=> b!1467829 m!1354329))

(assert (=> b!1467829 m!1354329))

(declare-fun m!1354343 () Bool)

(assert (=> b!1467829 m!1354343))

(declare-fun m!1354345 () Bool)

(assert (=> b!1467832 m!1354345))

(assert (=> b!1467832 m!1354345))

(declare-fun m!1354347 () Bool)

(assert (=> b!1467832 m!1354347))

(declare-fun m!1354349 () Bool)

(assert (=> b!1467833 m!1354349))

(declare-fun m!1354351 () Bool)

(assert (=> b!1467833 m!1354351))

(assert (=> b!1467826 m!1354349))

(declare-fun m!1354353 () Bool)

(assert (=> b!1467826 m!1354353))

(assert (=> b!1467826 m!1354353))

(declare-fun m!1354355 () Bool)

(assert (=> b!1467826 m!1354355))

(assert (=> b!1467826 m!1354355))

(assert (=> b!1467826 m!1354353))

(declare-fun m!1354357 () Bool)

(assert (=> b!1467826 m!1354357))

(declare-fun m!1354359 () Bool)

(assert (=> b!1467831 m!1354359))

(check-sat (not b!1467826) (not b!1467831) (not b!1467827) (not b!1467830) (not b!1467829) (not b!1467828) (not start!125452) (not b!1467832))
(check-sat)
