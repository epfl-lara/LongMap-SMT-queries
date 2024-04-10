; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127366 () Bool)

(assert start!127366)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12418 0))(
  ( (MissingZero!12418 (index!52064 (_ BitVec 32))) (Found!12418 (index!52065 (_ BitVec 32))) (Intermediate!12418 (undefined!13230 Bool) (index!52066 (_ BitVec 32)) (x!133684 (_ BitVec 32))) (Undefined!12418) (MissingVacant!12418 (index!52067 (_ BitVec 32))) )
))
(declare-fun lt!652356 () SeekEntryResult!12418)

(declare-datatypes ((array!99828 0))(
  ( (array!99829 (arr!48178 (Array (_ BitVec 32) (_ BitVec 64))) (size!48728 (_ BitVec 32))) )
))
(declare-fun lt!652357 () array!99828)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1497197 () Bool)

(declare-fun e!838464 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!652355 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99828 (_ BitVec 32)) SeekEntryResult!12418)

(assert (=> b!1497197 (= e!838464 (= lt!652356 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652355 lt!652357 mask!2687)))))

(declare-fun b!1497198 () Bool)

(declare-fun res!1018419 () Bool)

(declare-fun e!838470 () Bool)

(assert (=> b!1497198 (=> (not res!1018419) (not e!838470))))

(declare-fun a!2862 () array!99828)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99828 (_ BitVec 32)) Bool)

(assert (=> b!1497198 (= res!1018419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497199 () Bool)

(declare-fun e!838465 () Bool)

(declare-fun e!838469 () Bool)

(assert (=> b!1497199 (= e!838465 e!838469)))

(declare-fun res!1018408 () Bool)

(assert (=> b!1497199 (=> res!1018408 e!838469)))

(declare-fun lt!652353 () (_ BitVec 32))

(assert (=> b!1497199 (= res!1018408 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652353 #b00000000000000000000000000000000) (bvsge lt!652353 (size!48728 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497199 (= lt!652353 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497200 () Bool)

(declare-fun res!1018416 () Bool)

(assert (=> b!1497200 (=> res!1018416 e!838469)))

(declare-fun e!838468 () Bool)

(assert (=> b!1497200 (= res!1018416 e!838468)))

(declare-fun c!138931 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497200 (= c!138931 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497201 () Bool)

(declare-fun res!1018414 () Bool)

(assert (=> b!1497201 (=> res!1018414 e!838469)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497201 (= res!1018414 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497202 () Bool)

(declare-fun res!1018412 () Bool)

(declare-fun e!838463 () Bool)

(assert (=> b!1497202 (=> (not res!1018412) (not e!838463))))

(declare-fun lt!652354 () SeekEntryResult!12418)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1497202 (= res!1018412 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!652354))))

(declare-fun b!1497203 () Bool)

(declare-fun res!1018403 () Bool)

(declare-fun e!838466 () Bool)

(assert (=> b!1497203 (=> (not res!1018403) (not e!838466))))

(assert (=> b!1497203 (= res!1018403 e!838464)))

(declare-fun c!138932 () Bool)

(assert (=> b!1497203 (= c!138932 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497204 () Bool)

(assert (=> b!1497204 (= e!838466 (not e!838465))))

(declare-fun res!1018405 () Bool)

(assert (=> b!1497204 (=> res!1018405 e!838465)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497204 (= res!1018405 (or (and (= (select (arr!48178 a!2862) index!646) (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48178 a!2862) index!646) (select (arr!48178 a!2862) j!93))) (= (select (arr!48178 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!652359 () SeekEntryResult!12418)

(assert (=> b!1497204 (and (= lt!652359 (Found!12418 j!93)) (or (= (select (arr!48178 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48178 a!2862) intermediateBeforeIndex!19) (select (arr!48178 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99828 (_ BitVec 32)) SeekEntryResult!12418)

(assert (=> b!1497204 (= lt!652359 (seekEntryOrOpen!0 (select (arr!48178 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497204 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50176 0))(
  ( (Unit!50177) )
))
(declare-fun lt!652358 () Unit!50176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50176)

(assert (=> b!1497204 (= lt!652358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497205 () Bool)

(declare-fun res!1018417 () Bool)

(assert (=> b!1497205 (=> (not res!1018417) (not e!838470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497205 (= res!1018417 (validKeyInArray!0 (select (arr!48178 a!2862) i!1006)))))

(declare-fun b!1497206 () Bool)

(declare-fun res!1018409 () Bool)

(assert (=> b!1497206 (=> (not res!1018409) (not e!838466))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1497206 (= res!1018409 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497207 () Bool)

(assert (=> b!1497207 (= e!838463 e!838466)))

(declare-fun res!1018415 () Bool)

(assert (=> b!1497207 (=> (not res!1018415) (not e!838466))))

(assert (=> b!1497207 (= res!1018415 (= lt!652356 (Intermediate!12418 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497207 (= lt!652356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652355 mask!2687) lt!652355 lt!652357 mask!2687))))

(assert (=> b!1497207 (= lt!652355 (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497208 () Bool)

(declare-fun res!1018418 () Bool)

(assert (=> b!1497208 (=> (not res!1018418) (not e!838470))))

(assert (=> b!1497208 (= res!1018418 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48728 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48728 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48728 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497209 () Bool)

(assert (=> b!1497209 (= e!838468 (not (= lt!652356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652353 lt!652355 lt!652357 mask!2687))))))

(declare-fun res!1018413 () Bool)

(assert (=> start!127366 (=> (not res!1018413) (not e!838470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127366 (= res!1018413 (validMask!0 mask!2687))))

(assert (=> start!127366 e!838470))

(assert (=> start!127366 true))

(declare-fun array_inv!37206 (array!99828) Bool)

(assert (=> start!127366 (array_inv!37206 a!2862)))

(declare-fun b!1497210 () Bool)

(declare-fun e!838471 () Bool)

(assert (=> b!1497210 (= e!838471 e!838463)))

(declare-fun res!1018406 () Bool)

(assert (=> b!1497210 (=> (not res!1018406) (not e!838463))))

(assert (=> b!1497210 (= res!1018406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!652354))))

(assert (=> b!1497210 (= lt!652354 (Intermediate!12418 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497211 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99828 (_ BitVec 32)) SeekEntryResult!12418)

(assert (=> b!1497211 (= e!838464 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652355 lt!652357 mask!2687) (seekEntryOrOpen!0 lt!652355 lt!652357 mask!2687)))))

(declare-fun b!1497212 () Bool)

(declare-fun res!1018420 () Bool)

(assert (=> b!1497212 (=> res!1018420 e!838469)))

(assert (=> b!1497212 (= res!1018420 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652353 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!652354)))))

(declare-fun b!1497213 () Bool)

(assert (=> b!1497213 (= e!838469 true)))

(assert (=> b!1497213 (= lt!652359 (seekEntryOrOpen!0 lt!652355 lt!652357 mask!2687))))

(declare-fun lt!652360 () Unit!50176)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50176)

(assert (=> b!1497213 (= lt!652360 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652353 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497214 () Bool)

(assert (=> b!1497214 (= e!838470 e!838471)))

(declare-fun res!1018411 () Bool)

(assert (=> b!1497214 (=> (not res!1018411) (not e!838471))))

(assert (=> b!1497214 (= res!1018411 (= (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497214 (= lt!652357 (array!99829 (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48728 a!2862)))))

(declare-fun b!1497215 () Bool)

(declare-fun res!1018404 () Bool)

(assert (=> b!1497215 (=> (not res!1018404) (not e!838470))))

(declare-datatypes ((List!34679 0))(
  ( (Nil!34676) (Cons!34675 (h!36072 (_ BitVec 64)) (t!49373 List!34679)) )
))
(declare-fun arrayNoDuplicates!0 (array!99828 (_ BitVec 32) List!34679) Bool)

(assert (=> b!1497215 (= res!1018404 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34676))))

(declare-fun b!1497216 () Bool)

(declare-fun res!1018407 () Bool)

(assert (=> b!1497216 (=> (not res!1018407) (not e!838470))))

(assert (=> b!1497216 (= res!1018407 (validKeyInArray!0 (select (arr!48178 a!2862) j!93)))))

(declare-fun b!1497217 () Bool)

(declare-fun res!1018410 () Bool)

(assert (=> b!1497217 (=> (not res!1018410) (not e!838470))))

(assert (=> b!1497217 (= res!1018410 (and (= (size!48728 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48728 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48728 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497218 () Bool)

(assert (=> b!1497218 (= e!838468 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652353 intermediateAfterIndex!19 lt!652355 lt!652357 mask!2687) (seekEntryOrOpen!0 lt!652355 lt!652357 mask!2687))))))

(assert (= (and start!127366 res!1018413) b!1497217))

(assert (= (and b!1497217 res!1018410) b!1497205))

(assert (= (and b!1497205 res!1018417) b!1497216))

(assert (= (and b!1497216 res!1018407) b!1497198))

(assert (= (and b!1497198 res!1018419) b!1497215))

(assert (= (and b!1497215 res!1018404) b!1497208))

(assert (= (and b!1497208 res!1018418) b!1497214))

(assert (= (and b!1497214 res!1018411) b!1497210))

(assert (= (and b!1497210 res!1018406) b!1497202))

(assert (= (and b!1497202 res!1018412) b!1497207))

(assert (= (and b!1497207 res!1018415) b!1497203))

(assert (= (and b!1497203 c!138932) b!1497197))

(assert (= (and b!1497203 (not c!138932)) b!1497211))

(assert (= (and b!1497203 res!1018403) b!1497206))

(assert (= (and b!1497206 res!1018409) b!1497204))

(assert (= (and b!1497204 (not res!1018405)) b!1497199))

(assert (= (and b!1497199 (not res!1018408)) b!1497212))

(assert (= (and b!1497212 (not res!1018420)) b!1497200))

(assert (= (and b!1497200 c!138931) b!1497209))

(assert (= (and b!1497200 (not c!138931)) b!1497218))

(assert (= (and b!1497200 (not res!1018416)) b!1497201))

(assert (= (and b!1497201 (not res!1018414)) b!1497213))

(declare-fun m!1380295 () Bool)

(assert (=> b!1497202 m!1380295))

(assert (=> b!1497202 m!1380295))

(declare-fun m!1380297 () Bool)

(assert (=> b!1497202 m!1380297))

(declare-fun m!1380299 () Bool)

(assert (=> b!1497211 m!1380299))

(declare-fun m!1380301 () Bool)

(assert (=> b!1497211 m!1380301))

(assert (=> b!1497213 m!1380301))

(declare-fun m!1380303 () Bool)

(assert (=> b!1497213 m!1380303))

(assert (=> b!1497212 m!1380295))

(assert (=> b!1497212 m!1380295))

(declare-fun m!1380305 () Bool)

(assert (=> b!1497212 m!1380305))

(declare-fun m!1380307 () Bool)

(assert (=> b!1497215 m!1380307))

(declare-fun m!1380309 () Bool)

(assert (=> start!127366 m!1380309))

(declare-fun m!1380311 () Bool)

(assert (=> start!127366 m!1380311))

(declare-fun m!1380313 () Bool)

(assert (=> b!1497218 m!1380313))

(assert (=> b!1497218 m!1380301))

(assert (=> b!1497216 m!1380295))

(assert (=> b!1497216 m!1380295))

(declare-fun m!1380315 () Bool)

(assert (=> b!1497216 m!1380315))

(declare-fun m!1380317 () Bool)

(assert (=> b!1497207 m!1380317))

(assert (=> b!1497207 m!1380317))

(declare-fun m!1380319 () Bool)

(assert (=> b!1497207 m!1380319))

(declare-fun m!1380321 () Bool)

(assert (=> b!1497207 m!1380321))

(declare-fun m!1380323 () Bool)

(assert (=> b!1497207 m!1380323))

(declare-fun m!1380325 () Bool)

(assert (=> b!1497197 m!1380325))

(declare-fun m!1380327 () Bool)

(assert (=> b!1497205 m!1380327))

(assert (=> b!1497205 m!1380327))

(declare-fun m!1380329 () Bool)

(assert (=> b!1497205 m!1380329))

(declare-fun m!1380331 () Bool)

(assert (=> b!1497209 m!1380331))

(assert (=> b!1497210 m!1380295))

(assert (=> b!1497210 m!1380295))

(declare-fun m!1380333 () Bool)

(assert (=> b!1497210 m!1380333))

(assert (=> b!1497210 m!1380333))

(assert (=> b!1497210 m!1380295))

(declare-fun m!1380335 () Bool)

(assert (=> b!1497210 m!1380335))

(declare-fun m!1380337 () Bool)

(assert (=> b!1497198 m!1380337))

(declare-fun m!1380339 () Bool)

(assert (=> b!1497199 m!1380339))

(declare-fun m!1380341 () Bool)

(assert (=> b!1497204 m!1380341))

(assert (=> b!1497204 m!1380321))

(declare-fun m!1380343 () Bool)

(assert (=> b!1497204 m!1380343))

(declare-fun m!1380345 () Bool)

(assert (=> b!1497204 m!1380345))

(declare-fun m!1380347 () Bool)

(assert (=> b!1497204 m!1380347))

(assert (=> b!1497204 m!1380295))

(declare-fun m!1380349 () Bool)

(assert (=> b!1497204 m!1380349))

(declare-fun m!1380351 () Bool)

(assert (=> b!1497204 m!1380351))

(assert (=> b!1497204 m!1380295))

(assert (=> b!1497214 m!1380321))

(declare-fun m!1380353 () Bool)

(assert (=> b!1497214 m!1380353))

(push 1)

