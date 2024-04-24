; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125964 () Bool)

(assert start!125964)

(declare-fun b!1472536 () Bool)

(declare-fun res!999531 () Bool)

(declare-fun e!826679 () Bool)

(assert (=> b!1472536 (=> (not res!999531) (not e!826679))))

(declare-datatypes ((array!99193 0))(
  ( (array!99194 (arr!47878 (Array (_ BitVec 32) (_ BitVec 64))) (size!48429 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99193)

(declare-datatypes ((List!34366 0))(
  ( (Nil!34363) (Cons!34362 (h!35729 (_ BitVec 64)) (t!49052 List!34366)) )
))
(declare-fun arrayNoDuplicates!0 (array!99193 (_ BitVec 32) List!34366) Bool)

(assert (=> b!1472536 (= res!999531 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34363))))

(declare-fun e!826680 () Bool)

(declare-fun b!1472537 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12015 0))(
  ( (MissingZero!12015 (index!50452 (_ BitVec 32))) (Found!12015 (index!50453 (_ BitVec 32))) (Intermediate!12015 (undefined!12827 Bool) (index!50454 (_ BitVec 32)) (x!132218 (_ BitVec 32))) (Undefined!12015) (MissingVacant!12015 (index!50455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12015)

(assert (=> b!1472537 (= e!826680 (= (seekEntryOrOpen!0 (select (arr!47878 a!2862) j!93) a!2862 mask!2687) (Found!12015 j!93)))))

(declare-fun b!1472538 () Bool)

(declare-fun res!999520 () Bool)

(declare-fun e!826676 () Bool)

(assert (=> b!1472538 (=> (not res!999520) (not e!826676))))

(declare-fun e!826678 () Bool)

(assert (=> b!1472538 (= res!999520 e!826678)))

(declare-fun c!136030 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472538 (= c!136030 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472539 () Bool)

(declare-fun res!999526 () Bool)

(assert (=> b!1472539 (=> (not res!999526) (not e!826679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472539 (= res!999526 (validKeyInArray!0 (select (arr!47878 a!2862) j!93)))))

(declare-fun res!999533 () Bool)

(assert (=> start!125964 (=> (not res!999533) (not e!826679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125964 (= res!999533 (validMask!0 mask!2687))))

(assert (=> start!125964 e!826679))

(assert (=> start!125964 true))

(declare-fun array_inv!37159 (array!99193) Bool)

(assert (=> start!125964 (array_inv!37159 a!2862)))

(declare-fun b!1472540 () Bool)

(declare-fun e!826674 () Bool)

(assert (=> b!1472540 (= e!826679 e!826674)))

(declare-fun res!999524 () Bool)

(assert (=> b!1472540 (=> (not res!999524) (not e!826674))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472540 (= res!999524 (= (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643686 () array!99193)

(assert (=> b!1472540 (= lt!643686 (array!99194 (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48429 a!2862)))))

(declare-fun b!1472541 () Bool)

(declare-fun e!826675 () Bool)

(assert (=> b!1472541 (= e!826675 e!826676)))

(declare-fun res!999522 () Bool)

(assert (=> b!1472541 (=> (not res!999522) (not e!826676))))

(declare-fun lt!643685 () SeekEntryResult!12015)

(assert (=> b!1472541 (= res!999522 (= lt!643685 (Intermediate!12015 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643684 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12015)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472541 (= lt!643685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643684 mask!2687) lt!643684 lt!643686 mask!2687))))

(assert (=> b!1472541 (= lt!643684 (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472542 () Bool)

(declare-fun res!999527 () Bool)

(assert (=> b!1472542 (=> (not res!999527) (not e!826679))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472542 (= res!999527 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48429 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48429 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48429 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472543 () Bool)

(declare-fun res!999523 () Bool)

(assert (=> b!1472543 (=> (not res!999523) (not e!826679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99193 (_ BitVec 32)) Bool)

(assert (=> b!1472543 (= res!999523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472544 () Bool)

(declare-fun res!999521 () Bool)

(assert (=> b!1472544 (=> (not res!999521) (not e!826676))))

(assert (=> b!1472544 (= res!999521 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472545 () Bool)

(assert (=> b!1472545 (= e!826678 (= lt!643685 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643684 lt!643686 mask!2687)))))

(declare-fun b!1472546 () Bool)

(assert (=> b!1472546 (= e!826674 e!826675)))

(declare-fun res!999528 () Bool)

(assert (=> b!1472546 (=> (not res!999528) (not e!826675))))

(declare-fun lt!643683 () SeekEntryResult!12015)

(assert (=> b!1472546 (= res!999528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47878 a!2862) j!93) mask!2687) (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!643683))))

(assert (=> b!1472546 (= lt!643683 (Intermediate!12015 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472547 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12015)

(assert (=> b!1472547 (= e!826678 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643684 lt!643686 mask!2687) (seekEntryOrOpen!0 lt!643684 lt!643686 mask!2687)))))

(declare-fun b!1472548 () Bool)

(declare-fun res!999529 () Bool)

(assert (=> b!1472548 (=> (not res!999529) (not e!826679))))

(assert (=> b!1472548 (= res!999529 (validKeyInArray!0 (select (arr!47878 a!2862) i!1006)))))

(declare-fun b!1472549 () Bool)

(declare-fun res!999525 () Bool)

(assert (=> b!1472549 (=> (not res!999525) (not e!826675))))

(assert (=> b!1472549 (= res!999525 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!643683))))

(declare-fun b!1472550 () Bool)

(assert (=> b!1472550 (= e!826676 (not true))))

(assert (=> b!1472550 e!826680))

(declare-fun res!999532 () Bool)

(assert (=> b!1472550 (=> (not res!999532) (not e!826680))))

(assert (=> b!1472550 (= res!999532 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49403 0))(
  ( (Unit!49404) )
))
(declare-fun lt!643687 () Unit!49403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49403)

(assert (=> b!1472550 (= lt!643687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472551 () Bool)

(declare-fun res!999530 () Bool)

(assert (=> b!1472551 (=> (not res!999530) (not e!826679))))

(assert (=> b!1472551 (= res!999530 (and (= (size!48429 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48429 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48429 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125964 res!999533) b!1472551))

(assert (= (and b!1472551 res!999530) b!1472548))

(assert (= (and b!1472548 res!999529) b!1472539))

(assert (= (and b!1472539 res!999526) b!1472543))

(assert (= (and b!1472543 res!999523) b!1472536))

(assert (= (and b!1472536 res!999531) b!1472542))

(assert (= (and b!1472542 res!999527) b!1472540))

(assert (= (and b!1472540 res!999524) b!1472546))

(assert (= (and b!1472546 res!999528) b!1472549))

(assert (= (and b!1472549 res!999525) b!1472541))

(assert (= (and b!1472541 res!999522) b!1472538))

(assert (= (and b!1472538 c!136030) b!1472545))

(assert (= (and b!1472538 (not c!136030)) b!1472547))

(assert (= (and b!1472538 res!999520) b!1472544))

(assert (= (and b!1472544 res!999521) b!1472550))

(assert (= (and b!1472550 res!999532) b!1472537))

(declare-fun m!1359481 () Bool)

(assert (=> b!1472547 m!1359481))

(declare-fun m!1359483 () Bool)

(assert (=> b!1472547 m!1359483))

(declare-fun m!1359485 () Bool)

(assert (=> b!1472536 m!1359485))

(declare-fun m!1359487 () Bool)

(assert (=> b!1472550 m!1359487))

(declare-fun m!1359489 () Bool)

(assert (=> b!1472550 m!1359489))

(declare-fun m!1359491 () Bool)

(assert (=> b!1472549 m!1359491))

(assert (=> b!1472549 m!1359491))

(declare-fun m!1359493 () Bool)

(assert (=> b!1472549 m!1359493))

(assert (=> b!1472546 m!1359491))

(assert (=> b!1472546 m!1359491))

(declare-fun m!1359495 () Bool)

(assert (=> b!1472546 m!1359495))

(assert (=> b!1472546 m!1359495))

(assert (=> b!1472546 m!1359491))

(declare-fun m!1359497 () Bool)

(assert (=> b!1472546 m!1359497))

(declare-fun m!1359499 () Bool)

(assert (=> b!1472541 m!1359499))

(assert (=> b!1472541 m!1359499))

(declare-fun m!1359501 () Bool)

(assert (=> b!1472541 m!1359501))

(declare-fun m!1359503 () Bool)

(assert (=> b!1472541 m!1359503))

(declare-fun m!1359505 () Bool)

(assert (=> b!1472541 m!1359505))

(assert (=> b!1472539 m!1359491))

(assert (=> b!1472539 m!1359491))

(declare-fun m!1359507 () Bool)

(assert (=> b!1472539 m!1359507))

(assert (=> b!1472540 m!1359503))

(declare-fun m!1359509 () Bool)

(assert (=> b!1472540 m!1359509))

(assert (=> b!1472537 m!1359491))

(assert (=> b!1472537 m!1359491))

(declare-fun m!1359511 () Bool)

(assert (=> b!1472537 m!1359511))

(declare-fun m!1359513 () Bool)

(assert (=> b!1472545 m!1359513))

(declare-fun m!1359515 () Bool)

(assert (=> b!1472543 m!1359515))

(declare-fun m!1359517 () Bool)

(assert (=> start!125964 m!1359517))

(declare-fun m!1359519 () Bool)

(assert (=> start!125964 m!1359519))

(declare-fun m!1359521 () Bool)

(assert (=> b!1472548 m!1359521))

(assert (=> b!1472548 m!1359521))

(declare-fun m!1359523 () Bool)

(assert (=> b!1472548 m!1359523))

(check-sat (not b!1472550) (not start!125964) (not b!1472548) (not b!1472543) (not b!1472536) (not b!1472541) (not b!1472549) (not b!1472545) (not b!1472537) (not b!1472547) (not b!1472539) (not b!1472546))
(check-sat)
