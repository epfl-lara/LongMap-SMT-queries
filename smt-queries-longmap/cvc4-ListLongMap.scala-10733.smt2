; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125540 () Bool)

(assert start!125540)

(declare-fun b!1468804 () Bool)

(declare-fun res!997350 () Bool)

(declare-fun e!824703 () Bool)

(assert (=> b!1468804 (=> (not res!997350) (not e!824703))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98988 0))(
  ( (array!98989 (arr!47782 (Array (_ BitVec 32) (_ BitVec 64))) (size!48332 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98988)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12022 0))(
  ( (MissingZero!12022 (index!50480 (_ BitVec 32))) (Found!12022 (index!50481 (_ BitVec 32))) (Intermediate!12022 (undefined!12834 Bool) (index!50482 (_ BitVec 32)) (x!132063 (_ BitVec 32))) (Undefined!12022) (MissingVacant!12022 (index!50483 (_ BitVec 32))) )
))
(declare-fun lt!642372 () SeekEntryResult!12022)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98988 (_ BitVec 32)) SeekEntryResult!12022)

(assert (=> b!1468804 (= res!997350 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47782 a!2862) j!93) a!2862 mask!2687) lt!642372))))

(declare-fun b!1468805 () Bool)

(declare-fun res!997351 () Bool)

(declare-fun e!824704 () Bool)

(assert (=> b!1468805 (=> (not res!997351) (not e!824704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98988 (_ BitVec 32)) Bool)

(assert (=> b!1468805 (= res!997351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468806 () Bool)

(declare-fun res!997349 () Bool)

(assert (=> b!1468806 (=> (not res!997349) (not e!824704))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468806 (= res!997349 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48332 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48332 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48332 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468807 () Bool)

(declare-fun res!997348 () Bool)

(assert (=> b!1468807 (=> (not res!997348) (not e!824704))))

(declare-datatypes ((List!34283 0))(
  ( (Nil!34280) (Cons!34279 (h!35629 (_ BitVec 64)) (t!48977 List!34283)) )
))
(declare-fun arrayNoDuplicates!0 (array!98988 (_ BitVec 32) List!34283) Bool)

(assert (=> b!1468807 (= res!997348 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34280))))

(declare-fun b!1468808 () Bool)

(assert (=> b!1468808 (= e!824704 e!824703)))

(declare-fun res!997343 () Bool)

(assert (=> b!1468808 (=> (not res!997343) (not e!824703))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468808 (= res!997343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47782 a!2862) j!93) mask!2687) (select (arr!47782 a!2862) j!93) a!2862 mask!2687) lt!642372))))

(assert (=> b!1468808 (= lt!642372 (Intermediate!12022 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997344 () Bool)

(assert (=> start!125540 (=> (not res!997344) (not e!824704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125540 (= res!997344 (validMask!0 mask!2687))))

(assert (=> start!125540 e!824704))

(assert (=> start!125540 true))

(declare-fun array_inv!36810 (array!98988) Bool)

(assert (=> start!125540 (array_inv!36810 a!2862)))

(declare-fun b!1468809 () Bool)

(declare-fun res!997345 () Bool)

(assert (=> b!1468809 (=> (not res!997345) (not e!824704))))

(assert (=> b!1468809 (= res!997345 (and (= (size!48332 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48332 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48332 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468810 () Bool)

(declare-fun res!997347 () Bool)

(assert (=> b!1468810 (=> (not res!997347) (not e!824704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468810 (= res!997347 (validKeyInArray!0 (select (arr!47782 a!2862) i!1006)))))

(declare-fun b!1468811 () Bool)

(declare-fun res!997346 () Bool)

(assert (=> b!1468811 (=> (not res!997346) (not e!824704))))

(assert (=> b!1468811 (= res!997346 (validKeyInArray!0 (select (arr!47782 a!2862) j!93)))))

(declare-fun b!1468812 () Bool)

(assert (=> b!1468812 (= e!824703 false)))

(declare-fun lt!642371 () SeekEntryResult!12022)

(assert (=> b!1468812 (= lt!642371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98989 (store (arr!47782 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48332 a!2862)) mask!2687))))

(assert (= (and start!125540 res!997344) b!1468809))

(assert (= (and b!1468809 res!997345) b!1468810))

(assert (= (and b!1468810 res!997347) b!1468811))

(assert (= (and b!1468811 res!997346) b!1468805))

(assert (= (and b!1468805 res!997351) b!1468807))

(assert (= (and b!1468807 res!997348) b!1468806))

(assert (= (and b!1468806 res!997349) b!1468808))

(assert (= (and b!1468808 res!997343) b!1468804))

(assert (= (and b!1468804 res!997350) b!1468812))

(declare-fun m!1355933 () Bool)

(assert (=> b!1468807 m!1355933))

(declare-fun m!1355935 () Bool)

(assert (=> b!1468808 m!1355935))

(assert (=> b!1468808 m!1355935))

(declare-fun m!1355937 () Bool)

(assert (=> b!1468808 m!1355937))

(assert (=> b!1468808 m!1355937))

(assert (=> b!1468808 m!1355935))

(declare-fun m!1355939 () Bool)

(assert (=> b!1468808 m!1355939))

(declare-fun m!1355941 () Bool)

(assert (=> b!1468805 m!1355941))

(assert (=> b!1468811 m!1355935))

(assert (=> b!1468811 m!1355935))

(declare-fun m!1355943 () Bool)

(assert (=> b!1468811 m!1355943))

(declare-fun m!1355945 () Bool)

(assert (=> b!1468812 m!1355945))

(declare-fun m!1355947 () Bool)

(assert (=> b!1468812 m!1355947))

(assert (=> b!1468812 m!1355947))

(declare-fun m!1355949 () Bool)

(assert (=> b!1468812 m!1355949))

(assert (=> b!1468812 m!1355949))

(assert (=> b!1468812 m!1355947))

(declare-fun m!1355951 () Bool)

(assert (=> b!1468812 m!1355951))

(assert (=> b!1468804 m!1355935))

(assert (=> b!1468804 m!1355935))

(declare-fun m!1355953 () Bool)

(assert (=> b!1468804 m!1355953))

(assert (=> b!1468806 m!1355945))

(declare-fun m!1355955 () Bool)

(assert (=> b!1468806 m!1355955))

(declare-fun m!1355957 () Bool)

(assert (=> b!1468810 m!1355957))

(assert (=> b!1468810 m!1355957))

(declare-fun m!1355959 () Bool)

(assert (=> b!1468810 m!1355959))

(declare-fun m!1355961 () Bool)

(assert (=> start!125540 m!1355961))

(declare-fun m!1355963 () Bool)

(assert (=> start!125540 m!1355963))

(push 1)

(assert (not b!1468812))

(assert (not b!1468811))

(assert (not b!1468810))

(assert (not b!1468805))

(assert (not b!1468804))

(assert (not start!125540))

(assert (not b!1468807))

(assert (not b!1468808))

(check-sat)

