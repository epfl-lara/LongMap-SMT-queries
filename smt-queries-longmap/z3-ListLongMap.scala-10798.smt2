; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126326 () Bool)

(assert start!126326)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646469 () (_ BitVec 64))

(declare-fun b!1481045 () Bool)

(declare-datatypes ((array!99343 0))(
  ( (array!99344 (arr!47950 (Array (_ BitVec 32) (_ BitVec 64))) (size!48502 (_ BitVec 32))) )
))
(declare-fun lt!646467 () array!99343)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!830640 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12215 0))(
  ( (MissingZero!12215 (index!51252 (_ BitVec 32))) (Found!12215 (index!51253 (_ BitVec 32))) (Intermediate!12215 (undefined!13027 Bool) (index!51254 (_ BitVec 32)) (x!132835 (_ BitVec 32))) (Undefined!12215) (MissingVacant!12215 (index!51255 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99343 (_ BitVec 32)) SeekEntryResult!12215)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99343 (_ BitVec 32)) SeekEntryResult!12215)

(assert (=> b!1481045 (= e!830640 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646469 lt!646467 mask!2687) (seekEntryOrOpen!0 lt!646469 lt!646467 mask!2687)))))

(declare-fun b!1481046 () Bool)

(declare-fun res!1006598 () Bool)

(declare-fun e!830637 () Bool)

(assert (=> b!1481046 (=> (not res!1006598) (not e!830637))))

(declare-fun lt!646468 () SeekEntryResult!12215)

(declare-fun a!2862 () array!99343)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99343 (_ BitVec 32)) SeekEntryResult!12215)

(assert (=> b!1481046 (= res!1006598 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!646468))))

(declare-fun b!1481047 () Bool)

(declare-fun res!1006610 () Bool)

(declare-fun e!830641 () Bool)

(assert (=> b!1481047 (=> (not res!1006610) (not e!830641))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481047 (= res!1006610 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!830642 () Bool)

(declare-fun b!1481048 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481048 (= e!830642 (and (or (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) (select (arr!47950 a!2862) j!93))) (or (and (= (select (arr!47950 a!2862) index!646) (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47950 a!2862) index!646) (select (arr!47950 a!2862) j!93))) (= (select (arr!47950 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481049 () Bool)

(assert (=> b!1481049 (= e!830641 (not (or (and (= (select (arr!47950 a!2862) index!646) (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47950 a!2862) index!646) (select (arr!47950 a!2862) j!93))) (= (select (arr!47950 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1481049 e!830642))

(declare-fun res!1006609 () Bool)

(assert (=> b!1481049 (=> (not res!1006609) (not e!830642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99343 (_ BitVec 32)) Bool)

(assert (=> b!1481049 (= res!1006609 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49611 0))(
  ( (Unit!49612) )
))
(declare-fun lt!646466 () Unit!49611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49611)

(assert (=> b!1481049 (= lt!646466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481050 () Bool)

(declare-fun res!1006606 () Bool)

(declare-fun e!830636 () Bool)

(assert (=> b!1481050 (=> (not res!1006606) (not e!830636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481050 (= res!1006606 (validKeyInArray!0 (select (arr!47950 a!2862) j!93)))))

(declare-fun b!1481051 () Bool)

(declare-fun res!1006599 () Bool)

(assert (=> b!1481051 (=> (not res!1006599) (not e!830636))))

(assert (=> b!1481051 (= res!1006599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481052 () Bool)

(declare-fun res!1006605 () Bool)

(assert (=> b!1481052 (=> (not res!1006605) (not e!830636))))

(declare-datatypes ((List!34529 0))(
  ( (Nil!34526) (Cons!34525 (h!35896 (_ BitVec 64)) (t!49215 List!34529)) )
))
(declare-fun arrayNoDuplicates!0 (array!99343 (_ BitVec 32) List!34529) Bool)

(assert (=> b!1481052 (= res!1006605 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34526))))

(declare-fun b!1481053 () Bool)

(declare-fun res!1006608 () Bool)

(assert (=> b!1481053 (=> (not res!1006608) (not e!830636))))

(assert (=> b!1481053 (= res!1006608 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48502 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48502 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48502 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481055 () Bool)

(declare-fun e!830638 () Bool)

(assert (=> b!1481055 (= e!830638 e!830637)))

(declare-fun res!1006607 () Bool)

(assert (=> b!1481055 (=> (not res!1006607) (not e!830637))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481055 (= res!1006607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47950 a!2862) j!93) mask!2687) (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!646468))))

(assert (=> b!1481055 (= lt!646468 (Intermediate!12215 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481056 () Bool)

(declare-fun res!1006604 () Bool)

(assert (=> b!1481056 (=> (not res!1006604) (not e!830636))))

(assert (=> b!1481056 (= res!1006604 (validKeyInArray!0 (select (arr!47950 a!2862) i!1006)))))

(declare-fun b!1481057 () Bool)

(declare-fun res!1006611 () Bool)

(assert (=> b!1481057 (=> (not res!1006611) (not e!830636))))

(assert (=> b!1481057 (= res!1006611 (and (= (size!48502 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48502 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48502 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481058 () Bool)

(assert (=> b!1481058 (= e!830636 e!830638)))

(declare-fun res!1006600 () Bool)

(assert (=> b!1481058 (=> (not res!1006600) (not e!830638))))

(assert (=> b!1481058 (= res!1006600 (= (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481058 (= lt!646467 (array!99344 (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48502 a!2862)))))

(declare-fun b!1481059 () Bool)

(assert (=> b!1481059 (= e!830637 e!830641)))

(declare-fun res!1006603 () Bool)

(assert (=> b!1481059 (=> (not res!1006603) (not e!830641))))

(declare-fun lt!646465 () SeekEntryResult!12215)

(assert (=> b!1481059 (= res!1006603 (= lt!646465 (Intermediate!12215 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481059 (= lt!646465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646469 mask!2687) lt!646469 lt!646467 mask!2687))))

(assert (=> b!1481059 (= lt!646469 (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481060 () Bool)

(declare-fun res!1006601 () Bool)

(assert (=> b!1481060 (=> (not res!1006601) (not e!830641))))

(assert (=> b!1481060 (= res!1006601 e!830640)))

(declare-fun c!136747 () Bool)

(assert (=> b!1481060 (= c!136747 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481061 () Bool)

(declare-fun res!1006612 () Bool)

(assert (=> b!1481061 (=> (not res!1006612) (not e!830642))))

(assert (=> b!1481061 (= res!1006612 (= (seekEntryOrOpen!0 (select (arr!47950 a!2862) j!93) a!2862 mask!2687) (Found!12215 j!93)))))

(declare-fun b!1481054 () Bool)

(assert (=> b!1481054 (= e!830640 (= lt!646465 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646469 lt!646467 mask!2687)))))

(declare-fun res!1006602 () Bool)

(assert (=> start!126326 (=> (not res!1006602) (not e!830636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126326 (= res!1006602 (validMask!0 mask!2687))))

(assert (=> start!126326 e!830636))

(assert (=> start!126326 true))

(declare-fun array_inv!37183 (array!99343) Bool)

(assert (=> start!126326 (array_inv!37183 a!2862)))

(assert (= (and start!126326 res!1006602) b!1481057))

(assert (= (and b!1481057 res!1006611) b!1481056))

(assert (= (and b!1481056 res!1006604) b!1481050))

(assert (= (and b!1481050 res!1006606) b!1481051))

(assert (= (and b!1481051 res!1006599) b!1481052))

(assert (= (and b!1481052 res!1006605) b!1481053))

(assert (= (and b!1481053 res!1006608) b!1481058))

(assert (= (and b!1481058 res!1006600) b!1481055))

(assert (= (and b!1481055 res!1006607) b!1481046))

(assert (= (and b!1481046 res!1006598) b!1481059))

(assert (= (and b!1481059 res!1006603) b!1481060))

(assert (= (and b!1481060 c!136747) b!1481054))

(assert (= (and b!1481060 (not c!136747)) b!1481045))

(assert (= (and b!1481060 res!1006601) b!1481047))

(assert (= (and b!1481047 res!1006610) b!1481049))

(assert (= (and b!1481049 res!1006609) b!1481061))

(assert (= (and b!1481061 res!1006612) b!1481048))

(declare-fun m!1366251 () Bool)

(assert (=> b!1481046 m!1366251))

(assert (=> b!1481046 m!1366251))

(declare-fun m!1366253 () Bool)

(assert (=> b!1481046 m!1366253))

(declare-fun m!1366255 () Bool)

(assert (=> b!1481054 m!1366255))

(declare-fun m!1366257 () Bool)

(assert (=> b!1481045 m!1366257))

(declare-fun m!1366259 () Bool)

(assert (=> b!1481045 m!1366259))

(declare-fun m!1366261 () Bool)

(assert (=> b!1481052 m!1366261))

(declare-fun m!1366263 () Bool)

(assert (=> start!126326 m!1366263))

(declare-fun m!1366265 () Bool)

(assert (=> start!126326 m!1366265))

(declare-fun m!1366267 () Bool)

(assert (=> b!1481058 m!1366267))

(declare-fun m!1366269 () Bool)

(assert (=> b!1481058 m!1366269))

(assert (=> b!1481048 m!1366267))

(declare-fun m!1366271 () Bool)

(assert (=> b!1481048 m!1366271))

(declare-fun m!1366273 () Bool)

(assert (=> b!1481048 m!1366273))

(declare-fun m!1366275 () Bool)

(assert (=> b!1481048 m!1366275))

(assert (=> b!1481048 m!1366251))

(assert (=> b!1481061 m!1366251))

(assert (=> b!1481061 m!1366251))

(declare-fun m!1366277 () Bool)

(assert (=> b!1481061 m!1366277))

(declare-fun m!1366279 () Bool)

(assert (=> b!1481059 m!1366279))

(assert (=> b!1481059 m!1366279))

(declare-fun m!1366281 () Bool)

(assert (=> b!1481059 m!1366281))

(assert (=> b!1481059 m!1366267))

(declare-fun m!1366283 () Bool)

(assert (=> b!1481059 m!1366283))

(declare-fun m!1366285 () Bool)

(assert (=> b!1481049 m!1366285))

(assert (=> b!1481049 m!1366267))

(assert (=> b!1481049 m!1366273))

(assert (=> b!1481049 m!1366275))

(declare-fun m!1366287 () Bool)

(assert (=> b!1481049 m!1366287))

(assert (=> b!1481049 m!1366251))

(assert (=> b!1481055 m!1366251))

(assert (=> b!1481055 m!1366251))

(declare-fun m!1366289 () Bool)

(assert (=> b!1481055 m!1366289))

(assert (=> b!1481055 m!1366289))

(assert (=> b!1481055 m!1366251))

(declare-fun m!1366291 () Bool)

(assert (=> b!1481055 m!1366291))

(assert (=> b!1481050 m!1366251))

(assert (=> b!1481050 m!1366251))

(declare-fun m!1366293 () Bool)

(assert (=> b!1481050 m!1366293))

(declare-fun m!1366295 () Bool)

(assert (=> b!1481056 m!1366295))

(assert (=> b!1481056 m!1366295))

(declare-fun m!1366297 () Bool)

(assert (=> b!1481056 m!1366297))

(declare-fun m!1366299 () Bool)

(assert (=> b!1481051 m!1366299))

(check-sat (not b!1481045) (not b!1481051) (not b!1481046) (not b!1481049) (not b!1481059) (not b!1481061) (not b!1481054) (not b!1481052) (not start!126326) (not b!1481055) (not b!1481050) (not b!1481056))
(check-sat)
