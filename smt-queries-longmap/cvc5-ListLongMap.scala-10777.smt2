; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126160 () Bool)

(assert start!126160)

(declare-fun b!1477300 () Bool)

(declare-fun res!1003442 () Bool)

(declare-fun e!828778 () Bool)

(assert (=> b!1477300 (=> (not res!1003442) (not e!828778))))

(declare-datatypes ((array!99266 0))(
  ( (array!99267 (arr!47912 (Array (_ BitVec 32) (_ BitVec 64))) (size!48462 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99266)

(declare-datatypes ((List!34413 0))(
  ( (Nil!34410) (Cons!34409 (h!35777 (_ BitVec 64)) (t!49107 List!34413)) )
))
(declare-fun arrayNoDuplicates!0 (array!99266 (_ BitVec 32) List!34413) Bool)

(assert (=> b!1477300 (= res!1003442 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34410))))

(declare-fun b!1477301 () Bool)

(declare-fun e!828777 () Bool)

(assert (=> b!1477301 (= e!828778 e!828777)))

(declare-fun res!1003446 () Bool)

(assert (=> b!1477301 (=> (not res!1003446) (not e!828777))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477301 (= res!1003446 (= (select (store (arr!47912 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645302 () array!99266)

(assert (=> b!1477301 (= lt!645302 (array!99267 (store (arr!47912 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48462 a!2862)))))

(declare-fun b!1477302 () Bool)

(declare-fun e!828779 () Bool)

(declare-fun e!828781 () Bool)

(assert (=> b!1477302 (= e!828779 e!828781)))

(declare-fun res!1003451 () Bool)

(assert (=> b!1477302 (=> (not res!1003451) (not e!828781))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12152 0))(
  ( (MissingZero!12152 (index!51000 (_ BitVec 32))) (Found!12152 (index!51001 (_ BitVec 32))) (Intermediate!12152 (undefined!12964 Bool) (index!51002 (_ BitVec 32)) (x!132599 (_ BitVec 32))) (Undefined!12152) (MissingVacant!12152 (index!51003 (_ BitVec 32))) )
))
(declare-fun lt!645306 () SeekEntryResult!12152)

(assert (=> b!1477302 (= res!1003451 (= lt!645306 (Intermediate!12152 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645305 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99266 (_ BitVec 32)) SeekEntryResult!12152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477302 (= lt!645306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645305 mask!2687) lt!645305 lt!645302 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477302 (= lt!645305 (select (store (arr!47912 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477303 () Bool)

(declare-fun res!1003449 () Bool)

(assert (=> b!1477303 (=> (not res!1003449) (not e!828778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477303 (= res!1003449 (validKeyInArray!0 (select (arr!47912 a!2862) i!1006)))))

(declare-fun b!1477304 () Bool)

(declare-fun e!828774 () Bool)

(declare-fun e!828782 () Bool)

(assert (=> b!1477304 (= e!828774 e!828782)))

(declare-fun res!1003445 () Bool)

(assert (=> b!1477304 (=> res!1003445 e!828782)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1477304 (= res!1003445 (or (and (= (select (arr!47912 a!2862) index!646) (select (store (arr!47912 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47912 a!2862) index!646) (select (arr!47912 a!2862) j!93))) (not (= (select (arr!47912 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477305 () Bool)

(declare-fun res!1003454 () Bool)

(assert (=> b!1477305 (=> (not res!1003454) (not e!828781))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477305 (= res!1003454 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477306 () Bool)

(declare-fun res!1003447 () Bool)

(assert (=> b!1477306 (=> (not res!1003447) (not e!828778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99266 (_ BitVec 32)) Bool)

(assert (=> b!1477306 (= res!1003447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477307 () Bool)

(declare-fun res!1003455 () Bool)

(assert (=> b!1477307 (=> (not res!1003455) (not e!828778))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477307 (= res!1003455 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48462 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48462 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48462 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477308 () Bool)

(declare-fun res!1003450 () Bool)

(assert (=> b!1477308 (=> (not res!1003450) (not e!828778))))

(assert (=> b!1477308 (= res!1003450 (and (= (size!48462 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48462 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48462 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477309 () Bool)

(assert (=> b!1477309 (= e!828777 e!828779)))

(declare-fun res!1003456 () Bool)

(assert (=> b!1477309 (=> (not res!1003456) (not e!828779))))

(declare-fun lt!645303 () SeekEntryResult!12152)

(assert (=> b!1477309 (= res!1003456 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47912 a!2862) j!93) mask!2687) (select (arr!47912 a!2862) j!93) a!2862 mask!2687) lt!645303))))

(assert (=> b!1477309 (= lt!645303 (Intermediate!12152 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!828775 () Bool)

(declare-fun b!1477310 () Bool)

(assert (=> b!1477310 (= e!828775 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477311 () Bool)

(declare-fun res!1003441 () Bool)

(assert (=> b!1477311 (=> (not res!1003441) (not e!828779))))

(assert (=> b!1477311 (= res!1003441 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47912 a!2862) j!93) a!2862 mask!2687) lt!645303))))

(declare-fun b!1477312 () Bool)

(assert (=> b!1477312 (= e!828781 (not true))))

(assert (=> b!1477312 e!828774))

(declare-fun res!1003452 () Bool)

(assert (=> b!1477312 (=> (not res!1003452) (not e!828774))))

(declare-fun lt!645304 () SeekEntryResult!12152)

(assert (=> b!1477312 (= res!1003452 (and (= lt!645304 (Found!12152 j!93)) (or (= (select (arr!47912 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47912 a!2862) intermediateBeforeIndex!19) (select (arr!47912 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99266 (_ BitVec 32)) SeekEntryResult!12152)

(assert (=> b!1477312 (= lt!645304 (seekEntryOrOpen!0 (select (arr!47912 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477312 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49644 0))(
  ( (Unit!49645) )
))
(declare-fun lt!645301 () Unit!49644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49644)

(assert (=> b!1477312 (= lt!645301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1003443 () Bool)

(assert (=> start!126160 (=> (not res!1003443) (not e!828778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126160 (= res!1003443 (validMask!0 mask!2687))))

(assert (=> start!126160 e!828778))

(assert (=> start!126160 true))

(declare-fun array_inv!36940 (array!99266) Bool)

(assert (=> start!126160 (array_inv!36940 a!2862)))

(declare-fun b!1477313 () Bool)

(assert (=> b!1477313 (= e!828782 e!828775)))

(declare-fun res!1003444 () Bool)

(assert (=> b!1477313 (=> (not res!1003444) (not e!828775))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99266 (_ BitVec 32)) SeekEntryResult!12152)

(assert (=> b!1477313 (= res!1003444 (= lt!645304 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47912 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!828776 () Bool)

(declare-fun b!1477314 () Bool)

(assert (=> b!1477314 (= e!828776 (= lt!645306 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645305 lt!645302 mask!2687)))))

(declare-fun b!1477315 () Bool)

(declare-fun res!1003448 () Bool)

(assert (=> b!1477315 (=> (not res!1003448) (not e!828781))))

(assert (=> b!1477315 (= res!1003448 e!828776)))

(declare-fun c!136449 () Bool)

(assert (=> b!1477315 (= c!136449 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477316 () Bool)

(declare-fun res!1003453 () Bool)

(assert (=> b!1477316 (=> (not res!1003453) (not e!828778))))

(assert (=> b!1477316 (= res!1003453 (validKeyInArray!0 (select (arr!47912 a!2862) j!93)))))

(declare-fun b!1477317 () Bool)

(assert (=> b!1477317 (= e!828776 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645305 lt!645302 mask!2687) (seekEntryOrOpen!0 lt!645305 lt!645302 mask!2687)))))

(assert (= (and start!126160 res!1003443) b!1477308))

(assert (= (and b!1477308 res!1003450) b!1477303))

(assert (= (and b!1477303 res!1003449) b!1477316))

(assert (= (and b!1477316 res!1003453) b!1477306))

(assert (= (and b!1477306 res!1003447) b!1477300))

(assert (= (and b!1477300 res!1003442) b!1477307))

(assert (= (and b!1477307 res!1003455) b!1477301))

(assert (= (and b!1477301 res!1003446) b!1477309))

(assert (= (and b!1477309 res!1003456) b!1477311))

(assert (= (and b!1477311 res!1003441) b!1477302))

(assert (= (and b!1477302 res!1003451) b!1477315))

(assert (= (and b!1477315 c!136449) b!1477314))

(assert (= (and b!1477315 (not c!136449)) b!1477317))

(assert (= (and b!1477315 res!1003448) b!1477305))

(assert (= (and b!1477305 res!1003454) b!1477312))

(assert (= (and b!1477312 res!1003452) b!1477304))

(assert (= (and b!1477304 (not res!1003445)) b!1477313))

(assert (= (and b!1477313 res!1003444) b!1477310))

(declare-fun m!1363255 () Bool)

(assert (=> b!1477304 m!1363255))

(declare-fun m!1363257 () Bool)

(assert (=> b!1477304 m!1363257))

(declare-fun m!1363259 () Bool)

(assert (=> b!1477304 m!1363259))

(declare-fun m!1363261 () Bool)

(assert (=> b!1477304 m!1363261))

(declare-fun m!1363263 () Bool)

(assert (=> b!1477302 m!1363263))

(assert (=> b!1477302 m!1363263))

(declare-fun m!1363265 () Bool)

(assert (=> b!1477302 m!1363265))

(assert (=> b!1477302 m!1363257))

(declare-fun m!1363267 () Bool)

(assert (=> b!1477302 m!1363267))

(declare-fun m!1363269 () Bool)

(assert (=> b!1477303 m!1363269))

(assert (=> b!1477303 m!1363269))

(declare-fun m!1363271 () Bool)

(assert (=> b!1477303 m!1363271))

(assert (=> b!1477313 m!1363261))

(assert (=> b!1477313 m!1363261))

(declare-fun m!1363273 () Bool)

(assert (=> b!1477313 m!1363273))

(assert (=> b!1477301 m!1363257))

(declare-fun m!1363275 () Bool)

(assert (=> b!1477301 m!1363275))

(declare-fun m!1363277 () Bool)

(assert (=> b!1477317 m!1363277))

(declare-fun m!1363279 () Bool)

(assert (=> b!1477317 m!1363279))

(declare-fun m!1363281 () Bool)

(assert (=> b!1477306 m!1363281))

(assert (=> b!1477309 m!1363261))

(assert (=> b!1477309 m!1363261))

(declare-fun m!1363283 () Bool)

(assert (=> b!1477309 m!1363283))

(assert (=> b!1477309 m!1363283))

(assert (=> b!1477309 m!1363261))

(declare-fun m!1363285 () Bool)

(assert (=> b!1477309 m!1363285))

(assert (=> b!1477316 m!1363261))

(assert (=> b!1477316 m!1363261))

(declare-fun m!1363287 () Bool)

(assert (=> b!1477316 m!1363287))

(declare-fun m!1363289 () Bool)

(assert (=> start!126160 m!1363289))

(declare-fun m!1363291 () Bool)

(assert (=> start!126160 m!1363291))

(declare-fun m!1363293 () Bool)

(assert (=> b!1477300 m!1363293))

(declare-fun m!1363295 () Bool)

(assert (=> b!1477312 m!1363295))

(declare-fun m!1363297 () Bool)

(assert (=> b!1477312 m!1363297))

(assert (=> b!1477312 m!1363261))

(declare-fun m!1363299 () Bool)

(assert (=> b!1477312 m!1363299))

(declare-fun m!1363301 () Bool)

(assert (=> b!1477312 m!1363301))

(assert (=> b!1477312 m!1363261))

(declare-fun m!1363303 () Bool)

(assert (=> b!1477314 m!1363303))

(assert (=> b!1477311 m!1363261))

(assert (=> b!1477311 m!1363261))

(declare-fun m!1363305 () Bool)

(assert (=> b!1477311 m!1363305))

(push 1)

