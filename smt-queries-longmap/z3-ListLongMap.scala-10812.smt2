; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126798 () Bool)

(assert start!126798)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648312 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99598 0))(
  ( (array!99599 (arr!48070 (Array (_ BitVec 32) (_ BitVec 64))) (size!48621 (_ BitVec 32))) )
))
(declare-fun lt!648313 () array!99598)

(declare-fun b!1485878 () Bool)

(declare-fun e!833216 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12207 0))(
  ( (MissingZero!12207 (index!51220 (_ BitVec 32))) (Found!12207 (index!51221 (_ BitVec 32))) (Intermediate!12207 (undefined!13019 Bool) (index!51222 (_ BitVec 32)) (x!132988 (_ BitVec 32))) (Undefined!12207) (MissingVacant!12207 (index!51223 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99598 (_ BitVec 32)) SeekEntryResult!12207)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99598 (_ BitVec 32)) SeekEntryResult!12207)

(assert (=> b!1485878 (= e!833216 (= (seekEntryOrOpen!0 lt!648312 lt!648313 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648312 lt!648313 mask!2687)))))

(declare-fun b!1485879 () Bool)

(declare-fun e!833213 () Bool)

(assert (=> b!1485879 (= e!833213 true)))

(declare-fun lt!648310 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485879 (= lt!648310 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1485880 () Bool)

(declare-fun res!1009584 () Bool)

(declare-fun e!833214 () Bool)

(assert (=> b!1485880 (=> (not res!1009584) (not e!833214))))

(declare-fun a!2862 () array!99598)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485880 (= res!1009584 (= (seekEntryOrOpen!0 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) (Found!12207 j!93)))))

(declare-fun b!1485881 () Bool)

(declare-fun e!833215 () Bool)

(assert (=> b!1485881 (= e!833215 e!833216)))

(declare-fun res!1009600 () Bool)

(assert (=> b!1485881 (=> (not res!1009600) (not e!833216))))

(declare-fun lt!648307 () (_ BitVec 64))

(assert (=> b!1485881 (= res!1009600 (and (= index!646 intermediateAfterIndex!19) (= lt!648307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485882 () Bool)

(declare-fun e!833217 () Bool)

(assert (=> b!1485882 (= e!833217 (not e!833213))))

(declare-fun res!1009590 () Bool)

(assert (=> b!1485882 (=> res!1009590 e!833213)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485882 (= res!1009590 (or (and (= (select (arr!48070 a!2862) index!646) (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48070 a!2862) index!646) (select (arr!48070 a!2862) j!93))) (= (select (arr!48070 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485882 e!833214))

(declare-fun res!1009583 () Bool)

(assert (=> b!1485882 (=> (not res!1009583) (not e!833214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99598 (_ BitVec 32)) Bool)

(assert (=> b!1485882 (= res!1009583 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49787 0))(
  ( (Unit!49788) )
))
(declare-fun lt!648311 () Unit!49787)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49787)

(assert (=> b!1485882 (= lt!648311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485883 () Bool)

(declare-fun res!1009587 () Bool)

(assert (=> b!1485883 (=> (not res!1009587) (not e!833217))))

(declare-fun e!833220 () Bool)

(assert (=> b!1485883 (= res!1009587 e!833220)))

(declare-fun c!137680 () Bool)

(assert (=> b!1485883 (= c!137680 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485884 () Bool)

(declare-fun res!1009595 () Bool)

(assert (=> b!1485884 (=> (not res!1009595) (not e!833217))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485884 (= res!1009595 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485885 () Bool)

(declare-fun res!1009599 () Bool)

(assert (=> b!1485885 (=> (not res!1009599) (not e!833214))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485885 (= res!1009599 (or (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) (select (arr!48070 a!2862) j!93))))))

(declare-fun b!1485886 () Bool)

(declare-fun res!1009588 () Bool)

(declare-fun e!833219 () Bool)

(assert (=> b!1485886 (=> (not res!1009588) (not e!833219))))

(declare-datatypes ((List!34558 0))(
  ( (Nil!34555) (Cons!34554 (h!35942 (_ BitVec 64)) (t!49244 List!34558)) )
))
(declare-fun arrayNoDuplicates!0 (array!99598 (_ BitVec 32) List!34558) Bool)

(assert (=> b!1485886 (= res!1009588 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34555))))

(declare-fun b!1485887 () Bool)

(assert (=> b!1485887 (= e!833214 e!833215)))

(declare-fun res!1009591 () Bool)

(assert (=> b!1485887 (=> res!1009591 e!833215)))

(assert (=> b!1485887 (= res!1009591 (or (and (= (select (arr!48070 a!2862) index!646) lt!648307) (= (select (arr!48070 a!2862) index!646) (select (arr!48070 a!2862) j!93))) (= (select (arr!48070 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485887 (= lt!648307 (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485888 () Bool)

(declare-fun res!1009592 () Bool)

(declare-fun e!833212 () Bool)

(assert (=> b!1485888 (=> (not res!1009592) (not e!833212))))

(declare-fun lt!648309 () SeekEntryResult!12207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99598 (_ BitVec 32)) SeekEntryResult!12207)

(assert (=> b!1485888 (= res!1009592 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!648309))))

(declare-fun b!1485889 () Bool)

(declare-fun res!1009586 () Bool)

(assert (=> b!1485889 (=> (not res!1009586) (not e!833219))))

(assert (=> b!1485889 (= res!1009586 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48621 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48621 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48621 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485891 () Bool)

(declare-fun e!833218 () Bool)

(assert (=> b!1485891 (= e!833218 e!833212)))

(declare-fun res!1009598 () Bool)

(assert (=> b!1485891 (=> (not res!1009598) (not e!833212))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485891 (= res!1009598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48070 a!2862) j!93) mask!2687) (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!648309))))

(assert (=> b!1485891 (= lt!648309 (Intermediate!12207 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485892 () Bool)

(assert (=> b!1485892 (= e!833219 e!833218)))

(declare-fun res!1009596 () Bool)

(assert (=> b!1485892 (=> (not res!1009596) (not e!833218))))

(assert (=> b!1485892 (= res!1009596 (= (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485892 (= lt!648313 (array!99599 (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48621 a!2862)))))

(declare-fun b!1485893 () Bool)

(assert (=> b!1485893 (= e!833212 e!833217)))

(declare-fun res!1009597 () Bool)

(assert (=> b!1485893 (=> (not res!1009597) (not e!833217))))

(declare-fun lt!648308 () SeekEntryResult!12207)

(assert (=> b!1485893 (= res!1009597 (= lt!648308 (Intermediate!12207 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485893 (= lt!648308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648312 mask!2687) lt!648312 lt!648313 mask!2687))))

(assert (=> b!1485893 (= lt!648312 (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485894 () Bool)

(assert (=> b!1485894 (= e!833220 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648312 lt!648313 mask!2687) (seekEntryOrOpen!0 lt!648312 lt!648313 mask!2687)))))

(declare-fun b!1485895 () Bool)

(declare-fun res!1009594 () Bool)

(assert (=> b!1485895 (=> (not res!1009594) (not e!833219))))

(assert (=> b!1485895 (= res!1009594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485896 () Bool)

(declare-fun res!1009593 () Bool)

(assert (=> b!1485896 (=> (not res!1009593) (not e!833219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485896 (= res!1009593 (validKeyInArray!0 (select (arr!48070 a!2862) i!1006)))))

(declare-fun b!1485897 () Bool)

(declare-fun res!1009589 () Bool)

(assert (=> b!1485897 (=> (not res!1009589) (not e!833219))))

(assert (=> b!1485897 (= res!1009589 (and (= (size!48621 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48621 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48621 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485898 () Bool)

(declare-fun res!1009601 () Bool)

(assert (=> b!1485898 (=> (not res!1009601) (not e!833219))))

(assert (=> b!1485898 (= res!1009601 (validKeyInArray!0 (select (arr!48070 a!2862) j!93)))))

(declare-fun b!1485890 () Bool)

(assert (=> b!1485890 (= e!833220 (= lt!648308 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648312 lt!648313 mask!2687)))))

(declare-fun res!1009585 () Bool)

(assert (=> start!126798 (=> (not res!1009585) (not e!833219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126798 (= res!1009585 (validMask!0 mask!2687))))

(assert (=> start!126798 e!833219))

(assert (=> start!126798 true))

(declare-fun array_inv!37351 (array!99598) Bool)

(assert (=> start!126798 (array_inv!37351 a!2862)))

(assert (= (and start!126798 res!1009585) b!1485897))

(assert (= (and b!1485897 res!1009589) b!1485896))

(assert (= (and b!1485896 res!1009593) b!1485898))

(assert (= (and b!1485898 res!1009601) b!1485895))

(assert (= (and b!1485895 res!1009594) b!1485886))

(assert (= (and b!1485886 res!1009588) b!1485889))

(assert (= (and b!1485889 res!1009586) b!1485892))

(assert (= (and b!1485892 res!1009596) b!1485891))

(assert (= (and b!1485891 res!1009598) b!1485888))

(assert (= (and b!1485888 res!1009592) b!1485893))

(assert (= (and b!1485893 res!1009597) b!1485883))

(assert (= (and b!1485883 c!137680) b!1485890))

(assert (= (and b!1485883 (not c!137680)) b!1485894))

(assert (= (and b!1485883 res!1009587) b!1485884))

(assert (= (and b!1485884 res!1009595) b!1485882))

(assert (= (and b!1485882 res!1009583) b!1485880))

(assert (= (and b!1485880 res!1009584) b!1485885))

(assert (= (and b!1485885 res!1009599) b!1485887))

(assert (= (and b!1485887 (not res!1009591)) b!1485881))

(assert (= (and b!1485881 res!1009600) b!1485878))

(assert (= (and b!1485882 (not res!1009590)) b!1485879))

(declare-fun m!1371211 () Bool)

(assert (=> b!1485886 m!1371211))

(declare-fun m!1371213 () Bool)

(assert (=> start!126798 m!1371213))

(declare-fun m!1371215 () Bool)

(assert (=> start!126798 m!1371215))

(declare-fun m!1371217 () Bool)

(assert (=> b!1485879 m!1371217))

(declare-fun m!1371219 () Bool)

(assert (=> b!1485878 m!1371219))

(declare-fun m!1371221 () Bool)

(assert (=> b!1485878 m!1371221))

(declare-fun m!1371223 () Bool)

(assert (=> b!1485890 m!1371223))

(declare-fun m!1371225 () Bool)

(assert (=> b!1485885 m!1371225))

(declare-fun m!1371227 () Bool)

(assert (=> b!1485885 m!1371227))

(declare-fun m!1371229 () Bool)

(assert (=> b!1485895 m!1371229))

(assert (=> b!1485880 m!1371227))

(assert (=> b!1485880 m!1371227))

(declare-fun m!1371231 () Bool)

(assert (=> b!1485880 m!1371231))

(declare-fun m!1371233 () Bool)

(assert (=> b!1485893 m!1371233))

(assert (=> b!1485893 m!1371233))

(declare-fun m!1371235 () Bool)

(assert (=> b!1485893 m!1371235))

(declare-fun m!1371237 () Bool)

(assert (=> b!1485893 m!1371237))

(declare-fun m!1371239 () Bool)

(assert (=> b!1485893 m!1371239))

(assert (=> b!1485892 m!1371237))

(declare-fun m!1371241 () Bool)

(assert (=> b!1485892 m!1371241))

(assert (=> b!1485894 m!1371221))

(assert (=> b!1485894 m!1371219))

(assert (=> b!1485898 m!1371227))

(assert (=> b!1485898 m!1371227))

(declare-fun m!1371243 () Bool)

(assert (=> b!1485898 m!1371243))

(assert (=> b!1485888 m!1371227))

(assert (=> b!1485888 m!1371227))

(declare-fun m!1371245 () Bool)

(assert (=> b!1485888 m!1371245))

(declare-fun m!1371247 () Bool)

(assert (=> b!1485882 m!1371247))

(assert (=> b!1485882 m!1371237))

(declare-fun m!1371249 () Bool)

(assert (=> b!1485882 m!1371249))

(declare-fun m!1371251 () Bool)

(assert (=> b!1485882 m!1371251))

(declare-fun m!1371253 () Bool)

(assert (=> b!1485882 m!1371253))

(assert (=> b!1485882 m!1371227))

(assert (=> b!1485887 m!1371251))

(assert (=> b!1485887 m!1371227))

(assert (=> b!1485887 m!1371237))

(assert (=> b!1485887 m!1371249))

(declare-fun m!1371255 () Bool)

(assert (=> b!1485896 m!1371255))

(assert (=> b!1485896 m!1371255))

(declare-fun m!1371257 () Bool)

(assert (=> b!1485896 m!1371257))

(assert (=> b!1485891 m!1371227))

(assert (=> b!1485891 m!1371227))

(declare-fun m!1371259 () Bool)

(assert (=> b!1485891 m!1371259))

(assert (=> b!1485891 m!1371259))

(assert (=> b!1485891 m!1371227))

(declare-fun m!1371261 () Bool)

(assert (=> b!1485891 m!1371261))

(check-sat (not b!1485882) (not b!1485880) (not b!1485890) (not b!1485894) (not start!126798) (not b!1485898) (not b!1485895) (not b!1485896) (not b!1485888) (not b!1485878) (not b!1485886) (not b!1485893) (not b!1485879) (not b!1485891))
(check-sat)
