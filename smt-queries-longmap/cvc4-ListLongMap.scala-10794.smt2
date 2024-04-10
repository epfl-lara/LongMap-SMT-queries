; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126266 () Bool)

(assert start!126266)

(declare-fun b!1480259 () Bool)

(declare-fun res!1006091 () Bool)

(declare-fun e!830258 () Bool)

(assert (=> b!1480259 (=> (not res!1006091) (not e!830258))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480259 (= res!1006091 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((array!99372 0))(
  ( (array!99373 (arr!47965 (Array (_ BitVec 32) (_ BitVec 64))) (size!48515 (_ BitVec 32))) )
))
(declare-fun lt!646358 () array!99372)

(declare-fun b!1480260 () Bool)

(declare-datatypes ((SeekEntryResult!12205 0))(
  ( (MissingZero!12205 (index!51212 (_ BitVec 32))) (Found!12205 (index!51213 (_ BitVec 32))) (Intermediate!12205 (undefined!13017 Bool) (index!51214 (_ BitVec 32)) (x!132788 (_ BitVec 32))) (Undefined!12205) (MissingVacant!12205 (index!51215 (_ BitVec 32))) )
))
(declare-fun lt!646356 () SeekEntryResult!12205)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!646353 () (_ BitVec 64))

(declare-fun e!830260 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99372 (_ BitVec 32)) SeekEntryResult!12205)

(assert (=> b!1480260 (= e!830260 (= lt!646356 (seekEntryOrOpen!0 lt!646353 lt!646358 mask!2687)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646357 () SeekEntryResult!12205)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99372 (_ BitVec 32)) SeekEntryResult!12205)

(assert (=> b!1480260 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646353 lt!646358 mask!2687) lt!646357)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49750 0))(
  ( (Unit!49751) )
))
(declare-fun lt!646355 () Unit!49750)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!99372)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49750)

(assert (=> b!1480260 (= lt!646355 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1480261 () Bool)

(declare-fun res!1006098 () Bool)

(declare-fun e!830259 () Bool)

(assert (=> b!1480261 (=> (not res!1006098) (not e!830259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480261 (= res!1006098 (validKeyInArray!0 (select (arr!47965 a!2862) i!1006)))))

(declare-fun b!1480262 () Bool)

(assert (=> b!1480262 (= e!830258 (not e!830260))))

(declare-fun res!1006095 () Bool)

(assert (=> b!1480262 (=> res!1006095 e!830260)))

(assert (=> b!1480262 (= res!1006095 (or (and (= (select (arr!47965 a!2862) index!646) (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47965 a!2862) index!646) (select (arr!47965 a!2862) j!93))) (not (= (select (arr!47965 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47965 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830265 () Bool)

(assert (=> b!1480262 e!830265))

(declare-fun res!1006086 () Bool)

(assert (=> b!1480262 (=> (not res!1006086) (not e!830265))))

(assert (=> b!1480262 (= res!1006086 (and (= lt!646356 lt!646357) (or (= (select (arr!47965 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47965 a!2862) intermediateBeforeIndex!19) (select (arr!47965 a!2862) j!93)))))))

(assert (=> b!1480262 (= lt!646357 (Found!12205 j!93))))

(assert (=> b!1480262 (= lt!646356 (seekEntryOrOpen!0 (select (arr!47965 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99372 (_ BitVec 32)) Bool)

(assert (=> b!1480262 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646352 () Unit!49750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49750)

(assert (=> b!1480262 (= lt!646352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480263 () Bool)

(declare-fun e!830267 () Bool)

(assert (=> b!1480263 (= e!830267 e!830258)))

(declare-fun res!1006083 () Bool)

(assert (=> b!1480263 (=> (not res!1006083) (not e!830258))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!646354 () SeekEntryResult!12205)

(assert (=> b!1480263 (= res!1006083 (= lt!646354 (Intermediate!12205 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99372 (_ BitVec 32)) SeekEntryResult!12205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480263 (= lt!646354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646353 mask!2687) lt!646353 lt!646358 mask!2687))))

(assert (=> b!1480263 (= lt!646353 (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1006097 () Bool)

(assert (=> start!126266 (=> (not res!1006097) (not e!830259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126266 (= res!1006097 (validMask!0 mask!2687))))

(assert (=> start!126266 e!830259))

(assert (=> start!126266 true))

(declare-fun array_inv!36993 (array!99372) Bool)

(assert (=> start!126266 (array_inv!36993 a!2862)))

(declare-fun b!1480264 () Bool)

(declare-fun res!1006090 () Bool)

(assert (=> b!1480264 (=> res!1006090 e!830260)))

(assert (=> b!1480264 (= res!1006090 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47965 a!2862) j!93) a!2862 mask!2687) lt!646357)))))

(declare-fun b!1480265 () Bool)

(declare-fun e!830262 () Bool)

(assert (=> b!1480265 (= e!830262 e!830267)))

(declare-fun res!1006093 () Bool)

(assert (=> b!1480265 (=> (not res!1006093) (not e!830267))))

(declare-fun lt!646359 () SeekEntryResult!12205)

(assert (=> b!1480265 (= res!1006093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47965 a!2862) j!93) mask!2687) (select (arr!47965 a!2862) j!93) a!2862 mask!2687) lt!646359))))

(assert (=> b!1480265 (= lt!646359 (Intermediate!12205 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480266 () Bool)

(declare-fun res!1006087 () Bool)

(assert (=> b!1480266 (=> (not res!1006087) (not e!830259))))

(assert (=> b!1480266 (= res!1006087 (validKeyInArray!0 (select (arr!47965 a!2862) j!93)))))

(declare-fun b!1480267 () Bool)

(declare-fun res!1006084 () Bool)

(assert (=> b!1480267 (=> (not res!1006084) (not e!830259))))

(assert (=> b!1480267 (= res!1006084 (and (= (size!48515 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48515 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48515 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480268 () Bool)

(declare-fun e!830261 () Bool)

(assert (=> b!1480268 (= e!830265 e!830261)))

(declare-fun res!1006089 () Bool)

(assert (=> b!1480268 (=> res!1006089 e!830261)))

(assert (=> b!1480268 (= res!1006089 (or (and (= (select (arr!47965 a!2862) index!646) (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47965 a!2862) index!646) (select (arr!47965 a!2862) j!93))) (not (= (select (arr!47965 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830263 () Bool)

(declare-fun b!1480269 () Bool)

(assert (=> b!1480269 (= e!830263 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480270 () Bool)

(assert (=> b!1480270 (= e!830259 e!830262)))

(declare-fun res!1006088 () Bool)

(assert (=> b!1480270 (=> (not res!1006088) (not e!830262))))

(assert (=> b!1480270 (= res!1006088 (= (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480270 (= lt!646358 (array!99373 (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48515 a!2862)))))

(declare-fun b!1480271 () Bool)

(declare-fun res!1006096 () Bool)

(assert (=> b!1480271 (=> (not res!1006096) (not e!830259))))

(assert (=> b!1480271 (= res!1006096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480272 () Bool)

(declare-fun res!1006082 () Bool)

(assert (=> b!1480272 (=> (not res!1006082) (not e!830259))))

(declare-datatypes ((List!34466 0))(
  ( (Nil!34463) (Cons!34462 (h!35830 (_ BitVec 64)) (t!49160 List!34466)) )
))
(declare-fun arrayNoDuplicates!0 (array!99372 (_ BitVec 32) List!34466) Bool)

(assert (=> b!1480272 (= res!1006082 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34463))))

(declare-fun b!1480273 () Bool)

(declare-fun res!1006099 () Bool)

(assert (=> b!1480273 (=> (not res!1006099) (not e!830259))))

(assert (=> b!1480273 (= res!1006099 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48515 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48515 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48515 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480274 () Bool)

(declare-fun res!1006092 () Bool)

(assert (=> b!1480274 (=> (not res!1006092) (not e!830267))))

(assert (=> b!1480274 (= res!1006092 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47965 a!2862) j!93) a!2862 mask!2687) lt!646359))))

(declare-fun e!830264 () Bool)

(declare-fun b!1480275 () Bool)

(assert (=> b!1480275 (= e!830264 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646353 lt!646358 mask!2687) (seekEntryOrOpen!0 lt!646353 lt!646358 mask!2687)))))

(declare-fun b!1480276 () Bool)

(declare-fun res!1006094 () Bool)

(assert (=> b!1480276 (=> (not res!1006094) (not e!830258))))

(assert (=> b!1480276 (= res!1006094 e!830264)))

(declare-fun c!136608 () Bool)

(assert (=> b!1480276 (= c!136608 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480277 () Bool)

(assert (=> b!1480277 (= e!830261 e!830263)))

(declare-fun res!1006085 () Bool)

(assert (=> b!1480277 (=> (not res!1006085) (not e!830263))))

(assert (=> b!1480277 (= res!1006085 (= lt!646356 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47965 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480278 () Bool)

(assert (=> b!1480278 (= e!830264 (= lt!646354 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646353 lt!646358 mask!2687)))))

(assert (= (and start!126266 res!1006097) b!1480267))

(assert (= (and b!1480267 res!1006084) b!1480261))

(assert (= (and b!1480261 res!1006098) b!1480266))

(assert (= (and b!1480266 res!1006087) b!1480271))

(assert (= (and b!1480271 res!1006096) b!1480272))

(assert (= (and b!1480272 res!1006082) b!1480273))

(assert (= (and b!1480273 res!1006099) b!1480270))

(assert (= (and b!1480270 res!1006088) b!1480265))

(assert (= (and b!1480265 res!1006093) b!1480274))

(assert (= (and b!1480274 res!1006092) b!1480263))

(assert (= (and b!1480263 res!1006083) b!1480276))

(assert (= (and b!1480276 c!136608) b!1480278))

(assert (= (and b!1480276 (not c!136608)) b!1480275))

(assert (= (and b!1480276 res!1006094) b!1480259))

(assert (= (and b!1480259 res!1006091) b!1480262))

(assert (= (and b!1480262 res!1006086) b!1480268))

(assert (= (and b!1480268 (not res!1006089)) b!1480277))

(assert (= (and b!1480277 res!1006085) b!1480269))

(assert (= (and b!1480262 (not res!1006095)) b!1480264))

(assert (= (and b!1480264 (not res!1006090)) b!1480260))

(declare-fun m!1366073 () Bool)

(assert (=> b!1480274 m!1366073))

(assert (=> b!1480274 m!1366073))

(declare-fun m!1366075 () Bool)

(assert (=> b!1480274 m!1366075))

(declare-fun m!1366077 () Bool)

(assert (=> b!1480272 m!1366077))

(assert (=> b!1480265 m!1366073))

(assert (=> b!1480265 m!1366073))

(declare-fun m!1366079 () Bool)

(assert (=> b!1480265 m!1366079))

(assert (=> b!1480265 m!1366079))

(assert (=> b!1480265 m!1366073))

(declare-fun m!1366081 () Bool)

(assert (=> b!1480265 m!1366081))

(assert (=> b!1480277 m!1366073))

(assert (=> b!1480277 m!1366073))

(declare-fun m!1366083 () Bool)

(assert (=> b!1480277 m!1366083))

(declare-fun m!1366085 () Bool)

(assert (=> start!126266 m!1366085))

(declare-fun m!1366087 () Bool)

(assert (=> start!126266 m!1366087))

(declare-fun m!1366089 () Bool)

(assert (=> b!1480268 m!1366089))

(declare-fun m!1366091 () Bool)

(assert (=> b!1480268 m!1366091))

(declare-fun m!1366093 () Bool)

(assert (=> b!1480268 m!1366093))

(assert (=> b!1480268 m!1366073))

(declare-fun m!1366095 () Bool)

(assert (=> b!1480261 m!1366095))

(assert (=> b!1480261 m!1366095))

(declare-fun m!1366097 () Bool)

(assert (=> b!1480261 m!1366097))

(assert (=> b!1480270 m!1366091))

(declare-fun m!1366099 () Bool)

(assert (=> b!1480270 m!1366099))

(declare-fun m!1366101 () Bool)

(assert (=> b!1480275 m!1366101))

(declare-fun m!1366103 () Bool)

(assert (=> b!1480275 m!1366103))

(declare-fun m!1366105 () Bool)

(assert (=> b!1480271 m!1366105))

(assert (=> b!1480266 m!1366073))

(assert (=> b!1480266 m!1366073))

(declare-fun m!1366107 () Bool)

(assert (=> b!1480266 m!1366107))

(declare-fun m!1366109 () Bool)

(assert (=> b!1480278 m!1366109))

(assert (=> b!1480264 m!1366073))

(assert (=> b!1480264 m!1366073))

(declare-fun m!1366111 () Bool)

(assert (=> b!1480264 m!1366111))

(declare-fun m!1366113 () Bool)

(assert (=> b!1480263 m!1366113))

(assert (=> b!1480263 m!1366113))

(declare-fun m!1366115 () Bool)

(assert (=> b!1480263 m!1366115))

(assert (=> b!1480263 m!1366091))

(declare-fun m!1366117 () Bool)

(assert (=> b!1480263 m!1366117))

(declare-fun m!1366119 () Bool)

(assert (=> b!1480262 m!1366119))

(assert (=> b!1480262 m!1366091))

(declare-fun m!1366121 () Bool)

(assert (=> b!1480262 m!1366121))

(assert (=> b!1480262 m!1366093))

(assert (=> b!1480262 m!1366089))

(assert (=> b!1480262 m!1366073))

(declare-fun m!1366123 () Bool)

(assert (=> b!1480262 m!1366123))

(declare-fun m!1366125 () Bool)

(assert (=> b!1480262 m!1366125))

(assert (=> b!1480262 m!1366073))

(assert (=> b!1480260 m!1366103))

(assert (=> b!1480260 m!1366101))

(declare-fun m!1366127 () Bool)

(assert (=> b!1480260 m!1366127))

(push 1)

(assert (not b!1480272))

(assert (not b!1480261))

(assert (not b!1480274))

(assert (not b!1480271))

(assert (not b!1480264))

(assert (not b!1480266))

(assert (not b!1480275))

(assert (not b!1480262))

(assert (not start!126266))

(assert (not b!1480277))

(assert (not b!1480265))

(assert (not b!1480263))

(assert (not b!1480260))

(assert (not b!1480278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

