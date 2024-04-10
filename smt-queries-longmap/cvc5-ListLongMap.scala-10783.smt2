; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126196 () Bool)

(assert start!126196)

(declare-fun b!1478272 () Bool)

(declare-fun res!1004320 () Bool)

(declare-fun e!829265 () Bool)

(assert (=> b!1478272 (=> (not res!1004320) (not e!829265))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((array!99302 0))(
  ( (array!99303 (arr!47930 (Array (_ BitVec 32) (_ BitVec 64))) (size!48480 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99302)

(assert (=> b!1478272 (= res!1004320 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48480 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48480 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48480 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1004306 () Bool)

(assert (=> start!126196 (=> (not res!1004306) (not e!829265))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126196 (= res!1004306 (validMask!0 mask!2687))))

(assert (=> start!126196 e!829265))

(assert (=> start!126196 true))

(declare-fun array_inv!36958 (array!99302) Bool)

(assert (=> start!126196 (array_inv!36958 a!2862)))

(declare-fun e!829267 () Bool)

(declare-fun b!1478273 () Bool)

(declare-datatypes ((SeekEntryResult!12170 0))(
  ( (MissingZero!12170 (index!51072 (_ BitVec 32))) (Found!12170 (index!51073 (_ BitVec 32))) (Intermediate!12170 (undefined!12982 Bool) (index!51074 (_ BitVec 32)) (x!132665 (_ BitVec 32))) (Undefined!12170) (MissingVacant!12170 (index!51075 (_ BitVec 32))) )
))
(declare-fun lt!645627 () SeekEntryResult!12170)

(declare-fun lt!645628 () (_ BitVec 64))

(declare-fun lt!645625 () array!99302)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99302 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478273 (= e!829267 (= lt!645627 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645628 lt!645625 mask!2687)))))

(declare-fun b!1478274 () Bool)

(declare-fun res!1004316 () Bool)

(assert (=> b!1478274 (=> (not res!1004316) (not e!829265))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478274 (= res!1004316 (validKeyInArray!0 (select (arr!47930 a!2862) i!1006)))))

(declare-fun b!1478275 () Bool)

(declare-fun res!1004309 () Bool)

(declare-fun e!829268 () Bool)

(assert (=> b!1478275 (=> (not res!1004309) (not e!829268))))

(assert (=> b!1478275 (= res!1004309 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478276 () Bool)

(declare-fun e!829263 () Bool)

(declare-fun e!829262 () Bool)

(assert (=> b!1478276 (= e!829263 e!829262)))

(declare-fun res!1004318 () Bool)

(assert (=> b!1478276 (=> (not res!1004318) (not e!829262))))

(declare-fun lt!645630 () SeekEntryResult!12170)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99302 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478276 (= res!1004318 (= lt!645630 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47930 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478277 () Bool)

(declare-fun res!1004312 () Bool)

(assert (=> b!1478277 (=> (not res!1004312) (not e!829268))))

(assert (=> b!1478277 (= res!1004312 e!829267)))

(declare-fun c!136503 () Bool)

(assert (=> b!1478277 (= c!136503 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478278 () Bool)

(declare-fun e!829261 () Bool)

(assert (=> b!1478278 (= e!829261 e!829263)))

(declare-fun res!1004305 () Bool)

(assert (=> b!1478278 (=> res!1004305 e!829263)))

(assert (=> b!1478278 (= res!1004305 (or (and (= (select (arr!47930 a!2862) index!646) (select (store (arr!47930 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47930 a!2862) index!646) (select (arr!47930 a!2862) j!93))) (not (= (select (arr!47930 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478279 () Bool)

(declare-fun res!1004307 () Bool)

(declare-fun e!829264 () Bool)

(assert (=> b!1478279 (=> (not res!1004307) (not e!829264))))

(declare-fun lt!645629 () SeekEntryResult!12170)

(assert (=> b!1478279 (= res!1004307 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47930 a!2862) j!93) a!2862 mask!2687) lt!645629))))

(declare-fun b!1478280 () Bool)

(declare-fun res!1004315 () Bool)

(assert (=> b!1478280 (=> (not res!1004315) (not e!829265))))

(assert (=> b!1478280 (= res!1004315 (and (= (size!48480 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48480 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48480 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478281 () Bool)

(declare-fun e!829260 () Bool)

(assert (=> b!1478281 (= e!829260 e!829264)))

(declare-fun res!1004317 () Bool)

(assert (=> b!1478281 (=> (not res!1004317) (not e!829264))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478281 (= res!1004317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47930 a!2862) j!93) mask!2687) (select (arr!47930 a!2862) j!93) a!2862 mask!2687) lt!645629))))

(assert (=> b!1478281 (= lt!645629 (Intermediate!12170 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478282 () Bool)

(declare-fun res!1004311 () Bool)

(assert (=> b!1478282 (=> (not res!1004311) (not e!829265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99302 (_ BitVec 32)) Bool)

(assert (=> b!1478282 (= res!1004311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99302 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478283 (= e!829267 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645628 lt!645625 mask!2687) (seekEntryOrOpen!0 lt!645628 lt!645625 mask!2687)))))

(declare-fun b!1478284 () Bool)

(assert (=> b!1478284 (= e!829262 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478285 () Bool)

(assert (=> b!1478285 (= e!829265 e!829260)))

(declare-fun res!1004308 () Bool)

(assert (=> b!1478285 (=> (not res!1004308) (not e!829260))))

(assert (=> b!1478285 (= res!1004308 (= (select (store (arr!47930 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478285 (= lt!645625 (array!99303 (store (arr!47930 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48480 a!2862)))))

(declare-fun b!1478286 () Bool)

(declare-fun res!1004319 () Bool)

(assert (=> b!1478286 (=> (not res!1004319) (not e!829265))))

(declare-datatypes ((List!34431 0))(
  ( (Nil!34428) (Cons!34427 (h!35795 (_ BitVec 64)) (t!49125 List!34431)) )
))
(declare-fun arrayNoDuplicates!0 (array!99302 (_ BitVec 32) List!34431) Bool)

(assert (=> b!1478286 (= res!1004319 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34428))))

(declare-fun b!1478287 () Bool)

(assert (=> b!1478287 (= e!829268 (not true))))

(assert (=> b!1478287 e!829261))

(declare-fun res!1004314 () Bool)

(assert (=> b!1478287 (=> (not res!1004314) (not e!829261))))

(assert (=> b!1478287 (= res!1004314 (and (= lt!645630 (Found!12170 j!93)) (or (= (select (arr!47930 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47930 a!2862) intermediateBeforeIndex!19) (select (arr!47930 a!2862) j!93)))))))

(assert (=> b!1478287 (= lt!645630 (seekEntryOrOpen!0 (select (arr!47930 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478287 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49680 0))(
  ( (Unit!49681) )
))
(declare-fun lt!645626 () Unit!49680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49680)

(assert (=> b!1478287 (= lt!645626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478288 () Bool)

(assert (=> b!1478288 (= e!829264 e!829268)))

(declare-fun res!1004313 () Bool)

(assert (=> b!1478288 (=> (not res!1004313) (not e!829268))))

(assert (=> b!1478288 (= res!1004313 (= lt!645627 (Intermediate!12170 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478288 (= lt!645627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645628 mask!2687) lt!645628 lt!645625 mask!2687))))

(assert (=> b!1478288 (= lt!645628 (select (store (arr!47930 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478289 () Bool)

(declare-fun res!1004310 () Bool)

(assert (=> b!1478289 (=> (not res!1004310) (not e!829265))))

(assert (=> b!1478289 (= res!1004310 (validKeyInArray!0 (select (arr!47930 a!2862) j!93)))))

(assert (= (and start!126196 res!1004306) b!1478280))

(assert (= (and b!1478280 res!1004315) b!1478274))

(assert (= (and b!1478274 res!1004316) b!1478289))

(assert (= (and b!1478289 res!1004310) b!1478282))

(assert (= (and b!1478282 res!1004311) b!1478286))

(assert (= (and b!1478286 res!1004319) b!1478272))

(assert (= (and b!1478272 res!1004320) b!1478285))

(assert (= (and b!1478285 res!1004308) b!1478281))

(assert (= (and b!1478281 res!1004317) b!1478279))

(assert (= (and b!1478279 res!1004307) b!1478288))

(assert (= (and b!1478288 res!1004313) b!1478277))

(assert (= (and b!1478277 c!136503) b!1478273))

(assert (= (and b!1478277 (not c!136503)) b!1478283))

(assert (= (and b!1478277 res!1004312) b!1478275))

(assert (= (and b!1478275 res!1004309) b!1478287))

(assert (= (and b!1478287 res!1004314) b!1478278))

(assert (= (and b!1478278 (not res!1004305)) b!1478276))

(assert (= (and b!1478276 res!1004318) b!1478284))

(declare-fun m!1364191 () Bool)

(assert (=> b!1478273 m!1364191))

(declare-fun m!1364193 () Bool)

(assert (=> b!1478274 m!1364193))

(assert (=> b!1478274 m!1364193))

(declare-fun m!1364195 () Bool)

(assert (=> b!1478274 m!1364195))

(declare-fun m!1364197 () Bool)

(assert (=> b!1478283 m!1364197))

(declare-fun m!1364199 () Bool)

(assert (=> b!1478283 m!1364199))

(declare-fun m!1364201 () Bool)

(assert (=> b!1478276 m!1364201))

(assert (=> b!1478276 m!1364201))

(declare-fun m!1364203 () Bool)

(assert (=> b!1478276 m!1364203))

(declare-fun m!1364205 () Bool)

(assert (=> b!1478282 m!1364205))

(declare-fun m!1364207 () Bool)

(assert (=> b!1478287 m!1364207))

(declare-fun m!1364209 () Bool)

(assert (=> b!1478287 m!1364209))

(assert (=> b!1478287 m!1364201))

(declare-fun m!1364211 () Bool)

(assert (=> b!1478287 m!1364211))

(declare-fun m!1364213 () Bool)

(assert (=> b!1478287 m!1364213))

(assert (=> b!1478287 m!1364201))

(declare-fun m!1364215 () Bool)

(assert (=> b!1478278 m!1364215))

(declare-fun m!1364217 () Bool)

(assert (=> b!1478278 m!1364217))

(declare-fun m!1364219 () Bool)

(assert (=> b!1478278 m!1364219))

(assert (=> b!1478278 m!1364201))

(declare-fun m!1364221 () Bool)

(assert (=> start!126196 m!1364221))

(declare-fun m!1364223 () Bool)

(assert (=> start!126196 m!1364223))

(assert (=> b!1478279 m!1364201))

(assert (=> b!1478279 m!1364201))

(declare-fun m!1364225 () Bool)

(assert (=> b!1478279 m!1364225))

(declare-fun m!1364227 () Bool)

(assert (=> b!1478288 m!1364227))

(assert (=> b!1478288 m!1364227))

(declare-fun m!1364229 () Bool)

(assert (=> b!1478288 m!1364229))

(assert (=> b!1478288 m!1364217))

(declare-fun m!1364231 () Bool)

(assert (=> b!1478288 m!1364231))

(assert (=> b!1478285 m!1364217))

(declare-fun m!1364233 () Bool)

(assert (=> b!1478285 m!1364233))

(assert (=> b!1478289 m!1364201))

(assert (=> b!1478289 m!1364201))

(declare-fun m!1364235 () Bool)

(assert (=> b!1478289 m!1364235))

(declare-fun m!1364237 () Bool)

(assert (=> b!1478286 m!1364237))

(assert (=> b!1478281 m!1364201))

(assert (=> b!1478281 m!1364201))

(declare-fun m!1364239 () Bool)

(assert (=> b!1478281 m!1364239))

(assert (=> b!1478281 m!1364239))

(assert (=> b!1478281 m!1364201))

(declare-fun m!1364241 () Bool)

(assert (=> b!1478281 m!1364241))

(push 1)

