; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124704 () Bool)

(assert start!124704)

(declare-fun res!977295 () Bool)

(declare-fun e!814230 () Bool)

(assert (=> start!124704 (=> (not res!977295) (not e!814230))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124704 (= res!977295 (validMask!0 mask!2687))))

(assert (=> start!124704 e!814230))

(assert (=> start!124704 true))

(declare-datatypes ((array!98152 0))(
  ( (array!98153 (arr!47364 (Array (_ BitVec 32) (_ BitVec 64))) (size!47914 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98152)

(declare-fun array_inv!36392 (array!98152) Bool)

(assert (=> start!124704 (array_inv!36392 a!2862)))

(declare-fun b!1445408 () Bool)

(declare-fun res!977286 () Bool)

(assert (=> b!1445408 (=> (not res!977286) (not e!814230))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445408 (= res!977286 (validKeyInArray!0 (select (arr!47364 a!2862) j!93)))))

(declare-fun e!814232 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1445409 () Bool)

(assert (=> b!1445409 (= e!814232 (or (= (select (arr!47364 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47364 a!2862) intermediateBeforeIndex!19) (select (arr!47364 a!2862) j!93))))))

(declare-fun b!1445410 () Bool)

(declare-fun res!977291 () Bool)

(assert (=> b!1445410 (=> (not res!977291) (not e!814230))))

(declare-datatypes ((List!33865 0))(
  ( (Nil!33862) (Cons!33861 (h!35211 (_ BitVec 64)) (t!48559 List!33865)) )
))
(declare-fun arrayNoDuplicates!0 (array!98152 (_ BitVec 32) List!33865) Bool)

(assert (=> b!1445410 (= res!977291 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33862))))

(declare-fun b!1445411 () Bool)

(declare-fun e!814231 () Bool)

(declare-fun e!814229 () Bool)

(assert (=> b!1445411 (= e!814231 e!814229)))

(declare-fun res!977290 () Bool)

(assert (=> b!1445411 (=> (not res!977290) (not e!814229))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11616 0))(
  ( (MissingZero!11616 (index!48856 (_ BitVec 32))) (Found!11616 (index!48857 (_ BitVec 32))) (Intermediate!11616 (undefined!12428 Bool) (index!48858 (_ BitVec 32)) (x!130545 (_ BitVec 32))) (Undefined!11616) (MissingVacant!11616 (index!48859 (_ BitVec 32))) )
))
(declare-fun lt!634487 () SeekEntryResult!11616)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445411 (= res!977290 (= lt!634487 (Intermediate!11616 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634488 () (_ BitVec 64))

(declare-fun lt!634491 () array!98152)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445411 (= lt!634487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634488 mask!2687) lt!634488 lt!634491 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445411 (= lt!634488 (select (store (arr!47364 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445412 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445412 (= e!814229 (not (or (and (= (select (arr!47364 a!2862) index!646) (select (store (arr!47364 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47364 a!2862) index!646) (select (arr!47364 a!2862) j!93))) (not (= (select (arr!47364 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1445412 e!814232))

(declare-fun res!977293 () Bool)

(assert (=> b!1445412 (=> (not res!977293) (not e!814232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98152 (_ BitVec 32)) Bool)

(assert (=> b!1445412 (= res!977293 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48728 0))(
  ( (Unit!48729) )
))
(declare-fun lt!634489 () Unit!48728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48728)

(assert (=> b!1445412 (= lt!634489 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445413 () Bool)

(declare-fun e!814233 () Bool)

(assert (=> b!1445413 (= e!814230 e!814233)))

(declare-fun res!977292 () Bool)

(assert (=> b!1445413 (=> (not res!977292) (not e!814233))))

(assert (=> b!1445413 (= res!977292 (= (select (store (arr!47364 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445413 (= lt!634491 (array!98153 (store (arr!47364 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47914 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814234 () Bool)

(declare-fun b!1445414 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11616)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11616)

(assert (=> b!1445414 (= e!814234 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634488 lt!634491 mask!2687) (seekEntryOrOpen!0 lt!634488 lt!634491 mask!2687)))))

(declare-fun b!1445415 () Bool)

(declare-fun res!977288 () Bool)

(assert (=> b!1445415 (=> (not res!977288) (not e!814229))))

(assert (=> b!1445415 (= res!977288 e!814234)))

(declare-fun c!133572 () Bool)

(assert (=> b!1445415 (= c!133572 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445416 () Bool)

(assert (=> b!1445416 (= e!814234 (= lt!634487 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634488 lt!634491 mask!2687)))))

(declare-fun b!1445417 () Bool)

(declare-fun res!977297 () Bool)

(assert (=> b!1445417 (=> (not res!977297) (not e!814232))))

(assert (=> b!1445417 (= res!977297 (= (seekEntryOrOpen!0 (select (arr!47364 a!2862) j!93) a!2862 mask!2687) (Found!11616 j!93)))))

(declare-fun b!1445418 () Bool)

(declare-fun res!977299 () Bool)

(assert (=> b!1445418 (=> (not res!977299) (not e!814230))))

(assert (=> b!1445418 (= res!977299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445419 () Bool)

(assert (=> b!1445419 (= e!814233 e!814231)))

(declare-fun res!977296 () Bool)

(assert (=> b!1445419 (=> (not res!977296) (not e!814231))))

(declare-fun lt!634490 () SeekEntryResult!11616)

(assert (=> b!1445419 (= res!977296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47364 a!2862) j!93) mask!2687) (select (arr!47364 a!2862) j!93) a!2862 mask!2687) lt!634490))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445419 (= lt!634490 (Intermediate!11616 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445420 () Bool)

(declare-fun res!977285 () Bool)

(assert (=> b!1445420 (=> (not res!977285) (not e!814230))))

(assert (=> b!1445420 (= res!977285 (validKeyInArray!0 (select (arr!47364 a!2862) i!1006)))))

(declare-fun b!1445421 () Bool)

(declare-fun res!977287 () Bool)

(assert (=> b!1445421 (=> (not res!977287) (not e!814230))))

(assert (=> b!1445421 (= res!977287 (and (= (size!47914 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47914 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47914 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445422 () Bool)

(declare-fun res!977294 () Bool)

(assert (=> b!1445422 (=> (not res!977294) (not e!814229))))

(assert (=> b!1445422 (= res!977294 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445423 () Bool)

(declare-fun res!977289 () Bool)

(assert (=> b!1445423 (=> (not res!977289) (not e!814230))))

(assert (=> b!1445423 (= res!977289 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47914 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47914 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47914 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445424 () Bool)

(declare-fun res!977298 () Bool)

(assert (=> b!1445424 (=> (not res!977298) (not e!814231))))

(assert (=> b!1445424 (= res!977298 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47364 a!2862) j!93) a!2862 mask!2687) lt!634490))))

(assert (= (and start!124704 res!977295) b!1445421))

(assert (= (and b!1445421 res!977287) b!1445420))

(assert (= (and b!1445420 res!977285) b!1445408))

(assert (= (and b!1445408 res!977286) b!1445418))

(assert (= (and b!1445418 res!977299) b!1445410))

(assert (= (and b!1445410 res!977291) b!1445423))

(assert (= (and b!1445423 res!977289) b!1445413))

(assert (= (and b!1445413 res!977292) b!1445419))

(assert (= (and b!1445419 res!977296) b!1445424))

(assert (= (and b!1445424 res!977298) b!1445411))

(assert (= (and b!1445411 res!977290) b!1445415))

(assert (= (and b!1445415 c!133572) b!1445416))

(assert (= (and b!1445415 (not c!133572)) b!1445414))

(assert (= (and b!1445415 res!977288) b!1445422))

(assert (= (and b!1445422 res!977294) b!1445412))

(assert (= (and b!1445412 res!977293) b!1445417))

(assert (= (and b!1445417 res!977297) b!1445409))

(declare-fun m!1334361 () Bool)

(assert (=> b!1445419 m!1334361))

(assert (=> b!1445419 m!1334361))

(declare-fun m!1334363 () Bool)

(assert (=> b!1445419 m!1334363))

(assert (=> b!1445419 m!1334363))

(assert (=> b!1445419 m!1334361))

(declare-fun m!1334365 () Bool)

(assert (=> b!1445419 m!1334365))

(declare-fun m!1334367 () Bool)

(assert (=> b!1445411 m!1334367))

(assert (=> b!1445411 m!1334367))

(declare-fun m!1334369 () Bool)

(assert (=> b!1445411 m!1334369))

(declare-fun m!1334371 () Bool)

(assert (=> b!1445411 m!1334371))

(declare-fun m!1334373 () Bool)

(assert (=> b!1445411 m!1334373))

(declare-fun m!1334375 () Bool)

(assert (=> start!124704 m!1334375))

(declare-fun m!1334377 () Bool)

(assert (=> start!124704 m!1334377))

(assert (=> b!1445413 m!1334371))

(declare-fun m!1334379 () Bool)

(assert (=> b!1445413 m!1334379))

(declare-fun m!1334381 () Bool)

(assert (=> b!1445410 m!1334381))

(declare-fun m!1334383 () Bool)

(assert (=> b!1445409 m!1334383))

(assert (=> b!1445409 m!1334361))

(assert (=> b!1445417 m!1334361))

(assert (=> b!1445417 m!1334361))

(declare-fun m!1334385 () Bool)

(assert (=> b!1445417 m!1334385))

(declare-fun m!1334387 () Bool)

(assert (=> b!1445418 m!1334387))

(assert (=> b!1445408 m!1334361))

(assert (=> b!1445408 m!1334361))

(declare-fun m!1334389 () Bool)

(assert (=> b!1445408 m!1334389))

(declare-fun m!1334391 () Bool)

(assert (=> b!1445416 m!1334391))

(assert (=> b!1445424 m!1334361))

(assert (=> b!1445424 m!1334361))

(declare-fun m!1334393 () Bool)

(assert (=> b!1445424 m!1334393))

(declare-fun m!1334395 () Bool)

(assert (=> b!1445414 m!1334395))

(declare-fun m!1334397 () Bool)

(assert (=> b!1445414 m!1334397))

(declare-fun m!1334399 () Bool)

(assert (=> b!1445412 m!1334399))

(assert (=> b!1445412 m!1334371))

(declare-fun m!1334401 () Bool)

(assert (=> b!1445412 m!1334401))

(declare-fun m!1334403 () Bool)

(assert (=> b!1445412 m!1334403))

(declare-fun m!1334405 () Bool)

(assert (=> b!1445412 m!1334405))

(assert (=> b!1445412 m!1334361))

(declare-fun m!1334407 () Bool)

(assert (=> b!1445420 m!1334407))

(assert (=> b!1445420 m!1334407))

(declare-fun m!1334409 () Bool)

(assert (=> b!1445420 m!1334409))

(check-sat (not start!124704) (not b!1445414) (not b!1445416) (not b!1445424) (not b!1445412) (not b!1445419) (not b!1445417) (not b!1445411) (not b!1445418) (not b!1445420) (not b!1445410) (not b!1445408))
(check-sat)
