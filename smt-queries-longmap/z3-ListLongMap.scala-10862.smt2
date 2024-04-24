; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127620 () Bool)

(assert start!127620)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99921 0))(
  ( (array!99922 (arr!48220 (Array (_ BitVec 32) (_ BitVec 64))) (size!48771 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99921)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!839239 () Bool)

(declare-fun b!1498188 () Bool)

(assert (=> b!1498188 (= e!839239 (or (= (select (arr!48220 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48220 a!2862) intermediateBeforeIndex!19) (select (arr!48220 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!839237 () Bool)

(declare-fun lt!652753 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!652755 () array!99921)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1498189 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12357 0))(
  ( (MissingZero!12357 (index!51820 (_ BitVec 32))) (Found!12357 (index!51821 (_ BitVec 32))) (Intermediate!12357 (undefined!13169 Bool) (index!51822 (_ BitVec 32)) (x!133633 (_ BitVec 32))) (Undefined!12357) (MissingVacant!12357 (index!51823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99921 (_ BitVec 32)) SeekEntryResult!12357)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99921 (_ BitVec 32)) SeekEntryResult!12357)

(assert (=> b!1498189 (= e!839237 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652753 lt!652755 mask!2687) (seekEntryOrOpen!0 lt!652753 lt!652755 mask!2687)))))

(declare-fun b!1498190 () Bool)

(declare-fun e!839238 () Bool)

(declare-fun e!839233 () Bool)

(assert (=> b!1498190 (= e!839238 (not e!839233))))

(declare-fun res!1018439 () Bool)

(assert (=> b!1498190 (=> res!1018439 e!839233)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1498190 (= res!1018439 (or (and (= (select (arr!48220 a!2862) index!646) (select (store (arr!48220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48220 a!2862) index!646) (select (arr!48220 a!2862) j!93))) (= (select (arr!48220 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1498190 e!839239))

(declare-fun res!1018421 () Bool)

(assert (=> b!1498190 (=> (not res!1018421) (not e!839239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99921 (_ BitVec 32)) Bool)

(assert (=> b!1498190 (= res!1018421 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50087 0))(
  ( (Unit!50088) )
))
(declare-fun lt!652751 () Unit!50087)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50087)

(assert (=> b!1498190 (= lt!652751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498191 () Bool)

(declare-fun res!1018430 () Bool)

(assert (=> b!1498191 (=> (not res!1018430) (not e!839238))))

(assert (=> b!1498191 (= res!1018430 e!839237)))

(declare-fun c!139428 () Bool)

(assert (=> b!1498191 (= c!139428 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1498192 () Bool)

(declare-fun res!1018426 () Bool)

(declare-fun e!839232 () Bool)

(assert (=> b!1498192 (=> (not res!1018426) (not e!839232))))

(declare-fun lt!652754 () SeekEntryResult!12357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99921 (_ BitVec 32)) SeekEntryResult!12357)

(assert (=> b!1498192 (= res!1018426 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48220 a!2862) j!93) a!2862 mask!2687) lt!652754))))

(declare-fun b!1498193 () Bool)

(declare-fun res!1018433 () Bool)

(assert (=> b!1498193 (=> (not res!1018433) (not e!839239))))

(assert (=> b!1498193 (= res!1018433 (= (seekEntryOrOpen!0 (select (arr!48220 a!2862) j!93) a!2862 mask!2687) (Found!12357 j!93)))))

(declare-fun b!1498194 () Bool)

(declare-fun e!839235 () Bool)

(assert (=> b!1498194 (= e!839233 e!839235)))

(declare-fun res!1018431 () Bool)

(assert (=> b!1498194 (=> res!1018431 e!839235)))

(declare-fun lt!652750 () (_ BitVec 32))

(assert (=> b!1498194 (= res!1018431 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652750 #b00000000000000000000000000000000) (bvsge lt!652750 (size!48771 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498194 (= lt!652750 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1498195 () Bool)

(declare-fun res!1018429 () Bool)

(declare-fun e!839241 () Bool)

(assert (=> b!1498195 (=> (not res!1018429) (not e!839241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498195 (= res!1018429 (validKeyInArray!0 (select (arr!48220 a!2862) i!1006)))))

(declare-fun b!1498196 () Bool)

(declare-fun res!1018438 () Bool)

(assert (=> b!1498196 (=> res!1018438 e!839235)))

(assert (=> b!1498196 (= res!1018438 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652750 (select (arr!48220 a!2862) j!93) a!2862 mask!2687) lt!652754)))))

(declare-fun b!1498197 () Bool)

(declare-fun res!1018422 () Bool)

(assert (=> b!1498197 (=> (not res!1018422) (not e!839241))))

(declare-datatypes ((List!34708 0))(
  ( (Nil!34705) (Cons!34704 (h!36116 (_ BitVec 64)) (t!49394 List!34708)) )
))
(declare-fun arrayNoDuplicates!0 (array!99921 (_ BitVec 32) List!34708) Bool)

(assert (=> b!1498197 (= res!1018422 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34705))))

(declare-fun b!1498198 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1498198 (= e!839235 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun res!1018424 () Bool)

(assert (=> start!127620 (=> (not res!1018424) (not e!839241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127620 (= res!1018424 (validMask!0 mask!2687))))

(assert (=> start!127620 e!839241))

(assert (=> start!127620 true))

(declare-fun array_inv!37501 (array!99921) Bool)

(assert (=> start!127620 (array_inv!37501 a!2862)))

(declare-fun b!1498199 () Bool)

(declare-fun res!1018437 () Bool)

(assert (=> b!1498199 (=> (not res!1018437) (not e!839241))))

(assert (=> b!1498199 (= res!1018437 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48771 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48771 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48771 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1498200 () Bool)

(declare-fun e!839240 () Bool)

(assert (=> b!1498200 (= e!839240 e!839232)))

(declare-fun res!1018436 () Bool)

(assert (=> b!1498200 (=> (not res!1018436) (not e!839232))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498200 (= res!1018436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48220 a!2862) j!93) mask!2687) (select (arr!48220 a!2862) j!93) a!2862 mask!2687) lt!652754))))

(assert (=> b!1498200 (= lt!652754 (Intermediate!12357 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1498201 () Bool)

(declare-fun res!1018428 () Bool)

(assert (=> b!1498201 (=> (not res!1018428) (not e!839238))))

(assert (=> b!1498201 (= res!1018428 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1498202 () Bool)

(assert (=> b!1498202 (= e!839241 e!839240)))

(declare-fun res!1018434 () Bool)

(assert (=> b!1498202 (=> (not res!1018434) (not e!839240))))

(assert (=> b!1498202 (= res!1018434 (= (select (store (arr!48220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1498202 (= lt!652755 (array!99922 (store (arr!48220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48771 a!2862)))))

(declare-fun b!1498203 () Bool)

(declare-fun res!1018435 () Bool)

(assert (=> b!1498203 (=> (not res!1018435) (not e!839241))))

(assert (=> b!1498203 (= res!1018435 (and (= (size!48771 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48771 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48771 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!839236 () Bool)

(declare-fun b!1498204 () Bool)

(assert (=> b!1498204 (= e!839236 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652750 intermediateAfterIndex!19 lt!652753 lt!652755 mask!2687) (seekEntryOrOpen!0 lt!652753 lt!652755 mask!2687))))))

(declare-fun b!1498205 () Bool)

(declare-fun lt!652752 () SeekEntryResult!12357)

(assert (=> b!1498205 (= e!839237 (= lt!652752 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652753 lt!652755 mask!2687)))))

(declare-fun b!1498206 () Bool)

(declare-fun res!1018432 () Bool)

(assert (=> b!1498206 (=> res!1018432 e!839235)))

(assert (=> b!1498206 (= res!1018432 e!839236)))

(declare-fun c!139429 () Bool)

(assert (=> b!1498206 (= c!139429 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1498207 () Bool)

(assert (=> b!1498207 (= e!839236 (not (= lt!652752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652750 lt!652753 lt!652755 mask!2687))))))

(declare-fun b!1498208 () Bool)

(declare-fun res!1018423 () Bool)

(assert (=> b!1498208 (=> (not res!1018423) (not e!839241))))

(assert (=> b!1498208 (= res!1018423 (validKeyInArray!0 (select (arr!48220 a!2862) j!93)))))

(declare-fun b!1498209 () Bool)

(assert (=> b!1498209 (= e!839232 e!839238)))

(declare-fun res!1018427 () Bool)

(assert (=> b!1498209 (=> (not res!1018427) (not e!839238))))

(assert (=> b!1498209 (= res!1018427 (= lt!652752 (Intermediate!12357 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1498209 (= lt!652752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652753 mask!2687) lt!652753 lt!652755 mask!2687))))

(assert (=> b!1498209 (= lt!652753 (select (store (arr!48220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498210 () Bool)

(declare-fun res!1018425 () Bool)

(assert (=> b!1498210 (=> (not res!1018425) (not e!839241))))

(assert (=> b!1498210 (= res!1018425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127620 res!1018424) b!1498203))

(assert (= (and b!1498203 res!1018435) b!1498195))

(assert (= (and b!1498195 res!1018429) b!1498208))

(assert (= (and b!1498208 res!1018423) b!1498210))

(assert (= (and b!1498210 res!1018425) b!1498197))

(assert (= (and b!1498197 res!1018422) b!1498199))

(assert (= (and b!1498199 res!1018437) b!1498202))

(assert (= (and b!1498202 res!1018434) b!1498200))

(assert (= (and b!1498200 res!1018436) b!1498192))

(assert (= (and b!1498192 res!1018426) b!1498209))

(assert (= (and b!1498209 res!1018427) b!1498191))

(assert (= (and b!1498191 c!139428) b!1498205))

(assert (= (and b!1498191 (not c!139428)) b!1498189))

(assert (= (and b!1498191 res!1018430) b!1498201))

(assert (= (and b!1498201 res!1018428) b!1498190))

(assert (= (and b!1498190 res!1018421) b!1498193))

(assert (= (and b!1498193 res!1018433) b!1498188))

(assert (= (and b!1498190 (not res!1018439)) b!1498194))

(assert (= (and b!1498194 (not res!1018431)) b!1498196))

(assert (= (and b!1498196 (not res!1018438)) b!1498206))

(assert (= (and b!1498206 c!139429) b!1498207))

(assert (= (and b!1498206 (not c!139429)) b!1498204))

(assert (= (and b!1498206 (not res!1018432)) b!1498198))

(declare-fun m!1381383 () Bool)

(assert (=> b!1498192 m!1381383))

(assert (=> b!1498192 m!1381383))

(declare-fun m!1381385 () Bool)

(assert (=> b!1498192 m!1381385))

(declare-fun m!1381387 () Bool)

(assert (=> b!1498190 m!1381387))

(declare-fun m!1381389 () Bool)

(assert (=> b!1498190 m!1381389))

(declare-fun m!1381391 () Bool)

(assert (=> b!1498190 m!1381391))

(declare-fun m!1381393 () Bool)

(assert (=> b!1498190 m!1381393))

(declare-fun m!1381395 () Bool)

(assert (=> b!1498190 m!1381395))

(assert (=> b!1498190 m!1381383))

(declare-fun m!1381397 () Bool)

(assert (=> b!1498209 m!1381397))

(assert (=> b!1498209 m!1381397))

(declare-fun m!1381399 () Bool)

(assert (=> b!1498209 m!1381399))

(assert (=> b!1498209 m!1381389))

(declare-fun m!1381401 () Bool)

(assert (=> b!1498209 m!1381401))

(declare-fun m!1381403 () Bool)

(assert (=> b!1498195 m!1381403))

(assert (=> b!1498195 m!1381403))

(declare-fun m!1381405 () Bool)

(assert (=> b!1498195 m!1381405))

(assert (=> b!1498193 m!1381383))

(assert (=> b!1498193 m!1381383))

(declare-fun m!1381407 () Bool)

(assert (=> b!1498193 m!1381407))

(assert (=> b!1498196 m!1381383))

(assert (=> b!1498196 m!1381383))

(declare-fun m!1381409 () Bool)

(assert (=> b!1498196 m!1381409))

(declare-fun m!1381411 () Bool)

(assert (=> b!1498194 m!1381411))

(assert (=> b!1498208 m!1381383))

(assert (=> b!1498208 m!1381383))

(declare-fun m!1381413 () Bool)

(assert (=> b!1498208 m!1381413))

(assert (=> b!1498202 m!1381389))

(declare-fun m!1381415 () Bool)

(assert (=> b!1498202 m!1381415))

(declare-fun m!1381417 () Bool)

(assert (=> start!127620 m!1381417))

(declare-fun m!1381419 () Bool)

(assert (=> start!127620 m!1381419))

(declare-fun m!1381421 () Bool)

(assert (=> b!1498197 m!1381421))

(declare-fun m!1381423 () Bool)

(assert (=> b!1498204 m!1381423))

(declare-fun m!1381425 () Bool)

(assert (=> b!1498204 m!1381425))

(assert (=> b!1498200 m!1381383))

(assert (=> b!1498200 m!1381383))

(declare-fun m!1381427 () Bool)

(assert (=> b!1498200 m!1381427))

(assert (=> b!1498200 m!1381427))

(assert (=> b!1498200 m!1381383))

(declare-fun m!1381429 () Bool)

(assert (=> b!1498200 m!1381429))

(declare-fun m!1381431 () Bool)

(assert (=> b!1498189 m!1381431))

(assert (=> b!1498189 m!1381425))

(declare-fun m!1381433 () Bool)

(assert (=> b!1498207 m!1381433))

(declare-fun m!1381435 () Bool)

(assert (=> b!1498210 m!1381435))

(declare-fun m!1381437 () Bool)

(assert (=> b!1498205 m!1381437))

(declare-fun m!1381439 () Bool)

(assert (=> b!1498188 m!1381439))

(assert (=> b!1498188 m!1381383))

(check-sat (not b!1498189) (not b!1498192) (not b!1498210) (not b!1498205) (not b!1498208) (not b!1498197) (not b!1498194) (not b!1498195) (not b!1498209) (not b!1498196) (not b!1498190) (not start!127620) (not b!1498193) (not b!1498204) (not b!1498207) (not b!1498200))
(check-sat)
