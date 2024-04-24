; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127152 () Bool)

(assert start!127152)

(declare-fun b!1492118 () Bool)

(declare-fun e!836236 () Bool)

(declare-fun e!836233 () Bool)

(assert (=> b!1492118 (= e!836236 e!836233)))

(declare-fun res!1014304 () Bool)

(assert (=> b!1492118 (=> (not res!1014304) (not e!836233))))

(declare-datatypes ((SeekEntryResult!12285 0))(
  ( (MissingZero!12285 (index!51532 (_ BitVec 32))) (Found!12285 (index!51533 (_ BitVec 32))) (Intermediate!12285 (undefined!13097 Bool) (index!51534 (_ BitVec 32)) (x!133310 (_ BitVec 32))) (Undefined!12285) (MissingVacant!12285 (index!51535 (_ BitVec 32))) )
))
(declare-fun lt!650574 () SeekEntryResult!12285)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492118 (= res!1014304 (= lt!650574 (Intermediate!12285 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99763 0))(
  ( (array!99764 (arr!48148 (Array (_ BitVec 32) (_ BitVec 64))) (size!48699 (_ BitVec 32))) )
))
(declare-fun lt!650573 () array!99763)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650570 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492118 (= lt!650574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650570 mask!2687) lt!650570 lt!650573 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99763)

(assert (=> b!1492118 (= lt!650570 (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492119 () Bool)

(declare-fun res!1014307 () Bool)

(declare-fun e!836235 () Bool)

(assert (=> b!1492119 (=> (not res!1014307) (not e!836235))))

(declare-datatypes ((List!34636 0))(
  ( (Nil!34633) (Cons!34632 (h!36029 (_ BitVec 64)) (t!49322 List!34636)) )
))
(declare-fun arrayNoDuplicates!0 (array!99763 (_ BitVec 32) List!34636) Bool)

(assert (=> b!1492119 (= res!1014307 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34633))))

(declare-fun b!1492120 () Bool)

(declare-fun res!1014313 () Bool)

(assert (=> b!1492120 (=> (not res!1014313) (not e!836235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99763 (_ BitVec 32)) Bool)

(assert (=> b!1492120 (= res!1014313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!836232 () Bool)

(declare-fun b!1492121 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12285)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12285)

(assert (=> b!1492121 (= e!836232 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650570 lt!650573 mask!2687) (seekEntryOrOpen!0 lt!650570 lt!650573 mask!2687)))))

(declare-fun res!1014312 () Bool)

(assert (=> start!127152 (=> (not res!1014312) (not e!836235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127152 (= res!1014312 (validMask!0 mask!2687))))

(assert (=> start!127152 e!836235))

(assert (=> start!127152 true))

(declare-fun array_inv!37429 (array!99763) Bool)

(assert (=> start!127152 (array_inv!37429 a!2862)))

(declare-fun b!1492122 () Bool)

(declare-fun res!1014302 () Bool)

(assert (=> b!1492122 (=> (not res!1014302) (not e!836235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492122 (= res!1014302 (validKeyInArray!0 (select (arr!48148 a!2862) j!93)))))

(declare-fun b!1492123 () Bool)

(declare-fun e!836237 () Bool)

(assert (=> b!1492123 (= e!836237 true)))

(declare-fun lt!650575 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492123 (= lt!650575 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1492124 () Bool)

(declare-fun res!1014316 () Bool)

(assert (=> b!1492124 (=> (not res!1014316) (not e!836233))))

(assert (=> b!1492124 (= res!1014316 e!836232)))

(declare-fun c!138445 () Bool)

(assert (=> b!1492124 (= c!138445 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492125 () Bool)

(declare-fun e!836238 () Bool)

(assert (=> b!1492125 (= e!836238 e!836236)))

(declare-fun res!1014314 () Bool)

(assert (=> b!1492125 (=> (not res!1014314) (not e!836236))))

(declare-fun lt!650572 () SeekEntryResult!12285)

(assert (=> b!1492125 (= res!1014314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48148 a!2862) j!93) mask!2687) (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!650572))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492125 (= lt!650572 (Intermediate!12285 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492126 () Bool)

(declare-fun res!1014306 () Bool)

(assert (=> b!1492126 (=> (not res!1014306) (not e!836233))))

(assert (=> b!1492126 (= res!1014306 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492127 () Bool)

(assert (=> b!1492127 (= e!836232 (= lt!650574 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650570 lt!650573 mask!2687)))))

(declare-fun b!1492128 () Bool)

(declare-fun res!1014303 () Bool)

(assert (=> b!1492128 (=> (not res!1014303) (not e!836236))))

(assert (=> b!1492128 (= res!1014303 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!650572))))

(declare-fun b!1492129 () Bool)

(declare-fun e!836231 () Bool)

(assert (=> b!1492129 (= e!836231 (or (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) (select (arr!48148 a!2862) j!93))))))

(declare-fun b!1492130 () Bool)

(declare-fun res!1014315 () Bool)

(assert (=> b!1492130 (=> (not res!1014315) (not e!836235))))

(assert (=> b!1492130 (= res!1014315 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48699 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48699 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48699 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492131 () Bool)

(declare-fun res!1014308 () Bool)

(assert (=> b!1492131 (=> (not res!1014308) (not e!836231))))

(assert (=> b!1492131 (= res!1014308 (= (seekEntryOrOpen!0 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) (Found!12285 j!93)))))

(declare-fun b!1492132 () Bool)

(assert (=> b!1492132 (= e!836235 e!836238)))

(declare-fun res!1014317 () Bool)

(assert (=> b!1492132 (=> (not res!1014317) (not e!836238))))

(assert (=> b!1492132 (= res!1014317 (= (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492132 (= lt!650573 (array!99764 (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48699 a!2862)))))

(declare-fun b!1492133 () Bool)

(declare-fun res!1014309 () Bool)

(assert (=> b!1492133 (=> (not res!1014309) (not e!836235))))

(assert (=> b!1492133 (= res!1014309 (and (= (size!48699 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48699 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48699 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492134 () Bool)

(declare-fun res!1014305 () Bool)

(assert (=> b!1492134 (=> (not res!1014305) (not e!836235))))

(assert (=> b!1492134 (= res!1014305 (validKeyInArray!0 (select (arr!48148 a!2862) i!1006)))))

(declare-fun b!1492135 () Bool)

(assert (=> b!1492135 (= e!836233 (not e!836237))))

(declare-fun res!1014311 () Bool)

(assert (=> b!1492135 (=> res!1014311 e!836237)))

(assert (=> b!1492135 (= res!1014311 (or (and (= (select (arr!48148 a!2862) index!646) (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48148 a!2862) index!646) (select (arr!48148 a!2862) j!93))) (= (select (arr!48148 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492135 e!836231))

(declare-fun res!1014310 () Bool)

(assert (=> b!1492135 (=> (not res!1014310) (not e!836231))))

(assert (=> b!1492135 (= res!1014310 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49943 0))(
  ( (Unit!49944) )
))
(declare-fun lt!650571 () Unit!49943)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49943)

(assert (=> b!1492135 (= lt!650571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127152 res!1014312) b!1492133))

(assert (= (and b!1492133 res!1014309) b!1492134))

(assert (= (and b!1492134 res!1014305) b!1492122))

(assert (= (and b!1492122 res!1014302) b!1492120))

(assert (= (and b!1492120 res!1014313) b!1492119))

(assert (= (and b!1492119 res!1014307) b!1492130))

(assert (= (and b!1492130 res!1014315) b!1492132))

(assert (= (and b!1492132 res!1014317) b!1492125))

(assert (= (and b!1492125 res!1014314) b!1492128))

(assert (= (and b!1492128 res!1014303) b!1492118))

(assert (= (and b!1492118 res!1014304) b!1492124))

(assert (= (and b!1492124 c!138445) b!1492127))

(assert (= (and b!1492124 (not c!138445)) b!1492121))

(assert (= (and b!1492124 res!1014316) b!1492126))

(assert (= (and b!1492126 res!1014306) b!1492135))

(assert (= (and b!1492135 res!1014310) b!1492131))

(assert (= (and b!1492131 res!1014308) b!1492129))

(assert (= (and b!1492135 (not res!1014311)) b!1492123))

(declare-fun m!1376275 () Bool)

(assert (=> b!1492123 m!1376275))

(declare-fun m!1376277 () Bool)

(assert (=> b!1492121 m!1376277))

(declare-fun m!1376279 () Bool)

(assert (=> b!1492121 m!1376279))

(declare-fun m!1376281 () Bool)

(assert (=> b!1492127 m!1376281))

(declare-fun m!1376283 () Bool)

(assert (=> b!1492120 m!1376283))

(declare-fun m!1376285 () Bool)

(assert (=> b!1492128 m!1376285))

(assert (=> b!1492128 m!1376285))

(declare-fun m!1376287 () Bool)

(assert (=> b!1492128 m!1376287))

(assert (=> b!1492122 m!1376285))

(assert (=> b!1492122 m!1376285))

(declare-fun m!1376289 () Bool)

(assert (=> b!1492122 m!1376289))

(declare-fun m!1376291 () Bool)

(assert (=> b!1492119 m!1376291))

(declare-fun m!1376293 () Bool)

(assert (=> start!127152 m!1376293))

(declare-fun m!1376295 () Bool)

(assert (=> start!127152 m!1376295))

(assert (=> b!1492125 m!1376285))

(assert (=> b!1492125 m!1376285))

(declare-fun m!1376297 () Bool)

(assert (=> b!1492125 m!1376297))

(assert (=> b!1492125 m!1376297))

(assert (=> b!1492125 m!1376285))

(declare-fun m!1376299 () Bool)

(assert (=> b!1492125 m!1376299))

(declare-fun m!1376301 () Bool)

(assert (=> b!1492118 m!1376301))

(assert (=> b!1492118 m!1376301))

(declare-fun m!1376303 () Bool)

(assert (=> b!1492118 m!1376303))

(declare-fun m!1376305 () Bool)

(assert (=> b!1492118 m!1376305))

(declare-fun m!1376307 () Bool)

(assert (=> b!1492118 m!1376307))

(declare-fun m!1376309 () Bool)

(assert (=> b!1492135 m!1376309))

(assert (=> b!1492135 m!1376305))

(declare-fun m!1376311 () Bool)

(assert (=> b!1492135 m!1376311))

(declare-fun m!1376313 () Bool)

(assert (=> b!1492135 m!1376313))

(declare-fun m!1376315 () Bool)

(assert (=> b!1492135 m!1376315))

(assert (=> b!1492135 m!1376285))

(declare-fun m!1376317 () Bool)

(assert (=> b!1492129 m!1376317))

(assert (=> b!1492129 m!1376285))

(assert (=> b!1492131 m!1376285))

(assert (=> b!1492131 m!1376285))

(declare-fun m!1376319 () Bool)

(assert (=> b!1492131 m!1376319))

(declare-fun m!1376321 () Bool)

(assert (=> b!1492134 m!1376321))

(assert (=> b!1492134 m!1376321))

(declare-fun m!1376323 () Bool)

(assert (=> b!1492134 m!1376323))

(assert (=> b!1492132 m!1376305))

(declare-fun m!1376325 () Bool)

(assert (=> b!1492132 m!1376325))

(check-sat (not start!127152) (not b!1492131) (not b!1492128) (not b!1492118) (not b!1492123) (not b!1492125) (not b!1492134) (not b!1492119) (not b!1492127) (not b!1492135) (not b!1492122) (not b!1492120) (not b!1492121))
(check-sat)
