; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125088 () Bool)

(assert start!125088)

(declare-fun b!1456548 () Bool)

(declare-fun e!819487 () Bool)

(assert (=> b!1456548 (= e!819487 true)))

(declare-fun lt!638357 () Bool)

(declare-fun e!819482 () Bool)

(assert (=> b!1456548 (= lt!638357 e!819482)))

(declare-fun c!134279 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456548 (= c!134279 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456549 () Bool)

(declare-fun e!819489 () Bool)

(declare-fun e!819486 () Bool)

(assert (=> b!1456549 (= e!819489 e!819486)))

(declare-fun res!987022 () Bool)

(assert (=> b!1456549 (=> (not res!987022) (not e!819486))))

(declare-datatypes ((SeekEntryResult!11808 0))(
  ( (MissingZero!11808 (index!49624 (_ BitVec 32))) (Found!11808 (index!49625 (_ BitVec 32))) (Intermediate!11808 (undefined!12620 Bool) (index!49626 (_ BitVec 32)) (x!131249 (_ BitVec 32))) (Undefined!11808) (MissingVacant!11808 (index!49627 (_ BitVec 32))) )
))
(declare-fun lt!638358 () SeekEntryResult!11808)

(declare-datatypes ((array!98536 0))(
  ( (array!98537 (arr!47556 (Array (_ BitVec 32) (_ BitVec 64))) (size!48106 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98536)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456549 (= res!987022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47556 a!2862) j!93) mask!2687) (select (arr!47556 a!2862) j!93) a!2862 mask!2687) lt!638358))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456549 (= lt!638358 (Intermediate!11808 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456550 () Bool)

(declare-fun res!987026 () Bool)

(declare-fun e!819488 () Bool)

(assert (=> b!1456550 (=> (not res!987026) (not e!819488))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11808)

(assert (=> b!1456550 (= res!987026 (= (seekEntryOrOpen!0 (select (arr!47556 a!2862) j!93) a!2862 mask!2687) (Found!11808 j!93)))))

(declare-fun b!1456551 () Bool)

(declare-fun res!987017 () Bool)

(declare-fun e!819484 () Bool)

(assert (=> b!1456551 (=> (not res!987017) (not e!819484))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456551 (= res!987017 (and (= (size!48106 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48106 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48106 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456552 () Bool)

(declare-fun e!819491 () Bool)

(assert (=> b!1456552 (= e!819491 e!819487)))

(declare-fun res!987013 () Bool)

(assert (=> b!1456552 (=> res!987013 e!819487)))

(declare-fun lt!638359 () (_ BitVec 32))

(assert (=> b!1456552 (= res!987013 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638359 #b00000000000000000000000000000000) (bvsge lt!638359 (size!48106 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456552 (= lt!638359 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638356 () (_ BitVec 64))

(declare-fun lt!638361 () SeekEntryResult!11808)

(declare-fun lt!638354 () array!98536)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11808)

(assert (=> b!1456552 (= lt!638361 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638356 lt!638354 mask!2687))))

(assert (=> b!1456552 (= lt!638361 (seekEntryOrOpen!0 lt!638356 lt!638354 mask!2687))))

(declare-fun b!1456553 () Bool)

(declare-fun res!987015 () Bool)

(assert (=> b!1456553 (=> res!987015 e!819487)))

(assert (=> b!1456553 (= res!987015 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638359 (select (arr!47556 a!2862) j!93) a!2862 mask!2687) lt!638358)))))

(declare-fun b!1456554 () Bool)

(declare-fun e!819483 () Bool)

(assert (=> b!1456554 (= e!819486 e!819483)))

(declare-fun res!987023 () Bool)

(assert (=> b!1456554 (=> (not res!987023) (not e!819483))))

(declare-fun lt!638360 () SeekEntryResult!11808)

(assert (=> b!1456554 (= res!987023 (= lt!638360 (Intermediate!11808 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456554 (= lt!638360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638356 mask!2687) lt!638356 lt!638354 mask!2687))))

(assert (=> b!1456554 (= lt!638356 (select (store (arr!47556 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!987028 () Bool)

(assert (=> start!125088 (=> (not res!987028) (not e!819484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125088 (= res!987028 (validMask!0 mask!2687))))

(assert (=> start!125088 e!819484))

(assert (=> start!125088 true))

(declare-fun array_inv!36584 (array!98536) Bool)

(assert (=> start!125088 (array_inv!36584 a!2862)))

(declare-fun b!1456555 () Bool)

(assert (=> b!1456555 (= e!819483 (not e!819491))))

(declare-fun res!987011 () Bool)

(assert (=> b!1456555 (=> res!987011 e!819491)))

(assert (=> b!1456555 (= res!987011 (or (and (= (select (arr!47556 a!2862) index!646) (select (store (arr!47556 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47556 a!2862) index!646) (select (arr!47556 a!2862) j!93))) (= (select (arr!47556 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456555 e!819488))

(declare-fun res!987021 () Bool)

(assert (=> b!1456555 (=> (not res!987021) (not e!819488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98536 (_ BitVec 32)) Bool)

(assert (=> b!1456555 (= res!987021 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49112 0))(
  ( (Unit!49113) )
))
(declare-fun lt!638355 () Unit!49112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49112)

(assert (=> b!1456555 (= lt!638355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456556 () Bool)

(declare-fun res!987019 () Bool)

(assert (=> b!1456556 (=> (not res!987019) (not e!819484))))

(assert (=> b!1456556 (= res!987019 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48106 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48106 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48106 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456557 () Bool)

(assert (=> b!1456557 (= e!819482 (not (= lt!638360 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638359 lt!638356 lt!638354 mask!2687))))))

(declare-fun b!1456558 () Bool)

(assert (=> b!1456558 (= e!819484 e!819489)))

(declare-fun res!987016 () Bool)

(assert (=> b!1456558 (=> (not res!987016) (not e!819489))))

(assert (=> b!1456558 (= res!987016 (= (select (store (arr!47556 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456558 (= lt!638354 (array!98537 (store (arr!47556 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48106 a!2862)))))

(declare-fun b!1456559 () Bool)

(assert (=> b!1456559 (= e!819488 (and (or (= (select (arr!47556 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47556 a!2862) intermediateBeforeIndex!19) (select (arr!47556 a!2862) j!93))) (let ((bdg!53254 (select (store (arr!47556 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47556 a!2862) index!646) bdg!53254) (= (select (arr!47556 a!2862) index!646) (select (arr!47556 a!2862) j!93))) (= (select (arr!47556 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53254 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!819490 () Bool)

(declare-fun b!1456560 () Bool)

(assert (=> b!1456560 (= e!819490 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638356 lt!638354 mask!2687) (seekEntryOrOpen!0 lt!638356 lt!638354 mask!2687)))))

(declare-fun b!1456561 () Bool)

(declare-fun res!987027 () Bool)

(assert (=> b!1456561 (=> (not res!987027) (not e!819484))))

(assert (=> b!1456561 (= res!987027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456562 () Bool)

(declare-fun res!987018 () Bool)

(assert (=> b!1456562 (=> (not res!987018) (not e!819486))))

(assert (=> b!1456562 (= res!987018 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47556 a!2862) j!93) a!2862 mask!2687) lt!638358))))

(declare-fun b!1456563 () Bool)

(assert (=> b!1456563 (= e!819482 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638359 intermediateAfterIndex!19 lt!638356 lt!638354 mask!2687) lt!638361)))))

(declare-fun b!1456564 () Bool)

(declare-fun res!987020 () Bool)

(assert (=> b!1456564 (=> (not res!987020) (not e!819484))))

(declare-datatypes ((List!34057 0))(
  ( (Nil!34054) (Cons!34053 (h!35403 (_ BitVec 64)) (t!48751 List!34057)) )
))
(declare-fun arrayNoDuplicates!0 (array!98536 (_ BitVec 32) List!34057) Bool)

(assert (=> b!1456564 (= res!987020 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34054))))

(declare-fun b!1456565 () Bool)

(declare-fun res!987024 () Bool)

(assert (=> b!1456565 (=> (not res!987024) (not e!819484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456565 (= res!987024 (validKeyInArray!0 (select (arr!47556 a!2862) j!93)))))

(declare-fun b!1456566 () Bool)

(declare-fun res!987012 () Bool)

(assert (=> b!1456566 (=> (not res!987012) (not e!819483))))

(assert (=> b!1456566 (= res!987012 e!819490)))

(declare-fun c!134280 () Bool)

(assert (=> b!1456566 (= c!134280 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456567 () Bool)

(declare-fun res!987014 () Bool)

(assert (=> b!1456567 (=> (not res!987014) (not e!819484))))

(assert (=> b!1456567 (= res!987014 (validKeyInArray!0 (select (arr!47556 a!2862) i!1006)))))

(declare-fun b!1456568 () Bool)

(declare-fun res!987025 () Bool)

(assert (=> b!1456568 (=> (not res!987025) (not e!819483))))

(assert (=> b!1456568 (= res!987025 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456569 () Bool)

(assert (=> b!1456569 (= e!819490 (= lt!638360 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638356 lt!638354 mask!2687)))))

(assert (= (and start!125088 res!987028) b!1456551))

(assert (= (and b!1456551 res!987017) b!1456567))

(assert (= (and b!1456567 res!987014) b!1456565))

(assert (= (and b!1456565 res!987024) b!1456561))

(assert (= (and b!1456561 res!987027) b!1456564))

(assert (= (and b!1456564 res!987020) b!1456556))

(assert (= (and b!1456556 res!987019) b!1456558))

(assert (= (and b!1456558 res!987016) b!1456549))

(assert (= (and b!1456549 res!987022) b!1456562))

(assert (= (and b!1456562 res!987018) b!1456554))

(assert (= (and b!1456554 res!987023) b!1456566))

(assert (= (and b!1456566 c!134280) b!1456569))

(assert (= (and b!1456566 (not c!134280)) b!1456560))

(assert (= (and b!1456566 res!987012) b!1456568))

(assert (= (and b!1456568 res!987025) b!1456555))

(assert (= (and b!1456555 res!987021) b!1456550))

(assert (= (and b!1456550 res!987026) b!1456559))

(assert (= (and b!1456555 (not res!987011)) b!1456552))

(assert (= (and b!1456552 (not res!987013)) b!1456553))

(assert (= (and b!1456553 (not res!987015)) b!1456548))

(assert (= (and b!1456548 c!134279) b!1456557))

(assert (= (and b!1456548 (not c!134279)) b!1456563))

(declare-fun m!1344635 () Bool)

(assert (=> b!1456562 m!1344635))

(assert (=> b!1456562 m!1344635))

(declare-fun m!1344637 () Bool)

(assert (=> b!1456562 m!1344637))

(assert (=> b!1456553 m!1344635))

(assert (=> b!1456553 m!1344635))

(declare-fun m!1344639 () Bool)

(assert (=> b!1456553 m!1344639))

(declare-fun m!1344641 () Bool)

(assert (=> start!125088 m!1344641))

(declare-fun m!1344643 () Bool)

(assert (=> start!125088 m!1344643))

(declare-fun m!1344645 () Bool)

(assert (=> b!1456569 m!1344645))

(assert (=> b!1456549 m!1344635))

(assert (=> b!1456549 m!1344635))

(declare-fun m!1344647 () Bool)

(assert (=> b!1456549 m!1344647))

(assert (=> b!1456549 m!1344647))

(assert (=> b!1456549 m!1344635))

(declare-fun m!1344649 () Bool)

(assert (=> b!1456549 m!1344649))

(declare-fun m!1344651 () Bool)

(assert (=> b!1456563 m!1344651))

(declare-fun m!1344653 () Bool)

(assert (=> b!1456561 m!1344653))

(declare-fun m!1344655 () Bool)

(assert (=> b!1456564 m!1344655))

(declare-fun m!1344657 () Bool)

(assert (=> b!1456559 m!1344657))

(declare-fun m!1344659 () Bool)

(assert (=> b!1456559 m!1344659))

(declare-fun m!1344661 () Bool)

(assert (=> b!1456559 m!1344661))

(declare-fun m!1344663 () Bool)

(assert (=> b!1456559 m!1344663))

(assert (=> b!1456559 m!1344635))

(assert (=> b!1456558 m!1344657))

(declare-fun m!1344665 () Bool)

(assert (=> b!1456558 m!1344665))

(assert (=> b!1456550 m!1344635))

(assert (=> b!1456550 m!1344635))

(declare-fun m!1344667 () Bool)

(assert (=> b!1456550 m!1344667))

(assert (=> b!1456565 m!1344635))

(assert (=> b!1456565 m!1344635))

(declare-fun m!1344669 () Bool)

(assert (=> b!1456565 m!1344669))

(declare-fun m!1344671 () Bool)

(assert (=> b!1456557 m!1344671))

(declare-fun m!1344673 () Bool)

(assert (=> b!1456555 m!1344673))

(assert (=> b!1456555 m!1344657))

(assert (=> b!1456555 m!1344661))

(assert (=> b!1456555 m!1344663))

(declare-fun m!1344675 () Bool)

(assert (=> b!1456555 m!1344675))

(assert (=> b!1456555 m!1344635))

(declare-fun m!1344677 () Bool)

(assert (=> b!1456554 m!1344677))

(assert (=> b!1456554 m!1344677))

(declare-fun m!1344679 () Bool)

(assert (=> b!1456554 m!1344679))

(assert (=> b!1456554 m!1344657))

(declare-fun m!1344681 () Bool)

(assert (=> b!1456554 m!1344681))

(declare-fun m!1344683 () Bool)

(assert (=> b!1456560 m!1344683))

(declare-fun m!1344685 () Bool)

(assert (=> b!1456560 m!1344685))

(declare-fun m!1344687 () Bool)

(assert (=> b!1456552 m!1344687))

(assert (=> b!1456552 m!1344683))

(assert (=> b!1456552 m!1344685))

(declare-fun m!1344689 () Bool)

(assert (=> b!1456567 m!1344689))

(assert (=> b!1456567 m!1344689))

(declare-fun m!1344691 () Bool)

(assert (=> b!1456567 m!1344691))

(check-sat (not b!1456564) (not b!1456555) (not b!1456562) (not b!1456565) (not b!1456552) (not b!1456560) (not b!1456554) (not b!1456549) (not b!1456561) (not b!1456557) (not b!1456550) (not b!1456567) (not b!1456563) (not start!125088) (not b!1456569) (not b!1456553))
(check-sat)
