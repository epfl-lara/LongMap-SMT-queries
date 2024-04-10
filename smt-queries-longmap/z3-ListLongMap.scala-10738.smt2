; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125568 () Bool)

(assert start!125568)

(declare-fun b!1469202 () Bool)

(declare-fun res!997732 () Bool)

(declare-fun e!824846 () Bool)

(assert (=> b!1469202 (=> (not res!997732) (not e!824846))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99016 0))(
  ( (array!99017 (arr!47796 (Array (_ BitVec 32) (_ BitVec 64))) (size!48346 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99016)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469202 (= res!997732 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48346 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48346 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48346 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!997737 () Bool)

(assert (=> start!125568 (=> (not res!997737) (not e!824846))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125568 (= res!997737 (validMask!0 mask!2687))))

(assert (=> start!125568 e!824846))

(assert (=> start!125568 true))

(declare-fun array_inv!36824 (array!99016) Bool)

(assert (=> start!125568 (array_inv!36824 a!2862)))

(declare-fun b!1469203 () Bool)

(declare-fun res!997740 () Bool)

(assert (=> b!1469203 (=> (not res!997740) (not e!824846))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469203 (= res!997740 (validKeyInArray!0 (select (arr!47796 a!2862) j!93)))))

(declare-fun b!1469204 () Bool)

(declare-fun res!997739 () Bool)

(declare-fun e!824847 () Bool)

(assert (=> b!1469204 (=> (not res!997739) (not e!824847))))

(declare-datatypes ((SeekEntryResult!12036 0))(
  ( (MissingZero!12036 (index!50536 (_ BitVec 32))) (Found!12036 (index!50537 (_ BitVec 32))) (Intermediate!12036 (undefined!12848 Bool) (index!50538 (_ BitVec 32)) (x!132117 (_ BitVec 32))) (Undefined!12036) (MissingVacant!12036 (index!50539 (_ BitVec 32))) )
))
(declare-fun lt!642470 () SeekEntryResult!12036)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99016 (_ BitVec 32)) SeekEntryResult!12036)

(assert (=> b!1469204 (= res!997739 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47796 a!2862) j!93) a!2862 mask!2687) lt!642470))))

(declare-fun b!1469205 () Bool)

(declare-fun e!824844 () Bool)

(assert (=> b!1469205 (= e!824847 e!824844)))

(declare-fun res!997733 () Bool)

(assert (=> b!1469205 (=> (not res!997733) (not e!824844))))

(declare-fun lt!642473 () SeekEntryResult!12036)

(assert (=> b!1469205 (= res!997733 (= lt!642473 (Intermediate!12036 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642474 () (_ BitVec 64))

(declare-fun lt!642472 () array!99016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469205 (= lt!642473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642474 mask!2687) lt!642474 lt!642472 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469205 (= lt!642474 (select (store (arr!47796 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469206 () Bool)

(declare-fun e!824845 () Bool)

(assert (=> b!1469206 (= e!824845 e!824847)))

(declare-fun res!997741 () Bool)

(assert (=> b!1469206 (=> (not res!997741) (not e!824847))))

(assert (=> b!1469206 (= res!997741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47796 a!2862) j!93) mask!2687) (select (arr!47796 a!2862) j!93) a!2862 mask!2687) lt!642470))))

(assert (=> b!1469206 (= lt!642470 (Intermediate!12036 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469207 () Bool)

(declare-fun res!997736 () Bool)

(assert (=> b!1469207 (=> (not res!997736) (not e!824846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99016 (_ BitVec 32)) Bool)

(assert (=> b!1469207 (= res!997736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469208 () Bool)

(assert (=> b!1469208 (= e!824846 e!824845)))

(declare-fun res!997734 () Bool)

(assert (=> b!1469208 (=> (not res!997734) (not e!824845))))

(assert (=> b!1469208 (= res!997734 (= (select (store (arr!47796 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469208 (= lt!642472 (array!99017 (store (arr!47796 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48346 a!2862)))))

(declare-fun b!1469209 () Bool)

(assert (=> b!1469209 (= e!824844 false)))

(declare-fun lt!642471 () Bool)

(declare-fun e!824848 () Bool)

(assert (=> b!1469209 (= lt!642471 e!824848)))

(declare-fun c!135246 () Bool)

(assert (=> b!1469209 (= c!135246 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99016 (_ BitVec 32)) SeekEntryResult!12036)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99016 (_ BitVec 32)) SeekEntryResult!12036)

(assert (=> b!1469210 (= e!824848 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642474 lt!642472 mask!2687) (seekEntryOrOpen!0 lt!642474 lt!642472 mask!2687))))))

(declare-fun b!1469211 () Bool)

(assert (=> b!1469211 (= e!824848 (not (= lt!642473 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642474 lt!642472 mask!2687))))))

(declare-fun b!1469212 () Bool)

(declare-fun res!997731 () Bool)

(assert (=> b!1469212 (=> (not res!997731) (not e!824846))))

(declare-datatypes ((List!34297 0))(
  ( (Nil!34294) (Cons!34293 (h!35643 (_ BitVec 64)) (t!48991 List!34297)) )
))
(declare-fun arrayNoDuplicates!0 (array!99016 (_ BitVec 32) List!34297) Bool)

(assert (=> b!1469212 (= res!997731 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34294))))

(declare-fun b!1469213 () Bool)

(declare-fun res!997735 () Bool)

(assert (=> b!1469213 (=> (not res!997735) (not e!824846))))

(assert (=> b!1469213 (= res!997735 (validKeyInArray!0 (select (arr!47796 a!2862) i!1006)))))

(declare-fun b!1469214 () Bool)

(declare-fun res!997738 () Bool)

(assert (=> b!1469214 (=> (not res!997738) (not e!824846))))

(assert (=> b!1469214 (= res!997738 (and (= (size!48346 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48346 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48346 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125568 res!997737) b!1469214))

(assert (= (and b!1469214 res!997738) b!1469213))

(assert (= (and b!1469213 res!997735) b!1469203))

(assert (= (and b!1469203 res!997740) b!1469207))

(assert (= (and b!1469207 res!997736) b!1469212))

(assert (= (and b!1469212 res!997731) b!1469202))

(assert (= (and b!1469202 res!997732) b!1469208))

(assert (= (and b!1469208 res!997734) b!1469206))

(assert (= (and b!1469206 res!997741) b!1469204))

(assert (= (and b!1469204 res!997739) b!1469205))

(assert (= (and b!1469205 res!997733) b!1469209))

(assert (= (and b!1469209 c!135246) b!1469211))

(assert (= (and b!1469209 (not c!135246)) b!1469210))

(declare-fun m!1356387 () Bool)

(assert (=> b!1469213 m!1356387))

(assert (=> b!1469213 m!1356387))

(declare-fun m!1356389 () Bool)

(assert (=> b!1469213 m!1356389))

(declare-fun m!1356391 () Bool)

(assert (=> b!1469207 m!1356391))

(declare-fun m!1356393 () Bool)

(assert (=> b!1469204 m!1356393))

(assert (=> b!1469204 m!1356393))

(declare-fun m!1356395 () Bool)

(assert (=> b!1469204 m!1356395))

(declare-fun m!1356397 () Bool)

(assert (=> b!1469211 m!1356397))

(assert (=> b!1469206 m!1356393))

(assert (=> b!1469206 m!1356393))

(declare-fun m!1356399 () Bool)

(assert (=> b!1469206 m!1356399))

(assert (=> b!1469206 m!1356399))

(assert (=> b!1469206 m!1356393))

(declare-fun m!1356401 () Bool)

(assert (=> b!1469206 m!1356401))

(declare-fun m!1356403 () Bool)

(assert (=> b!1469212 m!1356403))

(declare-fun m!1356405 () Bool)

(assert (=> b!1469205 m!1356405))

(assert (=> b!1469205 m!1356405))

(declare-fun m!1356407 () Bool)

(assert (=> b!1469205 m!1356407))

(declare-fun m!1356409 () Bool)

(assert (=> b!1469205 m!1356409))

(declare-fun m!1356411 () Bool)

(assert (=> b!1469205 m!1356411))

(assert (=> b!1469208 m!1356409))

(declare-fun m!1356413 () Bool)

(assert (=> b!1469208 m!1356413))

(declare-fun m!1356415 () Bool)

(assert (=> start!125568 m!1356415))

(declare-fun m!1356417 () Bool)

(assert (=> start!125568 m!1356417))

(declare-fun m!1356419 () Bool)

(assert (=> b!1469210 m!1356419))

(declare-fun m!1356421 () Bool)

(assert (=> b!1469210 m!1356421))

(assert (=> b!1469203 m!1356393))

(assert (=> b!1469203 m!1356393))

(declare-fun m!1356423 () Bool)

(assert (=> b!1469203 m!1356423))

(check-sat (not b!1469211) (not b!1469203) (not b!1469210) (not start!125568) (not b!1469204) (not b!1469206) (not b!1469205) (not b!1469213) (not b!1469207) (not b!1469212))
(check-sat)
