; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125366 () Bool)

(assert start!125366)

(declare-datatypes ((array!98814 0))(
  ( (array!98815 (arr!47695 (Array (_ BitVec 32) (_ BitVec 64))) (size!48245 (_ BitVec 32))) )
))
(declare-fun lt!641444 () array!98814)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1465551 () Bool)

(declare-fun e!823482 () Bool)

(declare-fun lt!641441 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641439 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11947 0))(
  ( (MissingZero!11947 (index!50180 (_ BitVec 32))) (Found!11947 (index!50181 (_ BitVec 32))) (Intermediate!11947 (undefined!12759 Bool) (index!50182 (_ BitVec 32)) (x!131756 (_ BitVec 32))) (Undefined!11947) (MissingVacant!11947 (index!50183 (_ BitVec 32))) )
))
(declare-fun lt!641445 () SeekEntryResult!11947)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98814 (_ BitVec 32)) SeekEntryResult!11947)

(assert (=> b!1465551 (= e!823482 (not (= lt!641445 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 lt!641441 lt!641444 mask!2687))))))

(declare-fun b!1465552 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!823481 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98814 (_ BitVec 32)) SeekEntryResult!11947)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98814 (_ BitVec 32)) SeekEntryResult!11947)

(assert (=> b!1465552 (= e!823481 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641441 lt!641444 mask!2687) (seekEntryOrOpen!0 lt!641441 lt!641444 mask!2687)))))

(declare-fun b!1465553 () Bool)

(assert (=> b!1465553 (= e!823482 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 intermediateAfterIndex!19 lt!641441 lt!641444 mask!2687) (seekEntryOrOpen!0 lt!641441 lt!641444 mask!2687))))))

(declare-fun b!1465554 () Bool)

(declare-fun e!823484 () Bool)

(declare-fun e!823486 () Bool)

(assert (=> b!1465554 (= e!823484 e!823486)))

(declare-fun res!994424 () Bool)

(assert (=> b!1465554 (=> (not res!994424) (not e!823486))))

(declare-fun lt!641440 () SeekEntryResult!11947)

(declare-fun a!2862 () array!98814)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465554 (= res!994424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47695 a!2862) j!93) mask!2687) (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641440))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465554 (= lt!641440 (Intermediate!11947 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465555 () Bool)

(declare-fun e!823483 () Bool)

(declare-fun e!823485 () Bool)

(assert (=> b!1465555 (= e!823483 (not e!823485))))

(declare-fun res!994428 () Bool)

(assert (=> b!1465555 (=> res!994428 e!823485)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465555 (= res!994428 (or (and (= (select (arr!47695 a!2862) index!646) (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47695 a!2862) index!646) (select (arr!47695 a!2862) j!93))) (= (select (arr!47695 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823489 () Bool)

(assert (=> b!1465555 e!823489))

(declare-fun res!994423 () Bool)

(assert (=> b!1465555 (=> (not res!994423) (not e!823489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98814 (_ BitVec 32)) Bool)

(assert (=> b!1465555 (= res!994423 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49390 0))(
  ( (Unit!49391) )
))
(declare-fun lt!641443 () Unit!49390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49390)

(assert (=> b!1465555 (= lt!641443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465556 () Bool)

(declare-fun res!994419 () Bool)

(declare-fun e!823490 () Bool)

(assert (=> b!1465556 (=> res!994419 e!823490)))

(assert (=> b!1465556 (= res!994419 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641440)))))

(declare-fun b!1465557 () Bool)

(declare-fun res!994429 () Bool)

(assert (=> b!1465557 (=> (not res!994429) (not e!823486))))

(assert (=> b!1465557 (= res!994429 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641440))))

(declare-fun b!1465558 () Bool)

(declare-fun res!994418 () Bool)

(declare-fun e!823488 () Bool)

(assert (=> b!1465558 (=> (not res!994418) (not e!823488))))

(assert (=> b!1465558 (= res!994418 (and (= (size!48245 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48245 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48245 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465559 () Bool)

(declare-fun res!994433 () Bool)

(assert (=> b!1465559 (=> (not res!994433) (not e!823483))))

(assert (=> b!1465559 (= res!994433 e!823481)))

(declare-fun c!135078 () Bool)

(assert (=> b!1465559 (= c!135078 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465560 () Bool)

(declare-fun res!994420 () Bool)

(assert (=> b!1465560 (=> (not res!994420) (not e!823488))))

(assert (=> b!1465560 (= res!994420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465561 () Bool)

(assert (=> b!1465561 (= e!823488 e!823484)))

(declare-fun res!994431 () Bool)

(assert (=> b!1465561 (=> (not res!994431) (not e!823484))))

(assert (=> b!1465561 (= res!994431 (= (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465561 (= lt!641444 (array!98815 (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48245 a!2862)))))

(declare-fun res!994425 () Bool)

(assert (=> start!125366 (=> (not res!994425) (not e!823488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125366 (= res!994425 (validMask!0 mask!2687))))

(assert (=> start!125366 e!823488))

(assert (=> start!125366 true))

(declare-fun array_inv!36723 (array!98814) Bool)

(assert (=> start!125366 (array_inv!36723 a!2862)))

(declare-fun b!1465562 () Bool)

(assert (=> b!1465562 (= e!823489 (or (= (select (arr!47695 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47695 a!2862) intermediateBeforeIndex!19) (select (arr!47695 a!2862) j!93))))))

(declare-fun b!1465563 () Bool)

(declare-fun res!994427 () Bool)

(assert (=> b!1465563 (=> (not res!994427) (not e!823488))))

(assert (=> b!1465563 (= res!994427 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48245 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48245 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48245 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465564 () Bool)

(assert (=> b!1465564 (= e!823485 e!823490)))

(declare-fun res!994432 () Bool)

(assert (=> b!1465564 (=> res!994432 e!823490)))

(assert (=> b!1465564 (= res!994432 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641439 #b00000000000000000000000000000000) (bvsge lt!641439 (size!48245 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465564 (= lt!641439 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465565 () Bool)

(assert (=> b!1465565 (= e!823486 e!823483)))

(declare-fun res!994435 () Bool)

(assert (=> b!1465565 (=> (not res!994435) (not e!823483))))

(assert (=> b!1465565 (= res!994435 (= lt!641445 (Intermediate!11947 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465565 (= lt!641445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641441 mask!2687) lt!641441 lt!641444 mask!2687))))

(assert (=> b!1465565 (= lt!641441 (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465566 () Bool)

(declare-fun res!994430 () Bool)

(assert (=> b!1465566 (=> (not res!994430) (not e!823488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465566 (= res!994430 (validKeyInArray!0 (select (arr!47695 a!2862) i!1006)))))

(declare-fun b!1465567 () Bool)

(declare-fun res!994426 () Bool)

(assert (=> b!1465567 (=> (not res!994426) (not e!823488))))

(assert (=> b!1465567 (= res!994426 (validKeyInArray!0 (select (arr!47695 a!2862) j!93)))))

(declare-fun b!1465568 () Bool)

(assert (=> b!1465568 (= e!823490 true)))

(declare-fun lt!641442 () Bool)

(assert (=> b!1465568 (= lt!641442 e!823482)))

(declare-fun c!135077 () Bool)

(assert (=> b!1465568 (= c!135077 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465569 () Bool)

(declare-fun res!994434 () Bool)

(assert (=> b!1465569 (=> (not res!994434) (not e!823483))))

(assert (=> b!1465569 (= res!994434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465570 () Bool)

(declare-fun res!994421 () Bool)

(assert (=> b!1465570 (=> (not res!994421) (not e!823488))))

(declare-datatypes ((List!34196 0))(
  ( (Nil!34193) (Cons!34192 (h!35542 (_ BitVec 64)) (t!48890 List!34196)) )
))
(declare-fun arrayNoDuplicates!0 (array!98814 (_ BitVec 32) List!34196) Bool)

(assert (=> b!1465570 (= res!994421 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34193))))

(declare-fun b!1465571 () Bool)

(declare-fun res!994422 () Bool)

(assert (=> b!1465571 (=> (not res!994422) (not e!823489))))

(assert (=> b!1465571 (= res!994422 (= (seekEntryOrOpen!0 (select (arr!47695 a!2862) j!93) a!2862 mask!2687) (Found!11947 j!93)))))

(declare-fun b!1465572 () Bool)

(assert (=> b!1465572 (= e!823481 (= lt!641445 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641441 lt!641444 mask!2687)))))

(assert (= (and start!125366 res!994425) b!1465558))

(assert (= (and b!1465558 res!994418) b!1465566))

(assert (= (and b!1465566 res!994430) b!1465567))

(assert (= (and b!1465567 res!994426) b!1465560))

(assert (= (and b!1465560 res!994420) b!1465570))

(assert (= (and b!1465570 res!994421) b!1465563))

(assert (= (and b!1465563 res!994427) b!1465561))

(assert (= (and b!1465561 res!994431) b!1465554))

(assert (= (and b!1465554 res!994424) b!1465557))

(assert (= (and b!1465557 res!994429) b!1465565))

(assert (= (and b!1465565 res!994435) b!1465559))

(assert (= (and b!1465559 c!135078) b!1465572))

(assert (= (and b!1465559 (not c!135078)) b!1465552))

(assert (= (and b!1465559 res!994433) b!1465569))

(assert (= (and b!1465569 res!994434) b!1465555))

(assert (= (and b!1465555 res!994423) b!1465571))

(assert (= (and b!1465571 res!994422) b!1465562))

(assert (= (and b!1465555 (not res!994428)) b!1465564))

(assert (= (and b!1465564 (not res!994432)) b!1465556))

(assert (= (and b!1465556 (not res!994419)) b!1465568))

(assert (= (and b!1465568 c!135077) b!1465551))

(assert (= (and b!1465568 (not c!135077)) b!1465553))

(declare-fun m!1352631 () Bool)

(assert (=> b!1465564 m!1352631))

(declare-fun m!1352633 () Bool)

(assert (=> b!1465571 m!1352633))

(assert (=> b!1465571 m!1352633))

(declare-fun m!1352635 () Bool)

(assert (=> b!1465571 m!1352635))

(declare-fun m!1352637 () Bool)

(assert (=> b!1465572 m!1352637))

(declare-fun m!1352639 () Bool)

(assert (=> b!1465553 m!1352639))

(declare-fun m!1352641 () Bool)

(assert (=> b!1465553 m!1352641))

(assert (=> b!1465557 m!1352633))

(assert (=> b!1465557 m!1352633))

(declare-fun m!1352643 () Bool)

(assert (=> b!1465557 m!1352643))

(declare-fun m!1352645 () Bool)

(assert (=> b!1465555 m!1352645))

(declare-fun m!1352647 () Bool)

(assert (=> b!1465555 m!1352647))

(declare-fun m!1352649 () Bool)

(assert (=> b!1465555 m!1352649))

(declare-fun m!1352651 () Bool)

(assert (=> b!1465555 m!1352651))

(declare-fun m!1352653 () Bool)

(assert (=> b!1465555 m!1352653))

(assert (=> b!1465555 m!1352633))

(declare-fun m!1352655 () Bool)

(assert (=> b!1465562 m!1352655))

(assert (=> b!1465562 m!1352633))

(declare-fun m!1352657 () Bool)

(assert (=> b!1465570 m!1352657))

(declare-fun m!1352659 () Bool)

(assert (=> b!1465566 m!1352659))

(assert (=> b!1465566 m!1352659))

(declare-fun m!1352661 () Bool)

(assert (=> b!1465566 m!1352661))

(assert (=> b!1465561 m!1352647))

(declare-fun m!1352663 () Bool)

(assert (=> b!1465561 m!1352663))

(declare-fun m!1352665 () Bool)

(assert (=> start!125366 m!1352665))

(declare-fun m!1352667 () Bool)

(assert (=> start!125366 m!1352667))

(declare-fun m!1352669 () Bool)

(assert (=> b!1465565 m!1352669))

(assert (=> b!1465565 m!1352669))

(declare-fun m!1352671 () Bool)

(assert (=> b!1465565 m!1352671))

(assert (=> b!1465565 m!1352647))

(declare-fun m!1352673 () Bool)

(assert (=> b!1465565 m!1352673))

(assert (=> b!1465554 m!1352633))

(assert (=> b!1465554 m!1352633))

(declare-fun m!1352675 () Bool)

(assert (=> b!1465554 m!1352675))

(assert (=> b!1465554 m!1352675))

(assert (=> b!1465554 m!1352633))

(declare-fun m!1352677 () Bool)

(assert (=> b!1465554 m!1352677))

(assert (=> b!1465556 m!1352633))

(assert (=> b!1465556 m!1352633))

(declare-fun m!1352679 () Bool)

(assert (=> b!1465556 m!1352679))

(assert (=> b!1465567 m!1352633))

(assert (=> b!1465567 m!1352633))

(declare-fun m!1352681 () Bool)

(assert (=> b!1465567 m!1352681))

(declare-fun m!1352683 () Bool)

(assert (=> b!1465560 m!1352683))

(declare-fun m!1352685 () Bool)

(assert (=> b!1465551 m!1352685))

(declare-fun m!1352687 () Bool)

(assert (=> b!1465552 m!1352687))

(assert (=> b!1465552 m!1352641))

(push 1)

(assert (not b!1465551))

(assert (not b!1465567))

(assert (not b!1465571))

(assert (not start!125366))

(assert (not b!1465556))

(assert (not b!1465560))

(assert (not b!1465566))

(assert (not b!1465565))

(assert (not b!1465552))

(assert (not b!1465557))

