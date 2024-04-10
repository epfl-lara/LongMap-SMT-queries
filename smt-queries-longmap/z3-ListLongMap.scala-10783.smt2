; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126198 () Bool)

(assert start!126198)

(declare-fun b!1478326 () Bool)

(declare-fun e!829295 () Bool)

(assert (=> b!1478326 (= e!829295 (not true))))

(declare-fun e!829291 () Bool)

(assert (=> b!1478326 e!829291))

(declare-fun res!1004354 () Bool)

(assert (=> b!1478326 (=> (not res!1004354) (not e!829291))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99304 0))(
  ( (array!99305 (arr!47931 (Array (_ BitVec 32) (_ BitVec 64))) (size!48481 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99304)

(declare-datatypes ((SeekEntryResult!12171 0))(
  ( (MissingZero!12171 (index!51076 (_ BitVec 32))) (Found!12171 (index!51077 (_ BitVec 32))) (Intermediate!12171 (undefined!12983 Bool) (index!51078 (_ BitVec 32)) (x!132666 (_ BitVec 32))) (Undefined!12171) (MissingVacant!12171 (index!51079 (_ BitVec 32))) )
))
(declare-fun lt!645643 () SeekEntryResult!12171)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1478326 (= res!1004354 (and (= lt!645643 (Found!12171 j!93)) (or (= (select (arr!47931 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47931 a!2862) intermediateBeforeIndex!19) (select (arr!47931 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12171)

(assert (=> b!1478326 (= lt!645643 (seekEntryOrOpen!0 (select (arr!47931 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99304 (_ BitVec 32)) Bool)

(assert (=> b!1478326 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49682 0))(
  ( (Unit!49683) )
))
(declare-fun lt!645644 () Unit!49682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49682)

(assert (=> b!1478326 (= lt!645644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478327 () Bool)

(declare-fun e!829292 () Bool)

(assert (=> b!1478327 (= e!829292 e!829295)))

(declare-fun res!1004367 () Bool)

(assert (=> b!1478327 (=> (not res!1004367) (not e!829295))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645647 () SeekEntryResult!12171)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478327 (= res!1004367 (= lt!645647 (Intermediate!12171 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645648 () array!99304)

(declare-fun lt!645646 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478327 (= lt!645647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645646 mask!2687) lt!645646 lt!645648 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478327 (= lt!645646 (select (store (arr!47931 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478328 () Bool)

(declare-fun res!1004357 () Bool)

(declare-fun e!829290 () Bool)

(assert (=> b!1478328 (=> (not res!1004357) (not e!829290))))

(assert (=> b!1478328 (= res!1004357 (and (= (size!48481 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48481 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48481 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478329 () Bool)

(declare-fun e!829288 () Bool)

(assert (=> b!1478329 (= e!829291 e!829288)))

(declare-fun res!1004353 () Bool)

(assert (=> b!1478329 (=> res!1004353 e!829288)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1478329 (= res!1004353 (or (and (= (select (arr!47931 a!2862) index!646) (select (store (arr!47931 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47931 a!2862) index!646) (select (arr!47931 a!2862) j!93))) (not (= (select (arr!47931 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1004359 () Bool)

(assert (=> start!126198 (=> (not res!1004359) (not e!829290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126198 (= res!1004359 (validMask!0 mask!2687))))

(assert (=> start!126198 e!829290))

(assert (=> start!126198 true))

(declare-fun array_inv!36959 (array!99304) Bool)

(assert (=> start!126198 (array_inv!36959 a!2862)))

(declare-fun b!1478330 () Bool)

(declare-fun res!1004355 () Bool)

(assert (=> b!1478330 (=> (not res!1004355) (not e!829290))))

(assert (=> b!1478330 (= res!1004355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478331 () Bool)

(declare-fun e!829294 () Bool)

(assert (=> b!1478331 (= e!829288 e!829294)))

(declare-fun res!1004358 () Bool)

(assert (=> b!1478331 (=> (not res!1004358) (not e!829294))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12171)

(assert (=> b!1478331 (= res!1004358 (= lt!645643 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47931 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478332 () Bool)

(declare-fun e!829289 () Bool)

(assert (=> b!1478332 (= e!829289 (= lt!645647 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645646 lt!645648 mask!2687)))))

(declare-fun b!1478333 () Bool)

(declare-fun res!1004365 () Bool)

(assert (=> b!1478333 (=> (not res!1004365) (not e!829295))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478333 (= res!1004365 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478334 () Bool)

(declare-fun res!1004366 () Bool)

(assert (=> b!1478334 (=> (not res!1004366) (not e!829290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478334 (= res!1004366 (validKeyInArray!0 (select (arr!47931 a!2862) i!1006)))))

(declare-fun b!1478335 () Bool)

(declare-fun e!829287 () Bool)

(assert (=> b!1478335 (= e!829287 e!829292)))

(declare-fun res!1004356 () Bool)

(assert (=> b!1478335 (=> (not res!1004356) (not e!829292))))

(declare-fun lt!645645 () SeekEntryResult!12171)

(assert (=> b!1478335 (= res!1004356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47931 a!2862) j!93) mask!2687) (select (arr!47931 a!2862) j!93) a!2862 mask!2687) lt!645645))))

(assert (=> b!1478335 (= lt!645645 (Intermediate!12171 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478336 () Bool)

(declare-fun res!1004368 () Bool)

(assert (=> b!1478336 (=> (not res!1004368) (not e!829290))))

(assert (=> b!1478336 (= res!1004368 (validKeyInArray!0 (select (arr!47931 a!2862) j!93)))))

(declare-fun b!1478337 () Bool)

(declare-fun res!1004363 () Bool)

(assert (=> b!1478337 (=> (not res!1004363) (not e!829295))))

(assert (=> b!1478337 (= res!1004363 e!829289)))

(declare-fun c!136506 () Bool)

(assert (=> b!1478337 (= c!136506 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478338 () Bool)

(assert (=> b!1478338 (= e!829290 e!829287)))

(declare-fun res!1004360 () Bool)

(assert (=> b!1478338 (=> (not res!1004360) (not e!829287))))

(assert (=> b!1478338 (= res!1004360 (= (select (store (arr!47931 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478338 (= lt!645648 (array!99305 (store (arr!47931 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48481 a!2862)))))

(declare-fun b!1478339 () Bool)

(declare-fun res!1004361 () Bool)

(assert (=> b!1478339 (=> (not res!1004361) (not e!829290))))

(declare-datatypes ((List!34432 0))(
  ( (Nil!34429) (Cons!34428 (h!35796 (_ BitVec 64)) (t!49126 List!34432)) )
))
(declare-fun arrayNoDuplicates!0 (array!99304 (_ BitVec 32) List!34432) Bool)

(assert (=> b!1478339 (= res!1004361 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34429))))

(declare-fun b!1478340 () Bool)

(assert (=> b!1478340 (= e!829289 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645646 lt!645648 mask!2687) (seekEntryOrOpen!0 lt!645646 lt!645648 mask!2687)))))

(declare-fun b!1478341 () Bool)

(declare-fun res!1004362 () Bool)

(assert (=> b!1478341 (=> (not res!1004362) (not e!829292))))

(assert (=> b!1478341 (= res!1004362 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47931 a!2862) j!93) a!2862 mask!2687) lt!645645))))

(declare-fun b!1478342 () Bool)

(declare-fun res!1004364 () Bool)

(assert (=> b!1478342 (=> (not res!1004364) (not e!829290))))

(assert (=> b!1478342 (= res!1004364 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48481 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48481 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48481 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478343 () Bool)

(assert (=> b!1478343 (= e!829294 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126198 res!1004359) b!1478328))

(assert (= (and b!1478328 res!1004357) b!1478334))

(assert (= (and b!1478334 res!1004366) b!1478336))

(assert (= (and b!1478336 res!1004368) b!1478330))

(assert (= (and b!1478330 res!1004355) b!1478339))

(assert (= (and b!1478339 res!1004361) b!1478342))

(assert (= (and b!1478342 res!1004364) b!1478338))

(assert (= (and b!1478338 res!1004360) b!1478335))

(assert (= (and b!1478335 res!1004356) b!1478341))

(assert (= (and b!1478341 res!1004362) b!1478327))

(assert (= (and b!1478327 res!1004367) b!1478337))

(assert (= (and b!1478337 c!136506) b!1478332))

(assert (= (and b!1478337 (not c!136506)) b!1478340))

(assert (= (and b!1478337 res!1004363) b!1478333))

(assert (= (and b!1478333 res!1004365) b!1478326))

(assert (= (and b!1478326 res!1004354) b!1478329))

(assert (= (and b!1478329 (not res!1004353)) b!1478331))

(assert (= (and b!1478331 res!1004358) b!1478343))

(declare-fun m!1364243 () Bool)

(assert (=> start!126198 m!1364243))

(declare-fun m!1364245 () Bool)

(assert (=> start!126198 m!1364245))

(declare-fun m!1364247 () Bool)

(assert (=> b!1478335 m!1364247))

(assert (=> b!1478335 m!1364247))

(declare-fun m!1364249 () Bool)

(assert (=> b!1478335 m!1364249))

(assert (=> b!1478335 m!1364249))

(assert (=> b!1478335 m!1364247))

(declare-fun m!1364251 () Bool)

(assert (=> b!1478335 m!1364251))

(declare-fun m!1364253 () Bool)

(assert (=> b!1478339 m!1364253))

(declare-fun m!1364255 () Bool)

(assert (=> b!1478334 m!1364255))

(assert (=> b!1478334 m!1364255))

(declare-fun m!1364257 () Bool)

(assert (=> b!1478334 m!1364257))

(declare-fun m!1364259 () Bool)

(assert (=> b!1478326 m!1364259))

(declare-fun m!1364261 () Bool)

(assert (=> b!1478326 m!1364261))

(assert (=> b!1478326 m!1364247))

(declare-fun m!1364263 () Bool)

(assert (=> b!1478326 m!1364263))

(declare-fun m!1364265 () Bool)

(assert (=> b!1478326 m!1364265))

(assert (=> b!1478326 m!1364247))

(assert (=> b!1478336 m!1364247))

(assert (=> b!1478336 m!1364247))

(declare-fun m!1364267 () Bool)

(assert (=> b!1478336 m!1364267))

(declare-fun m!1364269 () Bool)

(assert (=> b!1478329 m!1364269))

(declare-fun m!1364271 () Bool)

(assert (=> b!1478329 m!1364271))

(declare-fun m!1364273 () Bool)

(assert (=> b!1478329 m!1364273))

(assert (=> b!1478329 m!1364247))

(declare-fun m!1364275 () Bool)

(assert (=> b!1478340 m!1364275))

(declare-fun m!1364277 () Bool)

(assert (=> b!1478340 m!1364277))

(assert (=> b!1478341 m!1364247))

(assert (=> b!1478341 m!1364247))

(declare-fun m!1364279 () Bool)

(assert (=> b!1478341 m!1364279))

(assert (=> b!1478331 m!1364247))

(assert (=> b!1478331 m!1364247))

(declare-fun m!1364281 () Bool)

(assert (=> b!1478331 m!1364281))

(declare-fun m!1364283 () Bool)

(assert (=> b!1478332 m!1364283))

(assert (=> b!1478338 m!1364271))

(declare-fun m!1364285 () Bool)

(assert (=> b!1478338 m!1364285))

(declare-fun m!1364287 () Bool)

(assert (=> b!1478327 m!1364287))

(assert (=> b!1478327 m!1364287))

(declare-fun m!1364289 () Bool)

(assert (=> b!1478327 m!1364289))

(assert (=> b!1478327 m!1364271))

(declare-fun m!1364291 () Bool)

(assert (=> b!1478327 m!1364291))

(declare-fun m!1364293 () Bool)

(assert (=> b!1478330 m!1364293))

(check-sat (not b!1478341) (not b!1478335) (not b!1478326) (not b!1478330) (not start!126198) (not b!1478336) (not b!1478331) (not b!1478327) (not b!1478332) (not b!1478340) (not b!1478339) (not b!1478334))
(check-sat)
