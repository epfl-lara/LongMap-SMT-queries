; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127370 () Bool)

(assert start!127370)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!838523 () Bool)

(declare-datatypes ((array!99832 0))(
  ( (array!99833 (arr!48180 (Array (_ BitVec 32) (_ BitVec 64))) (size!48730 (_ BitVec 32))) )
))
(declare-fun lt!652406 () array!99832)

(declare-fun lt!652402 () (_ BitVec 32))

(declare-fun lt!652401 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1497329 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12420 0))(
  ( (MissingZero!12420 (index!52072 (_ BitVec 32))) (Found!12420 (index!52073 (_ BitVec 32))) (Intermediate!12420 (undefined!13232 Bool) (index!52074 (_ BitVec 32)) (x!133694 (_ BitVec 32))) (Undefined!12420) (MissingVacant!12420 (index!52075 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12420)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12420)

(assert (=> b!1497329 (= e!838523 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652402 intermediateAfterIndex!19 lt!652401 lt!652406 mask!2687) (seekEntryOrOpen!0 lt!652401 lt!652406 mask!2687))))))

(declare-fun b!1497330 () Bool)

(declare-fun res!1018516 () Bool)

(declare-fun e!838521 () Bool)

(assert (=> b!1497330 (=> (not res!1018516) (not e!838521))))

(declare-fun e!838524 () Bool)

(assert (=> b!1497330 (= res!1018516 e!838524)))

(declare-fun c!138944 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497330 (= c!138944 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497331 () Bool)

(declare-fun e!838518 () Bool)

(declare-fun e!838520 () Bool)

(assert (=> b!1497331 (= e!838518 e!838520)))

(declare-fun res!1018512 () Bool)

(assert (=> b!1497331 (=> (not res!1018512) (not e!838520))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99832)

(assert (=> b!1497331 (= res!1018512 (= (select (store (arr!48180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497331 (= lt!652406 (array!99833 (store (arr!48180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48730 a!2862)))))

(declare-fun b!1497332 () Bool)

(declare-fun res!1018527 () Bool)

(assert (=> b!1497332 (=> (not res!1018527) (not e!838518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99832 (_ BitVec 32)) Bool)

(assert (=> b!1497332 (= res!1018527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497333 () Bool)

(declare-fun res!1018514 () Bool)

(assert (=> b!1497333 (=> (not res!1018514) (not e!838518))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497333 (= res!1018514 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48730 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48730 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48730 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497334 () Bool)

(declare-fun e!838519 () Bool)

(assert (=> b!1497334 (= e!838519 e!838521)))

(declare-fun res!1018511 () Bool)

(assert (=> b!1497334 (=> (not res!1018511) (not e!838521))))

(declare-fun lt!652408 () SeekEntryResult!12420)

(assert (=> b!1497334 (= res!1018511 (= lt!652408 (Intermediate!12420 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99832 (_ BitVec 32)) SeekEntryResult!12420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497334 (= lt!652408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652401 mask!2687) lt!652401 lt!652406 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1497334 (= lt!652401 (select (store (arr!48180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497335 () Bool)

(declare-fun res!1018526 () Bool)

(assert (=> b!1497335 (=> (not res!1018526) (not e!838518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497335 (= res!1018526 (validKeyInArray!0 (select (arr!48180 a!2862) j!93)))))

(declare-fun b!1497336 () Bool)

(declare-fun res!1018521 () Bool)

(assert (=> b!1497336 (=> (not res!1018521) (not e!838518))))

(assert (=> b!1497336 (= res!1018521 (and (= (size!48730 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48730 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48730 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497337 () Bool)

(assert (=> b!1497337 (= e!838523 (not (= lt!652408 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652402 lt!652401 lt!652406 mask!2687))))))

(declare-fun b!1497338 () Bool)

(declare-fun e!838525 () Bool)

(assert (=> b!1497338 (= e!838521 (not e!838525))))

(declare-fun res!1018528 () Bool)

(assert (=> b!1497338 (=> res!1018528 e!838525)))

(assert (=> b!1497338 (= res!1018528 (or (and (= (select (arr!48180 a!2862) index!646) (select (store (arr!48180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48180 a!2862) index!646) (select (arr!48180 a!2862) j!93))) (= (select (arr!48180 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!652404 () SeekEntryResult!12420)

(assert (=> b!1497338 (and (= lt!652404 (Found!12420 j!93)) (or (= (select (arr!48180 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48180 a!2862) intermediateBeforeIndex!19) (select (arr!48180 a!2862) j!93))))))

(assert (=> b!1497338 (= lt!652404 (seekEntryOrOpen!0 (select (arr!48180 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497338 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50180 0))(
  ( (Unit!50181) )
))
(declare-fun lt!652403 () Unit!50180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50180)

(assert (=> b!1497338 (= lt!652403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497339 () Bool)

(declare-fun e!838517 () Bool)

(assert (=> b!1497339 (= e!838525 e!838517)))

(declare-fun res!1018519 () Bool)

(assert (=> b!1497339 (=> res!1018519 e!838517)))

(assert (=> b!1497339 (= res!1018519 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652402 #b00000000000000000000000000000000) (bvsge lt!652402 (size!48730 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497339 (= lt!652402 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497340 () Bool)

(declare-fun res!1018517 () Bool)

(assert (=> b!1497340 (=> (not res!1018517) (not e!838518))))

(assert (=> b!1497340 (= res!1018517 (validKeyInArray!0 (select (arr!48180 a!2862) i!1006)))))

(declare-fun b!1497341 () Bool)

(assert (=> b!1497341 (= e!838520 e!838519)))

(declare-fun res!1018518 () Bool)

(assert (=> b!1497341 (=> (not res!1018518) (not e!838519))))

(declare-fun lt!652407 () SeekEntryResult!12420)

(assert (=> b!1497341 (= res!1018518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48180 a!2862) j!93) mask!2687) (select (arr!48180 a!2862) j!93) a!2862 mask!2687) lt!652407))))

(assert (=> b!1497341 (= lt!652407 (Intermediate!12420 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497342 () Bool)

(declare-fun res!1018525 () Bool)

(assert (=> b!1497342 (=> res!1018525 e!838517)))

(assert (=> b!1497342 (= res!1018525 e!838523)))

(declare-fun c!138943 () Bool)

(assert (=> b!1497342 (= c!138943 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1018524 () Bool)

(assert (=> start!127370 (=> (not res!1018524) (not e!838518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127370 (= res!1018524 (validMask!0 mask!2687))))

(assert (=> start!127370 e!838518))

(assert (=> start!127370 true))

(declare-fun array_inv!37208 (array!99832) Bool)

(assert (=> start!127370 (array_inv!37208 a!2862)))

(declare-fun b!1497343 () Bool)

(assert (=> b!1497343 (= e!838524 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652401 lt!652406 mask!2687) (seekEntryOrOpen!0 lt!652401 lt!652406 mask!2687)))))

(declare-fun b!1497344 () Bool)

(declare-fun res!1018520 () Bool)

(assert (=> b!1497344 (=> (not res!1018520) (not e!838519))))

(assert (=> b!1497344 (= res!1018520 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48180 a!2862) j!93) a!2862 mask!2687) lt!652407))))

(declare-fun b!1497345 () Bool)

(assert (=> b!1497345 (= e!838524 (= lt!652408 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652401 lt!652406 mask!2687)))))

(declare-fun b!1497346 () Bool)

(declare-fun res!1018522 () Bool)

(assert (=> b!1497346 (=> res!1018522 e!838517)))

(assert (=> b!1497346 (= res!1018522 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497347 () Bool)

(declare-fun res!1018523 () Bool)

(assert (=> b!1497347 (=> (not res!1018523) (not e!838521))))

(assert (=> b!1497347 (= res!1018523 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497348 () Bool)

(declare-fun res!1018513 () Bool)

(assert (=> b!1497348 (=> res!1018513 e!838517)))

(assert (=> b!1497348 (= res!1018513 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652402 (select (arr!48180 a!2862) j!93) a!2862 mask!2687) lt!652407)))))

(declare-fun b!1497349 () Bool)

(assert (=> b!1497349 (= e!838517 true)))

(assert (=> b!1497349 (= lt!652404 (seekEntryOrOpen!0 lt!652401 lt!652406 mask!2687))))

(declare-fun lt!652405 () Unit!50180)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50180)

(assert (=> b!1497349 (= lt!652405 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652402 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497350 () Bool)

(declare-fun res!1018515 () Bool)

(assert (=> b!1497350 (=> (not res!1018515) (not e!838518))))

(declare-datatypes ((List!34681 0))(
  ( (Nil!34678) (Cons!34677 (h!36074 (_ BitVec 64)) (t!49375 List!34681)) )
))
(declare-fun arrayNoDuplicates!0 (array!99832 (_ BitVec 32) List!34681) Bool)

(assert (=> b!1497350 (= res!1018515 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34678))))

(assert (= (and start!127370 res!1018524) b!1497336))

(assert (= (and b!1497336 res!1018521) b!1497340))

(assert (= (and b!1497340 res!1018517) b!1497335))

(assert (= (and b!1497335 res!1018526) b!1497332))

(assert (= (and b!1497332 res!1018527) b!1497350))

(assert (= (and b!1497350 res!1018515) b!1497333))

(assert (= (and b!1497333 res!1018514) b!1497331))

(assert (= (and b!1497331 res!1018512) b!1497341))

(assert (= (and b!1497341 res!1018518) b!1497344))

(assert (= (and b!1497344 res!1018520) b!1497334))

(assert (= (and b!1497334 res!1018511) b!1497330))

(assert (= (and b!1497330 c!138944) b!1497345))

(assert (= (and b!1497330 (not c!138944)) b!1497343))

(assert (= (and b!1497330 res!1018516) b!1497347))

(assert (= (and b!1497347 res!1018523) b!1497338))

(assert (= (and b!1497338 (not res!1018528)) b!1497339))

(assert (= (and b!1497339 (not res!1018519)) b!1497348))

(assert (= (and b!1497348 (not res!1018513)) b!1497342))

(assert (= (and b!1497342 c!138943) b!1497337))

(assert (= (and b!1497342 (not c!138943)) b!1497329))

(assert (= (and b!1497342 (not res!1018525)) b!1497346))

(assert (= (and b!1497346 (not res!1018522)) b!1497349))

(declare-fun m!1380415 () Bool)

(assert (=> b!1497350 m!1380415))

(declare-fun m!1380417 () Bool)

(assert (=> b!1497343 m!1380417))

(declare-fun m!1380419 () Bool)

(assert (=> b!1497343 m!1380419))

(declare-fun m!1380421 () Bool)

(assert (=> b!1497341 m!1380421))

(assert (=> b!1497341 m!1380421))

(declare-fun m!1380423 () Bool)

(assert (=> b!1497341 m!1380423))

(assert (=> b!1497341 m!1380423))

(assert (=> b!1497341 m!1380421))

(declare-fun m!1380425 () Bool)

(assert (=> b!1497341 m!1380425))

(declare-fun m!1380427 () Bool)

(assert (=> b!1497340 m!1380427))

(assert (=> b!1497340 m!1380427))

(declare-fun m!1380429 () Bool)

(assert (=> b!1497340 m!1380429))

(declare-fun m!1380431 () Bool)

(assert (=> b!1497339 m!1380431))

(assert (=> b!1497335 m!1380421))

(assert (=> b!1497335 m!1380421))

(declare-fun m!1380433 () Bool)

(assert (=> b!1497335 m!1380433))

(declare-fun m!1380435 () Bool)

(assert (=> b!1497345 m!1380435))

(declare-fun m!1380437 () Bool)

(assert (=> b!1497329 m!1380437))

(assert (=> b!1497329 m!1380419))

(declare-fun m!1380439 () Bool)

(assert (=> b!1497334 m!1380439))

(assert (=> b!1497334 m!1380439))

(declare-fun m!1380441 () Bool)

(assert (=> b!1497334 m!1380441))

(declare-fun m!1380443 () Bool)

(assert (=> b!1497334 m!1380443))

(declare-fun m!1380445 () Bool)

(assert (=> b!1497334 m!1380445))

(declare-fun m!1380447 () Bool)

(assert (=> start!127370 m!1380447))

(declare-fun m!1380449 () Bool)

(assert (=> start!127370 m!1380449))

(assert (=> b!1497348 m!1380421))

(assert (=> b!1497348 m!1380421))

(declare-fun m!1380451 () Bool)

(assert (=> b!1497348 m!1380451))

(declare-fun m!1380453 () Bool)

(assert (=> b!1497338 m!1380453))

(assert (=> b!1497338 m!1380443))

(declare-fun m!1380455 () Bool)

(assert (=> b!1497338 m!1380455))

(declare-fun m!1380457 () Bool)

(assert (=> b!1497338 m!1380457))

(declare-fun m!1380459 () Bool)

(assert (=> b!1497338 m!1380459))

(assert (=> b!1497338 m!1380421))

(declare-fun m!1380461 () Bool)

(assert (=> b!1497338 m!1380461))

(declare-fun m!1380463 () Bool)

(assert (=> b!1497338 m!1380463))

(assert (=> b!1497338 m!1380421))

(declare-fun m!1380465 () Bool)

(assert (=> b!1497332 m!1380465))

(assert (=> b!1497344 m!1380421))

(assert (=> b!1497344 m!1380421))

(declare-fun m!1380467 () Bool)

(assert (=> b!1497344 m!1380467))

(assert (=> b!1497349 m!1380419))

(declare-fun m!1380469 () Bool)

(assert (=> b!1497349 m!1380469))

(declare-fun m!1380471 () Bool)

(assert (=> b!1497337 m!1380471))

(assert (=> b!1497331 m!1380443))

(declare-fun m!1380473 () Bool)

(assert (=> b!1497331 m!1380473))

(check-sat (not b!1497332) (not b!1497349) (not b!1497341) (not b!1497338) (not b!1497348) (not b!1497334) (not b!1497337) (not b!1497343) (not start!127370) (not b!1497344) (not b!1497335) (not b!1497340) (not b!1497329) (not b!1497345) (not b!1497350) (not b!1497339))
(check-sat)
