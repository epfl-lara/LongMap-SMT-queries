; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124670 () Bool)

(assert start!124670)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98118 0))(
  ( (array!98119 (arr!47347 (Array (_ BitVec 32) (_ BitVec 64))) (size!47897 (_ BitVec 32))) )
))
(declare-fun lt!634235 () array!98118)

(declare-fun b!1444540 () Bool)

(declare-fun lt!634236 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!813878 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11599 0))(
  ( (MissingZero!11599 (index!48788 (_ BitVec 32))) (Found!11599 (index!48789 (_ BitVec 32))) (Intermediate!11599 (undefined!12411 Bool) (index!48790 (_ BitVec 32)) (x!130480 (_ BitVec 32))) (Undefined!11599) (MissingVacant!11599 (index!48791 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98118 (_ BitVec 32)) SeekEntryResult!11599)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98118 (_ BitVec 32)) SeekEntryResult!11599)

(assert (=> b!1444540 (= e!813878 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634236 lt!634235 mask!2687) (seekEntryOrOpen!0 lt!634236 lt!634235 mask!2687)))))

(declare-fun b!1444541 () Bool)

(declare-fun res!976530 () Bool)

(declare-fun e!813873 () Bool)

(assert (=> b!1444541 (=> res!976530 e!813873)))

(declare-fun lt!634232 () SeekEntryResult!11599)

(assert (=> b!1444541 (= res!976530 (not (= lt!634232 (seekEntryOrOpen!0 lt!634236 lt!634235 mask!2687))))))

(declare-fun b!1444542 () Bool)

(declare-fun res!976522 () Bool)

(assert (=> b!1444542 (=> res!976522 e!813873)))

(assert (=> b!1444542 (= res!976522 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444543 () Bool)

(declare-fun lt!634231 () SeekEntryResult!11599)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98118 (_ BitVec 32)) SeekEntryResult!11599)

(assert (=> b!1444543 (= e!813878 (= lt!634231 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634236 lt!634235 mask!2687)))))

(declare-fun b!1444544 () Bool)

(declare-fun res!976533 () Bool)

(declare-fun e!813875 () Bool)

(assert (=> b!1444544 (=> (not res!976533) (not e!813875))))

(declare-fun a!2862 () array!98118)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444544 (= res!976533 (validKeyInArray!0 (select (arr!47347 a!2862) i!1006)))))

(declare-fun b!1444545 () Bool)

(declare-fun res!976520 () Bool)

(assert (=> b!1444545 (=> (not res!976520) (not e!813875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98118 (_ BitVec 32)) Bool)

(assert (=> b!1444545 (= res!976520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444546 () Bool)

(declare-fun res!976528 () Bool)

(assert (=> b!1444546 (=> (not res!976528) (not e!813875))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444546 (= res!976528 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47897 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47897 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47897 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444547 () Bool)

(declare-fun res!976531 () Bool)

(assert (=> b!1444547 (=> (not res!976531) (not e!813875))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444547 (= res!976531 (and (= (size!47897 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47897 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47897 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444548 () Bool)

(declare-fun e!813876 () Bool)

(assert (=> b!1444548 (= e!813875 e!813876)))

(declare-fun res!976525 () Bool)

(assert (=> b!1444548 (=> (not res!976525) (not e!813876))))

(assert (=> b!1444548 (= res!976525 (= (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444548 (= lt!634235 (array!98119 (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47897 a!2862)))))

(declare-fun b!1444549 () Bool)

(declare-fun res!976521 () Bool)

(declare-fun e!813872 () Bool)

(assert (=> b!1444549 (=> (not res!976521) (not e!813872))))

(declare-fun lt!634234 () SeekEntryResult!11599)

(assert (=> b!1444549 (= res!976521 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!634234))))

(declare-fun b!1444550 () Bool)

(declare-fun res!976534 () Bool)

(declare-fun e!813877 () Bool)

(assert (=> b!1444550 (=> (not res!976534) (not e!813877))))

(assert (=> b!1444550 (= res!976534 e!813878)))

(declare-fun c!133521 () Bool)

(assert (=> b!1444550 (= c!133521 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444552 () Bool)

(assert (=> b!1444552 (= e!813877 (not e!813873))))

(declare-fun res!976523 () Bool)

(assert (=> b!1444552 (=> res!976523 e!813873)))

(assert (=> b!1444552 (= res!976523 (or (not (= (select (arr!47347 a!2862) index!646) (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47347 a!2862) index!646) (select (arr!47347 a!2862) j!93)))))))

(assert (=> b!1444552 (and (= lt!634232 (Found!11599 j!93)) (or (= (select (arr!47347 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47347 a!2862) intermediateBeforeIndex!19) (select (arr!47347 a!2862) j!93))))))

(assert (=> b!1444552 (= lt!634232 (seekEntryOrOpen!0 (select (arr!47347 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1444552 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48694 0))(
  ( (Unit!48695) )
))
(declare-fun lt!634233 () Unit!48694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48694)

(assert (=> b!1444552 (= lt!634233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444553 () Bool)

(assert (=> b!1444553 (= e!813872 e!813877)))

(declare-fun res!976527 () Bool)

(assert (=> b!1444553 (=> (not res!976527) (not e!813877))))

(assert (=> b!1444553 (= res!976527 (= lt!634231 (Intermediate!11599 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444553 (= lt!634231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634236 mask!2687) lt!634236 lt!634235 mask!2687))))

(assert (=> b!1444553 (= lt!634236 (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444554 () Bool)

(declare-fun res!976526 () Bool)

(assert (=> b!1444554 (=> (not res!976526) (not e!813875))))

(assert (=> b!1444554 (= res!976526 (validKeyInArray!0 (select (arr!47347 a!2862) j!93)))))

(declare-fun b!1444555 () Bool)

(assert (=> b!1444555 (= e!813873 (validKeyInArray!0 lt!634236))))

(declare-fun b!1444556 () Bool)

(assert (=> b!1444556 (= e!813876 e!813872)))

(declare-fun res!976532 () Bool)

(assert (=> b!1444556 (=> (not res!976532) (not e!813872))))

(assert (=> b!1444556 (= res!976532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47347 a!2862) j!93) mask!2687) (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!634234))))

(assert (=> b!1444556 (= lt!634234 (Intermediate!11599 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444557 () Bool)

(declare-fun res!976524 () Bool)

(assert (=> b!1444557 (=> (not res!976524) (not e!813875))))

(declare-datatypes ((List!33848 0))(
  ( (Nil!33845) (Cons!33844 (h!35194 (_ BitVec 64)) (t!48542 List!33848)) )
))
(declare-fun arrayNoDuplicates!0 (array!98118 (_ BitVec 32) List!33848) Bool)

(assert (=> b!1444557 (= res!976524 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33845))))

(declare-fun b!1444551 () Bool)

(declare-fun res!976529 () Bool)

(assert (=> b!1444551 (=> (not res!976529) (not e!813877))))

(assert (=> b!1444551 (= res!976529 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!976519 () Bool)

(assert (=> start!124670 (=> (not res!976519) (not e!813875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124670 (= res!976519 (validMask!0 mask!2687))))

(assert (=> start!124670 e!813875))

(assert (=> start!124670 true))

(declare-fun array_inv!36375 (array!98118) Bool)

(assert (=> start!124670 (array_inv!36375 a!2862)))

(assert (= (and start!124670 res!976519) b!1444547))

(assert (= (and b!1444547 res!976531) b!1444544))

(assert (= (and b!1444544 res!976533) b!1444554))

(assert (= (and b!1444554 res!976526) b!1444545))

(assert (= (and b!1444545 res!976520) b!1444557))

(assert (= (and b!1444557 res!976524) b!1444546))

(assert (= (and b!1444546 res!976528) b!1444548))

(assert (= (and b!1444548 res!976525) b!1444556))

(assert (= (and b!1444556 res!976532) b!1444549))

(assert (= (and b!1444549 res!976521) b!1444553))

(assert (= (and b!1444553 res!976527) b!1444550))

(assert (= (and b!1444550 c!133521) b!1444543))

(assert (= (and b!1444550 (not c!133521)) b!1444540))

(assert (= (and b!1444550 res!976534) b!1444551))

(assert (= (and b!1444551 res!976529) b!1444552))

(assert (= (and b!1444552 (not res!976523)) b!1444541))

(assert (= (and b!1444541 (not res!976530)) b!1444542))

(assert (= (and b!1444542 (not res!976522)) b!1444555))

(declare-fun m!1333557 () Bool)

(assert (=> b!1444544 m!1333557))

(assert (=> b!1444544 m!1333557))

(declare-fun m!1333559 () Bool)

(assert (=> b!1444544 m!1333559))

(declare-fun m!1333561 () Bool)

(assert (=> b!1444557 m!1333561))

(declare-fun m!1333563 () Bool)

(assert (=> b!1444548 m!1333563))

(declare-fun m!1333565 () Bool)

(assert (=> b!1444548 m!1333565))

(declare-fun m!1333567 () Bool)

(assert (=> b!1444552 m!1333567))

(assert (=> b!1444552 m!1333563))

(declare-fun m!1333569 () Bool)

(assert (=> b!1444552 m!1333569))

(declare-fun m!1333571 () Bool)

(assert (=> b!1444552 m!1333571))

(declare-fun m!1333573 () Bool)

(assert (=> b!1444552 m!1333573))

(declare-fun m!1333575 () Bool)

(assert (=> b!1444552 m!1333575))

(declare-fun m!1333577 () Bool)

(assert (=> b!1444552 m!1333577))

(declare-fun m!1333579 () Bool)

(assert (=> b!1444552 m!1333579))

(assert (=> b!1444552 m!1333575))

(assert (=> b!1444554 m!1333575))

(assert (=> b!1444554 m!1333575))

(declare-fun m!1333581 () Bool)

(assert (=> b!1444554 m!1333581))

(declare-fun m!1333583 () Bool)

(assert (=> b!1444543 m!1333583))

(assert (=> b!1444549 m!1333575))

(assert (=> b!1444549 m!1333575))

(declare-fun m!1333585 () Bool)

(assert (=> b!1444549 m!1333585))

(declare-fun m!1333587 () Bool)

(assert (=> b!1444545 m!1333587))

(assert (=> b!1444556 m!1333575))

(assert (=> b!1444556 m!1333575))

(declare-fun m!1333589 () Bool)

(assert (=> b!1444556 m!1333589))

(assert (=> b!1444556 m!1333589))

(assert (=> b!1444556 m!1333575))

(declare-fun m!1333591 () Bool)

(assert (=> b!1444556 m!1333591))

(declare-fun m!1333593 () Bool)

(assert (=> start!124670 m!1333593))

(declare-fun m!1333595 () Bool)

(assert (=> start!124670 m!1333595))

(declare-fun m!1333597 () Bool)

(assert (=> b!1444541 m!1333597))

(declare-fun m!1333599 () Bool)

(assert (=> b!1444553 m!1333599))

(assert (=> b!1444553 m!1333599))

(declare-fun m!1333601 () Bool)

(assert (=> b!1444553 m!1333601))

(assert (=> b!1444553 m!1333563))

(declare-fun m!1333603 () Bool)

(assert (=> b!1444553 m!1333603))

(declare-fun m!1333605 () Bool)

(assert (=> b!1444540 m!1333605))

(assert (=> b!1444540 m!1333597))

(declare-fun m!1333607 () Bool)

(assert (=> b!1444555 m!1333607))

(push 1)

(assert (not b!1444549))

