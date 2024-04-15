; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125212 () Bool)

(assert start!125212)

(declare-fun b!1461264 () Bool)

(declare-fun res!990995 () Bool)

(declare-fun e!821514 () Bool)

(assert (=> b!1461264 (=> (not res!990995) (not e!821514))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98638 0))(
  ( (array!98639 (arr!47608 (Array (_ BitVec 32) (_ BitVec 64))) (size!48160 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98638)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11885 0))(
  ( (MissingZero!11885 (index!49932 (_ BitVec 32))) (Found!11885 (index!49933 (_ BitVec 32))) (Intermediate!11885 (undefined!12697 Bool) (index!49934 (_ BitVec 32)) (x!131529 (_ BitVec 32))) (Undefined!11885) (MissingVacant!11885 (index!49935 (_ BitVec 32))) )
))
(declare-fun lt!639904 () SeekEntryResult!11885)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11885)

(assert (=> b!1461264 (= res!990995 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639904))))

(declare-fun b!1461265 () Bool)

(declare-fun e!821505 () Bool)

(declare-fun e!821511 () Bool)

(assert (=> b!1461265 (= e!821505 e!821511)))

(declare-fun res!990994 () Bool)

(assert (=> b!1461265 (=> res!990994 e!821511)))

(declare-fun lt!639903 () (_ BitVec 32))

(assert (=> b!1461265 (= res!990994 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639903 #b00000000000000000000000000000000) (bvsge lt!639903 (size!48160 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461265 (= lt!639903 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461266 () Bool)

(assert (=> b!1461266 (= e!821511 true)))

(declare-fun lt!639907 () Bool)

(declare-fun e!821510 () Bool)

(assert (=> b!1461266 (= lt!639907 e!821510)))

(declare-fun c!134649 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461266 (= c!134649 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461267 () Bool)

(declare-fun res!991009 () Bool)

(declare-fun e!821509 () Bool)

(assert (=> b!1461267 (=> (not res!991009) (not e!821509))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461267 (= res!991009 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48160 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48160 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48160 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461268 () Bool)

(declare-fun lt!639908 () array!98638)

(declare-fun lt!639906 () (_ BitVec 64))

(declare-fun e!821512 () Bool)

(declare-fun lt!639905 () SeekEntryResult!11885)

(assert (=> b!1461268 (= e!821512 (= lt!639905 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639906 lt!639908 mask!2687)))))

(declare-fun b!1461269 () Bool)

(declare-fun e!821508 () Bool)

(assert (=> b!1461269 (= e!821508 e!821514)))

(declare-fun res!991006 () Bool)

(assert (=> b!1461269 (=> (not res!991006) (not e!821514))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461269 (= res!991006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47608 a!2862) j!93) mask!2687) (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639904))))

(assert (=> b!1461269 (= lt!639904 (Intermediate!11885 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461270 () Bool)

(declare-fun res!991002 () Bool)

(assert (=> b!1461270 (=> res!991002 e!821511)))

(assert (=> b!1461270 (= res!991002 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639903 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!639904)))))

(declare-fun b!1461271 () Bool)

(declare-fun res!990999 () Bool)

(assert (=> b!1461271 (=> (not res!990999) (not e!821509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461271 (= res!990999 (validKeyInArray!0 (select (arr!47608 a!2862) j!93)))))

(declare-fun b!1461272 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11885)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11885)

(assert (=> b!1461272 (= e!821510 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639903 intermediateAfterIndex!19 lt!639906 lt!639908 mask!2687) (seekEntryOrOpen!0 lt!639906 lt!639908 mask!2687))))))

(declare-fun b!1461273 () Bool)

(declare-fun e!821507 () Bool)

(assert (=> b!1461273 (= e!821507 (not e!821505))))

(declare-fun res!990992 () Bool)

(assert (=> b!1461273 (=> res!990992 e!821505)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461273 (= res!990992 (or (and (= (select (arr!47608 a!2862) index!646) (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47608 a!2862) index!646) (select (arr!47608 a!2862) j!93))) (= (select (arr!47608 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821513 () Bool)

(assert (=> b!1461273 e!821513))

(declare-fun res!990997 () Bool)

(assert (=> b!1461273 (=> (not res!990997) (not e!821513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98638 (_ BitVec 32)) Bool)

(assert (=> b!1461273 (= res!990997 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49107 0))(
  ( (Unit!49108) )
))
(declare-fun lt!639909 () Unit!49107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49107)

(assert (=> b!1461273 (= lt!639909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461274 () Bool)

(declare-fun res!991004 () Bool)

(assert (=> b!1461274 (=> (not res!991004) (not e!821509))))

(declare-datatypes ((List!34187 0))(
  ( (Nil!34184) (Cons!34183 (h!35533 (_ BitVec 64)) (t!48873 List!34187)) )
))
(declare-fun arrayNoDuplicates!0 (array!98638 (_ BitVec 32) List!34187) Bool)

(assert (=> b!1461274 (= res!991004 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34184))))

(declare-fun b!1461275 () Bool)

(assert (=> b!1461275 (= e!821509 e!821508)))

(declare-fun res!990993 () Bool)

(assert (=> b!1461275 (=> (not res!990993) (not e!821508))))

(assert (=> b!1461275 (= res!990993 (= (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461275 (= lt!639908 (array!98639 (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48160 a!2862)))))

(declare-fun b!1461276 () Bool)

(declare-fun res!991003 () Bool)

(assert (=> b!1461276 (=> (not res!991003) (not e!821507))))

(assert (=> b!1461276 (= res!991003 e!821512)))

(declare-fun c!134650 () Bool)

(assert (=> b!1461276 (= c!134650 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461277 () Bool)

(assert (=> b!1461277 (= e!821510 (not (= lt!639905 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639903 lt!639906 lt!639908 mask!2687))))))

(declare-fun b!1461278 () Bool)

(assert (=> b!1461278 (= e!821514 e!821507)))

(declare-fun res!991005 () Bool)

(assert (=> b!1461278 (=> (not res!991005) (not e!821507))))

(assert (=> b!1461278 (= res!991005 (= lt!639905 (Intermediate!11885 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461278 (= lt!639905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639906 mask!2687) lt!639906 lt!639908 mask!2687))))

(assert (=> b!1461278 (= lt!639906 (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!991000 () Bool)

(assert (=> start!125212 (=> (not res!991000) (not e!821509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125212 (= res!991000 (validMask!0 mask!2687))))

(assert (=> start!125212 e!821509))

(assert (=> start!125212 true))

(declare-fun array_inv!36841 (array!98638) Bool)

(assert (=> start!125212 (array_inv!36841 a!2862)))

(declare-fun b!1461279 () Bool)

(assert (=> b!1461279 (= e!821513 (or (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) (select (arr!47608 a!2862) j!93))))))

(declare-fun b!1461280 () Bool)

(declare-fun res!991007 () Bool)

(assert (=> b!1461280 (=> (not res!991007) (not e!821509))))

(assert (=> b!1461280 (= res!991007 (and (= (size!48160 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48160 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48160 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461281 () Bool)

(declare-fun res!990998 () Bool)

(assert (=> b!1461281 (=> (not res!990998) (not e!821509))))

(assert (=> b!1461281 (= res!990998 (validKeyInArray!0 (select (arr!47608 a!2862) i!1006)))))

(declare-fun b!1461282 () Bool)

(assert (=> b!1461282 (= e!821512 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639906 lt!639908 mask!2687) (seekEntryOrOpen!0 lt!639906 lt!639908 mask!2687)))))

(declare-fun b!1461283 () Bool)

(declare-fun res!990996 () Bool)

(assert (=> b!1461283 (=> (not res!990996) (not e!821507))))

(assert (=> b!1461283 (= res!990996 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461284 () Bool)

(declare-fun res!991001 () Bool)

(assert (=> b!1461284 (=> (not res!991001) (not e!821513))))

(assert (=> b!1461284 (= res!991001 (= (seekEntryOrOpen!0 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) (Found!11885 j!93)))))

(declare-fun b!1461285 () Bool)

(declare-fun res!991008 () Bool)

(assert (=> b!1461285 (=> (not res!991008) (not e!821509))))

(assert (=> b!1461285 (= res!991008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125212 res!991000) b!1461280))

(assert (= (and b!1461280 res!991007) b!1461281))

(assert (= (and b!1461281 res!990998) b!1461271))

(assert (= (and b!1461271 res!990999) b!1461285))

(assert (= (and b!1461285 res!991008) b!1461274))

(assert (= (and b!1461274 res!991004) b!1461267))

(assert (= (and b!1461267 res!991009) b!1461275))

(assert (= (and b!1461275 res!990993) b!1461269))

(assert (= (and b!1461269 res!991006) b!1461264))

(assert (= (and b!1461264 res!990995) b!1461278))

(assert (= (and b!1461278 res!991005) b!1461276))

(assert (= (and b!1461276 c!134650) b!1461268))

(assert (= (and b!1461276 (not c!134650)) b!1461282))

(assert (= (and b!1461276 res!991003) b!1461283))

(assert (= (and b!1461283 res!990996) b!1461273))

(assert (= (and b!1461273 res!990997) b!1461284))

(assert (= (and b!1461284 res!991001) b!1461279))

(assert (= (and b!1461273 (not res!990992)) b!1461265))

(assert (= (and b!1461265 (not res!990994)) b!1461270))

(assert (= (and b!1461270 (not res!991002)) b!1461266))

(assert (= (and b!1461266 c!134649) b!1461277))

(assert (= (and b!1461266 (not c!134649)) b!1461272))

(declare-fun m!1348359 () Bool)

(assert (=> start!125212 m!1348359))

(declare-fun m!1348361 () Bool)

(assert (=> start!125212 m!1348361))

(declare-fun m!1348363 () Bool)

(assert (=> b!1461275 m!1348363))

(declare-fun m!1348365 () Bool)

(assert (=> b!1461275 m!1348365))

(declare-fun m!1348367 () Bool)

(assert (=> b!1461264 m!1348367))

(assert (=> b!1461264 m!1348367))

(declare-fun m!1348369 () Bool)

(assert (=> b!1461264 m!1348369))

(assert (=> b!1461269 m!1348367))

(assert (=> b!1461269 m!1348367))

(declare-fun m!1348371 () Bool)

(assert (=> b!1461269 m!1348371))

(assert (=> b!1461269 m!1348371))

(assert (=> b!1461269 m!1348367))

(declare-fun m!1348373 () Bool)

(assert (=> b!1461269 m!1348373))

(declare-fun m!1348375 () Bool)

(assert (=> b!1461278 m!1348375))

(assert (=> b!1461278 m!1348375))

(declare-fun m!1348377 () Bool)

(assert (=> b!1461278 m!1348377))

(assert (=> b!1461278 m!1348363))

(declare-fun m!1348379 () Bool)

(assert (=> b!1461278 m!1348379))

(declare-fun m!1348381 () Bool)

(assert (=> b!1461285 m!1348381))

(declare-fun m!1348383 () Bool)

(assert (=> b!1461274 m!1348383))

(declare-fun m!1348385 () Bool)

(assert (=> b!1461279 m!1348385))

(assert (=> b!1461279 m!1348367))

(declare-fun m!1348387 () Bool)

(assert (=> b!1461272 m!1348387))

(declare-fun m!1348389 () Bool)

(assert (=> b!1461272 m!1348389))

(assert (=> b!1461271 m!1348367))

(assert (=> b!1461271 m!1348367))

(declare-fun m!1348391 () Bool)

(assert (=> b!1461271 m!1348391))

(assert (=> b!1461270 m!1348367))

(assert (=> b!1461270 m!1348367))

(declare-fun m!1348393 () Bool)

(assert (=> b!1461270 m!1348393))

(declare-fun m!1348395 () Bool)

(assert (=> b!1461281 m!1348395))

(assert (=> b!1461281 m!1348395))

(declare-fun m!1348397 () Bool)

(assert (=> b!1461281 m!1348397))

(declare-fun m!1348399 () Bool)

(assert (=> b!1461277 m!1348399))

(declare-fun m!1348401 () Bool)

(assert (=> b!1461265 m!1348401))

(assert (=> b!1461284 m!1348367))

(assert (=> b!1461284 m!1348367))

(declare-fun m!1348403 () Bool)

(assert (=> b!1461284 m!1348403))

(declare-fun m!1348405 () Bool)

(assert (=> b!1461282 m!1348405))

(assert (=> b!1461282 m!1348389))

(declare-fun m!1348407 () Bool)

(assert (=> b!1461273 m!1348407))

(assert (=> b!1461273 m!1348363))

(declare-fun m!1348409 () Bool)

(assert (=> b!1461273 m!1348409))

(declare-fun m!1348411 () Bool)

(assert (=> b!1461273 m!1348411))

(declare-fun m!1348413 () Bool)

(assert (=> b!1461273 m!1348413))

(assert (=> b!1461273 m!1348367))

(declare-fun m!1348415 () Bool)

(assert (=> b!1461268 m!1348415))

(check-sat (not b!1461272) (not b!1461277) (not b!1461269) (not b!1461273) (not b!1461284) (not b!1461274) (not start!125212) (not b!1461265) (not b!1461270) (not b!1461285) (not b!1461264) (not b!1461281) (not b!1461282) (not b!1461271) (not b!1461278) (not b!1461268))
(check-sat)
