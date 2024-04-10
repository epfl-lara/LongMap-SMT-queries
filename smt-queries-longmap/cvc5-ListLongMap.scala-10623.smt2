; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124876 () Bool)

(assert start!124876)

(declare-fun b!1450223 () Bool)

(declare-fun res!981599 () Bool)

(declare-fun e!816635 () Bool)

(assert (=> b!1450223 (=> res!981599 e!816635)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11702 0))(
  ( (MissingZero!11702 (index!49200 (_ BitVec 32))) (Found!11702 (index!49201 (_ BitVec 32))) (Intermediate!11702 (undefined!12514 Bool) (index!49202 (_ BitVec 32)) (x!130863 (_ BitVec 32))) (Undefined!11702) (MissingVacant!11702 (index!49203 (_ BitVec 32))) )
))
(declare-fun lt!636213 () SeekEntryResult!11702)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98324 0))(
  ( (array!98325 (arr!47450 (Array (_ BitVec 32) (_ BitVec 64))) (size!48000 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98324)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98324 (_ BitVec 32)) SeekEntryResult!11702)

(assert (=> b!1450223 (= res!981599 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47450 a!2862) j!93) a!2862 mask!2687) lt!636213)))))

(declare-fun b!1450224 () Bool)

(declare-fun e!816639 () Bool)

(assert (=> b!1450224 (= e!816639 (not e!816635))))

(declare-fun res!981587 () Bool)

(assert (=> b!1450224 (=> res!981587 e!816635)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450224 (= res!981587 (or (and (= (select (arr!47450 a!2862) index!646) (select (store (arr!47450 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47450 a!2862) index!646) (select (arr!47450 a!2862) j!93))) (not (= (select (arr!47450 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47450 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816638 () Bool)

(assert (=> b!1450224 e!816638))

(declare-fun res!981601 () Bool)

(assert (=> b!1450224 (=> (not res!981601) (not e!816638))))

(declare-fun lt!636210 () SeekEntryResult!11702)

(assert (=> b!1450224 (= res!981601 (and (= lt!636210 lt!636213) (or (= (select (arr!47450 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47450 a!2862) intermediateBeforeIndex!19) (select (arr!47450 a!2862) j!93)))))))

(assert (=> b!1450224 (= lt!636213 (Found!11702 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98324 (_ BitVec 32)) SeekEntryResult!11702)

(assert (=> b!1450224 (= lt!636210 (seekEntryOrOpen!0 (select (arr!47450 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98324 (_ BitVec 32)) Bool)

(assert (=> b!1450224 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48900 0))(
  ( (Unit!48901) )
))
(declare-fun lt!636206 () Unit!48900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48900)

(assert (=> b!1450224 (= lt!636206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450225 () Bool)

(declare-fun e!816641 () Bool)

(assert (=> b!1450225 (= e!816638 e!816641)))

(declare-fun res!981590 () Bool)

(assert (=> b!1450225 (=> res!981590 e!816641)))

(assert (=> b!1450225 (= res!981590 (or (and (= (select (arr!47450 a!2862) index!646) (select (store (arr!47450 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47450 a!2862) index!646) (select (arr!47450 a!2862) j!93))) (not (= (select (arr!47450 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!636207 () array!98324)

(declare-fun e!816636 () Bool)

(declare-fun lt!636211 () (_ BitVec 64))

(declare-fun b!1450226 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450226 (= e!816636 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636211 lt!636207 mask!2687) (seekEntryOrOpen!0 lt!636211 lt!636207 mask!2687)))))

(declare-fun b!1450228 () Bool)

(declare-fun res!981584 () Bool)

(declare-fun e!816642 () Bool)

(assert (=> b!1450228 (=> (not res!981584) (not e!816642))))

(assert (=> b!1450228 (= res!981584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450229 () Bool)

(assert (=> b!1450229 (= e!816635 true)))

(assert (=> b!1450229 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636211 lt!636207 mask!2687) lt!636213)))

(declare-fun lt!636212 () Unit!48900)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48900)

(assert (=> b!1450229 (= lt!636212 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450230 () Bool)

(declare-fun res!981597 () Bool)

(declare-fun e!816640 () Bool)

(assert (=> b!1450230 (=> (not res!981597) (not e!816640))))

(declare-fun lt!636208 () SeekEntryResult!11702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98324 (_ BitVec 32)) SeekEntryResult!11702)

(assert (=> b!1450230 (= res!981597 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47450 a!2862) j!93) a!2862 mask!2687) lt!636208))))

(declare-fun b!1450231 () Bool)

(declare-fun res!981595 () Bool)

(assert (=> b!1450231 (=> (not res!981595) (not e!816639))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450231 (= res!981595 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450232 () Bool)

(declare-fun res!981596 () Bool)

(assert (=> b!1450232 (=> (not res!981596) (not e!816642))))

(assert (=> b!1450232 (= res!981596 (and (= (size!48000 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48000 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48000 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450233 () Bool)

(declare-fun res!981591 () Bool)

(assert (=> b!1450233 (=> (not res!981591) (not e!816642))))

(declare-datatypes ((List!33951 0))(
  ( (Nil!33948) (Cons!33947 (h!35297 (_ BitVec 64)) (t!48645 List!33951)) )
))
(declare-fun arrayNoDuplicates!0 (array!98324 (_ BitVec 32) List!33951) Bool)

(assert (=> b!1450233 (= res!981591 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33948))))

(declare-fun b!1450234 () Bool)

(assert (=> b!1450234 (= e!816640 e!816639)))

(declare-fun res!981585 () Bool)

(assert (=> b!1450234 (=> (not res!981585) (not e!816639))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!636209 () SeekEntryResult!11702)

(assert (=> b!1450234 (= res!981585 (= lt!636209 (Intermediate!11702 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450234 (= lt!636209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636211 mask!2687) lt!636211 lt!636207 mask!2687))))

(assert (=> b!1450234 (= lt!636211 (select (store (arr!47450 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!981592 () Bool)

(assert (=> start!124876 (=> (not res!981592) (not e!816642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124876 (= res!981592 (validMask!0 mask!2687))))

(assert (=> start!124876 e!816642))

(assert (=> start!124876 true))

(declare-fun array_inv!36478 (array!98324) Bool)

(assert (=> start!124876 (array_inv!36478 a!2862)))

(declare-fun b!1450227 () Bool)

(declare-fun e!816643 () Bool)

(assert (=> b!1450227 (= e!816642 e!816643)))

(declare-fun res!981598 () Bool)

(assert (=> b!1450227 (=> (not res!981598) (not e!816643))))

(assert (=> b!1450227 (= res!981598 (= (select (store (arr!47450 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450227 (= lt!636207 (array!98325 (store (arr!47450 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48000 a!2862)))))

(declare-fun b!1450235 () Bool)

(declare-fun res!981589 () Bool)

(assert (=> b!1450235 (=> (not res!981589) (not e!816639))))

(assert (=> b!1450235 (= res!981589 e!816636)))

(declare-fun c!133830 () Bool)

(assert (=> b!1450235 (= c!133830 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450236 () Bool)

(declare-fun e!816637 () Bool)

(assert (=> b!1450236 (= e!816641 e!816637)))

(declare-fun res!981600 () Bool)

(assert (=> b!1450236 (=> (not res!981600) (not e!816637))))

(assert (=> b!1450236 (= res!981600 (= lt!636210 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47450 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450237 () Bool)

(assert (=> b!1450237 (= e!816636 (= lt!636209 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636211 lt!636207 mask!2687)))))

(declare-fun b!1450238 () Bool)

(declare-fun res!981594 () Bool)

(assert (=> b!1450238 (=> (not res!981594) (not e!816642))))

(assert (=> b!1450238 (= res!981594 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48000 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48000 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48000 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450239 () Bool)

(declare-fun res!981593 () Bool)

(assert (=> b!1450239 (=> (not res!981593) (not e!816642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450239 (= res!981593 (validKeyInArray!0 (select (arr!47450 a!2862) j!93)))))

(declare-fun b!1450240 () Bool)

(assert (=> b!1450240 (= e!816643 e!816640)))

(declare-fun res!981588 () Bool)

(assert (=> b!1450240 (=> (not res!981588) (not e!816640))))

(assert (=> b!1450240 (= res!981588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47450 a!2862) j!93) mask!2687) (select (arr!47450 a!2862) j!93) a!2862 mask!2687) lt!636208))))

(assert (=> b!1450240 (= lt!636208 (Intermediate!11702 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450241 () Bool)

(assert (=> b!1450241 (= e!816637 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450242 () Bool)

(declare-fun res!981586 () Bool)

(assert (=> b!1450242 (=> (not res!981586) (not e!816642))))

(assert (=> b!1450242 (= res!981586 (validKeyInArray!0 (select (arr!47450 a!2862) i!1006)))))

(assert (= (and start!124876 res!981592) b!1450232))

(assert (= (and b!1450232 res!981596) b!1450242))

(assert (= (and b!1450242 res!981586) b!1450239))

(assert (= (and b!1450239 res!981593) b!1450228))

(assert (= (and b!1450228 res!981584) b!1450233))

(assert (= (and b!1450233 res!981591) b!1450238))

(assert (= (and b!1450238 res!981594) b!1450227))

(assert (= (and b!1450227 res!981598) b!1450240))

(assert (= (and b!1450240 res!981588) b!1450230))

(assert (= (and b!1450230 res!981597) b!1450234))

(assert (= (and b!1450234 res!981585) b!1450235))

(assert (= (and b!1450235 c!133830) b!1450237))

(assert (= (and b!1450235 (not c!133830)) b!1450226))

(assert (= (and b!1450235 res!981589) b!1450231))

(assert (= (and b!1450231 res!981595) b!1450224))

(assert (= (and b!1450224 res!981601) b!1450225))

(assert (= (and b!1450225 (not res!981590)) b!1450236))

(assert (= (and b!1450236 res!981600) b!1450241))

(assert (= (and b!1450224 (not res!981587)) b!1450223))

(assert (= (and b!1450223 (not res!981599)) b!1450229))

(declare-fun m!1338883 () Bool)

(assert (=> b!1450239 m!1338883))

(assert (=> b!1450239 m!1338883))

(declare-fun m!1338885 () Bool)

(assert (=> b!1450239 m!1338885))

(declare-fun m!1338887 () Bool)

(assert (=> b!1450234 m!1338887))

(assert (=> b!1450234 m!1338887))

(declare-fun m!1338889 () Bool)

(assert (=> b!1450234 m!1338889))

(declare-fun m!1338891 () Bool)

(assert (=> b!1450234 m!1338891))

(declare-fun m!1338893 () Bool)

(assert (=> b!1450234 m!1338893))

(declare-fun m!1338895 () Bool)

(assert (=> b!1450224 m!1338895))

(assert (=> b!1450224 m!1338891))

(declare-fun m!1338897 () Bool)

(assert (=> b!1450224 m!1338897))

(declare-fun m!1338899 () Bool)

(assert (=> b!1450224 m!1338899))

(declare-fun m!1338901 () Bool)

(assert (=> b!1450224 m!1338901))

(assert (=> b!1450224 m!1338883))

(declare-fun m!1338903 () Bool)

(assert (=> b!1450224 m!1338903))

(declare-fun m!1338905 () Bool)

(assert (=> b!1450224 m!1338905))

(assert (=> b!1450224 m!1338883))

(declare-fun m!1338907 () Bool)

(assert (=> start!124876 m!1338907))

(declare-fun m!1338909 () Bool)

(assert (=> start!124876 m!1338909))

(assert (=> b!1450240 m!1338883))

(assert (=> b!1450240 m!1338883))

(declare-fun m!1338911 () Bool)

(assert (=> b!1450240 m!1338911))

(assert (=> b!1450240 m!1338911))

(assert (=> b!1450240 m!1338883))

(declare-fun m!1338913 () Bool)

(assert (=> b!1450240 m!1338913))

(assert (=> b!1450230 m!1338883))

(assert (=> b!1450230 m!1338883))

(declare-fun m!1338915 () Bool)

(assert (=> b!1450230 m!1338915))

(declare-fun m!1338917 () Bool)

(assert (=> b!1450242 m!1338917))

(assert (=> b!1450242 m!1338917))

(declare-fun m!1338919 () Bool)

(assert (=> b!1450242 m!1338919))

(declare-fun m!1338921 () Bool)

(assert (=> b!1450226 m!1338921))

(declare-fun m!1338923 () Bool)

(assert (=> b!1450226 m!1338923))

(assert (=> b!1450236 m!1338883))

(assert (=> b!1450236 m!1338883))

(declare-fun m!1338925 () Bool)

(assert (=> b!1450236 m!1338925))

(assert (=> b!1450229 m!1338921))

(declare-fun m!1338927 () Bool)

(assert (=> b!1450229 m!1338927))

(declare-fun m!1338929 () Bool)

(assert (=> b!1450233 m!1338929))

(assert (=> b!1450227 m!1338891))

(declare-fun m!1338931 () Bool)

(assert (=> b!1450227 m!1338931))

(declare-fun m!1338933 () Bool)

(assert (=> b!1450228 m!1338933))

(declare-fun m!1338935 () Bool)

(assert (=> b!1450237 m!1338935))

(assert (=> b!1450223 m!1338883))

(assert (=> b!1450223 m!1338883))

(declare-fun m!1338937 () Bool)

(assert (=> b!1450223 m!1338937))

(assert (=> b!1450225 m!1338901))

(assert (=> b!1450225 m!1338891))

(assert (=> b!1450225 m!1338899))

(assert (=> b!1450225 m!1338883))

(push 1)

