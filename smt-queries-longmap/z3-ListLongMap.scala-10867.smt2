; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127650 () Bool)

(assert start!127650)

(declare-fun b!1499185 () Bool)

(declare-fun res!1019253 () Bool)

(declare-fun e!839651 () Bool)

(assert (=> b!1499185 (=> res!1019253 e!839651)))

(declare-fun e!839650 () Bool)

(assert (=> b!1499185 (= res!1019253 e!839650)))

(declare-fun c!139519 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1499185 (= c!139519 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-datatypes ((array!99951 0))(
  ( (array!99952 (arr!48235 (Array (_ BitVec 32) (_ BitVec 64))) (size!48786 (_ BitVec 32))) )
))
(declare-fun lt!653096 () array!99951)

(declare-datatypes ((SeekEntryResult!12372 0))(
  ( (MissingZero!12372 (index!51880 (_ BitVec 32))) (Found!12372 (index!51881 (_ BitVec 32))) (Intermediate!12372 (undefined!13184 Bool) (index!51882 (_ BitVec 32)) (x!133688 (_ BitVec 32))) (Undefined!12372) (MissingVacant!12372 (index!51883 (_ BitVec 32))) )
))
(declare-fun lt!653100 () SeekEntryResult!12372)

(declare-fun lt!653097 () (_ BitVec 64))

(declare-fun lt!653098 () (_ BitVec 32))

(declare-fun b!1499186 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99951 (_ BitVec 32)) SeekEntryResult!12372)

(assert (=> b!1499186 (= e!839650 (not (= lt!653100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653098 lt!653097 lt!653096 mask!2687))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!839648 () Bool)

(declare-fun b!1499187 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99951 (_ BitVec 32)) SeekEntryResult!12372)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99951 (_ BitVec 32)) SeekEntryResult!12372)

(assert (=> b!1499187 (= e!839648 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!653097 lt!653096 mask!2687) (seekEntryOrOpen!0 lt!653097 lt!653096 mask!2687)))))

(declare-fun b!1499188 () Bool)

(declare-fun res!1019240 () Bool)

(declare-fun e!839646 () Bool)

(assert (=> b!1499188 (=> (not res!1019240) (not e!839646))))

(declare-fun a!2862 () array!99951)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499188 (= res!1019240 (validKeyInArray!0 (select (arr!48235 a!2862) i!1006)))))

(declare-fun b!1499190 () Bool)

(declare-fun res!1019239 () Bool)

(assert (=> b!1499190 (=> (not res!1019239) (not e!839646))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1499190 (= res!1019239 (and (= (size!48786 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48786 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48786 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1499191 () Bool)

(assert (=> b!1499191 (= e!839650 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653098 intermediateAfterIndex!19 lt!653097 lt!653096 mask!2687) (seekEntryOrOpen!0 lt!653097 lt!653096 mask!2687))))))

(declare-fun b!1499192 () Bool)

(declare-fun e!839645 () Bool)

(declare-fun e!839644 () Bool)

(assert (=> b!1499192 (= e!839645 (not e!839644))))

(declare-fun res!1019242 () Bool)

(assert (=> b!1499192 (=> res!1019242 e!839644)))

(assert (=> b!1499192 (= res!1019242 (or (and (= (select (arr!48235 a!2862) index!646) (select (store (arr!48235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48235 a!2862) index!646) (select (arr!48235 a!2862) j!93))) (= (select (arr!48235 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!653099 () SeekEntryResult!12372)

(assert (=> b!1499192 (and (= lt!653099 (Found!12372 j!93)) (or (= (select (arr!48235 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48235 a!2862) intermediateBeforeIndex!19) (select (arr!48235 a!2862) j!93))))))

(assert (=> b!1499192 (= lt!653099 (seekEntryOrOpen!0 (select (arr!48235 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99951 (_ BitVec 32)) Bool)

(assert (=> b!1499192 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50117 0))(
  ( (Unit!50118) )
))
(declare-fun lt!653102 () Unit!50117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50117)

(assert (=> b!1499192 (= lt!653102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1499193 () Bool)

(declare-fun res!1019249 () Bool)

(assert (=> b!1499193 (=> (not res!1019249) (not e!839646))))

(declare-datatypes ((List!34723 0))(
  ( (Nil!34720) (Cons!34719 (h!36131 (_ BitVec 64)) (t!49409 List!34723)) )
))
(declare-fun arrayNoDuplicates!0 (array!99951 (_ BitVec 32) List!34723) Bool)

(assert (=> b!1499193 (= res!1019249 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34720))))

(declare-fun b!1499194 () Bool)

(declare-fun res!1019252 () Bool)

(assert (=> b!1499194 (=> (not res!1019252) (not e!839645))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1499194 (= res!1019252 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1499195 () Bool)

(assert (=> b!1499195 (= e!839651 true)))

(assert (=> b!1499195 (= lt!653099 (seekEntryOrOpen!0 lt!653097 lt!653096 mask!2687))))

(declare-fun lt!653103 () Unit!50117)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50117)

(assert (=> b!1499195 (= lt!653103 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!653098 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1499196 () Bool)

(declare-fun e!839652 () Bool)

(declare-fun e!839647 () Bool)

(assert (=> b!1499196 (= e!839652 e!839647)))

(declare-fun res!1019250 () Bool)

(assert (=> b!1499196 (=> (not res!1019250) (not e!839647))))

(declare-fun lt!653101 () SeekEntryResult!12372)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499196 (= res!1019250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48235 a!2862) j!93) mask!2687) (select (arr!48235 a!2862) j!93) a!2862 mask!2687) lt!653101))))

(assert (=> b!1499196 (= lt!653101 (Intermediate!12372 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1499197 () Bool)

(declare-fun res!1019243 () Bool)

(assert (=> b!1499197 (=> (not res!1019243) (not e!839647))))

(assert (=> b!1499197 (= res!1019243 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48235 a!2862) j!93) a!2862 mask!2687) lt!653101))))

(declare-fun b!1499198 () Bool)

(assert (=> b!1499198 (= e!839648 (= lt!653100 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!653097 lt!653096 mask!2687)))))

(declare-fun b!1499199 () Bool)

(assert (=> b!1499199 (= e!839646 e!839652)))

(declare-fun res!1019251 () Bool)

(assert (=> b!1499199 (=> (not res!1019251) (not e!839652))))

(assert (=> b!1499199 (= res!1019251 (= (select (store (arr!48235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1499199 (= lt!653096 (array!99952 (store (arr!48235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48786 a!2862)))))

(declare-fun b!1499200 () Bool)

(assert (=> b!1499200 (= e!839647 e!839645)))

(declare-fun res!1019254 () Bool)

(assert (=> b!1499200 (=> (not res!1019254) (not e!839645))))

(assert (=> b!1499200 (= res!1019254 (= lt!653100 (Intermediate!12372 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1499200 (= lt!653100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!653097 mask!2687) lt!653097 lt!653096 mask!2687))))

(assert (=> b!1499200 (= lt!653097 (select (store (arr!48235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1499201 () Bool)

(declare-fun res!1019238 () Bool)

(assert (=> b!1499201 (=> (not res!1019238) (not e!839646))))

(assert (=> b!1499201 (= res!1019238 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48786 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48786 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48786 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1499202 () Bool)

(assert (=> b!1499202 (= e!839644 e!839651)))

(declare-fun res!1019248 () Bool)

(assert (=> b!1499202 (=> res!1019248 e!839651)))

(assert (=> b!1499202 (= res!1019248 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!653098 #b00000000000000000000000000000000) (bvsge lt!653098 (size!48786 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499202 (= lt!653098 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1499203 () Bool)

(declare-fun res!1019246 () Bool)

(assert (=> b!1499203 (=> (not res!1019246) (not e!839645))))

(assert (=> b!1499203 (= res!1019246 e!839648)))

(declare-fun c!139518 () Bool)

(assert (=> b!1499203 (= c!139518 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1499189 () Bool)

(declare-fun res!1019241 () Bool)

(assert (=> b!1499189 (=> res!1019241 e!839651)))

(assert (=> b!1499189 (= res!1019241 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653098 (select (arr!48235 a!2862) j!93) a!2862 mask!2687) lt!653101)))))

(declare-fun res!1019247 () Bool)

(assert (=> start!127650 (=> (not res!1019247) (not e!839646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127650 (= res!1019247 (validMask!0 mask!2687))))

(assert (=> start!127650 e!839646))

(assert (=> start!127650 true))

(declare-fun array_inv!37516 (array!99951) Bool)

(assert (=> start!127650 (array_inv!37516 a!2862)))

(declare-fun b!1499204 () Bool)

(declare-fun res!1019255 () Bool)

(assert (=> b!1499204 (=> res!1019255 e!839651)))

(assert (=> b!1499204 (= res!1019255 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1499205 () Bool)

(declare-fun res!1019245 () Bool)

(assert (=> b!1499205 (=> (not res!1019245) (not e!839646))))

(assert (=> b!1499205 (= res!1019245 (validKeyInArray!0 (select (arr!48235 a!2862) j!93)))))

(declare-fun b!1499206 () Bool)

(declare-fun res!1019244 () Bool)

(assert (=> b!1499206 (=> (not res!1019244) (not e!839646))))

(assert (=> b!1499206 (= res!1019244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127650 res!1019247) b!1499190))

(assert (= (and b!1499190 res!1019239) b!1499188))

(assert (= (and b!1499188 res!1019240) b!1499205))

(assert (= (and b!1499205 res!1019245) b!1499206))

(assert (= (and b!1499206 res!1019244) b!1499193))

(assert (= (and b!1499193 res!1019249) b!1499201))

(assert (= (and b!1499201 res!1019238) b!1499199))

(assert (= (and b!1499199 res!1019251) b!1499196))

(assert (= (and b!1499196 res!1019250) b!1499197))

(assert (= (and b!1499197 res!1019243) b!1499200))

(assert (= (and b!1499200 res!1019254) b!1499203))

(assert (= (and b!1499203 c!139518) b!1499198))

(assert (= (and b!1499203 (not c!139518)) b!1499187))

(assert (= (and b!1499203 res!1019246) b!1499194))

(assert (= (and b!1499194 res!1019252) b!1499192))

(assert (= (and b!1499192 (not res!1019242)) b!1499202))

(assert (= (and b!1499202 (not res!1019248)) b!1499189))

(assert (= (and b!1499189 (not res!1019241)) b!1499185))

(assert (= (and b!1499185 c!139519) b!1499186))

(assert (= (and b!1499185 (not c!139519)) b!1499191))

(assert (= (and b!1499185 (not res!1019253)) b!1499204))

(assert (= (and b!1499204 (not res!1019255)) b!1499195))

(declare-fun m!1382277 () Bool)

(assert (=> b!1499188 m!1382277))

(assert (=> b!1499188 m!1382277))

(declare-fun m!1382279 () Bool)

(assert (=> b!1499188 m!1382279))

(declare-fun m!1382281 () Bool)

(assert (=> b!1499193 m!1382281))

(declare-fun m!1382283 () Bool)

(assert (=> b!1499186 m!1382283))

(declare-fun m!1382285 () Bool)

(assert (=> b!1499202 m!1382285))

(declare-fun m!1382287 () Bool)

(assert (=> b!1499206 m!1382287))

(declare-fun m!1382289 () Bool)

(assert (=> b!1499192 m!1382289))

(declare-fun m!1382291 () Bool)

(assert (=> b!1499192 m!1382291))

(declare-fun m!1382293 () Bool)

(assert (=> b!1499192 m!1382293))

(declare-fun m!1382295 () Bool)

(assert (=> b!1499192 m!1382295))

(declare-fun m!1382297 () Bool)

(assert (=> b!1499192 m!1382297))

(declare-fun m!1382299 () Bool)

(assert (=> b!1499192 m!1382299))

(declare-fun m!1382301 () Bool)

(assert (=> b!1499192 m!1382301))

(declare-fun m!1382303 () Bool)

(assert (=> b!1499192 m!1382303))

(assert (=> b!1499192 m!1382299))

(declare-fun m!1382305 () Bool)

(assert (=> b!1499191 m!1382305))

(declare-fun m!1382307 () Bool)

(assert (=> b!1499191 m!1382307))

(assert (=> b!1499195 m!1382307))

(declare-fun m!1382309 () Bool)

(assert (=> b!1499195 m!1382309))

(assert (=> b!1499189 m!1382299))

(assert (=> b!1499189 m!1382299))

(declare-fun m!1382311 () Bool)

(assert (=> b!1499189 m!1382311))

(assert (=> b!1499199 m!1382291))

(declare-fun m!1382313 () Bool)

(assert (=> b!1499199 m!1382313))

(declare-fun m!1382315 () Bool)

(assert (=> b!1499200 m!1382315))

(assert (=> b!1499200 m!1382315))

(declare-fun m!1382317 () Bool)

(assert (=> b!1499200 m!1382317))

(assert (=> b!1499200 m!1382291))

(declare-fun m!1382319 () Bool)

(assert (=> b!1499200 m!1382319))

(declare-fun m!1382321 () Bool)

(assert (=> start!127650 m!1382321))

(declare-fun m!1382323 () Bool)

(assert (=> start!127650 m!1382323))

(declare-fun m!1382325 () Bool)

(assert (=> b!1499198 m!1382325))

(declare-fun m!1382327 () Bool)

(assert (=> b!1499187 m!1382327))

(assert (=> b!1499187 m!1382307))

(assert (=> b!1499196 m!1382299))

(assert (=> b!1499196 m!1382299))

(declare-fun m!1382329 () Bool)

(assert (=> b!1499196 m!1382329))

(assert (=> b!1499196 m!1382329))

(assert (=> b!1499196 m!1382299))

(declare-fun m!1382331 () Bool)

(assert (=> b!1499196 m!1382331))

(assert (=> b!1499197 m!1382299))

(assert (=> b!1499197 m!1382299))

(declare-fun m!1382333 () Bool)

(assert (=> b!1499197 m!1382333))

(assert (=> b!1499205 m!1382299))

(assert (=> b!1499205 m!1382299))

(declare-fun m!1382335 () Bool)

(assert (=> b!1499205 m!1382335))

(check-sat (not b!1499197) (not b!1499206) (not b!1499187) (not b!1499198) (not b!1499193) (not b!1499189) (not start!127650) (not b!1499192) (not b!1499188) (not b!1499195) (not b!1499191) (not b!1499202) (not b!1499186) (not b!1499196) (not b!1499200) (not b!1499205))
(check-sat)
