; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125078 () Bool)

(assert start!125078)

(declare-fun b!1456218 () Bool)

(declare-fun res!986754 () Bool)

(declare-fun e!819339 () Bool)

(assert (=> b!1456218 (=> (not res!986754) (not e!819339))))

(declare-datatypes ((array!98526 0))(
  ( (array!98527 (arr!47551 (Array (_ BitVec 32) (_ BitVec 64))) (size!48101 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98526)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456218 (= res!986754 (validKeyInArray!0 (select (arr!47551 a!2862) j!93)))))

(declare-fun b!1456219 () Bool)

(declare-fun res!986756 () Bool)

(declare-fun e!819335 () Bool)

(assert (=> b!1456219 (=> (not res!986756) (not e!819335))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11803 0))(
  ( (MissingZero!11803 (index!49604 (_ BitVec 32))) (Found!11803 (index!49605 (_ BitVec 32))) (Intermediate!11803 (undefined!12615 Bool) (index!49606 (_ BitVec 32)) (x!131228 (_ BitVec 32))) (Undefined!11803) (MissingVacant!11803 (index!49607 (_ BitVec 32))) )
))
(declare-fun lt!638235 () SeekEntryResult!11803)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98526 (_ BitVec 32)) SeekEntryResult!11803)

(assert (=> b!1456219 (= res!986756 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638235))))

(declare-fun b!1456220 () Bool)

(declare-fun e!819336 () Bool)

(assert (=> b!1456220 (= e!819336 e!819335)))

(declare-fun res!986753 () Bool)

(assert (=> b!1456220 (=> (not res!986753) (not e!819335))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456220 (= res!986753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47551 a!2862) j!93) mask!2687) (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638235))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456220 (= lt!638235 (Intermediate!11803 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!638236 () (_ BitVec 64))

(declare-fun lt!638241 () array!98526)

(declare-fun b!1456221 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!819332 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98526 (_ BitVec 32)) SeekEntryResult!11803)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98526 (_ BitVec 32)) SeekEntryResult!11803)

(assert (=> b!1456221 (= e!819332 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638236 lt!638241 mask!2687) (seekEntryOrOpen!0 lt!638236 lt!638241 mask!2687)))))

(declare-fun b!1456222 () Bool)

(declare-fun res!986750 () Bool)

(assert (=> b!1456222 (=> (not res!986750) (not e!819339))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456222 (= res!986750 (validKeyInArray!0 (select (arr!47551 a!2862) i!1006)))))

(declare-fun e!819340 () Bool)

(declare-fun b!1456223 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456223 (= e!819340 (and (or (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) (select (arr!47551 a!2862) j!93))) (let ((bdg!53221 (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47551 a!2862) index!646) bdg!53221) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53221 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456224 () Bool)

(assert (=> b!1456224 (= e!819339 e!819336)))

(declare-fun res!986758 () Bool)

(assert (=> b!1456224 (=> (not res!986758) (not e!819336))))

(assert (=> b!1456224 (= res!986758 (= (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456224 (= lt!638241 (array!98527 (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48101 a!2862)))))

(declare-fun b!1456225 () Bool)

(declare-fun res!986751 () Bool)

(assert (=> b!1456225 (=> (not res!986751) (not e!819339))))

(declare-datatypes ((List!34052 0))(
  ( (Nil!34049) (Cons!34048 (h!35398 (_ BitVec 64)) (t!48746 List!34052)) )
))
(declare-fun arrayNoDuplicates!0 (array!98526 (_ BitVec 32) List!34052) Bool)

(assert (=> b!1456225 (= res!986751 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34049))))

(declare-fun b!1456226 () Bool)

(declare-fun e!819334 () Bool)

(declare-fun e!819333 () Bool)

(assert (=> b!1456226 (= e!819334 (not e!819333))))

(declare-fun res!986752 () Bool)

(assert (=> b!1456226 (=> res!986752 e!819333)))

(assert (=> b!1456226 (= res!986752 (or (and (= (select (arr!47551 a!2862) index!646) (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456226 e!819340))

(declare-fun res!986757 () Bool)

(assert (=> b!1456226 (=> (not res!986757) (not e!819340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98526 (_ BitVec 32)) Bool)

(assert (=> b!1456226 (= res!986757 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49102 0))(
  ( (Unit!49103) )
))
(declare-fun lt!638240 () Unit!49102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49102)

(assert (=> b!1456226 (= lt!638240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456228 () Bool)

(assert (=> b!1456228 (= e!819335 e!819334)))

(declare-fun res!986748 () Bool)

(assert (=> b!1456228 (=> (not res!986748) (not e!819334))))

(declare-fun lt!638239 () SeekEntryResult!11803)

(assert (=> b!1456228 (= res!986748 (= lt!638239 (Intermediate!11803 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456228 (= lt!638239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638236 mask!2687) lt!638236 lt!638241 mask!2687))))

(assert (=> b!1456228 (= lt!638236 (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456229 () Bool)

(declare-fun lt!638237 () SeekEntryResult!11803)

(declare-fun e!819341 () Bool)

(declare-fun lt!638234 () (_ BitVec 32))

(assert (=> b!1456229 (= e!819341 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 intermediateAfterIndex!19 lt!638236 lt!638241 mask!2687) lt!638237)))))

(declare-fun b!1456230 () Bool)

(declare-fun res!986747 () Bool)

(assert (=> b!1456230 (=> (not res!986747) (not e!819340))))

(assert (=> b!1456230 (= res!986747 (= (seekEntryOrOpen!0 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) (Found!11803 j!93)))))

(declare-fun b!1456231 () Bool)

(declare-fun e!819338 () Bool)

(assert (=> b!1456231 (= e!819333 e!819338)))

(declare-fun res!986741 () Bool)

(assert (=> b!1456231 (=> res!986741 e!819338)))

(assert (=> b!1456231 (= res!986741 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638234 #b00000000000000000000000000000000) (bvsge lt!638234 (size!48101 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456231 (= lt!638234 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456231 (= lt!638237 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638236 lt!638241 mask!2687))))

(assert (=> b!1456231 (= lt!638237 (seekEntryOrOpen!0 lt!638236 lt!638241 mask!2687))))

(declare-fun b!1456232 () Bool)

(declare-fun res!986744 () Bool)

(assert (=> b!1456232 (=> (not res!986744) (not e!819334))))

(assert (=> b!1456232 (= res!986744 e!819332)))

(declare-fun c!134250 () Bool)

(assert (=> b!1456232 (= c!134250 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456233 () Bool)

(declare-fun res!986742 () Bool)

(assert (=> b!1456233 (=> (not res!986742) (not e!819334))))

(assert (=> b!1456233 (= res!986742 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456234 () Bool)

(declare-fun res!986755 () Bool)

(assert (=> b!1456234 (=> res!986755 e!819338)))

(assert (=> b!1456234 (= res!986755 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638235)))))

(declare-fun b!1456235 () Bool)

(declare-fun res!986746 () Bool)

(assert (=> b!1456235 (=> (not res!986746) (not e!819339))))

(assert (=> b!1456235 (= res!986746 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48101 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48101 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48101 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456236 () Bool)

(assert (=> b!1456236 (= e!819332 (= lt!638239 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638236 lt!638241 mask!2687)))))

(declare-fun res!986743 () Bool)

(assert (=> start!125078 (=> (not res!986743) (not e!819339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125078 (= res!986743 (validMask!0 mask!2687))))

(assert (=> start!125078 e!819339))

(assert (=> start!125078 true))

(declare-fun array_inv!36579 (array!98526) Bool)

(assert (=> start!125078 (array_inv!36579 a!2862)))

(declare-fun b!1456227 () Bool)

(assert (=> b!1456227 (= e!819338 true)))

(declare-fun lt!638238 () Bool)

(assert (=> b!1456227 (= lt!638238 e!819341)))

(declare-fun c!134249 () Bool)

(assert (=> b!1456227 (= c!134249 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456237 () Bool)

(declare-fun res!986749 () Bool)

(assert (=> b!1456237 (=> (not res!986749) (not e!819339))))

(assert (=> b!1456237 (= res!986749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456238 () Bool)

(declare-fun res!986745 () Bool)

(assert (=> b!1456238 (=> (not res!986745) (not e!819339))))

(assert (=> b!1456238 (= res!986745 (and (= (size!48101 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48101 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48101 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456239 () Bool)

(assert (=> b!1456239 (= e!819341 (not (= lt!638239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 lt!638236 lt!638241 mask!2687))))))

(assert (= (and start!125078 res!986743) b!1456238))

(assert (= (and b!1456238 res!986745) b!1456222))

(assert (= (and b!1456222 res!986750) b!1456218))

(assert (= (and b!1456218 res!986754) b!1456237))

(assert (= (and b!1456237 res!986749) b!1456225))

(assert (= (and b!1456225 res!986751) b!1456235))

(assert (= (and b!1456235 res!986746) b!1456224))

(assert (= (and b!1456224 res!986758) b!1456220))

(assert (= (and b!1456220 res!986753) b!1456219))

(assert (= (and b!1456219 res!986756) b!1456228))

(assert (= (and b!1456228 res!986748) b!1456232))

(assert (= (and b!1456232 c!134250) b!1456236))

(assert (= (and b!1456232 (not c!134250)) b!1456221))

(assert (= (and b!1456232 res!986744) b!1456233))

(assert (= (and b!1456233 res!986742) b!1456226))

(assert (= (and b!1456226 res!986757) b!1456230))

(assert (= (and b!1456230 res!986747) b!1456223))

(assert (= (and b!1456226 (not res!986752)) b!1456231))

(assert (= (and b!1456231 (not res!986741)) b!1456234))

(assert (= (and b!1456234 (not res!986755)) b!1456227))

(assert (= (and b!1456227 c!134249) b!1456239))

(assert (= (and b!1456227 (not c!134249)) b!1456229))

(declare-fun m!1344345 () Bool)

(assert (=> b!1456224 m!1344345))

(declare-fun m!1344347 () Bool)

(assert (=> b!1456224 m!1344347))

(declare-fun m!1344349 () Bool)

(assert (=> b!1456228 m!1344349))

(assert (=> b!1456228 m!1344349))

(declare-fun m!1344351 () Bool)

(assert (=> b!1456228 m!1344351))

(assert (=> b!1456228 m!1344345))

(declare-fun m!1344353 () Bool)

(assert (=> b!1456228 m!1344353))

(assert (=> b!1456223 m!1344345))

(declare-fun m!1344355 () Bool)

(assert (=> b!1456223 m!1344355))

(declare-fun m!1344357 () Bool)

(assert (=> b!1456223 m!1344357))

(declare-fun m!1344359 () Bool)

(assert (=> b!1456223 m!1344359))

(declare-fun m!1344361 () Bool)

(assert (=> b!1456223 m!1344361))

(assert (=> b!1456234 m!1344361))

(assert (=> b!1456234 m!1344361))

(declare-fun m!1344363 () Bool)

(assert (=> b!1456234 m!1344363))

(declare-fun m!1344365 () Bool)

(assert (=> b!1456229 m!1344365))

(declare-fun m!1344367 () Bool)

(assert (=> start!125078 m!1344367))

(declare-fun m!1344369 () Bool)

(assert (=> start!125078 m!1344369))

(assert (=> b!1456218 m!1344361))

(assert (=> b!1456218 m!1344361))

(declare-fun m!1344371 () Bool)

(assert (=> b!1456218 m!1344371))

(assert (=> b!1456219 m!1344361))

(assert (=> b!1456219 m!1344361))

(declare-fun m!1344373 () Bool)

(assert (=> b!1456219 m!1344373))

(declare-fun m!1344375 () Bool)

(assert (=> b!1456236 m!1344375))

(declare-fun m!1344377 () Bool)

(assert (=> b!1456239 m!1344377))

(declare-fun m!1344379 () Bool)

(assert (=> b!1456237 m!1344379))

(declare-fun m!1344381 () Bool)

(assert (=> b!1456226 m!1344381))

(assert (=> b!1456226 m!1344345))

(assert (=> b!1456226 m!1344357))

(assert (=> b!1456226 m!1344359))

(declare-fun m!1344383 () Bool)

(assert (=> b!1456226 m!1344383))

(assert (=> b!1456226 m!1344361))

(declare-fun m!1344385 () Bool)

(assert (=> b!1456221 m!1344385))

(declare-fun m!1344387 () Bool)

(assert (=> b!1456221 m!1344387))

(declare-fun m!1344389 () Bool)

(assert (=> b!1456231 m!1344389))

(assert (=> b!1456231 m!1344385))

(assert (=> b!1456231 m!1344387))

(assert (=> b!1456220 m!1344361))

(assert (=> b!1456220 m!1344361))

(declare-fun m!1344391 () Bool)

(assert (=> b!1456220 m!1344391))

(assert (=> b!1456220 m!1344391))

(assert (=> b!1456220 m!1344361))

(declare-fun m!1344393 () Bool)

(assert (=> b!1456220 m!1344393))

(assert (=> b!1456230 m!1344361))

(assert (=> b!1456230 m!1344361))

(declare-fun m!1344395 () Bool)

(assert (=> b!1456230 m!1344395))

(declare-fun m!1344397 () Bool)

(assert (=> b!1456225 m!1344397))

(declare-fun m!1344399 () Bool)

(assert (=> b!1456222 m!1344399))

(assert (=> b!1456222 m!1344399))

(declare-fun m!1344401 () Bool)

(assert (=> b!1456222 m!1344401))

(push 1)

