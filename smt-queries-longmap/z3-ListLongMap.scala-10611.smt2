; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125022 () Bool)

(assert start!125022)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11616 0))(
  ( (MissingZero!11616 (index!48856 (_ BitVec 32))) (Found!11616 (index!48857 (_ BitVec 32))) (Intermediate!11616 (undefined!12428 Bool) (index!48858 (_ BitVec 32)) (x!130705 (_ BitVec 32))) (Undefined!11616) (MissingVacant!11616 (index!48859 (_ BitVec 32))) )
))
(declare-fun lt!635905 () SeekEntryResult!11616)

(declare-fun e!816396 () Bool)

(declare-fun lt!635902 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98365 0))(
  ( (array!98366 (arr!47467 (Array (_ BitVec 32) (_ BitVec 64))) (size!48018 (_ BitVec 32))) )
))
(declare-fun lt!635899 () array!98365)

(declare-fun b!1449469 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98365 (_ BitVec 32)) SeekEntryResult!11616)

(assert (=> b!1449469 (= e!816396 (= lt!635905 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635902 lt!635899 mask!2687)))))

(declare-fun b!1449470 () Bool)

(declare-fun e!816394 () Bool)

(declare-fun e!816401 () Bool)

(assert (=> b!1449470 (= e!816394 e!816401)))

(declare-fun res!980236 () Bool)

(assert (=> b!1449470 (=> (not res!980236) (not e!816401))))

(declare-fun lt!635903 () SeekEntryResult!11616)

(declare-fun a!2862 () array!98365)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449470 (= res!980236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47467 a!2862) j!93) mask!2687) (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!635903))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449470 (= lt!635903 (Intermediate!11616 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449471 () Bool)

(declare-fun e!816395 () Bool)

(declare-fun e!816393 () Bool)

(assert (=> b!1449471 (= e!816395 (not e!816393))))

(declare-fun res!980224 () Bool)

(assert (=> b!1449471 (=> res!980224 e!816393)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449471 (= res!980224 (or (and (= (select (arr!47467 a!2862) index!646) (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47467 a!2862) index!646) (select (arr!47467 a!2862) j!93))) (not (= (select (arr!47467 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816397 () Bool)

(assert (=> b!1449471 e!816397))

(declare-fun res!980221 () Bool)

(assert (=> b!1449471 (=> (not res!980221) (not e!816397))))

(declare-fun lt!635901 () SeekEntryResult!11616)

(assert (=> b!1449471 (= res!980221 (and (= lt!635901 (Found!11616 j!93)) (or (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) (select (arr!47467 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98365 (_ BitVec 32)) SeekEntryResult!11616)

(assert (=> b!1449471 (= lt!635901 (seekEntryOrOpen!0 (select (arr!47467 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98365 (_ BitVec 32)) Bool)

(assert (=> b!1449471 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48761 0))(
  ( (Unit!48762) )
))
(declare-fun lt!635900 () Unit!48761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48761)

(assert (=> b!1449471 (= lt!635900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449472 () Bool)

(declare-fun res!980227 () Bool)

(declare-fun e!816402 () Bool)

(assert (=> b!1449472 (=> (not res!980227) (not e!816402))))

(declare-datatypes ((List!33955 0))(
  ( (Nil!33952) (Cons!33951 (h!35312 (_ BitVec 64)) (t!48641 List!33955)) )
))
(declare-fun arrayNoDuplicates!0 (array!98365 (_ BitVec 32) List!33955) Bool)

(assert (=> b!1449472 (= res!980227 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33952))))

(declare-fun b!1449473 () Bool)

(assert (=> b!1449473 (= e!816393 true)))

(declare-fun lt!635904 () SeekEntryResult!11616)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98365 (_ BitVec 32)) SeekEntryResult!11616)

(assert (=> b!1449473 (= lt!635904 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47467 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!980223 () Bool)

(assert (=> start!125022 (=> (not res!980223) (not e!816402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125022 (= res!980223 (validMask!0 mask!2687))))

(assert (=> start!125022 e!816402))

(assert (=> start!125022 true))

(declare-fun array_inv!36748 (array!98365) Bool)

(assert (=> start!125022 (array_inv!36748 a!2862)))

(declare-fun b!1449474 () Bool)

(declare-fun res!980222 () Bool)

(assert (=> b!1449474 (=> (not res!980222) (not e!816402))))

(assert (=> b!1449474 (= res!980222 (and (= (size!48018 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48018 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48018 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449475 () Bool)

(declare-fun res!980229 () Bool)

(assert (=> b!1449475 (=> (not res!980229) (not e!816395))))

(assert (=> b!1449475 (= res!980229 e!816396)))

(declare-fun c!134143 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449475 (= c!134143 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449476 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449476 (= e!816396 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635902 lt!635899 mask!2687) (seekEntryOrOpen!0 lt!635902 lt!635899 mask!2687)))))

(declare-fun b!1449477 () Bool)

(declare-fun res!980225 () Bool)

(assert (=> b!1449477 (=> (not res!980225) (not e!816402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449477 (= res!980225 (validKeyInArray!0 (select (arr!47467 a!2862) j!93)))))

(declare-fun e!816398 () Bool)

(declare-fun b!1449478 () Bool)

(assert (=> b!1449478 (= e!816398 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449479 () Bool)

(assert (=> b!1449479 (= e!816402 e!816394)))

(declare-fun res!980233 () Bool)

(assert (=> b!1449479 (=> (not res!980233) (not e!816394))))

(assert (=> b!1449479 (= res!980233 (= (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449479 (= lt!635899 (array!98366 (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48018 a!2862)))))

(declare-fun b!1449480 () Bool)

(declare-fun e!816400 () Bool)

(assert (=> b!1449480 (= e!816400 e!816398)))

(declare-fun res!980231 () Bool)

(assert (=> b!1449480 (=> (not res!980231) (not e!816398))))

(assert (=> b!1449480 (= res!980231 (= lt!635901 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47467 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449481 () Bool)

(declare-fun res!980228 () Bool)

(assert (=> b!1449481 (=> (not res!980228) (not e!816402))))

(assert (=> b!1449481 (= res!980228 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48018 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48018 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48018 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449482 () Bool)

(assert (=> b!1449482 (= e!816401 e!816395)))

(declare-fun res!980235 () Bool)

(assert (=> b!1449482 (=> (not res!980235) (not e!816395))))

(assert (=> b!1449482 (= res!980235 (= lt!635905 (Intermediate!11616 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449482 (= lt!635905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635902 mask!2687) lt!635902 lt!635899 mask!2687))))

(assert (=> b!1449482 (= lt!635902 (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449483 () Bool)

(declare-fun res!980237 () Bool)

(assert (=> b!1449483 (=> (not res!980237) (not e!816402))))

(assert (=> b!1449483 (= res!980237 (validKeyInArray!0 (select (arr!47467 a!2862) i!1006)))))

(declare-fun b!1449484 () Bool)

(assert (=> b!1449484 (= e!816397 e!816400)))

(declare-fun res!980226 () Bool)

(assert (=> b!1449484 (=> res!980226 e!816400)))

(assert (=> b!1449484 (= res!980226 (or (and (= (select (arr!47467 a!2862) index!646) (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47467 a!2862) index!646) (select (arr!47467 a!2862) j!93))) (not (= (select (arr!47467 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449485 () Bool)

(declare-fun res!980230 () Bool)

(assert (=> b!1449485 (=> (not res!980230) (not e!816395))))

(assert (=> b!1449485 (= res!980230 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449486 () Bool)

(declare-fun res!980234 () Bool)

(assert (=> b!1449486 (=> (not res!980234) (not e!816401))))

(assert (=> b!1449486 (= res!980234 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!635903))))

(declare-fun b!1449487 () Bool)

(declare-fun res!980232 () Bool)

(assert (=> b!1449487 (=> (not res!980232) (not e!816402))))

(assert (=> b!1449487 (= res!980232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125022 res!980223) b!1449474))

(assert (= (and b!1449474 res!980222) b!1449483))

(assert (= (and b!1449483 res!980237) b!1449477))

(assert (= (and b!1449477 res!980225) b!1449487))

(assert (= (and b!1449487 res!980232) b!1449472))

(assert (= (and b!1449472 res!980227) b!1449481))

(assert (= (and b!1449481 res!980228) b!1449479))

(assert (= (and b!1449479 res!980233) b!1449470))

(assert (= (and b!1449470 res!980236) b!1449486))

(assert (= (and b!1449486 res!980234) b!1449482))

(assert (= (and b!1449482 res!980235) b!1449475))

(assert (= (and b!1449475 c!134143) b!1449469))

(assert (= (and b!1449475 (not c!134143)) b!1449476))

(assert (= (and b!1449475 res!980229) b!1449485))

(assert (= (and b!1449485 res!980230) b!1449471))

(assert (= (and b!1449471 res!980221) b!1449484))

(assert (= (and b!1449484 (not res!980226)) b!1449480))

(assert (= (and b!1449480 res!980231) b!1449478))

(assert (= (and b!1449471 (not res!980224)) b!1449473))

(declare-fun m!1338361 () Bool)

(assert (=> b!1449470 m!1338361))

(assert (=> b!1449470 m!1338361))

(declare-fun m!1338363 () Bool)

(assert (=> b!1449470 m!1338363))

(assert (=> b!1449470 m!1338363))

(assert (=> b!1449470 m!1338361))

(declare-fun m!1338365 () Bool)

(assert (=> b!1449470 m!1338365))

(declare-fun m!1338367 () Bool)

(assert (=> b!1449483 m!1338367))

(assert (=> b!1449483 m!1338367))

(declare-fun m!1338369 () Bool)

(assert (=> b!1449483 m!1338369))

(declare-fun m!1338371 () Bool)

(assert (=> start!125022 m!1338371))

(declare-fun m!1338373 () Bool)

(assert (=> start!125022 m!1338373))

(declare-fun m!1338375 () Bool)

(assert (=> b!1449472 m!1338375))

(declare-fun m!1338377 () Bool)

(assert (=> b!1449482 m!1338377))

(assert (=> b!1449482 m!1338377))

(declare-fun m!1338379 () Bool)

(assert (=> b!1449482 m!1338379))

(declare-fun m!1338381 () Bool)

(assert (=> b!1449482 m!1338381))

(declare-fun m!1338383 () Bool)

(assert (=> b!1449482 m!1338383))

(declare-fun m!1338385 () Bool)

(assert (=> b!1449484 m!1338385))

(assert (=> b!1449484 m!1338381))

(declare-fun m!1338387 () Bool)

(assert (=> b!1449484 m!1338387))

(assert (=> b!1449484 m!1338361))

(declare-fun m!1338389 () Bool)

(assert (=> b!1449471 m!1338389))

(assert (=> b!1449471 m!1338381))

(declare-fun m!1338391 () Bool)

(assert (=> b!1449471 m!1338391))

(assert (=> b!1449471 m!1338387))

(assert (=> b!1449471 m!1338385))

(assert (=> b!1449471 m!1338361))

(declare-fun m!1338393 () Bool)

(assert (=> b!1449471 m!1338393))

(declare-fun m!1338395 () Bool)

(assert (=> b!1449471 m!1338395))

(assert (=> b!1449471 m!1338361))

(assert (=> b!1449477 m!1338361))

(assert (=> b!1449477 m!1338361))

(declare-fun m!1338397 () Bool)

(assert (=> b!1449477 m!1338397))

(assert (=> b!1449479 m!1338381))

(declare-fun m!1338399 () Bool)

(assert (=> b!1449479 m!1338399))

(assert (=> b!1449473 m!1338361))

(assert (=> b!1449473 m!1338361))

(declare-fun m!1338401 () Bool)

(assert (=> b!1449473 m!1338401))

(declare-fun m!1338403 () Bool)

(assert (=> b!1449487 m!1338403))

(declare-fun m!1338405 () Bool)

(assert (=> b!1449476 m!1338405))

(declare-fun m!1338407 () Bool)

(assert (=> b!1449476 m!1338407))

(assert (=> b!1449480 m!1338361))

(assert (=> b!1449480 m!1338361))

(declare-fun m!1338409 () Bool)

(assert (=> b!1449480 m!1338409))

(assert (=> b!1449486 m!1338361))

(assert (=> b!1449486 m!1338361))

(declare-fun m!1338411 () Bool)

(assert (=> b!1449486 m!1338411))

(declare-fun m!1338413 () Bool)

(assert (=> b!1449469 m!1338413))

(check-sat (not b!1449473) (not start!125022) (not b!1449483) (not b!1449469) (not b!1449486) (not b!1449476) (not b!1449471) (not b!1449487) (not b!1449470) (not b!1449480) (not b!1449477) (not b!1449482) (not b!1449472))
(check-sat)
