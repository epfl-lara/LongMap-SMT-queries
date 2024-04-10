; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124706 () Bool)

(assert start!124706)

(declare-fun b!1445459 () Bool)

(declare-fun res!977336 () Bool)

(declare-fun e!814256 () Bool)

(assert (=> b!1445459 (=> (not res!977336) (not e!814256))))

(declare-fun e!814253 () Bool)

(assert (=> b!1445459 (= res!977336 e!814253)))

(declare-fun c!133575 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445459 (= c!133575 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!11617 0))(
  ( (MissingZero!11617 (index!48860 (_ BitVec 32))) (Found!11617 (index!48861 (_ BitVec 32))) (Intermediate!11617 (undefined!12429 Bool) (index!48862 (_ BitVec 32)) (x!130546 (_ BitVec 32))) (Undefined!11617) (MissingVacant!11617 (index!48863 (_ BitVec 32))) )
))
(declare-fun lt!634505 () SeekEntryResult!11617)

(declare-fun lt!634502 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98154 0))(
  ( (array!98155 (arr!47365 (Array (_ BitVec 32) (_ BitVec 64))) (size!47915 (_ BitVec 32))) )
))
(declare-fun lt!634503 () array!98154)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1445460 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98154 (_ BitVec 32)) SeekEntryResult!11617)

(assert (=> b!1445460 (= e!814253 (= lt!634505 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634502 lt!634503 mask!2687)))))

(declare-fun b!1445461 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98154)

(assert (=> b!1445461 (= e!814256 (not (or (and (= (select (arr!47365 a!2862) index!646) (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47365 a!2862) index!646) (select (arr!47365 a!2862) j!93))) (not (= (select (arr!47365 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!814255 () Bool)

(assert (=> b!1445461 e!814255))

(declare-fun res!977332 () Bool)

(assert (=> b!1445461 (=> (not res!977332) (not e!814255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98154 (_ BitVec 32)) Bool)

(assert (=> b!1445461 (= res!977332 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48730 0))(
  ( (Unit!48731) )
))
(declare-fun lt!634506 () Unit!48730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48730)

(assert (=> b!1445461 (= lt!634506 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445462 () Bool)

(declare-fun res!977331 () Bool)

(declare-fun e!814250 () Bool)

(assert (=> b!1445462 (=> (not res!977331) (not e!814250))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445462 (= res!977331 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47915 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47915 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47915 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445463 () Bool)

(declare-fun e!814252 () Bool)

(declare-fun e!814254 () Bool)

(assert (=> b!1445463 (= e!814252 e!814254)))

(declare-fun res!977344 () Bool)

(assert (=> b!1445463 (=> (not res!977344) (not e!814254))))

(declare-fun lt!634504 () SeekEntryResult!11617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445463 (= res!977344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47365 a!2862) j!93) mask!2687) (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634504))))

(assert (=> b!1445463 (= lt!634504 (Intermediate!11617 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445464 () Bool)

(assert (=> b!1445464 (= e!814254 e!814256)))

(declare-fun res!977338 () Bool)

(assert (=> b!1445464 (=> (not res!977338) (not e!814256))))

(assert (=> b!1445464 (= res!977338 (= lt!634505 (Intermediate!11617 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445464 (= lt!634505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634502 mask!2687) lt!634502 lt!634503 mask!2687))))

(assert (=> b!1445464 (= lt!634502 (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445465 () Bool)

(declare-fun res!977340 () Bool)

(assert (=> b!1445465 (=> (not res!977340) (not e!814250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445465 (= res!977340 (validKeyInArray!0 (select (arr!47365 a!2862) i!1006)))))

(declare-fun b!1445466 () Bool)

(declare-fun res!977337 () Bool)

(assert (=> b!1445466 (=> (not res!977337) (not e!814250))))

(assert (=> b!1445466 (= res!977337 (validKeyInArray!0 (select (arr!47365 a!2862) j!93)))))

(declare-fun b!1445467 () Bool)

(declare-fun res!977342 () Bool)

(assert (=> b!1445467 (=> (not res!977342) (not e!814256))))

(assert (=> b!1445467 (= res!977342 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445469 () Bool)

(declare-fun res!977339 () Bool)

(assert (=> b!1445469 (=> (not res!977339) (not e!814250))))

(declare-datatypes ((List!33866 0))(
  ( (Nil!33863) (Cons!33862 (h!35212 (_ BitVec 64)) (t!48560 List!33866)) )
))
(declare-fun arrayNoDuplicates!0 (array!98154 (_ BitVec 32) List!33866) Bool)

(assert (=> b!1445469 (= res!977339 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33863))))

(declare-fun b!1445470 () Bool)

(declare-fun res!977333 () Bool)

(assert (=> b!1445470 (=> (not res!977333) (not e!814255))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98154 (_ BitVec 32)) SeekEntryResult!11617)

(assert (=> b!1445470 (= res!977333 (= (seekEntryOrOpen!0 (select (arr!47365 a!2862) j!93) a!2862 mask!2687) (Found!11617 j!93)))))

(declare-fun b!1445471 () Bool)

(assert (=> b!1445471 (= e!814250 e!814252)))

(declare-fun res!977341 () Bool)

(assert (=> b!1445471 (=> (not res!977341) (not e!814252))))

(assert (=> b!1445471 (= res!977341 (= (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445471 (= lt!634503 (array!98155 (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47915 a!2862)))))

(declare-fun b!1445472 () Bool)

(declare-fun res!977343 () Bool)

(assert (=> b!1445472 (=> (not res!977343) (not e!814254))))

(assert (=> b!1445472 (= res!977343 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634504))))

(declare-fun b!1445473 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98154 (_ BitVec 32)) SeekEntryResult!11617)

(assert (=> b!1445473 (= e!814253 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634502 lt!634503 mask!2687) (seekEntryOrOpen!0 lt!634502 lt!634503 mask!2687)))))

(declare-fun b!1445474 () Bool)

(declare-fun res!977335 () Bool)

(assert (=> b!1445474 (=> (not res!977335) (not e!814250))))

(assert (=> b!1445474 (= res!977335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445475 () Bool)

(declare-fun res!977330 () Bool)

(assert (=> b!1445475 (=> (not res!977330) (not e!814250))))

(assert (=> b!1445475 (= res!977330 (and (= (size!47915 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47915 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47915 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445468 () Bool)

(assert (=> b!1445468 (= e!814255 (or (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) (select (arr!47365 a!2862) j!93))))))

(declare-fun res!977334 () Bool)

(assert (=> start!124706 (=> (not res!977334) (not e!814250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124706 (= res!977334 (validMask!0 mask!2687))))

(assert (=> start!124706 e!814250))

(assert (=> start!124706 true))

(declare-fun array_inv!36393 (array!98154) Bool)

(assert (=> start!124706 (array_inv!36393 a!2862)))

(assert (= (and start!124706 res!977334) b!1445475))

(assert (= (and b!1445475 res!977330) b!1445465))

(assert (= (and b!1445465 res!977340) b!1445466))

(assert (= (and b!1445466 res!977337) b!1445474))

(assert (= (and b!1445474 res!977335) b!1445469))

(assert (= (and b!1445469 res!977339) b!1445462))

(assert (= (and b!1445462 res!977331) b!1445471))

(assert (= (and b!1445471 res!977341) b!1445463))

(assert (= (and b!1445463 res!977344) b!1445472))

(assert (= (and b!1445472 res!977343) b!1445464))

(assert (= (and b!1445464 res!977338) b!1445459))

(assert (= (and b!1445459 c!133575) b!1445460))

(assert (= (and b!1445459 (not c!133575)) b!1445473))

(assert (= (and b!1445459 res!977336) b!1445467))

(assert (= (and b!1445467 res!977342) b!1445461))

(assert (= (and b!1445461 res!977332) b!1445470))

(assert (= (and b!1445470 res!977333) b!1445468))

(declare-fun m!1334411 () Bool)

(assert (=> b!1445460 m!1334411))

(declare-fun m!1334413 () Bool)

(assert (=> b!1445461 m!1334413))

(declare-fun m!1334415 () Bool)

(assert (=> b!1445461 m!1334415))

(declare-fun m!1334417 () Bool)

(assert (=> b!1445461 m!1334417))

(declare-fun m!1334419 () Bool)

(assert (=> b!1445461 m!1334419))

(declare-fun m!1334421 () Bool)

(assert (=> b!1445461 m!1334421))

(declare-fun m!1334423 () Bool)

(assert (=> b!1445461 m!1334423))

(declare-fun m!1334425 () Bool)

(assert (=> b!1445474 m!1334425))

(declare-fun m!1334427 () Bool)

(assert (=> b!1445465 m!1334427))

(assert (=> b!1445465 m!1334427))

(declare-fun m!1334429 () Bool)

(assert (=> b!1445465 m!1334429))

(declare-fun m!1334431 () Bool)

(assert (=> b!1445468 m!1334431))

(assert (=> b!1445468 m!1334423))

(declare-fun m!1334433 () Bool)

(assert (=> b!1445473 m!1334433))

(declare-fun m!1334435 () Bool)

(assert (=> b!1445473 m!1334435))

(assert (=> b!1445470 m!1334423))

(assert (=> b!1445470 m!1334423))

(declare-fun m!1334437 () Bool)

(assert (=> b!1445470 m!1334437))

(declare-fun m!1334439 () Bool)

(assert (=> start!124706 m!1334439))

(declare-fun m!1334441 () Bool)

(assert (=> start!124706 m!1334441))

(declare-fun m!1334443 () Bool)

(assert (=> b!1445469 m!1334443))

(assert (=> b!1445463 m!1334423))

(assert (=> b!1445463 m!1334423))

(declare-fun m!1334445 () Bool)

(assert (=> b!1445463 m!1334445))

(assert (=> b!1445463 m!1334445))

(assert (=> b!1445463 m!1334423))

(declare-fun m!1334447 () Bool)

(assert (=> b!1445463 m!1334447))

(assert (=> b!1445466 m!1334423))

(assert (=> b!1445466 m!1334423))

(declare-fun m!1334449 () Bool)

(assert (=> b!1445466 m!1334449))

(declare-fun m!1334451 () Bool)

(assert (=> b!1445464 m!1334451))

(assert (=> b!1445464 m!1334451))

(declare-fun m!1334453 () Bool)

(assert (=> b!1445464 m!1334453))

(assert (=> b!1445464 m!1334415))

(declare-fun m!1334455 () Bool)

(assert (=> b!1445464 m!1334455))

(assert (=> b!1445471 m!1334415))

(declare-fun m!1334457 () Bool)

(assert (=> b!1445471 m!1334457))

(assert (=> b!1445472 m!1334423))

(assert (=> b!1445472 m!1334423))

(declare-fun m!1334459 () Bool)

(assert (=> b!1445472 m!1334459))

(push 1)

(assert (not b!1445470))

(assert (not b!1445465))

(assert (not b!1445464))

(assert (not b!1445463))

(assert (not b!1445466))

