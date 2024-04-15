; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125380 () Bool)

(assert start!125380)

(declare-fun b!1466808 () Bool)

(declare-fun res!995542 () Bool)

(declare-fun e!823970 () Bool)

(assert (=> b!1466808 (=> (not res!995542) (not e!823970))))

(declare-datatypes ((array!98806 0))(
  ( (array!98807 (arr!47692 (Array (_ BitVec 32) (_ BitVec 64))) (size!48244 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98806)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466808 (= res!995542 (validKeyInArray!0 (select (arr!47692 a!2862) i!1006)))))

(declare-fun lt!641726 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641724 () array!98806)

(declare-fun e!823972 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1466809 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11969 0))(
  ( (MissingZero!11969 (index!50268 (_ BitVec 32))) (Found!11969 (index!50269 (_ BitVec 32))) (Intermediate!11969 (undefined!12781 Bool) (index!50270 (_ BitVec 32)) (x!131837 (_ BitVec 32))) (Undefined!11969) (MissingVacant!11969 (index!50271 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11969)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11969)

(assert (=> b!1466809 (= e!823972 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641726 lt!641724 mask!2687) (seekEntryOrOpen!0 lt!641726 lt!641724 mask!2687)))))

(declare-fun b!1466810 () Bool)

(declare-fun res!995534 () Bool)

(assert (=> b!1466810 (=> (not res!995534) (not e!823970))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1466810 (= res!995534 (validKeyInArray!0 (select (arr!47692 a!2862) j!93)))))

(declare-fun b!1466811 () Bool)

(declare-fun res!995532 () Bool)

(declare-fun e!823977 () Bool)

(assert (=> b!1466811 (=> (not res!995532) (not e!823977))))

(declare-fun lt!641727 () SeekEntryResult!11969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98806 (_ BitVec 32)) SeekEntryResult!11969)

(assert (=> b!1466811 (= res!995532 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641727))))

(declare-fun b!1466812 () Bool)

(declare-fun res!995539 () Bool)

(assert (=> b!1466812 (=> (not res!995539) (not e!823970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98806 (_ BitVec 32)) Bool)

(assert (=> b!1466812 (= res!995539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466813 () Bool)

(declare-fun res!995537 () Bool)

(assert (=> b!1466813 (=> (not res!995537) (not e!823970))))

(assert (=> b!1466813 (= res!995537 (and (= (size!48244 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48244 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48244 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!995545 () Bool)

(assert (=> start!125380 (=> (not res!995545) (not e!823970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125380 (= res!995545 (validMask!0 mask!2687))))

(assert (=> start!125380 e!823970))

(assert (=> start!125380 true))

(declare-fun array_inv!36925 (array!98806) Bool)

(assert (=> start!125380 (array_inv!36925 a!2862)))

(declare-fun b!1466814 () Bool)

(declare-fun res!995540 () Bool)

(assert (=> b!1466814 (=> (not res!995540) (not e!823970))))

(declare-datatypes ((List!34271 0))(
  ( (Nil!34268) (Cons!34267 (h!35617 (_ BitVec 64)) (t!48957 List!34271)) )
))
(declare-fun arrayNoDuplicates!0 (array!98806 (_ BitVec 32) List!34271) Bool)

(assert (=> b!1466814 (= res!995540 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34268))))

(declare-fun b!1466815 () Bool)

(declare-fun e!823975 () Bool)

(declare-fun e!823973 () Bool)

(assert (=> b!1466815 (= e!823975 (not e!823973))))

(declare-fun res!995528 () Bool)

(assert (=> b!1466815 (=> res!995528 e!823973)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466815 (= res!995528 (or (and (= (select (arr!47692 a!2862) index!646) (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47692 a!2862) index!646) (select (arr!47692 a!2862) j!93))) (= (select (arr!47692 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641730 () SeekEntryResult!11969)

(assert (=> b!1466815 (and (= lt!641730 (Found!11969 j!93)) (or (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47692 a!2862) intermediateBeforeIndex!19) (select (arr!47692 a!2862) j!93))))))

(assert (=> b!1466815 (= lt!641730 (seekEntryOrOpen!0 (select (arr!47692 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466815 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49275 0))(
  ( (Unit!49276) )
))
(declare-fun lt!641729 () Unit!49275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49275)

(assert (=> b!1466815 (= lt!641729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466816 () Bool)

(declare-fun e!823976 () Bool)

(assert (=> b!1466816 (= e!823976 true)))

(assert (=> b!1466816 (= lt!641730 (seekEntryOrOpen!0 lt!641726 lt!641724 mask!2687))))

(declare-fun lt!641728 () Unit!49275)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lt!641725 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49275)

(assert (=> b!1466816 (= lt!641728 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641725 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466817 () Bool)

(declare-fun e!823971 () Bool)

(assert (=> b!1466817 (= e!823971 e!823977)))

(declare-fun res!995531 () Bool)

(assert (=> b!1466817 (=> (not res!995531) (not e!823977))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466817 (= res!995531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47692 a!2862) j!93) mask!2687) (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641727))))

(assert (=> b!1466817 (= lt!641727 (Intermediate!11969 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466818 () Bool)

(declare-fun e!823974 () Bool)

(assert (=> b!1466818 (= e!823974 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641725 intermediateAfterIndex!19 lt!641726 lt!641724 mask!2687) (seekEntryOrOpen!0 lt!641726 lt!641724 mask!2687))))))

(declare-fun b!1466819 () Bool)

(declare-fun res!995538 () Bool)

(assert (=> b!1466819 (=> (not res!995538) (not e!823970))))

(assert (=> b!1466819 (= res!995538 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48244 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48244 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48244 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466820 () Bool)

(declare-fun res!995543 () Bool)

(assert (=> b!1466820 (=> res!995543 e!823976)))

(assert (=> b!1466820 (= res!995543 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641725 (select (arr!47692 a!2862) j!93) a!2862 mask!2687) lt!641727)))))

(declare-fun b!1466821 () Bool)

(assert (=> b!1466821 (= e!823970 e!823971)))

(declare-fun res!995533 () Bool)

(assert (=> b!1466821 (=> (not res!995533) (not e!823971))))

(assert (=> b!1466821 (= res!995533 (= (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466821 (= lt!641724 (array!98807 (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48244 a!2862)))))

(declare-fun b!1466822 () Bool)

(declare-fun res!995529 () Bool)

(assert (=> b!1466822 (=> res!995529 e!823976)))

(assert (=> b!1466822 (= res!995529 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466823 () Bool)

(declare-fun res!995544 () Bool)

(assert (=> b!1466823 (=> (not res!995544) (not e!823975))))

(assert (=> b!1466823 (= res!995544 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466824 () Bool)

(declare-fun lt!641723 () SeekEntryResult!11969)

(assert (=> b!1466824 (= e!823974 (not (= lt!641723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641725 lt!641726 lt!641724 mask!2687))))))

(declare-fun b!1466825 () Bool)

(declare-fun res!995530 () Bool)

(assert (=> b!1466825 (=> res!995530 e!823976)))

(assert (=> b!1466825 (= res!995530 e!823974)))

(declare-fun c!135153 () Bool)

(assert (=> b!1466825 (= c!135153 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466826 () Bool)

(declare-fun res!995536 () Bool)

(assert (=> b!1466826 (=> (not res!995536) (not e!823975))))

(assert (=> b!1466826 (= res!995536 e!823972)))

(declare-fun c!135154 () Bool)

(assert (=> b!1466826 (= c!135154 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466827 () Bool)

(assert (=> b!1466827 (= e!823973 e!823976)))

(declare-fun res!995535 () Bool)

(assert (=> b!1466827 (=> res!995535 e!823976)))

(assert (=> b!1466827 (= res!995535 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641725 #b00000000000000000000000000000000) (bvsge lt!641725 (size!48244 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466827 (= lt!641725 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466828 () Bool)

(assert (=> b!1466828 (= e!823972 (= lt!641723 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641726 lt!641724 mask!2687)))))

(declare-fun b!1466829 () Bool)

(assert (=> b!1466829 (= e!823977 e!823975)))

(declare-fun res!995541 () Bool)

(assert (=> b!1466829 (=> (not res!995541) (not e!823975))))

(assert (=> b!1466829 (= res!995541 (= lt!641723 (Intermediate!11969 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466829 (= lt!641723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641726 mask!2687) lt!641726 lt!641724 mask!2687))))

(assert (=> b!1466829 (= lt!641726 (select (store (arr!47692 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125380 res!995545) b!1466813))

(assert (= (and b!1466813 res!995537) b!1466808))

(assert (= (and b!1466808 res!995542) b!1466810))

(assert (= (and b!1466810 res!995534) b!1466812))

(assert (= (and b!1466812 res!995539) b!1466814))

(assert (= (and b!1466814 res!995540) b!1466819))

(assert (= (and b!1466819 res!995538) b!1466821))

(assert (= (and b!1466821 res!995533) b!1466817))

(assert (= (and b!1466817 res!995531) b!1466811))

(assert (= (and b!1466811 res!995532) b!1466829))

(assert (= (and b!1466829 res!995541) b!1466826))

(assert (= (and b!1466826 c!135154) b!1466828))

(assert (= (and b!1466826 (not c!135154)) b!1466809))

(assert (= (and b!1466826 res!995536) b!1466823))

(assert (= (and b!1466823 res!995544) b!1466815))

(assert (= (and b!1466815 (not res!995528)) b!1466827))

(assert (= (and b!1466827 (not res!995535)) b!1466820))

(assert (= (and b!1466820 (not res!995543)) b!1466825))

(assert (= (and b!1466825 c!135153) b!1466824))

(assert (= (and b!1466825 (not c!135153)) b!1466818))

(assert (= (and b!1466825 (not res!995530)) b!1466822))

(assert (= (and b!1466822 (not res!995529)) b!1466816))

(declare-fun m!1353267 () Bool)

(assert (=> b!1466829 m!1353267))

(assert (=> b!1466829 m!1353267))

(declare-fun m!1353269 () Bool)

(assert (=> b!1466829 m!1353269))

(declare-fun m!1353271 () Bool)

(assert (=> b!1466829 m!1353271))

(declare-fun m!1353273 () Bool)

(assert (=> b!1466829 m!1353273))

(declare-fun m!1353275 () Bool)

(assert (=> b!1466808 m!1353275))

(assert (=> b!1466808 m!1353275))

(declare-fun m!1353277 () Bool)

(assert (=> b!1466808 m!1353277))

(declare-fun m!1353279 () Bool)

(assert (=> start!125380 m!1353279))

(declare-fun m!1353281 () Bool)

(assert (=> start!125380 m!1353281))

(declare-fun m!1353283 () Bool)

(assert (=> b!1466816 m!1353283))

(declare-fun m!1353285 () Bool)

(assert (=> b!1466816 m!1353285))

(assert (=> b!1466821 m!1353271))

(declare-fun m!1353287 () Bool)

(assert (=> b!1466821 m!1353287))

(declare-fun m!1353289 () Bool)

(assert (=> b!1466809 m!1353289))

(assert (=> b!1466809 m!1353283))

(declare-fun m!1353291 () Bool)

(assert (=> b!1466815 m!1353291))

(assert (=> b!1466815 m!1353271))

(declare-fun m!1353293 () Bool)

(assert (=> b!1466815 m!1353293))

(declare-fun m!1353295 () Bool)

(assert (=> b!1466815 m!1353295))

(declare-fun m!1353297 () Bool)

(assert (=> b!1466815 m!1353297))

(declare-fun m!1353299 () Bool)

(assert (=> b!1466815 m!1353299))

(declare-fun m!1353301 () Bool)

(assert (=> b!1466815 m!1353301))

(declare-fun m!1353303 () Bool)

(assert (=> b!1466815 m!1353303))

(assert (=> b!1466815 m!1353299))

(assert (=> b!1466810 m!1353299))

(assert (=> b!1466810 m!1353299))

(declare-fun m!1353305 () Bool)

(assert (=> b!1466810 m!1353305))

(declare-fun m!1353307 () Bool)

(assert (=> b!1466818 m!1353307))

(assert (=> b!1466818 m!1353283))

(declare-fun m!1353309 () Bool)

(assert (=> b!1466827 m!1353309))

(declare-fun m!1353311 () Bool)

(assert (=> b!1466812 m!1353311))

(declare-fun m!1353313 () Bool)

(assert (=> b!1466814 m!1353313))

(declare-fun m!1353315 () Bool)

(assert (=> b!1466824 m!1353315))

(assert (=> b!1466820 m!1353299))

(assert (=> b!1466820 m!1353299))

(declare-fun m!1353317 () Bool)

(assert (=> b!1466820 m!1353317))

(declare-fun m!1353319 () Bool)

(assert (=> b!1466828 m!1353319))

(assert (=> b!1466817 m!1353299))

(assert (=> b!1466817 m!1353299))

(declare-fun m!1353321 () Bool)

(assert (=> b!1466817 m!1353321))

(assert (=> b!1466817 m!1353321))

(assert (=> b!1466817 m!1353299))

(declare-fun m!1353323 () Bool)

(assert (=> b!1466817 m!1353323))

(assert (=> b!1466811 m!1353299))

(assert (=> b!1466811 m!1353299))

(declare-fun m!1353325 () Bool)

(assert (=> b!1466811 m!1353325))

(check-sat (not b!1466814) (not b!1466808) (not b!1466810) (not b!1466817) (not b!1466816) (not b!1466809) (not b!1466827) (not b!1466812) (not start!125380) (not b!1466829) (not b!1466824) (not b!1466815) (not b!1466811) (not b!1466818) (not b!1466820) (not b!1466828))
(check-sat)
