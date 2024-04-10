; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130130 () Bool)

(assert start!130130)

(declare-fun lt!661500 () (_ BitVec 64))

(declare-datatypes ((array!101543 0))(
  ( (array!101544 (arr!48998 (Array (_ BitVec 32) (_ BitVec 64))) (size!49548 (_ BitVec 32))) )
))
(declare-fun lt!661498 () array!101543)

(declare-fun b!1527614 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!851423 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13163 0))(
  ( (MissingZero!13163 (index!55047 (_ BitVec 32))) (Found!13163 (index!55048 (_ BitVec 32))) (Intermediate!13163 (undefined!13975 Bool) (index!55049 (_ BitVec 32)) (x!136737 (_ BitVec 32))) (Undefined!13163) (MissingVacant!13163 (index!55050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101543 (_ BitVec 32)) SeekEntryResult!13163)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101543 (_ BitVec 32)) SeekEntryResult!13163)

(assert (=> b!1527614 (= e!851423 (= (seekEntryOrOpen!0 lt!661500 lt!661498 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661500 lt!661498 mask!2512)))))

(declare-fun b!1527615 () Bool)

(declare-fun e!851425 () Bool)

(declare-fun lt!661503 () SeekEntryResult!13163)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527615 (= e!851425 (= lt!661503 (Found!13163 j!70)))))

(assert (=> b!1527615 e!851423))

(declare-fun res!1045659 () Bool)

(assert (=> b!1527615 (=> (not res!1045659) (not e!851423))))

(declare-fun lt!661499 () SeekEntryResult!13163)

(assert (=> b!1527615 (= res!1045659 (= lt!661499 lt!661503))))

(declare-fun a!2804 () array!101543)

(assert (=> b!1527615 (= lt!661503 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1527615 (= lt!661499 (seekEntryOrOpen!0 (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527616 () Bool)

(declare-fun res!1045653 () Bool)

(declare-fun e!851420 () Bool)

(assert (=> b!1527616 (=> (not res!1045653) (not e!851420))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527616 (= res!1045653 (validKeyInArray!0 (select (arr!48998 a!2804) i!961)))))

(declare-fun b!1527617 () Bool)

(declare-fun res!1045657 () Bool)

(assert (=> b!1527617 (=> (not res!1045657) (not e!851420))))

(assert (=> b!1527617 (= res!1045657 (validKeyInArray!0 (select (arr!48998 a!2804) j!70)))))

(declare-fun b!1527618 () Bool)

(declare-fun e!851422 () Bool)

(assert (=> b!1527618 (= e!851420 e!851422)))

(declare-fun res!1045658 () Bool)

(assert (=> b!1527618 (=> (not res!1045658) (not e!851422))))

(declare-fun lt!661501 () SeekEntryResult!13163)

(declare-fun lt!661504 () SeekEntryResult!13163)

(assert (=> b!1527618 (= res!1045658 (= lt!661501 lt!661504))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527618 (= lt!661504 (Intermediate!13163 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101543 (_ BitVec 32)) SeekEntryResult!13163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527618 (= lt!661501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527619 () Bool)

(declare-fun res!1045648 () Bool)

(assert (=> b!1527619 (=> (not res!1045648) (not e!851420))))

(assert (=> b!1527619 (= res!1045648 (and (= (size!49548 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49548 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49548 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527620 () Bool)

(declare-fun res!1045649 () Bool)

(assert (=> b!1527620 (=> (not res!1045649) (not e!851420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101543 (_ BitVec 32)) Bool)

(assert (=> b!1527620 (= res!1045649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527621 () Bool)

(declare-fun res!1045652 () Bool)

(assert (=> b!1527621 (=> (not res!1045652) (not e!851422))))

(assert (=> b!1527621 (= res!1045652 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661504))))

(declare-fun b!1527622 () Bool)

(declare-fun e!851421 () Bool)

(assert (=> b!1527622 (= e!851421 (not e!851425))))

(declare-fun res!1045660 () Bool)

(assert (=> b!1527622 (=> res!1045660 e!851425)))

(assert (=> b!1527622 (= res!1045660 (or (not (= (select (arr!48998 a!2804) j!70) lt!661500)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48998 a!2804) index!487) (select (arr!48998 a!2804) j!70)) (not (= (select (arr!48998 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851419 () Bool)

(assert (=> b!1527622 e!851419))

(declare-fun res!1045655 () Bool)

(assert (=> b!1527622 (=> (not res!1045655) (not e!851419))))

(assert (=> b!1527622 (= res!1045655 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51110 0))(
  ( (Unit!51111) )
))
(declare-fun lt!661502 () Unit!51110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51110)

(assert (=> b!1527622 (= lt!661502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1045651 () Bool)

(assert (=> start!130130 (=> (not res!1045651) (not e!851420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130130 (= res!1045651 (validMask!0 mask!2512))))

(assert (=> start!130130 e!851420))

(assert (=> start!130130 true))

(declare-fun array_inv!38026 (array!101543) Bool)

(assert (=> start!130130 (array_inv!38026 a!2804)))

(declare-fun b!1527623 () Bool)

(declare-fun res!1045656 () Bool)

(assert (=> b!1527623 (=> (not res!1045656) (not e!851420))))

(declare-datatypes ((List!35481 0))(
  ( (Nil!35478) (Cons!35477 (h!36910 (_ BitVec 64)) (t!50175 List!35481)) )
))
(declare-fun arrayNoDuplicates!0 (array!101543 (_ BitVec 32) List!35481) Bool)

(assert (=> b!1527623 (= res!1045656 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35478))))

(declare-fun b!1527624 () Bool)

(assert (=> b!1527624 (= e!851422 e!851421)))

(declare-fun res!1045650 () Bool)

(assert (=> b!1527624 (=> (not res!1045650) (not e!851421))))

(assert (=> b!1527624 (= res!1045650 (= lt!661501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661500 mask!2512) lt!661500 lt!661498 mask!2512)))))

(assert (=> b!1527624 (= lt!661500 (select (store (arr!48998 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527624 (= lt!661498 (array!101544 (store (arr!48998 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49548 a!2804)))))

(declare-fun b!1527625 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101543 (_ BitVec 32)) SeekEntryResult!13163)

(assert (=> b!1527625 (= e!851419 (= (seekEntry!0 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) (Found!13163 j!70)))))

(declare-fun b!1527626 () Bool)

(declare-fun res!1045654 () Bool)

(assert (=> b!1527626 (=> (not res!1045654) (not e!851420))))

(assert (=> b!1527626 (= res!1045654 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49548 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49548 a!2804))))))

(assert (= (and start!130130 res!1045651) b!1527619))

(assert (= (and b!1527619 res!1045648) b!1527616))

(assert (= (and b!1527616 res!1045653) b!1527617))

(assert (= (and b!1527617 res!1045657) b!1527620))

(assert (= (and b!1527620 res!1045649) b!1527623))

(assert (= (and b!1527623 res!1045656) b!1527626))

(assert (= (and b!1527626 res!1045654) b!1527618))

(assert (= (and b!1527618 res!1045658) b!1527621))

(assert (= (and b!1527621 res!1045652) b!1527624))

(assert (= (and b!1527624 res!1045650) b!1527622))

(assert (= (and b!1527622 res!1045655) b!1527625))

(assert (= (and b!1527622 (not res!1045660)) b!1527615))

(assert (= (and b!1527615 res!1045659) b!1527614))

(declare-fun m!1410531 () Bool)

(assert (=> b!1527618 m!1410531))

(assert (=> b!1527618 m!1410531))

(declare-fun m!1410533 () Bool)

(assert (=> b!1527618 m!1410533))

(assert (=> b!1527618 m!1410533))

(assert (=> b!1527618 m!1410531))

(declare-fun m!1410535 () Bool)

(assert (=> b!1527618 m!1410535))

(assert (=> b!1527621 m!1410531))

(assert (=> b!1527621 m!1410531))

(declare-fun m!1410537 () Bool)

(assert (=> b!1527621 m!1410537))

(assert (=> b!1527622 m!1410531))

(declare-fun m!1410539 () Bool)

(assert (=> b!1527622 m!1410539))

(declare-fun m!1410541 () Bool)

(assert (=> b!1527622 m!1410541))

(declare-fun m!1410543 () Bool)

(assert (=> b!1527622 m!1410543))

(declare-fun m!1410545 () Bool)

(assert (=> b!1527620 m!1410545))

(declare-fun m!1410547 () Bool)

(assert (=> b!1527624 m!1410547))

(assert (=> b!1527624 m!1410547))

(declare-fun m!1410549 () Bool)

(assert (=> b!1527624 m!1410549))

(declare-fun m!1410551 () Bool)

(assert (=> b!1527624 m!1410551))

(declare-fun m!1410553 () Bool)

(assert (=> b!1527624 m!1410553))

(declare-fun m!1410555 () Bool)

(assert (=> start!130130 m!1410555))

(declare-fun m!1410557 () Bool)

(assert (=> start!130130 m!1410557))

(declare-fun m!1410559 () Bool)

(assert (=> b!1527623 m!1410559))

(declare-fun m!1410561 () Bool)

(assert (=> b!1527616 m!1410561))

(assert (=> b!1527616 m!1410561))

(declare-fun m!1410563 () Bool)

(assert (=> b!1527616 m!1410563))

(assert (=> b!1527625 m!1410531))

(assert (=> b!1527625 m!1410531))

(declare-fun m!1410565 () Bool)

(assert (=> b!1527625 m!1410565))

(declare-fun m!1410567 () Bool)

(assert (=> b!1527614 m!1410567))

(declare-fun m!1410569 () Bool)

(assert (=> b!1527614 m!1410569))

(assert (=> b!1527617 m!1410531))

(assert (=> b!1527617 m!1410531))

(declare-fun m!1410571 () Bool)

(assert (=> b!1527617 m!1410571))

(assert (=> b!1527615 m!1410531))

(assert (=> b!1527615 m!1410531))

(declare-fun m!1410573 () Bool)

(assert (=> b!1527615 m!1410573))

(assert (=> b!1527615 m!1410531))

(declare-fun m!1410575 () Bool)

(assert (=> b!1527615 m!1410575))

(push 1)

(assert (not b!1527621))

(assert (not b!1527620))

(assert (not b!1527618))

(assert (not b!1527615))

(assert (not b!1527623))

(assert (not b!1527616))

(assert (not b!1527624))

(assert (not b!1527617))

(assert (not b!1527614))

(assert (not b!1527625))

(assert (not start!130130))

(assert (not b!1527622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159595 () Bool)

(assert (=> d!159595 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130130 d!159595))

(declare-fun d!159599 () Bool)

(assert (=> d!159599 (= (array_inv!38026 a!2804) (bvsge (size!49548 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130130 d!159599))

(declare-fun b!1527725 () Bool)

(declare-fun e!851482 () Bool)

(declare-fun call!68472 () Bool)

(assert (=> b!1527725 (= e!851482 call!68472)))

(declare-fun d!159601 () Bool)

(declare-fun res!1045743 () Bool)

(declare-fun e!851481 () Bool)

(assert (=> d!159601 (=> res!1045743 e!851481)))

(assert (=> d!159601 (= res!1045743 (bvsge j!70 (size!49548 a!2804)))))

(assert (=> d!159601 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851481)))

(declare-fun b!1527726 () Bool)

(declare-fun e!851480 () Bool)

(assert (=> b!1527726 (= e!851481 e!851480)))

(declare-fun c!140543 () Bool)

(assert (=> b!1527726 (= c!140543 (validKeyInArray!0 (select (arr!48998 a!2804) j!70)))))

(declare-fun b!1527727 () Bool)

(assert (=> b!1527727 (= e!851480 e!851482)))

(declare-fun lt!661559 () (_ BitVec 64))

(assert (=> b!1527727 (= lt!661559 (select (arr!48998 a!2804) j!70))))

(declare-fun lt!661557 () Unit!51110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101543 (_ BitVec 64) (_ BitVec 32)) Unit!51110)

(assert (=> b!1527727 (= lt!661557 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661559 j!70))))

(declare-fun arrayContainsKey!0 (array!101543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1527727 (arrayContainsKey!0 a!2804 lt!661559 #b00000000000000000000000000000000)))

(declare-fun lt!661558 () Unit!51110)

(assert (=> b!1527727 (= lt!661558 lt!661557)))

(declare-fun res!1045744 () Bool)

(assert (=> b!1527727 (= res!1045744 (= (seekEntryOrOpen!0 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) (Found!13163 j!70)))))

(assert (=> b!1527727 (=> (not res!1045744) (not e!851482))))

(declare-fun bm!68469 () Bool)

(assert (=> bm!68469 (= call!68472 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527728 () Bool)

(assert (=> b!1527728 (= e!851480 call!68472)))

(assert (= (and d!159601 (not res!1045743)) b!1527726))

(assert (= (and b!1527726 c!140543) b!1527727))

(assert (= (and b!1527726 (not c!140543)) b!1527728))

(assert (= (and b!1527727 res!1045744) b!1527725))

(assert (= (or b!1527725 b!1527728) bm!68469))

(assert (=> b!1527726 m!1410531))

(assert (=> b!1527726 m!1410531))

(assert (=> b!1527726 m!1410571))

(assert (=> b!1527727 m!1410531))

(declare-fun m!1410669 () Bool)

(assert (=> b!1527727 m!1410669))

(declare-fun m!1410671 () Bool)

(assert (=> b!1527727 m!1410671))

(assert (=> b!1527727 m!1410531))

(assert (=> b!1527727 m!1410575))

(declare-fun m!1410673 () Bool)

(assert (=> bm!68469 m!1410673))

(assert (=> b!1527622 d!159601))

(declare-fun d!159603 () Bool)

(assert (=> d!159603 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661564 () Unit!51110)

(declare-fun choose!38 (array!101543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51110)

(assert (=> d!159603 (= lt!661564 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159603 (validMask!0 mask!2512)))

(assert (=> d!159603 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661564)))

(declare-fun bs!43819 () Bool)

(assert (= bs!43819 d!159603))

(assert (=> bs!43819 m!1410541))

(declare-fun m!1410683 () Bool)

(assert (=> bs!43819 m!1410683))

(assert (=> bs!43819 m!1410555))

(assert (=> b!1527622 d!159603))

(declare-fun b!1527745 () Bool)

(declare-fun e!851495 () Bool)

(declare-fun contains!9994 (List!35481 (_ BitVec 64)) Bool)

(assert (=> b!1527745 (= e!851495 (contains!9994 Nil!35478 (select (arr!48998 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527746 () Bool)

(declare-fun e!851496 () Bool)

(declare-fun e!851497 () Bool)

(assert (=> b!1527746 (= e!851496 e!851497)))

(declare-fun c!140549 () Bool)

(assert (=> b!1527746 (= c!140549 (validKeyInArray!0 (select (arr!48998 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527747 () Bool)

(declare-fun call!68475 () Bool)

(assert (=> b!1527747 (= e!851497 call!68475)))

(declare-fun b!1527748 () Bool)

(declare-fun e!851494 () Bool)

(assert (=> b!1527748 (= e!851494 e!851496)))

(declare-fun res!1045752 () Bool)

(assert (=> b!1527748 (=> (not res!1045752) (not e!851496))))

(assert (=> b!1527748 (= res!1045752 (not e!851495))))

(declare-fun res!1045751 () Bool)

(assert (=> b!1527748 (=> (not res!1045751) (not e!851495))))

(assert (=> b!1527748 (= res!1045751 (validKeyInArray!0 (select (arr!48998 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68472 () Bool)

(assert (=> bm!68472 (= call!68475 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140549 (Cons!35477 (select (arr!48998 a!2804) #b00000000000000000000000000000000) Nil!35478) Nil!35478)))))

(declare-fun d!159607 () Bool)

(declare-fun res!1045753 () Bool)

(assert (=> d!159607 (=> res!1045753 e!851494)))

(assert (=> d!159607 (= res!1045753 (bvsge #b00000000000000000000000000000000 (size!49548 a!2804)))))

(assert (=> d!159607 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35478) e!851494)))

(declare-fun b!1527749 () Bool)

(assert (=> b!1527749 (= e!851497 call!68475)))

(assert (= (and d!159607 (not res!1045753)) b!1527748))

(assert (= (and b!1527748 res!1045751) b!1527745))

(assert (= (and b!1527748 res!1045752) b!1527746))

(assert (= (and b!1527746 c!140549) b!1527747))

(assert (= (and b!1527746 (not c!140549)) b!1527749))

(assert (= (or b!1527747 b!1527749) bm!68472))

(declare-fun m!1410685 () Bool)

(assert (=> b!1527745 m!1410685))

(assert (=> b!1527745 m!1410685))

(declare-fun m!1410687 () Bool)

(assert (=> b!1527745 m!1410687))

(assert (=> b!1527746 m!1410685))

(assert (=> b!1527746 m!1410685))

(declare-fun m!1410689 () Bool)

(assert (=> b!1527746 m!1410689))

(assert (=> b!1527748 m!1410685))

(assert (=> b!1527748 m!1410685))

(assert (=> b!1527748 m!1410689))

(assert (=> bm!68472 m!1410685))

(declare-fun m!1410691 () Bool)

(assert (=> bm!68472 m!1410691))

(assert (=> b!1527623 d!159607))

(declare-fun b!1527750 () Bool)

(declare-fun e!851500 () Bool)

(declare-fun call!68476 () Bool)

(assert (=> b!1527750 (= e!851500 call!68476)))

(declare-fun d!159609 () Bool)

(declare-fun res!1045754 () Bool)

(declare-fun e!851499 () Bool)

(assert (=> d!159609 (=> res!1045754 e!851499)))

(assert (=> d!159609 (= res!1045754 (bvsge #b00000000000000000000000000000000 (size!49548 a!2804)))))

(assert (=> d!159609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851499)))

(declare-fun b!1527751 () Bool)

(declare-fun e!851498 () Bool)

(assert (=> b!1527751 (= e!851499 e!851498)))

(declare-fun c!140550 () Bool)

(assert (=> b!1527751 (= c!140550 (validKeyInArray!0 (select (arr!48998 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527752 () Bool)

(assert (=> b!1527752 (= e!851498 e!851500)))

(declare-fun lt!661567 () (_ BitVec 64))

(assert (=> b!1527752 (= lt!661567 (select (arr!48998 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661565 () Unit!51110)

(assert (=> b!1527752 (= lt!661565 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661567 #b00000000000000000000000000000000))))

(assert (=> b!1527752 (arrayContainsKey!0 a!2804 lt!661567 #b00000000000000000000000000000000)))

(declare-fun lt!661566 () Unit!51110)

(assert (=> b!1527752 (= lt!661566 lt!661565)))

(declare-fun res!1045755 () Bool)

(assert (=> b!1527752 (= res!1045755 (= (seekEntryOrOpen!0 (select (arr!48998 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13163 #b00000000000000000000000000000000)))))

(assert (=> b!1527752 (=> (not res!1045755) (not e!851500))))

(declare-fun bm!68473 () Bool)

(assert (=> bm!68473 (= call!68476 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527753 () Bool)

(assert (=> b!1527753 (= e!851498 call!68476)))

(assert (= (and d!159609 (not res!1045754)) b!1527751))

(assert (= (and b!1527751 c!140550) b!1527752))

(assert (= (and b!1527751 (not c!140550)) b!1527753))

(assert (= (and b!1527752 res!1045755) b!1527750))

(assert (= (or b!1527750 b!1527753) bm!68473))

(assert (=> b!1527751 m!1410685))

(assert (=> b!1527751 m!1410685))

(assert (=> b!1527751 m!1410689))

(assert (=> b!1527752 m!1410685))

(declare-fun m!1410693 () Bool)

(assert (=> b!1527752 m!1410693))

(declare-fun m!1410695 () Bool)

(assert (=> b!1527752 m!1410695))

(assert (=> b!1527752 m!1410685))

(declare-fun m!1410697 () Bool)

(assert (=> b!1527752 m!1410697))

(declare-fun m!1410699 () Bool)

(assert (=> bm!68473 m!1410699))

(assert (=> b!1527620 d!159609))

(declare-fun b!1527791 () Bool)

(declare-fun e!851520 () SeekEntryResult!13163)

(declare-fun e!851523 () SeekEntryResult!13163)

(assert (=> b!1527791 (= e!851520 e!851523)))

(declare-fun c!140566 () Bool)

(declare-fun lt!661582 () (_ BitVec 64))

(assert (=> b!1527791 (= c!140566 (or (= lt!661582 (select (arr!48998 a!2804) j!70)) (= (bvadd lt!661582 lt!661582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527792 () Bool)

(declare-fun e!851524 () Bool)

(declare-fun e!851521 () Bool)

(assert (=> b!1527792 (= e!851524 e!851521)))

(declare-fun res!1045762 () Bool)

(declare-fun lt!661581 () SeekEntryResult!13163)

(assert (=> b!1527792 (= res!1045762 (and (is-Intermediate!13163 lt!661581) (not (undefined!13975 lt!661581)) (bvslt (x!136737 lt!661581) #b01111111111111111111111111111110) (bvsge (x!136737 lt!661581) #b00000000000000000000000000000000) (bvsge (x!136737 lt!661581) x!534)))))

(assert (=> b!1527792 (=> (not res!1045762) (not e!851521))))

(declare-fun b!1527793 () Bool)

(assert (=> b!1527793 (= e!851520 (Intermediate!13163 true index!487 x!534))))

(declare-fun b!1527794 () Bool)

(assert (=> b!1527794 (and (bvsge (index!55049 lt!661581) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661581) (size!49548 a!2804)))))

(declare-fun res!1045763 () Bool)

(assert (=> b!1527794 (= res!1045763 (= (select (arr!48998 a!2804) (index!55049 lt!661581)) (select (arr!48998 a!2804) j!70)))))

(declare-fun e!851522 () Bool)

(assert (=> b!1527794 (=> res!1045763 e!851522)))

(assert (=> b!1527794 (= e!851521 e!851522)))

(declare-fun b!1527795 () Bool)

(assert (=> b!1527795 (and (bvsge (index!55049 lt!661581) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661581) (size!49548 a!2804)))))

(assert (=> b!1527795 (= e!851522 (= (select (arr!48998 a!2804) (index!55049 lt!661581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527796 () Bool)

(assert (=> b!1527796 (= e!851523 (Intermediate!13163 false index!487 x!534))))

(declare-fun d!159611 () Bool)

(assert (=> d!159611 e!851524))

(declare-fun c!140568 () Bool)

(assert (=> d!159611 (= c!140568 (and (is-Intermediate!13163 lt!661581) (undefined!13975 lt!661581)))))

(assert (=> d!159611 (= lt!661581 e!851520)))

(declare-fun c!140567 () Bool)

(assert (=> d!159611 (= c!140567 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159611 (= lt!661582 (select (arr!48998 a!2804) index!487))))

(assert (=> d!159611 (validMask!0 mask!2512)))

(assert (=> d!159611 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661581)))

(declare-fun b!1527790 () Bool)

(assert (=> b!1527790 (and (bvsge (index!55049 lt!661581) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661581) (size!49548 a!2804)))))

(declare-fun res!1045764 () Bool)

(assert (=> b!1527790 (= res!1045764 (= (select (arr!48998 a!2804) (index!55049 lt!661581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527790 (=> res!1045764 e!851522)))

(declare-fun b!1527797 () Bool)

(assert (=> b!1527797 (= e!851524 (bvsge (x!136737 lt!661581) #b01111111111111111111111111111110))))

(declare-fun b!1527798 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527798 (= e!851523 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159611 c!140567) b!1527793))

(assert (= (and d!159611 (not c!140567)) b!1527791))

(assert (= (and b!1527791 c!140566) b!1527796))

(assert (= (and b!1527791 (not c!140566)) b!1527798))

(assert (= (and d!159611 c!140568) b!1527797))

(assert (= (and d!159611 (not c!140568)) b!1527792))

(assert (= (and b!1527792 res!1045762) b!1527794))

(assert (= (and b!1527794 (not res!1045763)) b!1527790))

(assert (= (and b!1527790 (not res!1045764)) b!1527795))

(declare-fun m!1410711 () Bool)

(assert (=> b!1527794 m!1410711))

(assert (=> b!1527795 m!1410711))

(assert (=> d!159611 m!1410539))

(assert (=> d!159611 m!1410555))

(assert (=> b!1527790 m!1410711))

(declare-fun m!1410713 () Bool)

(assert (=> b!1527798 m!1410713))

(assert (=> b!1527798 m!1410713))

(assert (=> b!1527798 m!1410531))

(declare-fun m!1410715 () Bool)

(assert (=> b!1527798 m!1410715))

(assert (=> b!1527621 d!159611))

(declare-fun d!159615 () Bool)

(assert (=> d!159615 (= (validKeyInArray!0 (select (arr!48998 a!2804) i!961)) (and (not (= (select (arr!48998 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48998 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527616 d!159615))

(declare-fun d!159617 () Bool)

(assert (=> d!159617 (= (validKeyInArray!0 (select (arr!48998 a!2804) j!70)) (and (not (= (select (arr!48998 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48998 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527617 d!159617))

(declare-fun b!1527800 () Bool)

(declare-fun e!851525 () SeekEntryResult!13163)

(declare-fun e!851528 () SeekEntryResult!13163)

(assert (=> b!1527800 (= e!851525 e!851528)))

(declare-fun lt!661584 () (_ BitVec 64))

(declare-fun c!140569 () Bool)

(assert (=> b!1527800 (= c!140569 (or (= lt!661584 (select (arr!48998 a!2804) j!70)) (= (bvadd lt!661584 lt!661584) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527801 () Bool)

(declare-fun e!851529 () Bool)

(declare-fun e!851526 () Bool)

(assert (=> b!1527801 (= e!851529 e!851526)))

(declare-fun res!1045765 () Bool)

(declare-fun lt!661583 () SeekEntryResult!13163)

(assert (=> b!1527801 (= res!1045765 (and (is-Intermediate!13163 lt!661583) (not (undefined!13975 lt!661583)) (bvslt (x!136737 lt!661583) #b01111111111111111111111111111110) (bvsge (x!136737 lt!661583) #b00000000000000000000000000000000) (bvsge (x!136737 lt!661583) #b00000000000000000000000000000000)))))

(assert (=> b!1527801 (=> (not res!1045765) (not e!851526))))

(declare-fun b!1527802 () Bool)

(assert (=> b!1527802 (= e!851525 (Intermediate!13163 true (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527803 () Bool)

(assert (=> b!1527803 (and (bvsge (index!55049 lt!661583) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661583) (size!49548 a!2804)))))

(declare-fun res!1045766 () Bool)

(assert (=> b!1527803 (= res!1045766 (= (select (arr!48998 a!2804) (index!55049 lt!661583)) (select (arr!48998 a!2804) j!70)))))

(declare-fun e!851527 () Bool)

(assert (=> b!1527803 (=> res!1045766 e!851527)))

(assert (=> b!1527803 (= e!851526 e!851527)))

(declare-fun b!1527804 () Bool)

(assert (=> b!1527804 (and (bvsge (index!55049 lt!661583) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661583) (size!49548 a!2804)))))

(assert (=> b!1527804 (= e!851527 (= (select (arr!48998 a!2804) (index!55049 lt!661583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527805 () Bool)

(assert (=> b!1527805 (= e!851528 (Intermediate!13163 false (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159619 () Bool)

(assert (=> d!159619 e!851529))

(declare-fun c!140571 () Bool)

(assert (=> d!159619 (= c!140571 (and (is-Intermediate!13163 lt!661583) (undefined!13975 lt!661583)))))

(assert (=> d!159619 (= lt!661583 e!851525)))

(declare-fun c!140570 () Bool)

(assert (=> d!159619 (= c!140570 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159619 (= lt!661584 (select (arr!48998 a!2804) (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512)))))

(assert (=> d!159619 (validMask!0 mask!2512)))

(assert (=> d!159619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661583)))

(declare-fun b!1527799 () Bool)

(assert (=> b!1527799 (and (bvsge (index!55049 lt!661583) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661583) (size!49548 a!2804)))))

(declare-fun res!1045767 () Bool)

(assert (=> b!1527799 (= res!1045767 (= (select (arr!48998 a!2804) (index!55049 lt!661583)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527799 (=> res!1045767 e!851527)))

(declare-fun b!1527806 () Bool)

(assert (=> b!1527806 (= e!851529 (bvsge (x!136737 lt!661583) #b01111111111111111111111111111110))))

(declare-fun b!1527807 () Bool)

(assert (=> b!1527807 (= e!851528 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159619 c!140570) b!1527802))

(assert (= (and d!159619 (not c!140570)) b!1527800))

(assert (= (and b!1527800 c!140569) b!1527805))

(assert (= (and b!1527800 (not c!140569)) b!1527807))

(assert (= (and d!159619 c!140571) b!1527806))

(assert (= (and d!159619 (not c!140571)) b!1527801))

(assert (= (and b!1527801 res!1045765) b!1527803))

(assert (= (and b!1527803 (not res!1045766)) b!1527799))

(assert (= (and b!1527799 (not res!1045767)) b!1527804))

(declare-fun m!1410717 () Bool)

(assert (=> b!1527803 m!1410717))

(assert (=> b!1527804 m!1410717))

(assert (=> d!159619 m!1410533))

(declare-fun m!1410719 () Bool)

(assert (=> d!159619 m!1410719))

(assert (=> d!159619 m!1410555))

(assert (=> b!1527799 m!1410717))

(assert (=> b!1527807 m!1410533))

(declare-fun m!1410721 () Bool)

(assert (=> b!1527807 m!1410721))

(assert (=> b!1527807 m!1410721))

(assert (=> b!1527807 m!1410531))

(declare-fun m!1410723 () Bool)

(assert (=> b!1527807 m!1410723))

(assert (=> b!1527618 d!159619))

(declare-fun d!159621 () Bool)

(declare-fun lt!661594 () (_ BitVec 32))

(declare-fun lt!661593 () (_ BitVec 32))

(assert (=> d!159621 (= lt!661594 (bvmul (bvxor lt!661593 (bvlshr lt!661593 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159621 (= lt!661593 ((_ extract 31 0) (bvand (bvxor (select (arr!48998 a!2804) j!70) (bvlshr (select (arr!48998 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159621 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045768 (let ((h!36913 ((_ extract 31 0) (bvand (bvxor (select (arr!48998 a!2804) j!70) (bvlshr (select (arr!48998 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136742 (bvmul (bvxor h!36913 (bvlshr h!36913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136742 (bvlshr x!136742 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045768 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045768 #b00000000000000000000000000000000))))))

(assert (=> d!159621 (= (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) (bvand (bvxor lt!661594 (bvlshr lt!661594 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527618 d!159621))

(declare-fun b!1527827 () Bool)

(declare-fun e!851540 () SeekEntryResult!13163)

(declare-fun e!851543 () SeekEntryResult!13163)

(assert (=> b!1527827 (= e!851540 e!851543)))

(declare-fun c!140578 () Bool)

(declare-fun lt!661596 () (_ BitVec 64))

(assert (=> b!1527827 (= c!140578 (or (= lt!661596 lt!661500) (= (bvadd lt!661596 lt!661596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527828 () Bool)

(declare-fun e!851544 () Bool)

(declare-fun e!851541 () Bool)

(assert (=> b!1527828 (= e!851544 e!851541)))

(declare-fun res!1045775 () Bool)

(declare-fun lt!661595 () SeekEntryResult!13163)

(assert (=> b!1527828 (= res!1045775 (and (is-Intermediate!13163 lt!661595) (not (undefined!13975 lt!661595)) (bvslt (x!136737 lt!661595) #b01111111111111111111111111111110) (bvsge (x!136737 lt!661595) #b00000000000000000000000000000000) (bvsge (x!136737 lt!661595) #b00000000000000000000000000000000)))))

(assert (=> b!1527828 (=> (not res!1045775) (not e!851541))))

(declare-fun b!1527829 () Bool)

(assert (=> b!1527829 (= e!851540 (Intermediate!13163 true (toIndex!0 lt!661500 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527830 () Bool)

(assert (=> b!1527830 (and (bvsge (index!55049 lt!661595) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661595) (size!49548 lt!661498)))))

(declare-fun res!1045776 () Bool)

(assert (=> b!1527830 (= res!1045776 (= (select (arr!48998 lt!661498) (index!55049 lt!661595)) lt!661500))))

(declare-fun e!851542 () Bool)

(assert (=> b!1527830 (=> res!1045776 e!851542)))

(assert (=> b!1527830 (= e!851541 e!851542)))

(declare-fun b!1527831 () Bool)

(assert (=> b!1527831 (and (bvsge (index!55049 lt!661595) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661595) (size!49548 lt!661498)))))

(assert (=> b!1527831 (= e!851542 (= (select (arr!48998 lt!661498) (index!55049 lt!661595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527832 () Bool)

(assert (=> b!1527832 (= e!851543 (Intermediate!13163 false (toIndex!0 lt!661500 mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159625 () Bool)

(assert (=> d!159625 e!851544))

(declare-fun c!140580 () Bool)

(assert (=> d!159625 (= c!140580 (and (is-Intermediate!13163 lt!661595) (undefined!13975 lt!661595)))))

(assert (=> d!159625 (= lt!661595 e!851540)))

(declare-fun c!140579 () Bool)

(assert (=> d!159625 (= c!140579 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159625 (= lt!661596 (select (arr!48998 lt!661498) (toIndex!0 lt!661500 mask!2512)))))

(assert (=> d!159625 (validMask!0 mask!2512)))

(assert (=> d!159625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661500 mask!2512) lt!661500 lt!661498 mask!2512) lt!661595)))

(declare-fun b!1527826 () Bool)

(assert (=> b!1527826 (and (bvsge (index!55049 lt!661595) #b00000000000000000000000000000000) (bvslt (index!55049 lt!661595) (size!49548 lt!661498)))))

(declare-fun res!1045777 () Bool)

(assert (=> b!1527826 (= res!1045777 (= (select (arr!48998 lt!661498) (index!55049 lt!661595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527826 (=> res!1045777 e!851542)))

(declare-fun b!1527833 () Bool)

(assert (=> b!1527833 (= e!851544 (bvsge (x!136737 lt!661595) #b01111111111111111111111111111110))))

(declare-fun b!1527834 () Bool)

(assert (=> b!1527834 (= e!851543 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!661500 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!661500 lt!661498 mask!2512))))

(assert (= (and d!159625 c!140579) b!1527829))

(assert (= (and d!159625 (not c!140579)) b!1527827))

(assert (= (and b!1527827 c!140578) b!1527832))

(assert (= (and b!1527827 (not c!140578)) b!1527834))

(assert (= (and d!159625 c!140580) b!1527833))

(assert (= (and d!159625 (not c!140580)) b!1527828))

(assert (= (and b!1527828 res!1045775) b!1527830))

(assert (= (and b!1527830 (not res!1045776)) b!1527826))

(assert (= (and b!1527826 (not res!1045777)) b!1527831))

(declare-fun m!1410725 () Bool)

(assert (=> b!1527830 m!1410725))

(assert (=> b!1527831 m!1410725))

(assert (=> d!159625 m!1410547))

(declare-fun m!1410727 () Bool)

(assert (=> d!159625 m!1410727))

(assert (=> d!159625 m!1410555))

(assert (=> b!1527826 m!1410725))

(assert (=> b!1527834 m!1410547))

(declare-fun m!1410729 () Bool)

(assert (=> b!1527834 m!1410729))

(assert (=> b!1527834 m!1410729))

(declare-fun m!1410731 () Bool)

(assert (=> b!1527834 m!1410731))

(assert (=> b!1527624 d!159625))

(declare-fun d!159627 () Bool)

(declare-fun lt!661598 () (_ BitVec 32))

(declare-fun lt!661597 () (_ BitVec 32))

(assert (=> d!159627 (= lt!661598 (bvmul (bvxor lt!661597 (bvlshr lt!661597 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159627 (= lt!661597 ((_ extract 31 0) (bvand (bvxor lt!661500 (bvlshr lt!661500 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159627 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045768 (let ((h!36913 ((_ extract 31 0) (bvand (bvxor lt!661500 (bvlshr lt!661500 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136742 (bvmul (bvxor h!36913 (bvlshr h!36913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136742 (bvlshr x!136742 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045768 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045768 #b00000000000000000000000000000000))))))

(assert (=> d!159627 (= (toIndex!0 lt!661500 mask!2512) (bvand (bvxor lt!661598 (bvlshr lt!661598 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527624 d!159627))

(declare-fun b!1527885 () Bool)

(declare-fun e!851573 () SeekEntryResult!13163)

(declare-fun lt!661630 () SeekEntryResult!13163)

(assert (=> b!1527885 (= e!851573 (MissingZero!13163 (index!55049 lt!661630)))))

(declare-fun d!159629 () Bool)

(declare-fun lt!661629 () SeekEntryResult!13163)

(assert (=> d!159629 (and (or (is-MissingVacant!13163 lt!661629) (not (is-Found!13163 lt!661629)) (and (bvsge (index!55048 lt!661629) #b00000000000000000000000000000000) (bvslt (index!55048 lt!661629) (size!49548 a!2804)))) (not (is-MissingVacant!13163 lt!661629)) (or (not (is-Found!13163 lt!661629)) (= (select (arr!48998 a!2804) (index!55048 lt!661629)) (select (arr!48998 a!2804) j!70))))))

(declare-fun e!851574 () SeekEntryResult!13163)

(assert (=> d!159629 (= lt!661629 e!851574)))

(declare-fun c!140601 () Bool)

(assert (=> d!159629 (= c!140601 (and (is-Intermediate!13163 lt!661630) (undefined!13975 lt!661630)))))

(assert (=> d!159629 (= lt!661630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159629 (validMask!0 mask!2512)))

(assert (=> d!159629 (= (seekEntry!0 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661629)))

(declare-fun b!1527886 () Bool)

(assert (=> b!1527886 (= e!851574 Undefined!13163)))

(declare-fun b!1527887 () Bool)

(declare-fun e!851575 () SeekEntryResult!13163)

(assert (=> b!1527887 (= e!851574 e!851575)))

(declare-fun lt!661631 () (_ BitVec 64))

(assert (=> b!1527887 (= lt!661631 (select (arr!48998 a!2804) (index!55049 lt!661630)))))

(declare-fun c!140603 () Bool)

(assert (=> b!1527887 (= c!140603 (= lt!661631 (select (arr!48998 a!2804) j!70)))))

(declare-fun b!1527888 () Bool)

(declare-fun lt!661632 () SeekEntryResult!13163)

(assert (=> b!1527888 (= e!851573 (ite (is-MissingVacant!13163 lt!661632) (MissingZero!13163 (index!55050 lt!661632)) lt!661632))))

(assert (=> b!1527888 (= lt!661632 (seekKeyOrZeroReturnVacant!0 (x!136737 lt!661630) (index!55049 lt!661630) (index!55049 lt!661630) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527889 () Bool)

(assert (=> b!1527889 (= e!851575 (Found!13163 (index!55049 lt!661630)))))

(declare-fun b!1527890 () Bool)

(declare-fun c!140602 () Bool)

(assert (=> b!1527890 (= c!140602 (= lt!661631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527890 (= e!851575 e!851573)))

(assert (= (and d!159629 c!140601) b!1527886))

(assert (= (and d!159629 (not c!140601)) b!1527887))

(assert (= (and b!1527887 c!140603) b!1527889))

(assert (= (and b!1527887 (not c!140603)) b!1527890))

(assert (= (and b!1527890 c!140602) b!1527885))

(assert (= (and b!1527890 (not c!140602)) b!1527888))

(declare-fun m!1410745 () Bool)

(assert (=> d!159629 m!1410745))

(assert (=> d!159629 m!1410531))

(assert (=> d!159629 m!1410533))

(assert (=> d!159629 m!1410533))

(assert (=> d!159629 m!1410531))

(assert (=> d!159629 m!1410535))

(assert (=> d!159629 m!1410555))

(declare-fun m!1410747 () Bool)

(assert (=> b!1527887 m!1410747))

(assert (=> b!1527888 m!1410531))

(declare-fun m!1410749 () Bool)

(assert (=> b!1527888 m!1410749))

(assert (=> b!1527625 d!159629))

(declare-fun b!1527956 () Bool)

(declare-fun e!851611 () SeekEntryResult!13163)

(declare-fun lt!661666 () SeekEntryResult!13163)

(assert (=> b!1527956 (= e!851611 (MissingZero!13163 (index!55049 lt!661666)))))

(declare-fun b!1527957 () Bool)

(declare-fun c!140635 () Bool)

(declare-fun lt!661668 () (_ BitVec 64))

(assert (=> b!1527957 (= c!140635 (= lt!661668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851612 () SeekEntryResult!13163)

(assert (=> b!1527957 (= e!851612 e!851611)))

(declare-fun b!1527958 () Bool)

(assert (=> b!1527958 (= e!851612 (Found!13163 (index!55049 lt!661666)))))

(declare-fun b!1527959 () Bool)

(assert (=> b!1527959 (= e!851611 (seekKeyOrZeroReturnVacant!0 (x!136737 lt!661666) (index!55049 lt!661666) (index!55049 lt!661666) lt!661500 lt!661498 mask!2512))))

(declare-fun b!1527960 () Bool)

(declare-fun e!851613 () SeekEntryResult!13163)

(assert (=> b!1527960 (= e!851613 Undefined!13163)))

(declare-fun d!159637 () Bool)

(declare-fun lt!661667 () SeekEntryResult!13163)

(assert (=> d!159637 (and (or (is-Undefined!13163 lt!661667) (not (is-Found!13163 lt!661667)) (and (bvsge (index!55048 lt!661667) #b00000000000000000000000000000000) (bvslt (index!55048 lt!661667) (size!49548 lt!661498)))) (or (is-Undefined!13163 lt!661667) (is-Found!13163 lt!661667) (not (is-MissingZero!13163 lt!661667)) (and (bvsge (index!55047 lt!661667) #b00000000000000000000000000000000) (bvslt (index!55047 lt!661667) (size!49548 lt!661498)))) (or (is-Undefined!13163 lt!661667) (is-Found!13163 lt!661667) (is-MissingZero!13163 lt!661667) (not (is-MissingVacant!13163 lt!661667)) (and (bvsge (index!55050 lt!661667) #b00000000000000000000000000000000) (bvslt (index!55050 lt!661667) (size!49548 lt!661498)))) (or (is-Undefined!13163 lt!661667) (ite (is-Found!13163 lt!661667) (= (select (arr!48998 lt!661498) (index!55048 lt!661667)) lt!661500) (ite (is-MissingZero!13163 lt!661667) (= (select (arr!48998 lt!661498) (index!55047 lt!661667)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13163 lt!661667) (= (select (arr!48998 lt!661498) (index!55050 lt!661667)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159637 (= lt!661667 e!851613)))

(declare-fun c!140634 () Bool)

(assert (=> d!159637 (= c!140634 (and (is-Intermediate!13163 lt!661666) (undefined!13975 lt!661666)))))

(assert (=> d!159637 (= lt!661666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661500 mask!2512) lt!661500 lt!661498 mask!2512))))

(assert (=> d!159637 (validMask!0 mask!2512)))

(assert (=> d!159637 (= (seekEntryOrOpen!0 lt!661500 lt!661498 mask!2512) lt!661667)))

(declare-fun b!1527961 () Bool)

(assert (=> b!1527961 (= e!851613 e!851612)))

(assert (=> b!1527961 (= lt!661668 (select (arr!48998 lt!661498) (index!55049 lt!661666)))))

(declare-fun c!140633 () Bool)

(assert (=> b!1527961 (= c!140633 (= lt!661668 lt!661500))))

(assert (= (and d!159637 c!140634) b!1527960))

(assert (= (and d!159637 (not c!140634)) b!1527961))

(assert (= (and b!1527961 c!140633) b!1527958))

(assert (= (and b!1527961 (not c!140633)) b!1527957))

(assert (= (and b!1527957 c!140635) b!1527956))

(assert (= (and b!1527957 (not c!140635)) b!1527959))

(declare-fun m!1410817 () Bool)

(assert (=> b!1527959 m!1410817))

(assert (=> d!159637 m!1410555))

(declare-fun m!1410819 () Bool)

(assert (=> d!159637 m!1410819))

(assert (=> d!159637 m!1410547))

(assert (=> d!159637 m!1410549))

(declare-fun m!1410821 () Bool)

(assert (=> d!159637 m!1410821))

(assert (=> d!159637 m!1410547))

(declare-fun m!1410823 () Bool)

(assert (=> d!159637 m!1410823))

(declare-fun m!1410825 () Bool)

(assert (=> b!1527961 m!1410825))

(assert (=> b!1527614 d!159637))

(declare-fun b!1527986 () Bool)

(declare-fun e!851626 () SeekEntryResult!13163)

(assert (=> b!1527986 (= e!851626 (Found!13163 index!487))))

(declare-fun b!1527987 () Bool)

(declare-fun c!140650 () Bool)

(declare-fun lt!661682 () (_ BitVec 64))

(assert (=> b!1527987 (= c!140650 (= lt!661682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851627 () SeekEntryResult!13163)

(assert (=> b!1527987 (= e!851626 e!851627)))

(declare-fun b!1527988 () Bool)

(assert (=> b!1527988 (= e!851627 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!661500 lt!661498 mask!2512))))

(declare-fun b!1527989 () Bool)

(assert (=> b!1527989 (= e!851627 (MissingVacant!13163 index!487))))

(declare-fun lt!661681 () SeekEntryResult!13163)

(declare-fun d!159663 () Bool)

(assert (=> d!159663 (and (or (is-Undefined!13163 lt!661681) (not (is-Found!13163 lt!661681)) (and (bvsge (index!55048 lt!661681) #b00000000000000000000000000000000) (bvslt (index!55048 lt!661681) (size!49548 lt!661498)))) (or (is-Undefined!13163 lt!661681) (is-Found!13163 lt!661681) (not (is-MissingVacant!13163 lt!661681)) (not (= (index!55050 lt!661681) index!487)) (and (bvsge (index!55050 lt!661681) #b00000000000000000000000000000000) (bvslt (index!55050 lt!661681) (size!49548 lt!661498)))) (or (is-Undefined!13163 lt!661681) (ite (is-Found!13163 lt!661681) (= (select (arr!48998 lt!661498) (index!55048 lt!661681)) lt!661500) (and (is-MissingVacant!13163 lt!661681) (= (index!55050 lt!661681) index!487) (= (select (arr!48998 lt!661498) (index!55050 lt!661681)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!851628 () SeekEntryResult!13163)

(assert (=> d!159663 (= lt!661681 e!851628)))

(declare-fun c!140648 () Bool)

(assert (=> d!159663 (= c!140648 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159663 (= lt!661682 (select (arr!48998 lt!661498) index!487))))

(assert (=> d!159663 (validMask!0 mask!2512)))

(assert (=> d!159663 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661500 lt!661498 mask!2512) lt!661681)))

(declare-fun b!1527990 () Bool)

(assert (=> b!1527990 (= e!851628 e!851626)))

(declare-fun c!140649 () Bool)

(assert (=> b!1527990 (= c!140649 (= lt!661682 lt!661500))))

(declare-fun b!1527991 () Bool)

(assert (=> b!1527991 (= e!851628 Undefined!13163)))

(assert (= (and d!159663 c!140648) b!1527991))

(assert (= (and d!159663 (not c!140648)) b!1527990))

(assert (= (and b!1527990 c!140649) b!1527986))

(assert (= (and b!1527990 (not c!140649)) b!1527987))

(assert (= (and b!1527987 c!140650) b!1527989))

(assert (= (and b!1527987 (not c!140650)) b!1527988))

(assert (=> b!1527988 m!1410713))

(assert (=> b!1527988 m!1410713))

(declare-fun m!1410827 () Bool)

(assert (=> b!1527988 m!1410827))

(declare-fun m!1410829 () Bool)

(assert (=> d!159663 m!1410829))

(declare-fun m!1410831 () Bool)

(assert (=> d!159663 m!1410831))

(declare-fun m!1410833 () Bool)

(assert (=> d!159663 m!1410833))

(assert (=> d!159663 m!1410555))

(assert (=> b!1527614 d!159663))

(declare-fun b!1527992 () Bool)

(declare-fun e!851629 () SeekEntryResult!13163)

(assert (=> b!1527992 (= e!851629 (Found!13163 index!487))))

(declare-fun b!1527993 () Bool)

(declare-fun c!140653 () Bool)

(declare-fun lt!661684 () (_ BitVec 64))

(assert (=> b!1527993 (= c!140653 (= lt!661684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851630 () SeekEntryResult!13163)

(assert (=> b!1527993 (= e!851629 e!851630)))

(declare-fun b!1527994 () Bool)

(assert (=> b!1527994 (= e!851630 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527995 () Bool)

(assert (=> b!1527995 (= e!851630 (MissingVacant!13163 index!487))))

(declare-fun lt!661683 () SeekEntryResult!13163)

(declare-fun d!159673 () Bool)

(assert (=> d!159673 (and (or (is-Undefined!13163 lt!661683) (not (is-Found!13163 lt!661683)) (and (bvsge (index!55048 lt!661683) #b00000000000000000000000000000000) (bvslt (index!55048 lt!661683) (size!49548 a!2804)))) (or (is-Undefined!13163 lt!661683) (is-Found!13163 lt!661683) (not (is-MissingVacant!13163 lt!661683)) (not (= (index!55050 lt!661683) index!487)) (and (bvsge (index!55050 lt!661683) #b00000000000000000000000000000000) (bvslt (index!55050 lt!661683) (size!49548 a!2804)))) (or (is-Undefined!13163 lt!661683) (ite (is-Found!13163 lt!661683) (= (select (arr!48998 a!2804) (index!55048 lt!661683)) (select (arr!48998 a!2804) j!70)) (and (is-MissingVacant!13163 lt!661683) (= (index!55050 lt!661683) index!487) (= (select (arr!48998 a!2804) (index!55050 lt!661683)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!851631 () SeekEntryResult!13163)

(assert (=> d!159673 (= lt!661683 e!851631)))

(declare-fun c!140651 () Bool)

(assert (=> d!159673 (= c!140651 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159673 (= lt!661684 (select (arr!48998 a!2804) index!487))))

(assert (=> d!159673 (validMask!0 mask!2512)))

(assert (=> d!159673 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661683)))

(declare-fun b!1527996 () Bool)

(assert (=> b!1527996 (= e!851631 e!851629)))

(declare-fun c!140652 () Bool)

(assert (=> b!1527996 (= c!140652 (= lt!661684 (select (arr!48998 a!2804) j!70)))))

(declare-fun b!1527997 () Bool)

(assert (=> b!1527997 (= e!851631 Undefined!13163)))

(assert (= (and d!159673 c!140651) b!1527997))

(assert (= (and d!159673 (not c!140651)) b!1527996))

(assert (= (and b!1527996 c!140652) b!1527992))

(assert (= (and b!1527996 (not c!140652)) b!1527993))

(assert (= (and b!1527993 c!140653) b!1527995))

(assert (= (and b!1527993 (not c!140653)) b!1527994))

(assert (=> b!1527994 m!1410713))

(assert (=> b!1527994 m!1410713))

(assert (=> b!1527994 m!1410531))

(declare-fun m!1410835 () Bool)

(assert (=> b!1527994 m!1410835))

(declare-fun m!1410837 () Bool)

(assert (=> d!159673 m!1410837))

(declare-fun m!1410839 () Bool)

(assert (=> d!159673 m!1410839))

(assert (=> d!159673 m!1410539))

(assert (=> d!159673 m!1410555))

(assert (=> b!1527615 d!159673))

(declare-fun b!1528004 () Bool)

(declare-fun e!851635 () SeekEntryResult!13163)

(declare-fun lt!661689 () SeekEntryResult!13163)

(assert (=> b!1528004 (= e!851635 (MissingZero!13163 (index!55049 lt!661689)))))

(declare-fun b!1528005 () Bool)

(declare-fun c!140659 () Bool)

(declare-fun lt!661691 () (_ BitVec 64))

(assert (=> b!1528005 (= c!140659 (= lt!661691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851636 () SeekEntryResult!13163)

(assert (=> b!1528005 (= e!851636 e!851635)))

(declare-fun b!1528006 () Bool)

(assert (=> b!1528006 (= e!851636 (Found!13163 (index!55049 lt!661689)))))

(declare-fun b!1528007 () Bool)

(assert (=> b!1528007 (= e!851635 (seekKeyOrZeroReturnVacant!0 (x!136737 lt!661689) (index!55049 lt!661689) (index!55049 lt!661689) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528008 () Bool)

(declare-fun e!851637 () SeekEntryResult!13163)

(assert (=> b!1528008 (= e!851637 Undefined!13163)))

(declare-fun d!159675 () Bool)

(declare-fun lt!661690 () SeekEntryResult!13163)

(assert (=> d!159675 (and (or (is-Undefined!13163 lt!661690) (not (is-Found!13163 lt!661690)) (and (bvsge (index!55048 lt!661690) #b00000000000000000000000000000000) (bvslt (index!55048 lt!661690) (size!49548 a!2804)))) (or (is-Undefined!13163 lt!661690) (is-Found!13163 lt!661690) (not (is-MissingZero!13163 lt!661690)) (and (bvsge (index!55047 lt!661690) #b00000000000000000000000000000000) (bvslt (index!55047 lt!661690) (size!49548 a!2804)))) (or (is-Undefined!13163 lt!661690) (is-Found!13163 lt!661690) (is-MissingZero!13163 lt!661690) (not (is-MissingVacant!13163 lt!661690)) (and (bvsge (index!55050 lt!661690) #b00000000000000000000000000000000) (bvslt (index!55050 lt!661690) (size!49548 a!2804)))) (or (is-Undefined!13163 lt!661690) (ite (is-Found!13163 lt!661690) (= (select (arr!48998 a!2804) (index!55048 lt!661690)) (select (arr!48998 a!2804) j!70)) (ite (is-MissingZero!13163 lt!661690) (= (select (arr!48998 a!2804) (index!55047 lt!661690)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13163 lt!661690) (= (select (arr!48998 a!2804) (index!55050 lt!661690)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159675 (= lt!661690 e!851637)))

(declare-fun c!140658 () Bool)

(assert (=> d!159675 (= c!140658 (and (is-Intermediate!13163 lt!661689) (undefined!13975 lt!661689)))))

(assert (=> d!159675 (= lt!661689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48998 a!2804) j!70) mask!2512) (select (arr!48998 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159675 (validMask!0 mask!2512)))

(assert (=> d!159675 (= (seekEntryOrOpen!0 (select (arr!48998 a!2804) j!70) a!2804 mask!2512) lt!661690)))

(declare-fun b!1528009 () Bool)

(assert (=> b!1528009 (= e!851637 e!851636)))

(assert (=> b!1528009 (= lt!661691 (select (arr!48998 a!2804) (index!55049 lt!661689)))))

(declare-fun c!140657 () Bool)

(assert (=> b!1528009 (= c!140657 (= lt!661691 (select (arr!48998 a!2804) j!70)))))

(assert (= (and d!159675 c!140658) b!1528008))

(assert (= (and d!159675 (not c!140658)) b!1528009))

(assert (= (and b!1528009 c!140657) b!1528006))

(assert (= (and b!1528009 (not c!140657)) b!1528005))

(assert (= (and b!1528005 c!140659) b!1528004))

(assert (= (and b!1528005 (not c!140659)) b!1528007))

(assert (=> b!1528007 m!1410531))

(declare-fun m!1410847 () Bool)

(assert (=> b!1528007 m!1410847))

(assert (=> d!159675 m!1410555))

(declare-fun m!1410849 () Bool)

(assert (=> d!159675 m!1410849))

(assert (=> d!159675 m!1410533))

(assert (=> d!159675 m!1410531))

(assert (=> d!159675 m!1410535))

(declare-fun m!1410851 () Bool)

(assert (=> d!159675 m!1410851))

(assert (=> d!159675 m!1410531))

(assert (=> d!159675 m!1410533))

(declare-fun m!1410853 () Bool)

(assert (=> d!159675 m!1410853))

(declare-fun m!1410855 () Bool)

(assert (=> b!1528009 m!1410855))

(assert (=> b!1527615 d!159675))

(push 1)

(assert (not b!1527752))

(assert (not b!1527959))

(assert (not b!1527798))

(assert (not d!159625))

(assert (not d!159629))

(assert (not b!1527888))

(assert (not b!1527751))

(assert (not d!159611))

(assert (not bm!68473))

(assert (not b!1528007))

(assert (not d!159603))

(assert (not b!1527745))

(assert (not bm!68469))

(assert (not d!159637))

(assert (not bm!68472))

(assert (not b!1527994))

(assert (not d!159673))

(assert (not b!1527807))

(assert (not b!1527726))

(assert (not d!159663))

(assert (not b!1527746))

(assert (not b!1527748))

(assert (not b!1527988))

(assert (not d!159619))

(assert (not d!159675))

(assert (not b!1527834))

(assert (not b!1527727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

