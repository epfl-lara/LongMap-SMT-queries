; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125488 () Bool)

(assert start!125488)

(declare-fun b!1468312 () Bool)

(declare-fun e!824489 () Bool)

(declare-fun e!824488 () Bool)

(assert (=> b!1468312 (= e!824489 e!824488)))

(declare-fun res!996968 () Bool)

(assert (=> b!1468312 (=> (not res!996968) (not e!824488))))

(declare-datatypes ((SeekEntryResult!12011 0))(
  ( (MissingZero!12011 (index!50436 (_ BitVec 32))) (Found!12011 (index!50437 (_ BitVec 32))) (Intermediate!12011 (undefined!12823 Bool) (index!50438 (_ BitVec 32)) (x!132023 (_ BitVec 32))) (Undefined!12011) (MissingVacant!12011 (index!50439 (_ BitVec 32))) )
))
(declare-fun lt!642071 () SeekEntryResult!12011)

(declare-datatypes ((array!98914 0))(
  ( (array!98915 (arr!47746 (Array (_ BitVec 32) (_ BitVec 64))) (size!48298 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98914)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98914 (_ BitVec 32)) SeekEntryResult!12011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468312 (= res!996968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47746 a!2862) j!93) mask!2687) (select (arr!47746 a!2862) j!93) a!2862 mask!2687) lt!642071))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468312 (= lt!642071 (Intermediate!12011 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468313 () Bool)

(declare-fun res!996972 () Bool)

(assert (=> b!1468313 (=> (not res!996972) (not e!824489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468313 (= res!996972 (validKeyInArray!0 (select (arr!47746 a!2862) j!93)))))

(declare-fun b!1468314 () Bool)

(assert (=> b!1468314 (= e!824488 false)))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lt!642072 () SeekEntryResult!12011)

(assert (=> b!1468314 (= lt!642072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98915 (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48298 a!2862)) mask!2687))))

(declare-fun b!1468315 () Bool)

(declare-fun res!996971 () Bool)

(assert (=> b!1468315 (=> (not res!996971) (not e!824489))))

(assert (=> b!1468315 (= res!996971 (and (= (size!48298 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48298 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48298 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468316 () Bool)

(declare-fun res!996974 () Bool)

(assert (=> b!1468316 (=> (not res!996974) (not e!824489))))

(assert (=> b!1468316 (= res!996974 (validKeyInArray!0 (select (arr!47746 a!2862) i!1006)))))

(declare-fun b!1468317 () Bool)

(declare-fun res!996973 () Bool)

(assert (=> b!1468317 (=> (not res!996973) (not e!824488))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468317 (= res!996973 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47746 a!2862) j!93) a!2862 mask!2687) lt!642071))))

(declare-fun res!996970 () Bool)

(assert (=> start!125488 (=> (not res!996970) (not e!824489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125488 (= res!996970 (validMask!0 mask!2687))))

(assert (=> start!125488 e!824489))

(assert (=> start!125488 true))

(declare-fun array_inv!36979 (array!98914) Bool)

(assert (=> start!125488 (array_inv!36979 a!2862)))

(declare-fun b!1468318 () Bool)

(declare-fun res!996976 () Bool)

(assert (=> b!1468318 (=> (not res!996976) (not e!824489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98914 (_ BitVec 32)) Bool)

(assert (=> b!1468318 (= res!996976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468319 () Bool)

(declare-fun res!996975 () Bool)

(assert (=> b!1468319 (=> (not res!996975) (not e!824489))))

(declare-datatypes ((List!34325 0))(
  ( (Nil!34322) (Cons!34321 (h!35671 (_ BitVec 64)) (t!49011 List!34325)) )
))
(declare-fun arrayNoDuplicates!0 (array!98914 (_ BitVec 32) List!34325) Bool)

(assert (=> b!1468319 (= res!996975 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34322))))

(declare-fun b!1468320 () Bool)

(declare-fun res!996969 () Bool)

(assert (=> b!1468320 (=> (not res!996969) (not e!824489))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468320 (= res!996969 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48298 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48298 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48298 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125488 res!996970) b!1468315))

(assert (= (and b!1468315 res!996971) b!1468316))

(assert (= (and b!1468316 res!996974) b!1468313))

(assert (= (and b!1468313 res!996972) b!1468318))

(assert (= (and b!1468318 res!996976) b!1468319))

(assert (= (and b!1468319 res!996975) b!1468320))

(assert (= (and b!1468320 res!996969) b!1468312))

(assert (= (and b!1468312 res!996968) b!1468317))

(assert (= (and b!1468317 res!996973) b!1468314))

(declare-fun m!1354905 () Bool)

(assert (=> b!1468312 m!1354905))

(assert (=> b!1468312 m!1354905))

(declare-fun m!1354907 () Bool)

(assert (=> b!1468312 m!1354907))

(assert (=> b!1468312 m!1354907))

(assert (=> b!1468312 m!1354905))

(declare-fun m!1354909 () Bool)

(assert (=> b!1468312 m!1354909))

(declare-fun m!1354911 () Bool)

(assert (=> b!1468316 m!1354911))

(assert (=> b!1468316 m!1354911))

(declare-fun m!1354913 () Bool)

(assert (=> b!1468316 m!1354913))

(assert (=> b!1468313 m!1354905))

(assert (=> b!1468313 m!1354905))

(declare-fun m!1354915 () Bool)

(assert (=> b!1468313 m!1354915))

(declare-fun m!1354917 () Bool)

(assert (=> start!125488 m!1354917))

(declare-fun m!1354919 () Bool)

(assert (=> start!125488 m!1354919))

(declare-fun m!1354921 () Bool)

(assert (=> b!1468319 m!1354921))

(declare-fun m!1354923 () Bool)

(assert (=> b!1468320 m!1354923))

(declare-fun m!1354925 () Bool)

(assert (=> b!1468320 m!1354925))

(assert (=> b!1468317 m!1354905))

(assert (=> b!1468317 m!1354905))

(declare-fun m!1354927 () Bool)

(assert (=> b!1468317 m!1354927))

(declare-fun m!1354929 () Bool)

(assert (=> b!1468318 m!1354929))

(assert (=> b!1468314 m!1354923))

(declare-fun m!1354931 () Bool)

(assert (=> b!1468314 m!1354931))

(assert (=> b!1468314 m!1354931))

(declare-fun m!1354933 () Bool)

(assert (=> b!1468314 m!1354933))

(assert (=> b!1468314 m!1354933))

(assert (=> b!1468314 m!1354931))

(declare-fun m!1354935 () Bool)

(assert (=> b!1468314 m!1354935))

(check-sat (not b!1468316) (not b!1468312) (not start!125488) (not b!1468318) (not b!1468319) (not b!1468314) (not b!1468313) (not b!1468317))
(check-sat)
