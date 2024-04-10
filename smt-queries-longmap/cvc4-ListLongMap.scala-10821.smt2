; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126644 () Bool)

(assert start!126644)

(declare-fun b!1486378 () Bool)

(declare-fun res!1010735 () Bool)

(declare-fun e!833244 () Bool)

(assert (=> b!1486378 (=> (not res!1010735) (not e!833244))))

(declare-datatypes ((array!99543 0))(
  ( (array!99544 (arr!48046 (Array (_ BitVec 32) (_ BitVec 64))) (size!48596 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99543)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12286 0))(
  ( (MissingZero!12286 (index!51536 (_ BitVec 32))) (Found!12286 (index!51537 (_ BitVec 32))) (Intermediate!12286 (undefined!13098 Bool) (index!51538 (_ BitVec 32)) (x!133118 (_ BitVec 32))) (Undefined!12286) (MissingVacant!12286 (index!51539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99543 (_ BitVec 32)) SeekEntryResult!12286)

(assert (=> b!1486378 (= res!1010735 (= (seekEntryOrOpen!0 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) (Found!12286 j!93)))))

(declare-fun b!1486379 () Bool)

(declare-fun res!1010751 () Bool)

(declare-fun e!833249 () Bool)

(assert (=> b!1486379 (=> (not res!1010751) (not e!833249))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486379 (= res!1010751 (and (= (size!48596 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48596 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48596 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486380 () Bool)

(declare-fun res!1010747 () Bool)

(declare-fun e!833250 () Bool)

(assert (=> b!1486380 (=> (not res!1010747) (not e!833250))))

(declare-fun e!833248 () Bool)

(assert (=> b!1486380 (= res!1010747 e!833248)))

(declare-fun c!137346 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486380 (= c!137346 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486381 () Bool)

(declare-fun res!1010737 () Bool)

(assert (=> b!1486381 (=> (not res!1010737) (not e!833249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486381 (= res!1010737 (validKeyInArray!0 (select (arr!48046 a!2862) i!1006)))))

(declare-fun lt!648452 () array!99543)

(declare-fun lt!648450 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1486382 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99543 (_ BitVec 32)) SeekEntryResult!12286)

(assert (=> b!1486382 (= e!833248 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648450 lt!648452 mask!2687) (seekEntryOrOpen!0 lt!648450 lt!648452 mask!2687)))))

(declare-fun b!1486383 () Bool)

(declare-fun res!1010750 () Bool)

(assert (=> b!1486383 (=> (not res!1010750) (not e!833250))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486383 (= res!1010750 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486384 () Bool)

(declare-fun res!1010742 () Bool)

(declare-fun e!833245 () Bool)

(assert (=> b!1486384 (=> (not res!1010742) (not e!833245))))

(declare-fun lt!648449 () SeekEntryResult!12286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99543 (_ BitVec 32)) SeekEntryResult!12286)

(assert (=> b!1486384 (= res!1010742 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!648449))))

(declare-fun b!1486385 () Bool)

(declare-fun res!1010741 () Bool)

(assert (=> b!1486385 (=> (not res!1010741) (not e!833249))))

(declare-datatypes ((List!34547 0))(
  ( (Nil!34544) (Cons!34543 (h!35920 (_ BitVec 64)) (t!49241 List!34547)) )
))
(declare-fun arrayNoDuplicates!0 (array!99543 (_ BitVec 32) List!34547) Bool)

(assert (=> b!1486385 (= res!1010741 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34544))))

(declare-fun b!1486386 () Bool)

(assert (=> b!1486386 (= e!833245 e!833250)))

(declare-fun res!1010743 () Bool)

(assert (=> b!1486386 (=> (not res!1010743) (not e!833250))))

(declare-fun lt!648451 () SeekEntryResult!12286)

(assert (=> b!1486386 (= res!1010743 (= lt!648451 (Intermediate!12286 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486386 (= lt!648451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648450 mask!2687) lt!648450 lt!648452 mask!2687))))

(assert (=> b!1486386 (= lt!648450 (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486388 () Bool)

(assert (=> b!1486388 (= e!833248 (= lt!648451 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648450 lt!648452 mask!2687)))))

(declare-fun b!1486389 () Bool)

(declare-fun res!1010749 () Bool)

(assert (=> b!1486389 (=> (not res!1010749) (not e!833244))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486389 (= res!1010749 (or (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) (select (arr!48046 a!2862) j!93))))))

(declare-fun b!1486390 () Bool)

(declare-fun e!833247 () Bool)

(assert (=> b!1486390 (= e!833250 (not e!833247))))

(declare-fun res!1010734 () Bool)

(assert (=> b!1486390 (=> res!1010734 e!833247)))

(assert (=> b!1486390 (= res!1010734 (or (and (= (select (arr!48046 a!2862) index!646) (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48046 a!2862) index!646) (select (arr!48046 a!2862) j!93))) (= (select (arr!48046 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486390 e!833244))

(declare-fun res!1010752 () Bool)

(assert (=> b!1486390 (=> (not res!1010752) (not e!833244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99543 (_ BitVec 32)) Bool)

(assert (=> b!1486390 (= res!1010752 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49912 0))(
  ( (Unit!49913) )
))
(declare-fun lt!648447 () Unit!49912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49912)

(assert (=> b!1486390 (= lt!648447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486391 () Bool)

(declare-fun e!833251 () Bool)

(assert (=> b!1486391 (= e!833249 e!833251)))

(declare-fun res!1010746 () Bool)

(assert (=> b!1486391 (=> (not res!1010746) (not e!833251))))

(assert (=> b!1486391 (= res!1010746 (= (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486391 (= lt!648452 (array!99544 (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48596 a!2862)))))

(declare-fun b!1486392 () Bool)

(declare-fun e!833252 () Bool)

(assert (=> b!1486392 (= e!833244 e!833252)))

(declare-fun res!1010740 () Bool)

(assert (=> b!1486392 (=> res!1010740 e!833252)))

(declare-fun lt!648453 () (_ BitVec 64))

(assert (=> b!1486392 (= res!1010740 (or (and (= (select (arr!48046 a!2862) index!646) lt!648453) (= (select (arr!48046 a!2862) index!646) (select (arr!48046 a!2862) j!93))) (= (select (arr!48046 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486392 (= lt!648453 (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486393 () Bool)

(declare-fun res!1010738 () Bool)

(assert (=> b!1486393 (=> (not res!1010738) (not e!833249))))

(assert (=> b!1486393 (= res!1010738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486394 () Bool)

(declare-fun res!1010739 () Bool)

(assert (=> b!1486394 (=> (not res!1010739) (not e!833249))))

(assert (=> b!1486394 (= res!1010739 (validKeyInArray!0 (select (arr!48046 a!2862) j!93)))))

(declare-fun b!1486387 () Bool)

(declare-fun res!1010745 () Bool)

(assert (=> b!1486387 (=> (not res!1010745) (not e!833249))))

(assert (=> b!1486387 (= res!1010745 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48596 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48596 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48596 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1010744 () Bool)

(assert (=> start!126644 (=> (not res!1010744) (not e!833249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126644 (= res!1010744 (validMask!0 mask!2687))))

(assert (=> start!126644 e!833249))

(assert (=> start!126644 true))

(declare-fun array_inv!37074 (array!99543) Bool)

(assert (=> start!126644 (array_inv!37074 a!2862)))

(declare-fun b!1486395 () Bool)

(declare-fun e!833246 () Bool)

(assert (=> b!1486395 (= e!833252 e!833246)))

(declare-fun res!1010748 () Bool)

(assert (=> b!1486395 (=> (not res!1010748) (not e!833246))))

(assert (=> b!1486395 (= res!1010748 (and (= index!646 intermediateAfterIndex!19) (= lt!648453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486396 () Bool)

(assert (=> b!1486396 (= e!833246 (= (seekEntryOrOpen!0 lt!648450 lt!648452 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648450 lt!648452 mask!2687)))))

(declare-fun b!1486397 () Bool)

(assert (=> b!1486397 (= e!833247 true)))

(declare-fun lt!648448 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486397 (= lt!648448 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486398 () Bool)

(assert (=> b!1486398 (= e!833251 e!833245)))

(declare-fun res!1010736 () Bool)

(assert (=> b!1486398 (=> (not res!1010736) (not e!833245))))

(assert (=> b!1486398 (= res!1010736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48046 a!2862) j!93) mask!2687) (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!648449))))

(assert (=> b!1486398 (= lt!648449 (Intermediate!12286 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126644 res!1010744) b!1486379))

(assert (= (and b!1486379 res!1010751) b!1486381))

(assert (= (and b!1486381 res!1010737) b!1486394))

(assert (= (and b!1486394 res!1010739) b!1486393))

(assert (= (and b!1486393 res!1010738) b!1486385))

(assert (= (and b!1486385 res!1010741) b!1486387))

(assert (= (and b!1486387 res!1010745) b!1486391))

(assert (= (and b!1486391 res!1010746) b!1486398))

(assert (= (and b!1486398 res!1010736) b!1486384))

(assert (= (and b!1486384 res!1010742) b!1486386))

(assert (= (and b!1486386 res!1010743) b!1486380))

(assert (= (and b!1486380 c!137346) b!1486388))

(assert (= (and b!1486380 (not c!137346)) b!1486382))

(assert (= (and b!1486380 res!1010747) b!1486383))

(assert (= (and b!1486383 res!1010750) b!1486390))

(assert (= (and b!1486390 res!1010752) b!1486378))

(assert (= (and b!1486378 res!1010735) b!1486389))

(assert (= (and b!1486389 res!1010749) b!1486392))

(assert (= (and b!1486392 (not res!1010740)) b!1486395))

(assert (= (and b!1486395 res!1010748) b!1486396))

(assert (= (and b!1486390 (not res!1010734)) b!1486397))

(declare-fun m!1371267 () Bool)

(assert (=> b!1486381 m!1371267))

(assert (=> b!1486381 m!1371267))

(declare-fun m!1371269 () Bool)

(assert (=> b!1486381 m!1371269))

(declare-fun m!1371271 () Bool)

(assert (=> b!1486393 m!1371271))

(declare-fun m!1371273 () Bool)

(assert (=> b!1486382 m!1371273))

(declare-fun m!1371275 () Bool)

(assert (=> b!1486382 m!1371275))

(declare-fun m!1371277 () Bool)

(assert (=> b!1486394 m!1371277))

(assert (=> b!1486394 m!1371277))

(declare-fun m!1371279 () Bool)

(assert (=> b!1486394 m!1371279))

(declare-fun m!1371281 () Bool)

(assert (=> b!1486397 m!1371281))

(declare-fun m!1371283 () Bool)

(assert (=> b!1486392 m!1371283))

(assert (=> b!1486392 m!1371277))

(declare-fun m!1371285 () Bool)

(assert (=> b!1486392 m!1371285))

(declare-fun m!1371287 () Bool)

(assert (=> b!1486392 m!1371287))

(declare-fun m!1371289 () Bool)

(assert (=> b!1486390 m!1371289))

(assert (=> b!1486390 m!1371285))

(assert (=> b!1486390 m!1371287))

(assert (=> b!1486390 m!1371283))

(declare-fun m!1371291 () Bool)

(assert (=> b!1486390 m!1371291))

(assert (=> b!1486390 m!1371277))

(assert (=> b!1486378 m!1371277))

(assert (=> b!1486378 m!1371277))

(declare-fun m!1371293 () Bool)

(assert (=> b!1486378 m!1371293))

(declare-fun m!1371295 () Bool)

(assert (=> b!1486385 m!1371295))

(declare-fun m!1371297 () Bool)

(assert (=> b!1486386 m!1371297))

(assert (=> b!1486386 m!1371297))

(declare-fun m!1371299 () Bool)

(assert (=> b!1486386 m!1371299))

(assert (=> b!1486386 m!1371285))

(declare-fun m!1371301 () Bool)

(assert (=> b!1486386 m!1371301))

(assert (=> b!1486391 m!1371285))

(declare-fun m!1371303 () Bool)

(assert (=> b!1486391 m!1371303))

(assert (=> b!1486396 m!1371275))

(assert (=> b!1486396 m!1371273))

(assert (=> b!1486384 m!1371277))

(assert (=> b!1486384 m!1371277))

(declare-fun m!1371305 () Bool)

(assert (=> b!1486384 m!1371305))

(declare-fun m!1371307 () Bool)

(assert (=> start!126644 m!1371307))

(declare-fun m!1371309 () Bool)

(assert (=> start!126644 m!1371309))

(declare-fun m!1371311 () Bool)

(assert (=> b!1486388 m!1371311))

(declare-fun m!1371313 () Bool)

(assert (=> b!1486389 m!1371313))

(assert (=> b!1486389 m!1371277))

(assert (=> b!1486398 m!1371277))

(assert (=> b!1486398 m!1371277))

(declare-fun m!1371315 () Bool)

(assert (=> b!1486398 m!1371315))

(assert (=> b!1486398 m!1371315))

(assert (=> b!1486398 m!1371277))

(declare-fun m!1371317 () Bool)

(assert (=> b!1486398 m!1371317))

(push 1)

