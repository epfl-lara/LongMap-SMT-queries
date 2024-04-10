; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125284 () Bool)

(assert start!125284)

(declare-fun b!1462845 () Bool)

(declare-fun e!822258 () Bool)

(declare-fun e!822253 () Bool)

(assert (=> b!1462845 (= e!822258 (not e!822253))))

(declare-fun res!992219 () Bool)

(assert (=> b!1462845 (=> res!992219 e!822253)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98732 0))(
  ( (array!98733 (arr!47654 (Array (_ BitVec 32) (_ BitVec 64))) (size!48204 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98732)

(assert (=> b!1462845 (= res!992219 (or (and (= (select (arr!47654 a!2862) index!646) (select (store (arr!47654 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47654 a!2862) index!646) (select (arr!47654 a!2862) j!93))) (= (select (arr!47654 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822255 () Bool)

(assert (=> b!1462845 e!822255))

(declare-fun res!992215 () Bool)

(assert (=> b!1462845 (=> (not res!992215) (not e!822255))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98732 (_ BitVec 32)) Bool)

(assert (=> b!1462845 (= res!992215 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49308 0))(
  ( (Unit!49309) )
))
(declare-fun lt!640578 () Unit!49308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49308)

(assert (=> b!1462845 (= lt!640578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462846 () Bool)

(declare-datatypes ((SeekEntryResult!11906 0))(
  ( (MissingZero!11906 (index!50016 (_ BitVec 32))) (Found!11906 (index!50017 (_ BitVec 32))) (Intermediate!11906 (undefined!12718 Bool) (index!50018 (_ BitVec 32)) (x!131611 (_ BitVec 32))) (Undefined!11906) (MissingVacant!11906 (index!50019 (_ BitVec 32))) )
))
(declare-fun lt!640581 () SeekEntryResult!11906)

(declare-fun e!822259 () Bool)

(declare-fun lt!640579 () array!98732)

(declare-fun lt!640584 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98732 (_ BitVec 32)) SeekEntryResult!11906)

(assert (=> b!1462846 (= e!822259 (= lt!640581 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640584 lt!640579 mask!2687)))))

(declare-fun b!1462848 () Bool)

(declare-fun e!822256 () Bool)

(assert (=> b!1462848 (= e!822253 e!822256)))

(declare-fun res!992214 () Bool)

(assert (=> b!1462848 (=> res!992214 e!822256)))

(declare-fun lt!640583 () (_ BitVec 32))

(assert (=> b!1462848 (= res!992214 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640583 #b00000000000000000000000000000000) (bvsge lt!640583 (size!48204 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462848 (= lt!640583 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462849 () Bool)

(declare-fun res!992216 () Bool)

(declare-fun e!822252 () Bool)

(assert (=> b!1462849 (=> (not res!992216) (not e!822252))))

(declare-datatypes ((List!34155 0))(
  ( (Nil!34152) (Cons!34151 (h!35501 (_ BitVec 64)) (t!48849 List!34155)) )
))
(declare-fun arrayNoDuplicates!0 (array!98732 (_ BitVec 32) List!34155) Bool)

(assert (=> b!1462849 (= res!992216 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34152))))

(declare-fun b!1462850 () Bool)

(assert (=> b!1462850 (= e!822256 true)))

(declare-fun lt!640580 () Bool)

(declare-fun e!822260 () Bool)

(assert (=> b!1462850 (= lt!640580 e!822260)))

(declare-fun c!134831 () Bool)

(assert (=> b!1462850 (= c!134831 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462851 () Bool)

(declare-fun res!992218 () Bool)

(assert (=> b!1462851 (=> (not res!992218) (not e!822252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462851 (= res!992218 (validKeyInArray!0 (select (arr!47654 a!2862) j!93)))))

(declare-fun b!1462852 () Bool)

(declare-fun e!822251 () Bool)

(assert (=> b!1462852 (= e!822251 e!822258)))

(declare-fun res!992204 () Bool)

(assert (=> b!1462852 (=> (not res!992204) (not e!822258))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462852 (= res!992204 (= lt!640581 (Intermediate!11906 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462852 (= lt!640581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640584 mask!2687) lt!640584 lt!640579 mask!2687))))

(assert (=> b!1462852 (= lt!640584 (select (store (arr!47654 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462853 () Bool)

(declare-fun res!992210 () Bool)

(assert (=> b!1462853 (=> (not res!992210) (not e!822252))))

(assert (=> b!1462853 (= res!992210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462854 () Bool)

(declare-fun res!992207 () Bool)

(assert (=> b!1462854 (=> (not res!992207) (not e!822258))))

(assert (=> b!1462854 (= res!992207 e!822259)))

(declare-fun c!134832 () Bool)

(assert (=> b!1462854 (= c!134832 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462855 () Bool)

(declare-fun e!822254 () Bool)

(assert (=> b!1462855 (= e!822254 e!822251)))

(declare-fun res!992208 () Bool)

(assert (=> b!1462855 (=> (not res!992208) (not e!822251))))

(declare-fun lt!640582 () SeekEntryResult!11906)

(assert (=> b!1462855 (= res!992208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47654 a!2862) j!93) mask!2687) (select (arr!47654 a!2862) j!93) a!2862 mask!2687) lt!640582))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462855 (= lt!640582 (Intermediate!11906 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98732 (_ BitVec 32)) SeekEntryResult!11906)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98732 (_ BitVec 32)) SeekEntryResult!11906)

(assert (=> b!1462856 (= e!822260 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640583 intermediateAfterIndex!19 lt!640584 lt!640579 mask!2687) (seekEntryOrOpen!0 lt!640584 lt!640579 mask!2687))))))

(declare-fun b!1462857 () Bool)

(assert (=> b!1462857 (= e!822260 (not (= lt!640581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640583 lt!640584 lt!640579 mask!2687))))))

(declare-fun b!1462858 () Bool)

(declare-fun res!992213 () Bool)

(assert (=> b!1462858 (=> (not res!992213) (not e!822258))))

(assert (=> b!1462858 (= res!992213 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462859 () Bool)

(assert (=> b!1462859 (= e!822259 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640584 lt!640579 mask!2687) (seekEntryOrOpen!0 lt!640584 lt!640579 mask!2687)))))

(declare-fun b!1462860 () Bool)

(declare-fun res!992205 () Bool)

(assert (=> b!1462860 (=> (not res!992205) (not e!822252))))

(assert (=> b!1462860 (= res!992205 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48204 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48204 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48204 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462861 () Bool)

(declare-fun res!992217 () Bool)

(assert (=> b!1462861 (=> (not res!992217) (not e!822251))))

(assert (=> b!1462861 (= res!992217 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47654 a!2862) j!93) a!2862 mask!2687) lt!640582))))

(declare-fun res!992221 () Bool)

(assert (=> start!125284 (=> (not res!992221) (not e!822252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125284 (= res!992221 (validMask!0 mask!2687))))

(assert (=> start!125284 e!822252))

(assert (=> start!125284 true))

(declare-fun array_inv!36682 (array!98732) Bool)

(assert (=> start!125284 (array_inv!36682 a!2862)))

(declare-fun b!1462847 () Bool)

(assert (=> b!1462847 (= e!822255 (or (= (select (arr!47654 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47654 a!2862) intermediateBeforeIndex!19) (select (arr!47654 a!2862) j!93))))))

(declare-fun b!1462862 () Bool)

(declare-fun res!992220 () Bool)

(assert (=> b!1462862 (=> (not res!992220) (not e!822252))))

(assert (=> b!1462862 (= res!992220 (and (= (size!48204 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48204 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48204 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462863 () Bool)

(assert (=> b!1462863 (= e!822252 e!822254)))

(declare-fun res!992206 () Bool)

(assert (=> b!1462863 (=> (not res!992206) (not e!822254))))

(assert (=> b!1462863 (= res!992206 (= (select (store (arr!47654 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462863 (= lt!640579 (array!98733 (store (arr!47654 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48204 a!2862)))))

(declare-fun b!1462864 () Bool)

(declare-fun res!992209 () Bool)

(assert (=> b!1462864 (=> (not res!992209) (not e!822252))))

(assert (=> b!1462864 (= res!992209 (validKeyInArray!0 (select (arr!47654 a!2862) i!1006)))))

(declare-fun b!1462865 () Bool)

(declare-fun res!992212 () Bool)

(assert (=> b!1462865 (=> (not res!992212) (not e!822255))))

(assert (=> b!1462865 (= res!992212 (= (seekEntryOrOpen!0 (select (arr!47654 a!2862) j!93) a!2862 mask!2687) (Found!11906 j!93)))))

(declare-fun b!1462866 () Bool)

(declare-fun res!992211 () Bool)

(assert (=> b!1462866 (=> res!992211 e!822256)))

(assert (=> b!1462866 (= res!992211 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640583 (select (arr!47654 a!2862) j!93) a!2862 mask!2687) lt!640582)))))

(assert (= (and start!125284 res!992221) b!1462862))

(assert (= (and b!1462862 res!992220) b!1462864))

(assert (= (and b!1462864 res!992209) b!1462851))

(assert (= (and b!1462851 res!992218) b!1462853))

(assert (= (and b!1462853 res!992210) b!1462849))

(assert (= (and b!1462849 res!992216) b!1462860))

(assert (= (and b!1462860 res!992205) b!1462863))

(assert (= (and b!1462863 res!992206) b!1462855))

(assert (= (and b!1462855 res!992208) b!1462861))

(assert (= (and b!1462861 res!992217) b!1462852))

(assert (= (and b!1462852 res!992204) b!1462854))

(assert (= (and b!1462854 c!134832) b!1462846))

(assert (= (and b!1462854 (not c!134832)) b!1462859))

(assert (= (and b!1462854 res!992207) b!1462858))

(assert (= (and b!1462858 res!992213) b!1462845))

(assert (= (and b!1462845 res!992215) b!1462865))

(assert (= (and b!1462865 res!992212) b!1462847))

(assert (= (and b!1462845 (not res!992219)) b!1462848))

(assert (= (and b!1462848 (not res!992214)) b!1462866))

(assert (= (and b!1462866 (not res!992211)) b!1462850))

(assert (= (and b!1462850 c!134831) b!1462857))

(assert (= (and b!1462850 (not c!134831)) b!1462856))

(declare-fun m!1350253 () Bool)

(assert (=> b!1462857 m!1350253))

(declare-fun m!1350255 () Bool)

(assert (=> b!1462856 m!1350255))

(declare-fun m!1350257 () Bool)

(assert (=> b!1462856 m!1350257))

(declare-fun m!1350259 () Bool)

(assert (=> b!1462848 m!1350259))

(declare-fun m!1350261 () Bool)

(assert (=> b!1462853 m!1350261))

(declare-fun m!1350263 () Bool)

(assert (=> b!1462855 m!1350263))

(assert (=> b!1462855 m!1350263))

(declare-fun m!1350265 () Bool)

(assert (=> b!1462855 m!1350265))

(assert (=> b!1462855 m!1350265))

(assert (=> b!1462855 m!1350263))

(declare-fun m!1350267 () Bool)

(assert (=> b!1462855 m!1350267))

(declare-fun m!1350269 () Bool)

(assert (=> b!1462863 m!1350269))

(declare-fun m!1350271 () Bool)

(assert (=> b!1462863 m!1350271))

(declare-fun m!1350273 () Bool)

(assert (=> b!1462849 m!1350273))

(declare-fun m!1350275 () Bool)

(assert (=> start!125284 m!1350275))

(declare-fun m!1350277 () Bool)

(assert (=> start!125284 m!1350277))

(declare-fun m!1350279 () Bool)

(assert (=> b!1462852 m!1350279))

(assert (=> b!1462852 m!1350279))

(declare-fun m!1350281 () Bool)

(assert (=> b!1462852 m!1350281))

(assert (=> b!1462852 m!1350269))

(declare-fun m!1350283 () Bool)

(assert (=> b!1462852 m!1350283))

(declare-fun m!1350285 () Bool)

(assert (=> b!1462864 m!1350285))

(assert (=> b!1462864 m!1350285))

(declare-fun m!1350287 () Bool)

(assert (=> b!1462864 m!1350287))

(declare-fun m!1350289 () Bool)

(assert (=> b!1462846 m!1350289))

(assert (=> b!1462861 m!1350263))

(assert (=> b!1462861 m!1350263))

(declare-fun m!1350291 () Bool)

(assert (=> b!1462861 m!1350291))

(declare-fun m!1350293 () Bool)

(assert (=> b!1462847 m!1350293))

(assert (=> b!1462847 m!1350263))

(assert (=> b!1462865 m!1350263))

(assert (=> b!1462865 m!1350263))

(declare-fun m!1350295 () Bool)

(assert (=> b!1462865 m!1350295))

(assert (=> b!1462866 m!1350263))

(assert (=> b!1462866 m!1350263))

(declare-fun m!1350297 () Bool)

(assert (=> b!1462866 m!1350297))

(declare-fun m!1350299 () Bool)

(assert (=> b!1462859 m!1350299))

(assert (=> b!1462859 m!1350257))

(assert (=> b!1462851 m!1350263))

(assert (=> b!1462851 m!1350263))

(declare-fun m!1350301 () Bool)

(assert (=> b!1462851 m!1350301))

(declare-fun m!1350303 () Bool)

(assert (=> b!1462845 m!1350303))

(assert (=> b!1462845 m!1350269))

(declare-fun m!1350305 () Bool)

(assert (=> b!1462845 m!1350305))

(declare-fun m!1350307 () Bool)

(assert (=> b!1462845 m!1350307))

(declare-fun m!1350309 () Bool)

(assert (=> b!1462845 m!1350309))

(assert (=> b!1462845 m!1350263))

(push 1)

