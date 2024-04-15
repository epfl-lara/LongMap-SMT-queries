; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124996 () Bool)

(assert start!124996)

(declare-fun b!1454307 () Bool)

(declare-fun res!985269 () Bool)

(declare-fun e!818439 () Bool)

(assert (=> b!1454307 (=> (not res!985269) (not e!818439))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454307 (= res!985269 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454308 () Bool)

(declare-fun res!985266 () Bool)

(declare-fun e!818442 () Bool)

(assert (=> b!1454308 (=> (not res!985266) (not e!818442))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98422 0))(
  ( (array!98423 (arr!47500 (Array (_ BitVec 32) (_ BitVec 64))) (size!48052 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98422)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11777 0))(
  ( (MissingZero!11777 (index!49500 (_ BitVec 32))) (Found!11777 (index!49501 (_ BitVec 32))) (Intermediate!11777 (undefined!12589 Bool) (index!49502 (_ BitVec 32)) (x!131133 (_ BitVec 32))) (Undefined!11777) (MissingVacant!11777 (index!49503 (_ BitVec 32))) )
))
(declare-fun lt!637377 () SeekEntryResult!11777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11777)

(assert (=> b!1454308 (= res!985266 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!637377))))

(declare-fun b!1454309 () Bool)

(declare-fun res!985275 () Bool)

(declare-fun e!818445 () Bool)

(assert (=> b!1454309 (=> (not res!985275) (not e!818445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454309 (= res!985275 (validKeyInArray!0 (select (arr!47500 a!2862) j!93)))))

(declare-fun b!1454310 () Bool)

(assert (=> b!1454310 (= e!818442 e!818439)))

(declare-fun res!985259 () Bool)

(assert (=> b!1454310 (=> (not res!985259) (not e!818439))))

(declare-fun lt!637379 () SeekEntryResult!11777)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454310 (= res!985259 (= lt!637379 (Intermediate!11777 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637380 () array!98422)

(declare-fun lt!637382 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454310 (= lt!637379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637382 mask!2687) lt!637382 lt!637380 mask!2687))))

(assert (=> b!1454310 (= lt!637382 (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!637376 () SeekEntryResult!11777)

(declare-fun e!818437 () Bool)

(declare-fun b!1454311 () Bool)

(declare-fun lt!637378 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11777)

(assert (=> b!1454311 (= e!818437 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637378 intermediateAfterIndex!19 lt!637382 lt!637380 mask!2687) lt!637376)))))

(declare-fun b!1454312 () Bool)

(declare-fun res!985260 () Bool)

(assert (=> b!1454312 (=> (not res!985260) (not e!818445))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454312 (= res!985260 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48052 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48052 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48052 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454313 () Bool)

(declare-fun res!985263 () Bool)

(assert (=> b!1454313 (=> (not res!985263) (not e!818439))))

(declare-fun e!818444 () Bool)

(assert (=> b!1454313 (= res!985263 e!818444)))

(declare-fun c!134037 () Bool)

(assert (=> b!1454313 (= c!134037 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454314 () Bool)

(declare-fun res!985270 () Bool)

(assert (=> b!1454314 (=> (not res!985270) (not e!818445))))

(declare-datatypes ((List!34079 0))(
  ( (Nil!34076) (Cons!34075 (h!35425 (_ BitVec 64)) (t!48765 List!34079)) )
))
(declare-fun arrayNoDuplicates!0 (array!98422 (_ BitVec 32) List!34079) Bool)

(assert (=> b!1454314 (= res!985270 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34076))))

(declare-fun b!1454315 () Bool)

(declare-fun res!985262 () Bool)

(assert (=> b!1454315 (=> (not res!985262) (not e!818445))))

(assert (=> b!1454315 (= res!985262 (validKeyInArray!0 (select (arr!47500 a!2862) i!1006)))))

(declare-fun b!1454316 () Bool)

(assert (=> b!1454316 (= e!818444 (= lt!637379 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637382 lt!637380 mask!2687)))))

(declare-fun b!1454318 () Bool)

(declare-fun e!818441 () Bool)

(declare-fun e!818443 () Bool)

(assert (=> b!1454318 (= e!818441 e!818443)))

(declare-fun res!985271 () Bool)

(assert (=> b!1454318 (=> res!985271 e!818443)))

(assert (=> b!1454318 (= res!985271 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637378 #b00000000000000000000000000000000) (bvsge lt!637378 (size!48052 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454318 (= lt!637378 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454318 (= lt!637376 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637382 lt!637380 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11777)

(assert (=> b!1454318 (= lt!637376 (seekEntryOrOpen!0 lt!637382 lt!637380 mask!2687))))

(declare-fun b!1454319 () Bool)

(assert (=> b!1454319 (= e!818444 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637382 lt!637380 mask!2687) (seekEntryOrOpen!0 lt!637382 lt!637380 mask!2687)))))

(declare-fun b!1454320 () Bool)

(declare-fun e!818436 () Bool)

(assert (=> b!1454320 (= e!818436 (and (or (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) (select (arr!47500 a!2862) j!93))) (let ((bdg!53071 (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47500 a!2862) index!646) bdg!53071) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53071 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454321 () Bool)

(declare-fun e!818440 () Bool)

(assert (=> b!1454321 (= e!818445 e!818440)))

(declare-fun res!985268 () Bool)

(assert (=> b!1454321 (=> (not res!985268) (not e!818440))))

(assert (=> b!1454321 (= res!985268 (= (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454321 (= lt!637380 (array!98423 (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48052 a!2862)))))

(declare-fun b!1454322 () Bool)

(assert (=> b!1454322 (= e!818439 (not e!818441))))

(declare-fun res!985274 () Bool)

(assert (=> b!1454322 (=> res!985274 e!818441)))

(assert (=> b!1454322 (= res!985274 (or (and (= (select (arr!47500 a!2862) index!646) (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454322 e!818436))

(declare-fun res!985273 () Bool)

(assert (=> b!1454322 (=> (not res!985273) (not e!818436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98422 (_ BitVec 32)) Bool)

(assert (=> b!1454322 (= res!985273 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48891 0))(
  ( (Unit!48892) )
))
(declare-fun lt!637383 () Unit!48891)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48891)

(assert (=> b!1454322 (= lt!637383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454323 () Bool)

(assert (=> b!1454323 (= e!818443 true)))

(declare-fun lt!637381 () Bool)

(assert (=> b!1454323 (= lt!637381 e!818437)))

(declare-fun c!134038 () Bool)

(assert (=> b!1454323 (= c!134038 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454324 () Bool)

(assert (=> b!1454324 (= e!818437 (not (= lt!637379 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637378 lt!637382 lt!637380 mask!2687))))))

(declare-fun b!1454325 () Bool)

(declare-fun res!985265 () Bool)

(assert (=> b!1454325 (=> (not res!985265) (not e!818445))))

(assert (=> b!1454325 (= res!985265 (and (= (size!48052 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48052 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48052 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454317 () Bool)

(assert (=> b!1454317 (= e!818440 e!818442)))

(declare-fun res!985267 () Bool)

(assert (=> b!1454317 (=> (not res!985267) (not e!818442))))

(assert (=> b!1454317 (= res!985267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47500 a!2862) j!93) mask!2687) (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!637377))))

(assert (=> b!1454317 (= lt!637377 (Intermediate!11777 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!985261 () Bool)

(assert (=> start!124996 (=> (not res!985261) (not e!818445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124996 (= res!985261 (validMask!0 mask!2687))))

(assert (=> start!124996 e!818445))

(assert (=> start!124996 true))

(declare-fun array_inv!36733 (array!98422) Bool)

(assert (=> start!124996 (array_inv!36733 a!2862)))

(declare-fun b!1454326 () Bool)

(declare-fun res!985264 () Bool)

(assert (=> b!1454326 (=> (not res!985264) (not e!818445))))

(assert (=> b!1454326 (= res!985264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454327 () Bool)

(declare-fun res!985272 () Bool)

(assert (=> b!1454327 (=> res!985272 e!818443)))

(assert (=> b!1454327 (= res!985272 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637378 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!637377)))))

(declare-fun b!1454328 () Bool)

(declare-fun res!985276 () Bool)

(assert (=> b!1454328 (=> (not res!985276) (not e!818436))))

(assert (=> b!1454328 (= res!985276 (= (seekEntryOrOpen!0 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) (Found!11777 j!93)))))

(assert (= (and start!124996 res!985261) b!1454325))

(assert (= (and b!1454325 res!985265) b!1454315))

(assert (= (and b!1454315 res!985262) b!1454309))

(assert (= (and b!1454309 res!985275) b!1454326))

(assert (= (and b!1454326 res!985264) b!1454314))

(assert (= (and b!1454314 res!985270) b!1454312))

(assert (= (and b!1454312 res!985260) b!1454321))

(assert (= (and b!1454321 res!985268) b!1454317))

(assert (= (and b!1454317 res!985267) b!1454308))

(assert (= (and b!1454308 res!985266) b!1454310))

(assert (= (and b!1454310 res!985259) b!1454313))

(assert (= (and b!1454313 c!134037) b!1454316))

(assert (= (and b!1454313 (not c!134037)) b!1454319))

(assert (= (and b!1454313 res!985263) b!1454307))

(assert (= (and b!1454307 res!985269) b!1454322))

(assert (= (and b!1454322 res!985273) b!1454328))

(assert (= (and b!1454328 res!985276) b!1454320))

(assert (= (and b!1454322 (not res!985274)) b!1454318))

(assert (= (and b!1454318 (not res!985271)) b!1454327))

(assert (= (and b!1454327 (not res!985272)) b!1454323))

(assert (= (and b!1454323 c!134038) b!1454324))

(assert (= (and b!1454323 (not c!134038)) b!1454311))

(declare-fun m!1342161 () Bool)

(assert (=> b!1454308 m!1342161))

(assert (=> b!1454308 m!1342161))

(declare-fun m!1342163 () Bool)

(assert (=> b!1454308 m!1342163))

(declare-fun m!1342165 () Bool)

(assert (=> b!1454322 m!1342165))

(declare-fun m!1342167 () Bool)

(assert (=> b!1454322 m!1342167))

(declare-fun m!1342169 () Bool)

(assert (=> b!1454322 m!1342169))

(declare-fun m!1342171 () Bool)

(assert (=> b!1454322 m!1342171))

(declare-fun m!1342173 () Bool)

(assert (=> b!1454322 m!1342173))

(assert (=> b!1454322 m!1342161))

(declare-fun m!1342175 () Bool)

(assert (=> b!1454310 m!1342175))

(assert (=> b!1454310 m!1342175))

(declare-fun m!1342177 () Bool)

(assert (=> b!1454310 m!1342177))

(assert (=> b!1454310 m!1342167))

(declare-fun m!1342179 () Bool)

(assert (=> b!1454310 m!1342179))

(declare-fun m!1342181 () Bool)

(assert (=> b!1454314 m!1342181))

(assert (=> b!1454317 m!1342161))

(assert (=> b!1454317 m!1342161))

(declare-fun m!1342183 () Bool)

(assert (=> b!1454317 m!1342183))

(assert (=> b!1454317 m!1342183))

(assert (=> b!1454317 m!1342161))

(declare-fun m!1342185 () Bool)

(assert (=> b!1454317 m!1342185))

(declare-fun m!1342187 () Bool)

(assert (=> start!124996 m!1342187))

(declare-fun m!1342189 () Bool)

(assert (=> start!124996 m!1342189))

(declare-fun m!1342191 () Bool)

(assert (=> b!1454316 m!1342191))

(declare-fun m!1342193 () Bool)

(assert (=> b!1454311 m!1342193))

(assert (=> b!1454327 m!1342161))

(assert (=> b!1454327 m!1342161))

(declare-fun m!1342195 () Bool)

(assert (=> b!1454327 m!1342195))

(assert (=> b!1454328 m!1342161))

(assert (=> b!1454328 m!1342161))

(declare-fun m!1342197 () Bool)

(assert (=> b!1454328 m!1342197))

(declare-fun m!1342199 () Bool)

(assert (=> b!1454319 m!1342199))

(declare-fun m!1342201 () Bool)

(assert (=> b!1454319 m!1342201))

(assert (=> b!1454321 m!1342167))

(declare-fun m!1342203 () Bool)

(assert (=> b!1454321 m!1342203))

(declare-fun m!1342205 () Bool)

(assert (=> b!1454326 m!1342205))

(declare-fun m!1342207 () Bool)

(assert (=> b!1454315 m!1342207))

(assert (=> b!1454315 m!1342207))

(declare-fun m!1342209 () Bool)

(assert (=> b!1454315 m!1342209))

(assert (=> b!1454309 m!1342161))

(assert (=> b!1454309 m!1342161))

(declare-fun m!1342211 () Bool)

(assert (=> b!1454309 m!1342211))

(declare-fun m!1342213 () Bool)

(assert (=> b!1454318 m!1342213))

(assert (=> b!1454318 m!1342199))

(assert (=> b!1454318 m!1342201))

(assert (=> b!1454320 m!1342167))

(declare-fun m!1342215 () Bool)

(assert (=> b!1454320 m!1342215))

(assert (=> b!1454320 m!1342169))

(assert (=> b!1454320 m!1342171))

(assert (=> b!1454320 m!1342161))

(declare-fun m!1342217 () Bool)

(assert (=> b!1454324 m!1342217))

(check-sat (not b!1454316) (not b!1454317) (not b!1454311) (not b!1454328) (not b!1454324) (not b!1454319) (not b!1454322) (not b!1454326) (not b!1454327) (not b!1454309) (not b!1454308) (not b!1454314) (not b!1454310) (not start!124996) (not b!1454318) (not b!1454315))
(check-sat)
