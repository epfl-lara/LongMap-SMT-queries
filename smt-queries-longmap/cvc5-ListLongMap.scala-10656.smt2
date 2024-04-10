; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125074 () Bool)

(assert start!125074)

(declare-datatypes ((array!98522 0))(
  ( (array!98523 (arr!47549 (Array (_ BitVec 32) (_ BitVec 64))) (size!48099 (_ BitVec 32))) )
))
(declare-fun lt!638190 () array!98522)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638192 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!819274 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1456087 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11801 0))(
  ( (MissingZero!11801 (index!49596 (_ BitVec 32))) (Found!11801 (index!49597 (_ BitVec 32))) (Intermediate!11801 (undefined!12613 Bool) (index!49598 (_ BitVec 32)) (x!131226 (_ BitVec 32))) (Undefined!11801) (MissingVacant!11801 (index!49599 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98522 (_ BitVec 32)) SeekEntryResult!11801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98522 (_ BitVec 32)) SeekEntryResult!11801)

(assert (=> b!1456087 (= e!819274 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638192 lt!638190 mask!2687) (seekEntryOrOpen!0 lt!638192 lt!638190 mask!2687)))))

(declare-fun b!1456088 () Bool)

(declare-fun res!986639 () Bool)

(declare-fun e!819276 () Bool)

(assert (=> b!1456088 (=> (not res!986639) (not e!819276))))

(declare-fun a!2862 () array!98522)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456088 (= res!986639 (validKeyInArray!0 (select (arr!47549 a!2862) i!1006)))))

(declare-fun b!1456089 () Bool)

(declare-fun res!986646 () Bool)

(assert (=> b!1456089 (=> (not res!986646) (not e!819276))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1456089 (= res!986646 (validKeyInArray!0 (select (arr!47549 a!2862) j!93)))))

(declare-fun b!1456090 () Bool)

(declare-fun res!986645 () Bool)

(assert (=> b!1456090 (=> (not res!986645) (not e!819276))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456090 (= res!986645 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48099 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48099 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48099 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!638186 () (_ BitVec 32))

(declare-fun e!819272 () Bool)

(declare-fun b!1456091 () Bool)

(declare-fun lt!638188 () SeekEntryResult!11801)

(assert (=> b!1456091 (= e!819272 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638186 intermediateAfterIndex!19 lt!638192 lt!638190 mask!2687) lt!638188)))))

(declare-fun b!1456092 () Bool)

(declare-fun e!819281 () Bool)

(declare-fun e!819273 () Bool)

(assert (=> b!1456092 (= e!819281 e!819273)))

(declare-fun res!986635 () Bool)

(assert (=> b!1456092 (=> (not res!986635) (not e!819273))))

(declare-fun lt!638191 () SeekEntryResult!11801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98522 (_ BitVec 32)) SeekEntryResult!11801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456092 (= res!986635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47549 a!2862) j!93) mask!2687) (select (arr!47549 a!2862) j!93) a!2862 mask!2687) lt!638191))))

(assert (=> b!1456092 (= lt!638191 (Intermediate!11801 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456093 () Bool)

(declare-fun e!819278 () Bool)

(assert (=> b!1456093 (= e!819278 true)))

(declare-fun lt!638189 () Bool)

(assert (=> b!1456093 (= lt!638189 e!819272)))

(declare-fun c!134237 () Bool)

(assert (=> b!1456093 (= c!134237 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456086 () Bool)

(declare-fun res!986642 () Bool)

(assert (=> b!1456086 (=> res!986642 e!819278)))

(assert (=> b!1456086 (= res!986642 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638186 (select (arr!47549 a!2862) j!93) a!2862 mask!2687) lt!638191)))))

(declare-fun res!986643 () Bool)

(assert (=> start!125074 (=> (not res!986643) (not e!819276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125074 (= res!986643 (validMask!0 mask!2687))))

(assert (=> start!125074 e!819276))

(assert (=> start!125074 true))

(declare-fun array_inv!36577 (array!98522) Bool)

(assert (=> start!125074 (array_inv!36577 a!2862)))

(declare-fun b!1456094 () Bool)

(declare-fun lt!638193 () SeekEntryResult!11801)

(assert (=> b!1456094 (= e!819272 (not (= lt!638193 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638186 lt!638192 lt!638190 mask!2687))))))

(declare-fun b!1456095 () Bool)

(declare-fun res!986637 () Bool)

(assert (=> b!1456095 (=> (not res!986637) (not e!819276))))

(declare-datatypes ((List!34050 0))(
  ( (Nil!34047) (Cons!34046 (h!35396 (_ BitVec 64)) (t!48744 List!34050)) )
))
(declare-fun arrayNoDuplicates!0 (array!98522 (_ BitVec 32) List!34050) Bool)

(assert (=> b!1456095 (= res!986637 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34047))))

(declare-fun b!1456096 () Bool)

(assert (=> b!1456096 (= e!819274 (= lt!638193 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638192 lt!638190 mask!2687)))))

(declare-fun b!1456097 () Bool)

(declare-fun res!986647 () Bool)

(declare-fun e!819277 () Bool)

(assert (=> b!1456097 (=> (not res!986647) (not e!819277))))

(assert (=> b!1456097 (= res!986647 e!819274)))

(declare-fun c!134238 () Bool)

(assert (=> b!1456097 (= c!134238 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456098 () Bool)

(declare-fun e!819275 () Bool)

(assert (=> b!1456098 (= e!819275 e!819278)))

(declare-fun res!986636 () Bool)

(assert (=> b!1456098 (=> res!986636 e!819278)))

(assert (=> b!1456098 (= res!986636 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638186 #b00000000000000000000000000000000) (bvsge lt!638186 (size!48099 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456098 (= lt!638186 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456098 (= lt!638188 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638192 lt!638190 mask!2687))))

(assert (=> b!1456098 (= lt!638188 (seekEntryOrOpen!0 lt!638192 lt!638190 mask!2687))))

(declare-fun e!819279 () Bool)

(declare-fun b!1456099 () Bool)

(assert (=> b!1456099 (= e!819279 (and (or (= (select (arr!47549 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47549 a!2862) intermediateBeforeIndex!19) (select (arr!47549 a!2862) j!93))) (let ((bdg!53215 (select (store (arr!47549 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47549 a!2862) index!646) bdg!53215) (= (select (arr!47549 a!2862) index!646) (select (arr!47549 a!2862) j!93))) (= (select (arr!47549 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53215 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456100 () Bool)

(assert (=> b!1456100 (= e!819276 e!819281)))

(declare-fun res!986640 () Bool)

(assert (=> b!1456100 (=> (not res!986640) (not e!819281))))

(assert (=> b!1456100 (= res!986640 (= (select (store (arr!47549 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456100 (= lt!638190 (array!98523 (store (arr!47549 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48099 a!2862)))))

(declare-fun b!1456101 () Bool)

(declare-fun res!986633 () Bool)

(assert (=> b!1456101 (=> (not res!986633) (not e!819276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98522 (_ BitVec 32)) Bool)

(assert (=> b!1456101 (= res!986633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456102 () Bool)

(declare-fun res!986641 () Bool)

(assert (=> b!1456102 (=> (not res!986641) (not e!819273))))

(assert (=> b!1456102 (= res!986641 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47549 a!2862) j!93) a!2862 mask!2687) lt!638191))))

(declare-fun b!1456103 () Bool)

(assert (=> b!1456103 (= e!819277 (not e!819275))))

(declare-fun res!986644 () Bool)

(assert (=> b!1456103 (=> res!986644 e!819275)))

(assert (=> b!1456103 (= res!986644 (or (and (= (select (arr!47549 a!2862) index!646) (select (store (arr!47549 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47549 a!2862) index!646) (select (arr!47549 a!2862) j!93))) (= (select (arr!47549 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456103 e!819279))

(declare-fun res!986634 () Bool)

(assert (=> b!1456103 (=> (not res!986634) (not e!819279))))

(assert (=> b!1456103 (= res!986634 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49098 0))(
  ( (Unit!49099) )
))
(declare-fun lt!638187 () Unit!49098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49098)

(assert (=> b!1456103 (= lt!638187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456104 () Bool)

(declare-fun res!986648 () Bool)

(assert (=> b!1456104 (=> (not res!986648) (not e!819276))))

(assert (=> b!1456104 (= res!986648 (and (= (size!48099 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48099 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48099 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456105 () Bool)

(declare-fun res!986649 () Bool)

(assert (=> b!1456105 (=> (not res!986649) (not e!819279))))

(assert (=> b!1456105 (= res!986649 (= (seekEntryOrOpen!0 (select (arr!47549 a!2862) j!93) a!2862 mask!2687) (Found!11801 j!93)))))

(declare-fun b!1456106 () Bool)

(declare-fun res!986638 () Bool)

(assert (=> b!1456106 (=> (not res!986638) (not e!819277))))

(assert (=> b!1456106 (= res!986638 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456107 () Bool)

(assert (=> b!1456107 (= e!819273 e!819277)))

(declare-fun res!986650 () Bool)

(assert (=> b!1456107 (=> (not res!986650) (not e!819277))))

(assert (=> b!1456107 (= res!986650 (= lt!638193 (Intermediate!11801 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456107 (= lt!638193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638192 mask!2687) lt!638192 lt!638190 mask!2687))))

(assert (=> b!1456107 (= lt!638192 (select (store (arr!47549 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125074 res!986643) b!1456104))

(assert (= (and b!1456104 res!986648) b!1456088))

(assert (= (and b!1456088 res!986639) b!1456089))

(assert (= (and b!1456089 res!986646) b!1456101))

(assert (= (and b!1456101 res!986633) b!1456095))

(assert (= (and b!1456095 res!986637) b!1456090))

(assert (= (and b!1456090 res!986645) b!1456100))

(assert (= (and b!1456100 res!986640) b!1456092))

(assert (= (and b!1456092 res!986635) b!1456102))

(assert (= (and b!1456102 res!986641) b!1456107))

(assert (= (and b!1456107 res!986650) b!1456097))

(assert (= (and b!1456097 c!134238) b!1456096))

(assert (= (and b!1456097 (not c!134238)) b!1456087))

(assert (= (and b!1456097 res!986647) b!1456106))

(assert (= (and b!1456106 res!986638) b!1456103))

(assert (= (and b!1456103 res!986634) b!1456105))

(assert (= (and b!1456105 res!986649) b!1456099))

(assert (= (and b!1456103 (not res!986644)) b!1456098))

(assert (= (and b!1456098 (not res!986636)) b!1456086))

(assert (= (and b!1456086 (not res!986642)) b!1456093))

(assert (= (and b!1456093 c!134237) b!1456094))

(assert (= (and b!1456093 (not c!134237)) b!1456091))

(declare-fun m!1344229 () Bool)

(assert (=> b!1456105 m!1344229))

(assert (=> b!1456105 m!1344229))

(declare-fun m!1344231 () Bool)

(assert (=> b!1456105 m!1344231))

(declare-fun m!1344233 () Bool)

(assert (=> b!1456099 m!1344233))

(declare-fun m!1344235 () Bool)

(assert (=> b!1456099 m!1344235))

(declare-fun m!1344237 () Bool)

(assert (=> b!1456099 m!1344237))

(declare-fun m!1344239 () Bool)

(assert (=> b!1456099 m!1344239))

(assert (=> b!1456099 m!1344229))

(declare-fun m!1344241 () Bool)

(assert (=> b!1456107 m!1344241))

(assert (=> b!1456107 m!1344241))

(declare-fun m!1344243 () Bool)

(assert (=> b!1456107 m!1344243))

(assert (=> b!1456107 m!1344233))

(declare-fun m!1344245 () Bool)

(assert (=> b!1456107 m!1344245))

(declare-fun m!1344247 () Bool)

(assert (=> b!1456095 m!1344247))

(assert (=> b!1456086 m!1344229))

(assert (=> b!1456086 m!1344229))

(declare-fun m!1344249 () Bool)

(assert (=> b!1456086 m!1344249))

(declare-fun m!1344251 () Bool)

(assert (=> b!1456094 m!1344251))

(declare-fun m!1344253 () Bool)

(assert (=> b!1456098 m!1344253))

(declare-fun m!1344255 () Bool)

(assert (=> b!1456098 m!1344255))

(declare-fun m!1344257 () Bool)

(assert (=> b!1456098 m!1344257))

(assert (=> b!1456100 m!1344233))

(declare-fun m!1344259 () Bool)

(assert (=> b!1456100 m!1344259))

(declare-fun m!1344261 () Bool)

(assert (=> b!1456103 m!1344261))

(assert (=> b!1456103 m!1344233))

(assert (=> b!1456103 m!1344237))

(assert (=> b!1456103 m!1344239))

(declare-fun m!1344263 () Bool)

(assert (=> b!1456103 m!1344263))

(assert (=> b!1456103 m!1344229))

(assert (=> b!1456089 m!1344229))

(assert (=> b!1456089 m!1344229))

(declare-fun m!1344265 () Bool)

(assert (=> b!1456089 m!1344265))

(declare-fun m!1344267 () Bool)

(assert (=> start!125074 m!1344267))

(declare-fun m!1344269 () Bool)

(assert (=> start!125074 m!1344269))

(declare-fun m!1344271 () Bool)

(assert (=> b!1456091 m!1344271))

(assert (=> b!1456102 m!1344229))

(assert (=> b!1456102 m!1344229))

(declare-fun m!1344273 () Bool)

(assert (=> b!1456102 m!1344273))

(declare-fun m!1344275 () Bool)

(assert (=> b!1456088 m!1344275))

(assert (=> b!1456088 m!1344275))

(declare-fun m!1344277 () Bool)

(assert (=> b!1456088 m!1344277))

(assert (=> b!1456087 m!1344255))

(assert (=> b!1456087 m!1344257))

(declare-fun m!1344279 () Bool)

(assert (=> b!1456101 m!1344279))

(assert (=> b!1456092 m!1344229))

(assert (=> b!1456092 m!1344229))

(declare-fun m!1344281 () Bool)

(assert (=> b!1456092 m!1344281))

(assert (=> b!1456092 m!1344281))

(assert (=> b!1456092 m!1344229))

(declare-fun m!1344283 () Bool)

(assert (=> b!1456092 m!1344283))

(declare-fun m!1344285 () Bool)

(assert (=> b!1456096 m!1344285))

(push 1)

