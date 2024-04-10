; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124844 () Bool)

(assert start!124844)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1449282 () Bool)

(declare-fun e!816156 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1449282 (= e!816156 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449283 () Bool)

(declare-fun res!980753 () Bool)

(declare-fun e!816161 () Bool)

(assert (=> b!1449283 (=> (not res!980753) (not e!816161))))

(declare-datatypes ((SeekEntryResult!11686 0))(
  ( (MissingZero!11686 (index!49136 (_ BitVec 32))) (Found!11686 (index!49137 (_ BitVec 32))) (Intermediate!11686 (undefined!12498 Bool) (index!49138 (_ BitVec 32)) (x!130799 (_ BitVec 32))) (Undefined!11686) (MissingVacant!11686 (index!49139 (_ BitVec 32))) )
))
(declare-fun lt!635841 () SeekEntryResult!11686)

(declare-datatypes ((array!98292 0))(
  ( (array!98293 (arr!47434 (Array (_ BitVec 32) (_ BitVec 64))) (size!47984 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98292)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98292 (_ BitVec 32)) SeekEntryResult!11686)

(assert (=> b!1449283 (= res!980753 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!635841))))

(declare-fun b!1449284 () Bool)

(declare-fun e!816164 () Bool)

(assert (=> b!1449284 (= e!816164 e!816156)))

(declare-fun res!980742 () Bool)

(assert (=> b!1449284 (=> (not res!980742) (not e!816156))))

(declare-fun lt!635843 () SeekEntryResult!11686)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98292 (_ BitVec 32)) SeekEntryResult!11686)

(assert (=> b!1449284 (= res!980742 (= lt!635843 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47434 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449285 () Bool)

(declare-fun lt!635844 () SeekEntryResult!11686)

(declare-fun lt!635842 () array!98292)

(declare-fun lt!635847 () (_ BitVec 64))

(declare-fun e!816163 () Bool)

(assert (=> b!1449285 (= e!816163 (= lt!635844 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635847 lt!635842 mask!2687)))))

(declare-fun b!1449286 () Bool)

(declare-fun e!816160 () Bool)

(assert (=> b!1449286 (= e!816160 e!816164)))

(declare-fun res!980749 () Bool)

(assert (=> b!1449286 (=> res!980749 e!816164)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449286 (= res!980749 (or (and (= (select (arr!47434 a!2862) index!646) (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47434 a!2862) index!646) (select (arr!47434 a!2862) j!93))) (not (= (select (arr!47434 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449287 () Bool)

(declare-fun res!980745 () Bool)

(declare-fun e!816157 () Bool)

(assert (=> b!1449287 (=> (not res!980745) (not e!816157))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449287 (= res!980745 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47984 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47984 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47984 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449288 () Bool)

(declare-fun res!980751 () Bool)

(declare-fun e!816159 () Bool)

(assert (=> b!1449288 (=> (not res!980751) (not e!816159))))

(assert (=> b!1449288 (= res!980751 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449289 () Bool)

(declare-fun e!816158 () Bool)

(assert (=> b!1449289 (= e!816158 true)))

(declare-fun lt!635845 () SeekEntryResult!11686)

(assert (=> b!1449289 (= lt!635845 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47434 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449290 () Bool)

(declare-fun res!980739 () Bool)

(assert (=> b!1449290 (=> (not res!980739) (not e!816157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449290 (= res!980739 (validKeyInArray!0 (select (arr!47434 a!2862) j!93)))))

(declare-fun b!1449291 () Bool)

(assert (=> b!1449291 (= e!816161 e!816159)))

(declare-fun res!980748 () Bool)

(assert (=> b!1449291 (=> (not res!980748) (not e!816159))))

(assert (=> b!1449291 (= res!980748 (= lt!635844 (Intermediate!11686 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449291 (= lt!635844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635847 mask!2687) lt!635847 lt!635842 mask!2687))))

(assert (=> b!1449291 (= lt!635847 (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449292 () Bool)

(declare-fun res!980743 () Bool)

(assert (=> b!1449292 (=> (not res!980743) (not e!816157))))

(declare-datatypes ((List!33935 0))(
  ( (Nil!33932) (Cons!33931 (h!35281 (_ BitVec 64)) (t!48629 List!33935)) )
))
(declare-fun arrayNoDuplicates!0 (array!98292 (_ BitVec 32) List!33935) Bool)

(assert (=> b!1449292 (= res!980743 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33932))))

(declare-fun res!980740 () Bool)

(assert (=> start!124844 (=> (not res!980740) (not e!816157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124844 (= res!980740 (validMask!0 mask!2687))))

(assert (=> start!124844 e!816157))

(assert (=> start!124844 true))

(declare-fun array_inv!36462 (array!98292) Bool)

(assert (=> start!124844 (array_inv!36462 a!2862)))

(declare-fun b!1449293 () Bool)

(declare-fun res!980747 () Bool)

(assert (=> b!1449293 (=> (not res!980747) (not e!816159))))

(assert (=> b!1449293 (= res!980747 e!816163)))

(declare-fun c!133782 () Bool)

(assert (=> b!1449293 (= c!133782 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449294 () Bool)

(declare-fun res!980741 () Bool)

(assert (=> b!1449294 (=> (not res!980741) (not e!816157))))

(assert (=> b!1449294 (= res!980741 (validKeyInArray!0 (select (arr!47434 a!2862) i!1006)))))

(declare-fun b!1449295 () Bool)

(assert (=> b!1449295 (= e!816159 (not e!816158))))

(declare-fun res!980746 () Bool)

(assert (=> b!1449295 (=> res!980746 e!816158)))

(assert (=> b!1449295 (= res!980746 (or (and (= (select (arr!47434 a!2862) index!646) (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47434 a!2862) index!646) (select (arr!47434 a!2862) j!93))) (not (= (select (arr!47434 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449295 e!816160))

(declare-fun res!980754 () Bool)

(assert (=> b!1449295 (=> (not res!980754) (not e!816160))))

(assert (=> b!1449295 (= res!980754 (and (= lt!635843 (Found!11686 j!93)) (or (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) (select (arr!47434 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98292 (_ BitVec 32)) SeekEntryResult!11686)

(assert (=> b!1449295 (= lt!635843 (seekEntryOrOpen!0 (select (arr!47434 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98292 (_ BitVec 32)) Bool)

(assert (=> b!1449295 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48868 0))(
  ( (Unit!48869) )
))
(declare-fun lt!635846 () Unit!48868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48868)

(assert (=> b!1449295 (= lt!635846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449296 () Bool)

(declare-fun e!816162 () Bool)

(assert (=> b!1449296 (= e!816157 e!816162)))

(declare-fun res!980752 () Bool)

(assert (=> b!1449296 (=> (not res!980752) (not e!816162))))

(assert (=> b!1449296 (= res!980752 (= (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449296 (= lt!635842 (array!98293 (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47984 a!2862)))))

(declare-fun b!1449297 () Bool)

(declare-fun res!980744 () Bool)

(assert (=> b!1449297 (=> (not res!980744) (not e!816157))))

(assert (=> b!1449297 (= res!980744 (and (= (size!47984 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47984 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47984 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449298 () Bool)

(declare-fun res!980750 () Bool)

(assert (=> b!1449298 (=> (not res!980750) (not e!816157))))

(assert (=> b!1449298 (= res!980750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449299 () Bool)

(assert (=> b!1449299 (= e!816162 e!816161)))

(declare-fun res!980755 () Bool)

(assert (=> b!1449299 (=> (not res!980755) (not e!816161))))

(assert (=> b!1449299 (= res!980755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47434 a!2862) j!93) mask!2687) (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!635841))))

(assert (=> b!1449299 (= lt!635841 (Intermediate!11686 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449300 () Bool)

(assert (=> b!1449300 (= e!816163 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635847 lt!635842 mask!2687) (seekEntryOrOpen!0 lt!635847 lt!635842 mask!2687)))))

(assert (= (and start!124844 res!980740) b!1449297))

(assert (= (and b!1449297 res!980744) b!1449294))

(assert (= (and b!1449294 res!980741) b!1449290))

(assert (= (and b!1449290 res!980739) b!1449298))

(assert (= (and b!1449298 res!980750) b!1449292))

(assert (= (and b!1449292 res!980743) b!1449287))

(assert (= (and b!1449287 res!980745) b!1449296))

(assert (= (and b!1449296 res!980752) b!1449299))

(assert (= (and b!1449299 res!980755) b!1449283))

(assert (= (and b!1449283 res!980753) b!1449291))

(assert (= (and b!1449291 res!980748) b!1449293))

(assert (= (and b!1449293 c!133782) b!1449285))

(assert (= (and b!1449293 (not c!133782)) b!1449300))

(assert (= (and b!1449293 res!980747) b!1449288))

(assert (= (and b!1449288 res!980751) b!1449295))

(assert (= (and b!1449295 res!980754) b!1449286))

(assert (= (and b!1449286 (not res!980749)) b!1449284))

(assert (= (and b!1449284 res!980742) b!1449282))

(assert (= (and b!1449295 (not res!980746)) b!1449289))

(declare-fun m!1338001 () Bool)

(assert (=> b!1449291 m!1338001))

(assert (=> b!1449291 m!1338001))

(declare-fun m!1338003 () Bool)

(assert (=> b!1449291 m!1338003))

(declare-fun m!1338005 () Bool)

(assert (=> b!1449291 m!1338005))

(declare-fun m!1338007 () Bool)

(assert (=> b!1449291 m!1338007))

(declare-fun m!1338009 () Bool)

(assert (=> b!1449292 m!1338009))

(declare-fun m!1338011 () Bool)

(assert (=> b!1449284 m!1338011))

(assert (=> b!1449284 m!1338011))

(declare-fun m!1338013 () Bool)

(assert (=> b!1449284 m!1338013))

(assert (=> b!1449290 m!1338011))

(assert (=> b!1449290 m!1338011))

(declare-fun m!1338015 () Bool)

(assert (=> b!1449290 m!1338015))

(assert (=> b!1449299 m!1338011))

(assert (=> b!1449299 m!1338011))

(declare-fun m!1338017 () Bool)

(assert (=> b!1449299 m!1338017))

(assert (=> b!1449299 m!1338017))

(assert (=> b!1449299 m!1338011))

(declare-fun m!1338019 () Bool)

(assert (=> b!1449299 m!1338019))

(declare-fun m!1338021 () Bool)

(assert (=> b!1449295 m!1338021))

(assert (=> b!1449295 m!1338005))

(declare-fun m!1338023 () Bool)

(assert (=> b!1449295 m!1338023))

(declare-fun m!1338025 () Bool)

(assert (=> b!1449295 m!1338025))

(declare-fun m!1338027 () Bool)

(assert (=> b!1449295 m!1338027))

(assert (=> b!1449295 m!1338011))

(declare-fun m!1338029 () Bool)

(assert (=> b!1449295 m!1338029))

(declare-fun m!1338031 () Bool)

(assert (=> b!1449295 m!1338031))

(assert (=> b!1449295 m!1338011))

(declare-fun m!1338033 () Bool)

(assert (=> b!1449294 m!1338033))

(assert (=> b!1449294 m!1338033))

(declare-fun m!1338035 () Bool)

(assert (=> b!1449294 m!1338035))

(assert (=> b!1449286 m!1338027))

(assert (=> b!1449286 m!1338005))

(assert (=> b!1449286 m!1338025))

(assert (=> b!1449286 m!1338011))

(assert (=> b!1449296 m!1338005))

(declare-fun m!1338037 () Bool)

(assert (=> b!1449296 m!1338037))

(assert (=> b!1449289 m!1338011))

(assert (=> b!1449289 m!1338011))

(declare-fun m!1338039 () Bool)

(assert (=> b!1449289 m!1338039))

(declare-fun m!1338041 () Bool)

(assert (=> b!1449285 m!1338041))

(declare-fun m!1338043 () Bool)

(assert (=> b!1449298 m!1338043))

(assert (=> b!1449283 m!1338011))

(assert (=> b!1449283 m!1338011))

(declare-fun m!1338045 () Bool)

(assert (=> b!1449283 m!1338045))

(declare-fun m!1338047 () Bool)

(assert (=> b!1449300 m!1338047))

(declare-fun m!1338049 () Bool)

(assert (=> b!1449300 m!1338049))

(declare-fun m!1338051 () Bool)

(assert (=> start!124844 m!1338051))

(declare-fun m!1338053 () Bool)

(assert (=> start!124844 m!1338053))

(push 1)

