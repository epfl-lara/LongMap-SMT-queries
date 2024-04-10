; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125890 () Bool)

(assert start!125890)

(declare-fun b!1473727 () Bool)

(declare-fun res!1001012 () Bool)

(declare-fun e!826965 () Bool)

(assert (=> b!1473727 (=> (not res!1001012) (not e!826965))))

(declare-datatypes ((array!99167 0))(
  ( (array!99168 (arr!47867 (Array (_ BitVec 32) (_ BitVec 64))) (size!48417 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99167)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473727 (= res!1001012 (validKeyInArray!0 (select (arr!47867 a!2862) j!93)))))

(declare-fun b!1473728 () Bool)

(declare-fun res!1001013 () Bool)

(assert (=> b!1473728 (=> (not res!1001013) (not e!826965))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473728 (= res!1001013 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48417 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48417 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48417 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473730 () Bool)

(declare-fun res!1001017 () Bool)

(assert (=> b!1473730 (=> (not res!1001017) (not e!826965))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99167 (_ BitVec 32)) Bool)

(assert (=> b!1473730 (= res!1001017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473731 () Bool)

(declare-fun e!826970 () Bool)

(assert (=> b!1473731 (= e!826965 e!826970)))

(declare-fun res!1001021 () Bool)

(assert (=> b!1473731 (=> (not res!1001021) (not e!826970))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473731 (= res!1001021 (= (select (store (arr!47867 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644023 () array!99167)

(assert (=> b!1473731 (= lt!644023 (array!99168 (store (arr!47867 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48417 a!2862)))))

(declare-fun b!1473732 () Bool)

(declare-fun res!1001023 () Bool)

(declare-fun e!826967 () Bool)

(assert (=> b!1473732 (=> (not res!1001023) (not e!826967))))

(declare-datatypes ((SeekEntryResult!12107 0))(
  ( (MissingZero!12107 (index!50820 (_ BitVec 32))) (Found!12107 (index!50821 (_ BitVec 32))) (Intermediate!12107 (undefined!12919 Bool) (index!50822 (_ BitVec 32)) (x!132407 (_ BitVec 32))) (Undefined!12107) (MissingVacant!12107 (index!50823 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99167 (_ BitVec 32)) SeekEntryResult!12107)

(assert (=> b!1473732 (= res!1001023 (= (seekEntryOrOpen!0 (select (arr!47867 a!2862) j!93) a!2862 mask!2687) (Found!12107 j!93)))))

(declare-fun b!1473733 () Bool)

(declare-fun res!1001014 () Bool)

(declare-fun e!826969 () Bool)

(assert (=> b!1473733 (=> (not res!1001014) (not e!826969))))

(declare-fun lt!644026 () SeekEntryResult!12107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99167 (_ BitVec 32)) SeekEntryResult!12107)

(assert (=> b!1473733 (= res!1001014 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47867 a!2862) j!93) a!2862 mask!2687) lt!644026))))

(declare-fun b!1473734 () Bool)

(declare-fun res!1001019 () Bool)

(assert (=> b!1473734 (=> (not res!1001019) (not e!826965))))

(assert (=> b!1473734 (= res!1001019 (and (= (size!48417 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48417 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48417 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473735 () Bool)

(declare-fun res!1001022 () Bool)

(declare-fun e!826966 () Bool)

(assert (=> b!1473735 (=> (not res!1001022) (not e!826966))))

(declare-fun e!826964 () Bool)

(assert (=> b!1473735 (= res!1001022 e!826964)))

(declare-fun c!135873 () Bool)

(assert (=> b!1473735 (= c!135873 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473736 () Bool)

(declare-fun e!826963 () Bool)

(assert (=> b!1473736 (= e!826963 true)))

(declare-fun lt!644025 () (_ BitVec 64))

(declare-fun lt!644027 () SeekEntryResult!12107)

(assert (=> b!1473736 (= lt!644027 (seekEntryOrOpen!0 lt!644025 lt!644023 mask!2687))))

(declare-fun b!1473737 () Bool)

(declare-fun lt!644028 () SeekEntryResult!12107)

(assert (=> b!1473737 (= e!826964 (= lt!644028 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644025 lt!644023 mask!2687)))))

(declare-fun b!1473738 () Bool)

(declare-fun res!1001011 () Bool)

(assert (=> b!1473738 (=> (not res!1001011) (not e!826966))))

(assert (=> b!1473738 (= res!1001011 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473739 () Bool)

(declare-fun res!1001015 () Bool)

(assert (=> b!1473739 (=> (not res!1001015) (not e!826965))))

(assert (=> b!1473739 (= res!1001015 (validKeyInArray!0 (select (arr!47867 a!2862) i!1006)))))

(declare-fun b!1473740 () Bool)

(assert (=> b!1473740 (= e!826966 (not e!826963))))

(declare-fun res!1001026 () Bool)

(assert (=> b!1473740 (=> res!1001026 e!826963)))

(assert (=> b!1473740 (= res!1001026 (or (not (= (select (arr!47867 a!2862) index!646) (select (store (arr!47867 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47867 a!2862) index!646) (select (arr!47867 a!2862) j!93)))))))

(assert (=> b!1473740 e!826967))

(declare-fun res!1001024 () Bool)

(assert (=> b!1473740 (=> (not res!1001024) (not e!826967))))

(assert (=> b!1473740 (= res!1001024 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49554 0))(
  ( (Unit!49555) )
))
(declare-fun lt!644024 () Unit!49554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49554)

(assert (=> b!1473740 (= lt!644024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1001025 () Bool)

(assert (=> start!125890 (=> (not res!1001025) (not e!826965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125890 (= res!1001025 (validMask!0 mask!2687))))

(assert (=> start!125890 e!826965))

(assert (=> start!125890 true))

(declare-fun array_inv!36895 (array!99167) Bool)

(assert (=> start!125890 (array_inv!36895 a!2862)))

(declare-fun b!1473729 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99167 (_ BitVec 32)) SeekEntryResult!12107)

(assert (=> b!1473729 (= e!826964 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644025 lt!644023 mask!2687) (seekEntryOrOpen!0 lt!644025 lt!644023 mask!2687)))))

(declare-fun b!1473741 () Bool)

(assert (=> b!1473741 (= e!826970 e!826969)))

(declare-fun res!1001016 () Bool)

(assert (=> b!1473741 (=> (not res!1001016) (not e!826969))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473741 (= res!1001016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47867 a!2862) j!93) mask!2687) (select (arr!47867 a!2862) j!93) a!2862 mask!2687) lt!644026))))

(assert (=> b!1473741 (= lt!644026 (Intermediate!12107 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473742 () Bool)

(assert (=> b!1473742 (= e!826967 (or (= (select (arr!47867 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47867 a!2862) intermediateBeforeIndex!19) (select (arr!47867 a!2862) j!93))))))

(declare-fun b!1473743 () Bool)

(declare-fun res!1001018 () Bool)

(assert (=> b!1473743 (=> (not res!1001018) (not e!826965))))

(declare-datatypes ((List!34368 0))(
  ( (Nil!34365) (Cons!34364 (h!35723 (_ BitVec 64)) (t!49062 List!34368)) )
))
(declare-fun arrayNoDuplicates!0 (array!99167 (_ BitVec 32) List!34368) Bool)

(assert (=> b!1473743 (= res!1001018 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34365))))

(declare-fun b!1473744 () Bool)

(assert (=> b!1473744 (= e!826969 e!826966)))

(declare-fun res!1001020 () Bool)

(assert (=> b!1473744 (=> (not res!1001020) (not e!826966))))

(assert (=> b!1473744 (= res!1001020 (= lt!644028 (Intermediate!12107 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473744 (= lt!644028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644025 mask!2687) lt!644025 lt!644023 mask!2687))))

(assert (=> b!1473744 (= lt!644025 (select (store (arr!47867 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125890 res!1001025) b!1473734))

(assert (= (and b!1473734 res!1001019) b!1473739))

(assert (= (and b!1473739 res!1001015) b!1473727))

(assert (= (and b!1473727 res!1001012) b!1473730))

(assert (= (and b!1473730 res!1001017) b!1473743))

(assert (= (and b!1473743 res!1001018) b!1473728))

(assert (= (and b!1473728 res!1001013) b!1473731))

(assert (= (and b!1473731 res!1001021) b!1473741))

(assert (= (and b!1473741 res!1001016) b!1473733))

(assert (= (and b!1473733 res!1001014) b!1473744))

(assert (= (and b!1473744 res!1001020) b!1473735))

(assert (= (and b!1473735 c!135873) b!1473737))

(assert (= (and b!1473735 (not c!135873)) b!1473729))

(assert (= (and b!1473735 res!1001022) b!1473738))

(assert (= (and b!1473738 res!1001011) b!1473740))

(assert (= (and b!1473740 res!1001024) b!1473732))

(assert (= (and b!1473732 res!1001023) b!1473742))

(assert (= (and b!1473740 (not res!1001026)) b!1473736))

(declare-fun m!1360231 () Bool)

(assert (=> b!1473743 m!1360231))

(declare-fun m!1360233 () Bool)

(assert (=> b!1473729 m!1360233))

(declare-fun m!1360235 () Bool)

(assert (=> b!1473729 m!1360235))

(declare-fun m!1360237 () Bool)

(assert (=> b!1473727 m!1360237))

(assert (=> b!1473727 m!1360237))

(declare-fun m!1360239 () Bool)

(assert (=> b!1473727 m!1360239))

(assert (=> b!1473741 m!1360237))

(assert (=> b!1473741 m!1360237))

(declare-fun m!1360241 () Bool)

(assert (=> b!1473741 m!1360241))

(assert (=> b!1473741 m!1360241))

(assert (=> b!1473741 m!1360237))

(declare-fun m!1360243 () Bool)

(assert (=> b!1473741 m!1360243))

(assert (=> b!1473732 m!1360237))

(assert (=> b!1473732 m!1360237))

(declare-fun m!1360245 () Bool)

(assert (=> b!1473732 m!1360245))

(declare-fun m!1360247 () Bool)

(assert (=> b!1473731 m!1360247))

(declare-fun m!1360249 () Bool)

(assert (=> b!1473731 m!1360249))

(assert (=> b!1473736 m!1360235))

(declare-fun m!1360251 () Bool)

(assert (=> b!1473744 m!1360251))

(assert (=> b!1473744 m!1360251))

(declare-fun m!1360253 () Bool)

(assert (=> b!1473744 m!1360253))

(assert (=> b!1473744 m!1360247))

(declare-fun m!1360255 () Bool)

(assert (=> b!1473744 m!1360255))

(declare-fun m!1360257 () Bool)

(assert (=> b!1473740 m!1360257))

(assert (=> b!1473740 m!1360247))

(declare-fun m!1360259 () Bool)

(assert (=> b!1473740 m!1360259))

(declare-fun m!1360261 () Bool)

(assert (=> b!1473740 m!1360261))

(declare-fun m!1360263 () Bool)

(assert (=> b!1473740 m!1360263))

(assert (=> b!1473740 m!1360237))

(assert (=> b!1473733 m!1360237))

(assert (=> b!1473733 m!1360237))

(declare-fun m!1360265 () Bool)

(assert (=> b!1473733 m!1360265))

(declare-fun m!1360267 () Bool)

(assert (=> b!1473737 m!1360267))

(declare-fun m!1360269 () Bool)

(assert (=> b!1473739 m!1360269))

(assert (=> b!1473739 m!1360269))

(declare-fun m!1360271 () Bool)

(assert (=> b!1473739 m!1360271))

(declare-fun m!1360273 () Bool)

(assert (=> b!1473742 m!1360273))

(assert (=> b!1473742 m!1360237))

(declare-fun m!1360275 () Bool)

(assert (=> start!125890 m!1360275))

(declare-fun m!1360277 () Bool)

(assert (=> start!125890 m!1360277))

(declare-fun m!1360279 () Bool)

(assert (=> b!1473730 m!1360279))

(push 1)

