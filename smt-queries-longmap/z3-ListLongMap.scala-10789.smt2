; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126234 () Bool)

(assert start!126234)

(declare-fun lt!645977 () (_ BitVec 64))

(declare-fun b!1479304 () Bool)

(declare-fun e!829782 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99340 0))(
  ( (array!99341 (arr!47949 (Array (_ BitVec 32) (_ BitVec 64))) (size!48499 (_ BitVec 32))) )
))
(declare-fun lt!645974 () array!99340)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12189 0))(
  ( (MissingZero!12189 (index!51148 (_ BitVec 32))) (Found!12189 (index!51149 (_ BitVec 32))) (Intermediate!12189 (undefined!13001 Bool) (index!51150 (_ BitVec 32)) (x!132732 (_ BitVec 32))) (Undefined!12189) (MissingVacant!12189 (index!51151 (_ BitVec 32))) )
))
(declare-fun lt!645978 () SeekEntryResult!12189)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99340 (_ BitVec 32)) SeekEntryResult!12189)

(assert (=> b!1479304 (= e!829782 (= lt!645978 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645977 lt!645974 mask!2687)))))

(declare-fun b!1479305 () Bool)

(declare-fun e!829780 () Bool)

(declare-fun e!829786 () Bool)

(assert (=> b!1479305 (= e!829780 e!829786)))

(declare-fun res!1005236 () Bool)

(assert (=> b!1479305 (=> (not res!1005236) (not e!829786))))

(declare-fun lt!645972 () SeekEntryResult!12189)

(declare-fun a!2862 () array!99340)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479305 (= res!1005236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47949 a!2862) j!93) mask!2687) (select (arr!47949 a!2862) j!93) a!2862 mask!2687) lt!645972))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479305 (= lt!645972 (Intermediate!12189 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479306 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99340 (_ BitVec 32)) SeekEntryResult!12189)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99340 (_ BitVec 32)) SeekEntryResult!12189)

(assert (=> b!1479306 (= e!829782 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645977 lt!645974 mask!2687) (seekEntryOrOpen!0 lt!645977 lt!645974 mask!2687)))))

(declare-fun b!1479307 () Bool)

(declare-fun e!829785 () Bool)

(declare-fun e!829781 () Bool)

(assert (=> b!1479307 (= e!829785 e!829781)))

(declare-fun res!1005227 () Bool)

(assert (=> b!1479307 (=> res!1005227 e!829781)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479307 (= res!1005227 (or (and (= (select (arr!47949 a!2862) index!646) (select (store (arr!47949 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47949 a!2862) index!646) (select (arr!47949 a!2862) j!93))) (not (= (select (arr!47949 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479308 () Bool)

(declare-fun res!1005223 () Bool)

(declare-fun e!829779 () Bool)

(assert (=> b!1479308 (=> (not res!1005223) (not e!829779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99340 (_ BitVec 32)) Bool)

(assert (=> b!1479308 (= res!1005223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!645975 () SeekEntryResult!12189)

(declare-fun e!829778 () Bool)

(declare-fun b!1479309 () Bool)

(assert (=> b!1479309 (= e!829778 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47949 a!2862) j!93) a!2862 mask!2687) lt!645975))))

(declare-fun b!1479310 () Bool)

(declare-fun res!1005234 () Bool)

(declare-fun e!829784 () Bool)

(assert (=> b!1479310 (=> (not res!1005234) (not e!829784))))

(assert (=> b!1479310 (= res!1005234 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479311 () Bool)

(declare-fun res!1005230 () Bool)

(assert (=> b!1479311 (=> (not res!1005230) (not e!829779))))

(declare-datatypes ((List!34450 0))(
  ( (Nil!34447) (Cons!34446 (h!35814 (_ BitVec 64)) (t!49144 List!34450)) )
))
(declare-fun arrayNoDuplicates!0 (array!99340 (_ BitVec 32) List!34450) Bool)

(assert (=> b!1479311 (= res!1005230 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34447))))

(declare-fun b!1479312 () Bool)

(declare-fun res!1005237 () Bool)

(assert (=> b!1479312 (=> (not res!1005237) (not e!829779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479312 (= res!1005237 (validKeyInArray!0 (select (arr!47949 a!2862) j!93)))))

(declare-fun b!1479313 () Bool)

(declare-fun res!1005222 () Bool)

(assert (=> b!1479313 (=> (not res!1005222) (not e!829779))))

(assert (=> b!1479313 (= res!1005222 (and (= (size!48499 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48499 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48499 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479314 () Bool)

(assert (=> b!1479314 (= e!829786 e!829784)))

(declare-fun res!1005229 () Bool)

(assert (=> b!1479314 (=> (not res!1005229) (not e!829784))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479314 (= res!1005229 (= lt!645978 (Intermediate!12189 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479314 (= lt!645978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645977 mask!2687) lt!645977 lt!645974 mask!2687))))

(assert (=> b!1479314 (= lt!645977 (select (store (arr!47949 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479315 () Bool)

(assert (=> b!1479315 (= e!829779 e!829780)))

(declare-fun res!1005228 () Bool)

(assert (=> b!1479315 (=> (not res!1005228) (not e!829780))))

(assert (=> b!1479315 (= res!1005228 (= (select (store (arr!47949 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479315 (= lt!645974 (array!99341 (store (arr!47949 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48499 a!2862)))))

(declare-fun res!1005232 () Bool)

(assert (=> start!126234 (=> (not res!1005232) (not e!829779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126234 (= res!1005232 (validMask!0 mask!2687))))

(assert (=> start!126234 e!829779))

(assert (=> start!126234 true))

(declare-fun array_inv!36977 (array!99340) Bool)

(assert (=> start!126234 (array_inv!36977 a!2862)))

(declare-fun b!1479303 () Bool)

(declare-fun res!1005235 () Bool)

(assert (=> b!1479303 (=> (not res!1005235) (not e!829779))))

(assert (=> b!1479303 (= res!1005235 (validKeyInArray!0 (select (arr!47949 a!2862) i!1006)))))

(declare-fun b!1479316 () Bool)

(declare-fun res!1005231 () Bool)

(assert (=> b!1479316 (=> (not res!1005231) (not e!829786))))

(assert (=> b!1479316 (= res!1005231 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47949 a!2862) j!93) a!2862 mask!2687) lt!645972))))

(declare-fun b!1479317 () Bool)

(declare-fun e!829787 () Bool)

(assert (=> b!1479317 (= e!829781 e!829787)))

(declare-fun res!1005233 () Bool)

(assert (=> b!1479317 (=> (not res!1005233) (not e!829787))))

(declare-fun lt!645973 () SeekEntryResult!12189)

(assert (=> b!1479317 (= res!1005233 (= lt!645973 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47949 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479318 () Bool)

(declare-fun res!1005225 () Bool)

(assert (=> b!1479318 (=> (not res!1005225) (not e!829779))))

(assert (=> b!1479318 (= res!1005225 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48499 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48499 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48499 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479319 () Bool)

(assert (=> b!1479319 (= e!829787 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479320 () Bool)

(assert (=> b!1479320 (= e!829784 (not e!829778))))

(declare-fun res!1005224 () Bool)

(assert (=> b!1479320 (=> res!1005224 e!829778)))

(assert (=> b!1479320 (= res!1005224 (or (and (= (select (arr!47949 a!2862) index!646) (select (store (arr!47949 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47949 a!2862) index!646) (select (arr!47949 a!2862) j!93))) (not (= (select (arr!47949 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47949 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479320 e!829785))

(declare-fun res!1005226 () Bool)

(assert (=> b!1479320 (=> (not res!1005226) (not e!829785))))

(assert (=> b!1479320 (= res!1005226 (and (= lt!645973 lt!645975) (or (= (select (arr!47949 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47949 a!2862) intermediateBeforeIndex!19) (select (arr!47949 a!2862) j!93)))))))

(assert (=> b!1479320 (= lt!645975 (Found!12189 j!93))))

(assert (=> b!1479320 (= lt!645973 (seekEntryOrOpen!0 (select (arr!47949 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479320 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49718 0))(
  ( (Unit!49719) )
))
(declare-fun lt!645976 () Unit!49718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49718)

(assert (=> b!1479320 (= lt!645976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479321 () Bool)

(declare-fun res!1005238 () Bool)

(assert (=> b!1479321 (=> (not res!1005238) (not e!829784))))

(assert (=> b!1479321 (= res!1005238 e!829782)))

(declare-fun c!136560 () Bool)

(assert (=> b!1479321 (= c!136560 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126234 res!1005232) b!1479313))

(assert (= (and b!1479313 res!1005222) b!1479303))

(assert (= (and b!1479303 res!1005235) b!1479312))

(assert (= (and b!1479312 res!1005237) b!1479308))

(assert (= (and b!1479308 res!1005223) b!1479311))

(assert (= (and b!1479311 res!1005230) b!1479318))

(assert (= (and b!1479318 res!1005225) b!1479315))

(assert (= (and b!1479315 res!1005228) b!1479305))

(assert (= (and b!1479305 res!1005236) b!1479316))

(assert (= (and b!1479316 res!1005231) b!1479314))

(assert (= (and b!1479314 res!1005229) b!1479321))

(assert (= (and b!1479321 c!136560) b!1479304))

(assert (= (and b!1479321 (not c!136560)) b!1479306))

(assert (= (and b!1479321 res!1005238) b!1479310))

(assert (= (and b!1479310 res!1005234) b!1479320))

(assert (= (and b!1479320 res!1005226) b!1479307))

(assert (= (and b!1479307 (not res!1005227)) b!1479317))

(assert (= (and b!1479317 res!1005233) b!1479319))

(assert (= (and b!1479320 (not res!1005224)) b!1479309))

(declare-fun m!1365181 () Bool)

(assert (=> b!1479320 m!1365181))

(declare-fun m!1365183 () Bool)

(assert (=> b!1479320 m!1365183))

(declare-fun m!1365185 () Bool)

(assert (=> b!1479320 m!1365185))

(declare-fun m!1365187 () Bool)

(assert (=> b!1479320 m!1365187))

(declare-fun m!1365189 () Bool)

(assert (=> b!1479320 m!1365189))

(declare-fun m!1365191 () Bool)

(assert (=> b!1479320 m!1365191))

(declare-fun m!1365193 () Bool)

(assert (=> b!1479320 m!1365193))

(declare-fun m!1365195 () Bool)

(assert (=> b!1479320 m!1365195))

(assert (=> b!1479320 m!1365191))

(assert (=> b!1479316 m!1365191))

(assert (=> b!1479316 m!1365191))

(declare-fun m!1365197 () Bool)

(assert (=> b!1479316 m!1365197))

(assert (=> b!1479315 m!1365183))

(declare-fun m!1365199 () Bool)

(assert (=> b!1479315 m!1365199))

(declare-fun m!1365201 () Bool)

(assert (=> b!1479303 m!1365201))

(assert (=> b!1479303 m!1365201))

(declare-fun m!1365203 () Bool)

(assert (=> b!1479303 m!1365203))

(assert (=> b!1479317 m!1365191))

(assert (=> b!1479317 m!1365191))

(declare-fun m!1365205 () Bool)

(assert (=> b!1479317 m!1365205))

(assert (=> b!1479305 m!1365191))

(assert (=> b!1479305 m!1365191))

(declare-fun m!1365207 () Bool)

(assert (=> b!1479305 m!1365207))

(assert (=> b!1479305 m!1365207))

(assert (=> b!1479305 m!1365191))

(declare-fun m!1365209 () Bool)

(assert (=> b!1479305 m!1365209))

(declare-fun m!1365211 () Bool)

(assert (=> b!1479314 m!1365211))

(assert (=> b!1479314 m!1365211))

(declare-fun m!1365213 () Bool)

(assert (=> b!1479314 m!1365213))

(assert (=> b!1479314 m!1365183))

(declare-fun m!1365215 () Bool)

(assert (=> b!1479314 m!1365215))

(assert (=> b!1479312 m!1365191))

(assert (=> b!1479312 m!1365191))

(declare-fun m!1365217 () Bool)

(assert (=> b!1479312 m!1365217))

(declare-fun m!1365219 () Bool)

(assert (=> b!1479308 m!1365219))

(declare-fun m!1365221 () Bool)

(assert (=> b!1479311 m!1365221))

(declare-fun m!1365223 () Bool)

(assert (=> b!1479304 m!1365223))

(declare-fun m!1365225 () Bool)

(assert (=> b!1479306 m!1365225))

(declare-fun m!1365227 () Bool)

(assert (=> b!1479306 m!1365227))

(declare-fun m!1365229 () Bool)

(assert (=> start!126234 m!1365229))

(declare-fun m!1365231 () Bool)

(assert (=> start!126234 m!1365231))

(assert (=> b!1479307 m!1365189))

(assert (=> b!1479307 m!1365183))

(assert (=> b!1479307 m!1365187))

(assert (=> b!1479307 m!1365191))

(assert (=> b!1479309 m!1365191))

(assert (=> b!1479309 m!1365191))

(declare-fun m!1365233 () Bool)

(assert (=> b!1479309 m!1365233))

(check-sat (not b!1479306) (not b!1479314) (not b!1479308) (not b!1479320) (not b!1479317) (not b!1479305) (not b!1479316) (not b!1479303) (not b!1479312) (not start!126234) (not b!1479304) (not b!1479311) (not b!1479309))
(check-sat)
