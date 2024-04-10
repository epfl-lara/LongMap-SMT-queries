; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126642 () Bool)

(assert start!126642)

(declare-fun b!1486315 () Bool)

(declare-fun res!1010682 () Bool)

(declare-fun e!833221 () Bool)

(assert (=> b!1486315 (=> (not res!1010682) (not e!833221))))

(declare-datatypes ((array!99541 0))(
  ( (array!99542 (arr!48045 (Array (_ BitVec 32) (_ BitVec 64))) (size!48595 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99541)

(declare-datatypes ((List!34546 0))(
  ( (Nil!34543) (Cons!34542 (h!35919 (_ BitVec 64)) (t!49240 List!34546)) )
))
(declare-fun arrayNoDuplicates!0 (array!99541 (_ BitVec 32) List!34546) Bool)

(assert (=> b!1486315 (= res!1010682 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34543))))

(declare-fun b!1486316 () Bool)

(declare-fun res!1010683 () Bool)

(declare-fun e!833219 () Bool)

(assert (=> b!1486316 (=> (not res!1010683) (not e!833219))))

(declare-fun e!833222 () Bool)

(assert (=> b!1486316 (= res!1010683 e!833222)))

(declare-fun c!137343 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486316 (= c!137343 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486317 () Bool)

(declare-fun e!833217 () Bool)

(declare-fun e!833214 () Bool)

(assert (=> b!1486317 (= e!833217 e!833214)))

(declare-fun res!1010693 () Bool)

(assert (=> b!1486317 (=> res!1010693 e!833214)))

(declare-fun lt!648426 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486317 (= res!1010693 (or (and (= (select (arr!48045 a!2862) index!646) lt!648426) (= (select (arr!48045 a!2862) index!646) (select (arr!48045 a!2862) j!93))) (= (select (arr!48045 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486317 (= lt!648426 (select (store (arr!48045 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486318 () Bool)

(declare-fun res!1010688 () Bool)

(assert (=> b!1486318 (=> (not res!1010688) (not e!833219))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486318 (= res!1010688 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!648427 () array!99541)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1486319 () Bool)

(declare-datatypes ((SeekEntryResult!12285 0))(
  ( (MissingZero!12285 (index!51532 (_ BitVec 32))) (Found!12285 (index!51533 (_ BitVec 32))) (Intermediate!12285 (undefined!13097 Bool) (index!51534 (_ BitVec 32)) (x!133117 (_ BitVec 32))) (Undefined!12285) (MissingVacant!12285 (index!51535 (_ BitVec 32))) )
))
(declare-fun lt!648432 () SeekEntryResult!12285)

(declare-fun lt!648430 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12285)

(assert (=> b!1486319 (= e!833222 (= lt!648432 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648430 lt!648427 mask!2687)))))

(declare-fun b!1486320 () Bool)

(declare-fun e!833220 () Bool)

(assert (=> b!1486320 (= e!833221 e!833220)))

(declare-fun res!1010691 () Bool)

(assert (=> b!1486320 (=> (not res!1010691) (not e!833220))))

(assert (=> b!1486320 (= res!1010691 (= (select (store (arr!48045 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486320 (= lt!648427 (array!99542 (store (arr!48045 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48595 a!2862)))))

(declare-fun b!1486321 () Bool)

(declare-fun e!833218 () Bool)

(assert (=> b!1486321 (= e!833214 e!833218)))

(declare-fun res!1010692 () Bool)

(assert (=> b!1486321 (=> (not res!1010692) (not e!833218))))

(assert (=> b!1486321 (= res!1010692 (and (= index!646 intermediateAfterIndex!19) (= lt!648426 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1010689 () Bool)

(assert (=> start!126642 (=> (not res!1010689) (not e!833221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126642 (= res!1010689 (validMask!0 mask!2687))))

(assert (=> start!126642 e!833221))

(assert (=> start!126642 true))

(declare-fun array_inv!37073 (array!99541) Bool)

(assert (=> start!126642 (array_inv!37073 a!2862)))

(declare-fun b!1486322 () Bool)

(declare-fun res!1010687 () Bool)

(assert (=> b!1486322 (=> (not res!1010687) (not e!833217))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486322 (= res!1010687 (or (= (select (arr!48045 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48045 a!2862) intermediateBeforeIndex!19) (select (arr!48045 a!2862) j!93))))))

(declare-fun b!1486323 () Bool)

(declare-fun res!1010690 () Bool)

(assert (=> b!1486323 (=> (not res!1010690) (not e!833221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99541 (_ BitVec 32)) Bool)

(assert (=> b!1486323 (= res!1010690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486324 () Bool)

(declare-fun e!833216 () Bool)

(assert (=> b!1486324 (= e!833216 true)))

(declare-fun lt!648431 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486324 (= lt!648431 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486325 () Bool)

(declare-fun res!1010679 () Bool)

(assert (=> b!1486325 (=> (not res!1010679) (not e!833221))))

(assert (=> b!1486325 (= res!1010679 (and (= (size!48595 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48595 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48595 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486326 () Bool)

(declare-fun e!833213 () Bool)

(assert (=> b!1486326 (= e!833213 e!833219)))

(declare-fun res!1010678 () Bool)

(assert (=> b!1486326 (=> (not res!1010678) (not e!833219))))

(assert (=> b!1486326 (= res!1010678 (= lt!648432 (Intermediate!12285 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486326 (= lt!648432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648430 mask!2687) lt!648430 lt!648427 mask!2687))))

(assert (=> b!1486326 (= lt!648430 (select (store (arr!48045 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486327 () Bool)

(declare-fun res!1010677 () Bool)

(assert (=> b!1486327 (=> (not res!1010677) (not e!833221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486327 (= res!1010677 (validKeyInArray!0 (select (arr!48045 a!2862) j!93)))))

(declare-fun b!1486328 () Bool)

(assert (=> b!1486328 (= e!833219 (not e!833216))))

(declare-fun res!1010680 () Bool)

(assert (=> b!1486328 (=> res!1010680 e!833216)))

(assert (=> b!1486328 (= res!1010680 (or (and (= (select (arr!48045 a!2862) index!646) (select (store (arr!48045 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48045 a!2862) index!646) (select (arr!48045 a!2862) j!93))) (= (select (arr!48045 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486328 e!833217))

(declare-fun res!1010694 () Bool)

(assert (=> b!1486328 (=> (not res!1010694) (not e!833217))))

(assert (=> b!1486328 (= res!1010694 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49910 0))(
  ( (Unit!49911) )
))
(declare-fun lt!648428 () Unit!49910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49910)

(assert (=> b!1486328 (= lt!648428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486329 () Bool)

(declare-fun res!1010695 () Bool)

(assert (=> b!1486329 (=> (not res!1010695) (not e!833221))))

(assert (=> b!1486329 (= res!1010695 (validKeyInArray!0 (select (arr!48045 a!2862) i!1006)))))

(declare-fun b!1486330 () Bool)

(declare-fun res!1010686 () Bool)

(assert (=> b!1486330 (=> (not res!1010686) (not e!833217))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12285)

(assert (=> b!1486330 (= res!1010686 (= (seekEntryOrOpen!0 (select (arr!48045 a!2862) j!93) a!2862 mask!2687) (Found!12285 j!93)))))

(declare-fun b!1486331 () Bool)

(declare-fun res!1010685 () Bool)

(assert (=> b!1486331 (=> (not res!1010685) (not e!833213))))

(declare-fun lt!648429 () SeekEntryResult!12285)

(assert (=> b!1486331 (= res!1010685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48045 a!2862) j!93) a!2862 mask!2687) lt!648429))))

(declare-fun b!1486332 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12285)

(assert (=> b!1486332 (= e!833222 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648430 lt!648427 mask!2687) (seekEntryOrOpen!0 lt!648430 lt!648427 mask!2687)))))

(declare-fun b!1486333 () Bool)

(assert (=> b!1486333 (= e!833220 e!833213)))

(declare-fun res!1010684 () Bool)

(assert (=> b!1486333 (=> (not res!1010684) (not e!833213))))

(assert (=> b!1486333 (= res!1010684 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48045 a!2862) j!93) mask!2687) (select (arr!48045 a!2862) j!93) a!2862 mask!2687) lt!648429))))

(assert (=> b!1486333 (= lt!648429 (Intermediate!12285 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486334 () Bool)

(assert (=> b!1486334 (= e!833218 (= (seekEntryOrOpen!0 lt!648430 lt!648427 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648430 lt!648427 mask!2687)))))

(declare-fun b!1486335 () Bool)

(declare-fun res!1010681 () Bool)

(assert (=> b!1486335 (=> (not res!1010681) (not e!833221))))

(assert (=> b!1486335 (= res!1010681 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48595 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48595 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48595 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126642 res!1010689) b!1486325))

(assert (= (and b!1486325 res!1010679) b!1486329))

(assert (= (and b!1486329 res!1010695) b!1486327))

(assert (= (and b!1486327 res!1010677) b!1486323))

(assert (= (and b!1486323 res!1010690) b!1486315))

(assert (= (and b!1486315 res!1010682) b!1486335))

(assert (= (and b!1486335 res!1010681) b!1486320))

(assert (= (and b!1486320 res!1010691) b!1486333))

(assert (= (and b!1486333 res!1010684) b!1486331))

(assert (= (and b!1486331 res!1010685) b!1486326))

(assert (= (and b!1486326 res!1010678) b!1486316))

(assert (= (and b!1486316 c!137343) b!1486319))

(assert (= (and b!1486316 (not c!137343)) b!1486332))

(assert (= (and b!1486316 res!1010683) b!1486318))

(assert (= (and b!1486318 res!1010688) b!1486328))

(assert (= (and b!1486328 res!1010694) b!1486330))

(assert (= (and b!1486330 res!1010686) b!1486322))

(assert (= (and b!1486322 res!1010687) b!1486317))

(assert (= (and b!1486317 (not res!1010693)) b!1486321))

(assert (= (and b!1486321 res!1010692) b!1486334))

(assert (= (and b!1486328 (not res!1010680)) b!1486324))

(declare-fun m!1371215 () Bool)

(assert (=> b!1486315 m!1371215))

(declare-fun m!1371217 () Bool)

(assert (=> b!1486328 m!1371217))

(declare-fun m!1371219 () Bool)

(assert (=> b!1486328 m!1371219))

(declare-fun m!1371221 () Bool)

(assert (=> b!1486328 m!1371221))

(declare-fun m!1371223 () Bool)

(assert (=> b!1486328 m!1371223))

(declare-fun m!1371225 () Bool)

(assert (=> b!1486328 m!1371225))

(declare-fun m!1371227 () Bool)

(assert (=> b!1486328 m!1371227))

(declare-fun m!1371229 () Bool)

(assert (=> b!1486323 m!1371229))

(declare-fun m!1371231 () Bool)

(assert (=> b!1486319 m!1371231))

(assert (=> b!1486320 m!1371219))

(declare-fun m!1371233 () Bool)

(assert (=> b!1486320 m!1371233))

(assert (=> b!1486333 m!1371227))

(assert (=> b!1486333 m!1371227))

(declare-fun m!1371235 () Bool)

(assert (=> b!1486333 m!1371235))

(assert (=> b!1486333 m!1371235))

(assert (=> b!1486333 m!1371227))

(declare-fun m!1371237 () Bool)

(assert (=> b!1486333 m!1371237))

(assert (=> b!1486331 m!1371227))

(assert (=> b!1486331 m!1371227))

(declare-fun m!1371239 () Bool)

(assert (=> b!1486331 m!1371239))

(declare-fun m!1371241 () Bool)

(assert (=> b!1486329 m!1371241))

(assert (=> b!1486329 m!1371241))

(declare-fun m!1371243 () Bool)

(assert (=> b!1486329 m!1371243))

(declare-fun m!1371245 () Bool)

(assert (=> b!1486324 m!1371245))

(assert (=> b!1486327 m!1371227))

(assert (=> b!1486327 m!1371227))

(declare-fun m!1371247 () Bool)

(assert (=> b!1486327 m!1371247))

(assert (=> b!1486317 m!1371223))

(assert (=> b!1486317 m!1371227))

(assert (=> b!1486317 m!1371219))

(assert (=> b!1486317 m!1371221))

(declare-fun m!1371249 () Bool)

(assert (=> start!126642 m!1371249))

(declare-fun m!1371251 () Bool)

(assert (=> start!126642 m!1371251))

(declare-fun m!1371253 () Bool)

(assert (=> b!1486326 m!1371253))

(assert (=> b!1486326 m!1371253))

(declare-fun m!1371255 () Bool)

(assert (=> b!1486326 m!1371255))

(assert (=> b!1486326 m!1371219))

(declare-fun m!1371257 () Bool)

(assert (=> b!1486326 m!1371257))

(assert (=> b!1486330 m!1371227))

(assert (=> b!1486330 m!1371227))

(declare-fun m!1371259 () Bool)

(assert (=> b!1486330 m!1371259))

(declare-fun m!1371261 () Bool)

(assert (=> b!1486332 m!1371261))

(declare-fun m!1371263 () Bool)

(assert (=> b!1486332 m!1371263))

(declare-fun m!1371265 () Bool)

(assert (=> b!1486322 m!1371265))

(assert (=> b!1486322 m!1371227))

(assert (=> b!1486334 m!1371263))

(assert (=> b!1486334 m!1371261))

(check-sat (not b!1486330) (not b!1486323) (not b!1486324) (not b!1486334) (not b!1486327) (not b!1486319) (not b!1486315) (not b!1486333) (not b!1486331) (not b!1486329) (not b!1486332) (not start!126642) (not b!1486326) (not b!1486328))
(check-sat)
