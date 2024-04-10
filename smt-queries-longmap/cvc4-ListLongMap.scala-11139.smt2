; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130134 () Bool)

(assert start!130134)

(declare-fun b!1527692 () Bool)

(declare-fun e!851466 () Bool)

(declare-fun e!851462 () Bool)

(assert (=> b!1527692 (= e!851466 e!851462)))

(declare-fun res!1045732 () Bool)

(assert (=> b!1527692 (=> (not res!1045732) (not e!851462))))

(declare-datatypes ((SeekEntryResult!13165 0))(
  ( (MissingZero!13165 (index!55055 (_ BitVec 32))) (Found!13165 (index!55056 (_ BitVec 32))) (Intermediate!13165 (undefined!13977 Bool) (index!55057 (_ BitVec 32)) (x!136739 (_ BitVec 32))) (Undefined!13165) (MissingVacant!13165 (index!55058 (_ BitVec 32))) )
))
(declare-fun lt!661546 () SeekEntryResult!13165)

(declare-fun lt!661545 () SeekEntryResult!13165)

(assert (=> b!1527692 (= res!1045732 (= lt!661546 lt!661545))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527692 (= lt!661545 (Intermediate!13165 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101547 0))(
  ( (array!101548 (arr!49000 (Array (_ BitVec 32) (_ BitVec 64))) (size!49550 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101547)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101547 (_ BitVec 32)) SeekEntryResult!13165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527692 (= lt!661546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527693 () Bool)

(declare-fun res!1045729 () Bool)

(assert (=> b!1527693 (=> (not res!1045729) (not e!851466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101547 (_ BitVec 32)) Bool)

(assert (=> b!1527693 (= res!1045729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527695 () Bool)

(declare-fun res!1045734 () Bool)

(assert (=> b!1527695 (=> (not res!1045734) (not e!851462))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1527695 (= res!1045734 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661545))))

(declare-fun b!1527696 () Bool)

(declare-fun e!851464 () Bool)

(assert (=> b!1527696 (= e!851462 e!851464)))

(declare-fun res!1045731 () Bool)

(assert (=> b!1527696 (=> (not res!1045731) (not e!851464))))

(declare-fun lt!661541 () (_ BitVec 64))

(declare-fun lt!661542 () array!101547)

(assert (=> b!1527696 (= res!1045731 (= lt!661546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661541 mask!2512) lt!661541 lt!661542 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527696 (= lt!661541 (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527696 (= lt!661542 (array!101548 (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49550 a!2804)))))

(declare-fun b!1527697 () Bool)

(declare-fun e!851467 () Bool)

(assert (=> b!1527697 (= e!851464 (not e!851467))))

(declare-fun res!1045736 () Bool)

(assert (=> b!1527697 (=> res!1045736 e!851467)))

(assert (=> b!1527697 (= res!1045736 (or (not (= (select (arr!49000 a!2804) j!70) lt!661541)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49000 a!2804) index!487) (select (arr!49000 a!2804) j!70)) (not (= (select (arr!49000 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851463 () Bool)

(assert (=> b!1527697 e!851463))

(declare-fun res!1045726 () Bool)

(assert (=> b!1527697 (=> (not res!1045726) (not e!851463))))

(assert (=> b!1527697 (= res!1045726 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51114 0))(
  ( (Unit!51115) )
))
(declare-fun lt!661540 () Unit!51114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51114)

(assert (=> b!1527697 (= lt!661540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527698 () Bool)

(declare-fun res!1045728 () Bool)

(assert (=> b!1527698 (=> (not res!1045728) (not e!851466))))

(assert (=> b!1527698 (= res!1045728 (and (= (size!49550 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49550 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49550 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527699 () Bool)

(declare-fun lt!661543 () SeekEntryResult!13165)

(assert (=> b!1527699 (= e!851467 (= lt!661543 (Found!13165 j!70)))))

(declare-fun e!851465 () Bool)

(assert (=> b!1527699 e!851465))

(declare-fun res!1045737 () Bool)

(assert (=> b!1527699 (=> (not res!1045737) (not e!851465))))

(declare-fun lt!661544 () SeekEntryResult!13165)

(assert (=> b!1527699 (= res!1045737 (= lt!661544 lt!661543))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101547 (_ BitVec 32)) SeekEntryResult!13165)

(assert (=> b!1527699 (= lt!661543 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101547 (_ BitVec 32)) SeekEntryResult!13165)

(assert (=> b!1527699 (= lt!661544 (seekEntryOrOpen!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527700 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101547 (_ BitVec 32)) SeekEntryResult!13165)

(assert (=> b!1527700 (= e!851463 (= (seekEntry!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) (Found!13165 j!70)))))

(declare-fun b!1527701 () Bool)

(declare-fun res!1045735 () Bool)

(assert (=> b!1527701 (=> (not res!1045735) (not e!851466))))

(declare-datatypes ((List!35483 0))(
  ( (Nil!35480) (Cons!35479 (h!36912 (_ BitVec 64)) (t!50177 List!35483)) )
))
(declare-fun arrayNoDuplicates!0 (array!101547 (_ BitVec 32) List!35483) Bool)

(assert (=> b!1527701 (= res!1045735 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35480))))

(declare-fun b!1527702 () Bool)

(declare-fun res!1045730 () Bool)

(assert (=> b!1527702 (=> (not res!1045730) (not e!851466))))

(assert (=> b!1527702 (= res!1045730 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49550 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49550 a!2804))))))

(declare-fun b!1527703 () Bool)

(declare-fun res!1045738 () Bool)

(assert (=> b!1527703 (=> (not res!1045738) (not e!851466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527703 (= res!1045738 (validKeyInArray!0 (select (arr!49000 a!2804) j!70)))))

(declare-fun b!1527704 () Bool)

(declare-fun res!1045727 () Bool)

(assert (=> b!1527704 (=> (not res!1045727) (not e!851466))))

(assert (=> b!1527704 (= res!1045727 (validKeyInArray!0 (select (arr!49000 a!2804) i!961)))))

(declare-fun b!1527694 () Bool)

(assert (=> b!1527694 (= e!851465 (= (seekEntryOrOpen!0 lt!661541 lt!661542 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661541 lt!661542 mask!2512)))))

(declare-fun res!1045733 () Bool)

(assert (=> start!130134 (=> (not res!1045733) (not e!851466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130134 (= res!1045733 (validMask!0 mask!2512))))

(assert (=> start!130134 e!851466))

(assert (=> start!130134 true))

(declare-fun array_inv!38028 (array!101547) Bool)

(assert (=> start!130134 (array_inv!38028 a!2804)))

(assert (= (and start!130134 res!1045733) b!1527698))

(assert (= (and b!1527698 res!1045728) b!1527704))

(assert (= (and b!1527704 res!1045727) b!1527703))

(assert (= (and b!1527703 res!1045738) b!1527693))

(assert (= (and b!1527693 res!1045729) b!1527701))

(assert (= (and b!1527701 res!1045735) b!1527702))

(assert (= (and b!1527702 res!1045730) b!1527692))

(assert (= (and b!1527692 res!1045732) b!1527695))

(assert (= (and b!1527695 res!1045734) b!1527696))

(assert (= (and b!1527696 res!1045731) b!1527697))

(assert (= (and b!1527697 res!1045726) b!1527700))

(assert (= (and b!1527697 (not res!1045736)) b!1527699))

(assert (= (and b!1527699 res!1045737) b!1527694))

(declare-fun m!1410623 () Bool)

(assert (=> start!130134 m!1410623))

(declare-fun m!1410625 () Bool)

(assert (=> start!130134 m!1410625))

(declare-fun m!1410627 () Bool)

(assert (=> b!1527695 m!1410627))

(assert (=> b!1527695 m!1410627))

(declare-fun m!1410629 () Bool)

(assert (=> b!1527695 m!1410629))

(assert (=> b!1527699 m!1410627))

(assert (=> b!1527699 m!1410627))

(declare-fun m!1410631 () Bool)

(assert (=> b!1527699 m!1410631))

(assert (=> b!1527699 m!1410627))

(declare-fun m!1410633 () Bool)

(assert (=> b!1527699 m!1410633))

(declare-fun m!1410635 () Bool)

(assert (=> b!1527696 m!1410635))

(assert (=> b!1527696 m!1410635))

(declare-fun m!1410637 () Bool)

(assert (=> b!1527696 m!1410637))

(declare-fun m!1410639 () Bool)

(assert (=> b!1527696 m!1410639))

(declare-fun m!1410641 () Bool)

(assert (=> b!1527696 m!1410641))

(declare-fun m!1410643 () Bool)

(assert (=> b!1527704 m!1410643))

(assert (=> b!1527704 m!1410643))

(declare-fun m!1410645 () Bool)

(assert (=> b!1527704 m!1410645))

(declare-fun m!1410647 () Bool)

(assert (=> b!1527694 m!1410647))

(declare-fun m!1410649 () Bool)

(assert (=> b!1527694 m!1410649))

(declare-fun m!1410651 () Bool)

(assert (=> b!1527693 m!1410651))

(assert (=> b!1527692 m!1410627))

(assert (=> b!1527692 m!1410627))

(declare-fun m!1410653 () Bool)

(assert (=> b!1527692 m!1410653))

(assert (=> b!1527692 m!1410653))

(assert (=> b!1527692 m!1410627))

(declare-fun m!1410655 () Bool)

(assert (=> b!1527692 m!1410655))

(assert (=> b!1527703 m!1410627))

(assert (=> b!1527703 m!1410627))

(declare-fun m!1410657 () Bool)

(assert (=> b!1527703 m!1410657))

(assert (=> b!1527697 m!1410627))

(declare-fun m!1410659 () Bool)

(assert (=> b!1527697 m!1410659))

(declare-fun m!1410661 () Bool)

(assert (=> b!1527697 m!1410661))

(declare-fun m!1410663 () Bool)

(assert (=> b!1527697 m!1410663))

(assert (=> b!1527700 m!1410627))

(assert (=> b!1527700 m!1410627))

(declare-fun m!1410665 () Bool)

(assert (=> b!1527700 m!1410665))

(declare-fun m!1410667 () Bool)

(assert (=> b!1527701 m!1410667))

(push 1)

(assert (not b!1527694))

(assert (not b!1527697))

(assert (not b!1527696))

(assert (not b!1527699))

(assert (not b!1527693))

(assert (not b!1527703))

(assert (not b!1527695))

(assert (not b!1527701))

(assert (not b!1527704))

(assert (not b!1527692))

(assert (not start!130134))

(assert (not b!1527700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1527729 () Bool)

(declare-fun e!851485 () SeekEntryResult!13165)

(declare-fun e!851484 () SeekEntryResult!13165)

(assert (=> b!1527729 (= e!851485 e!851484)))

(declare-fun c!140545 () Bool)

(declare-fun lt!661561 () (_ BitVec 64))

(assert (=> b!1527729 (= c!140545 (= lt!661561 (select (arr!49000 a!2804) j!70)))))

(declare-fun lt!661560 () SeekEntryResult!13165)

(declare-fun d!159597 () Bool)

(assert (=> d!159597 (and (or (is-Undefined!13165 lt!661560) (not (is-Found!13165 lt!661560)) (and (bvsge (index!55056 lt!661560) #b00000000000000000000000000000000) (bvslt (index!55056 lt!661560) (size!49550 a!2804)))) (or (is-Undefined!13165 lt!661560) (is-Found!13165 lt!661560) (not (is-MissingVacant!13165 lt!661560)) (not (= (index!55058 lt!661560) index!487)) (and (bvsge (index!55058 lt!661560) #b00000000000000000000000000000000) (bvslt (index!55058 lt!661560) (size!49550 a!2804)))) (or (is-Undefined!13165 lt!661560) (ite (is-Found!13165 lt!661560) (= (select (arr!49000 a!2804) (index!55056 lt!661560)) (select (arr!49000 a!2804) j!70)) (and (is-MissingVacant!13165 lt!661560) (= (index!55058 lt!661560) index!487) (= (select (arr!49000 a!2804) (index!55058 lt!661560)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159597 (= lt!661560 e!851485)))

(declare-fun c!140544 () Bool)

(assert (=> d!159597 (= c!140544 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159597 (= lt!661561 (select (arr!49000 a!2804) index!487))))

(assert (=> d!159597 (validMask!0 mask!2512)))

(assert (=> d!159597 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661560)))

(declare-fun e!851483 () SeekEntryResult!13165)

(declare-fun b!1527730 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527730 (= e!851483 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527731 () Bool)

(assert (=> b!1527731 (= e!851483 (MissingVacant!13165 index!487))))

(declare-fun b!1527732 () Bool)

(assert (=> b!1527732 (= e!851484 (Found!13165 index!487))))

(declare-fun b!1527733 () Bool)

(assert (=> b!1527733 (= e!851485 Undefined!13165)))

(declare-fun b!1527734 () Bool)

(declare-fun c!140546 () Bool)

(assert (=> b!1527734 (= c!140546 (= lt!661561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527734 (= e!851484 e!851483)))

(assert (= (and d!159597 c!140544) b!1527733))

(assert (= (and d!159597 (not c!140544)) b!1527729))

(assert (= (and b!1527729 c!140545) b!1527732))

(assert (= (and b!1527729 (not c!140545)) b!1527734))

(assert (= (and b!1527734 c!140546) b!1527731))

(assert (= (and b!1527734 (not c!140546)) b!1527730))

(declare-fun m!1410675 () Bool)

(assert (=> d!159597 m!1410675))

(declare-fun m!1410677 () Bool)

(assert (=> d!159597 m!1410677))

(assert (=> d!159597 m!1410659))

(assert (=> d!159597 m!1410623))

(declare-fun m!1410679 () Bool)

(assert (=> b!1527730 m!1410679))

(assert (=> b!1527730 m!1410679))

(assert (=> b!1527730 m!1410627))

(declare-fun m!1410681 () Bool)

(assert (=> b!1527730 m!1410681))

(assert (=> b!1527699 d!159597))

(declare-fun d!159605 () Bool)

(declare-fun lt!661576 () SeekEntryResult!13165)

(assert (=> d!159605 (and (or (is-Undefined!13165 lt!661576) (not (is-Found!13165 lt!661576)) (and (bvsge (index!55056 lt!661576) #b00000000000000000000000000000000) (bvslt (index!55056 lt!661576) (size!49550 a!2804)))) (or (is-Undefined!13165 lt!661576) (is-Found!13165 lt!661576) (not (is-MissingZero!13165 lt!661576)) (and (bvsge (index!55055 lt!661576) #b00000000000000000000000000000000) (bvslt (index!55055 lt!661576) (size!49550 a!2804)))) (or (is-Undefined!13165 lt!661576) (is-Found!13165 lt!661576) (is-MissingZero!13165 lt!661576) (not (is-MissingVacant!13165 lt!661576)) (and (bvsge (index!55058 lt!661576) #b00000000000000000000000000000000) (bvslt (index!55058 lt!661576) (size!49550 a!2804)))) (or (is-Undefined!13165 lt!661576) (ite (is-Found!13165 lt!661576) (= (select (arr!49000 a!2804) (index!55056 lt!661576)) (select (arr!49000 a!2804) j!70)) (ite (is-MissingZero!13165 lt!661576) (= (select (arr!49000 a!2804) (index!55055 lt!661576)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13165 lt!661576) (= (select (arr!49000 a!2804) (index!55058 lt!661576)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851508 () SeekEntryResult!13165)

(assert (=> d!159605 (= lt!661576 e!851508)))

(declare-fun c!140557 () Bool)

(declare-fun lt!661575 () SeekEntryResult!13165)

(assert (=> d!159605 (= c!140557 (and (is-Intermediate!13165 lt!661575) (undefined!13977 lt!661575)))))

(assert (=> d!159605 (= lt!661575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159605 (validMask!0 mask!2512)))

(assert (=> d!159605 (= (seekEntryOrOpen!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661576)))

(declare-fun b!1527766 () Bool)

(assert (=> b!1527766 (= e!851508 Undefined!13165)))

(declare-fun b!1527767 () Bool)

(declare-fun e!851507 () SeekEntryResult!13165)

(assert (=> b!1527767 (= e!851507 (seekKeyOrZeroReturnVacant!0 (x!136739 lt!661575) (index!55057 lt!661575) (index!55057 lt!661575) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527768 () Bool)

(assert (=> b!1527768 (= e!851507 (MissingZero!13165 (index!55057 lt!661575)))))

(declare-fun b!1527769 () Bool)

(declare-fun e!851509 () SeekEntryResult!13165)

(assert (=> b!1527769 (= e!851509 (Found!13165 (index!55057 lt!661575)))))

(declare-fun b!1527770 () Bool)

(declare-fun c!140559 () Bool)

(declare-fun lt!661574 () (_ BitVec 64))

(assert (=> b!1527770 (= c!140559 (= lt!661574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527770 (= e!851509 e!851507)))

(declare-fun b!1527771 () Bool)

(assert (=> b!1527771 (= e!851508 e!851509)))

(assert (=> b!1527771 (= lt!661574 (select (arr!49000 a!2804) (index!55057 lt!661575)))))

(declare-fun c!140558 () Bool)

(assert (=> b!1527771 (= c!140558 (= lt!661574 (select (arr!49000 a!2804) j!70)))))

(assert (= (and d!159605 c!140557) b!1527766))

(assert (= (and d!159605 (not c!140557)) b!1527771))

(assert (= (and b!1527771 c!140558) b!1527769))

(assert (= (and b!1527771 (not c!140558)) b!1527770))

(assert (= (and b!1527770 c!140559) b!1527768))

(assert (= (and b!1527770 (not c!140559)) b!1527767))

(declare-fun m!1410701 () Bool)

(assert (=> d!159605 m!1410701))

(assert (=> d!159605 m!1410627))

(assert (=> d!159605 m!1410653))

(assert (=> d!159605 m!1410653))

(assert (=> d!159605 m!1410627))

(assert (=> d!159605 m!1410655))

(declare-fun m!1410703 () Bool)

(assert (=> d!159605 m!1410703))

(declare-fun m!1410705 () Bool)

(assert (=> d!159605 m!1410705))

(assert (=> d!159605 m!1410623))

(assert (=> b!1527767 m!1410627))

(declare-fun m!1410707 () Bool)

(assert (=> b!1527767 m!1410707))

(declare-fun m!1410709 () Bool)

(assert (=> b!1527771 m!1410709))

(assert (=> b!1527699 d!159605))

(declare-fun b!1527835 () Bool)

(declare-fun e!851548 () SeekEntryResult!13165)

(declare-fun e!851545 () SeekEntryResult!13165)

(assert (=> b!1527835 (= e!851548 e!851545)))

(declare-fun lt!661600 () (_ BitVec 64))

(declare-fun c!140582 () Bool)

(assert (=> b!1527835 (= c!140582 (or (= lt!661600 (select (arr!49000 a!2804) j!70)) (= (bvadd lt!661600 lt!661600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527836 () Bool)

(declare-fun lt!661599 () SeekEntryResult!13165)

(assert (=> b!1527836 (and (bvsge (index!55057 lt!661599) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661599) (size!49550 a!2804)))))

(declare-fun res!1045780 () Bool)

(assert (=> b!1527836 (= res!1045780 (= (select (arr!49000 a!2804) (index!55057 lt!661599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851547 () Bool)

(assert (=> b!1527836 (=> res!1045780 e!851547)))

(declare-fun b!1527837 () Bool)

(declare-fun e!851546 () Bool)

(declare-fun e!851549 () Bool)

(assert (=> b!1527837 (= e!851546 e!851549)))

(declare-fun res!1045778 () Bool)

(assert (=> b!1527837 (= res!1045778 (and (is-Intermediate!13165 lt!661599) (not (undefined!13977 lt!661599)) (bvslt (x!136739 lt!661599) #b01111111111111111111111111111110) (bvsge (x!136739 lt!661599) #b00000000000000000000000000000000) (bvsge (x!136739 lt!661599) x!534)))))

(assert (=> b!1527837 (=> (not res!1045778) (not e!851549))))

(declare-fun b!1527838 () Bool)

(assert (=> b!1527838 (and (bvsge (index!55057 lt!661599) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661599) (size!49550 a!2804)))))

(assert (=> b!1527838 (= e!851547 (= (select (arr!49000 a!2804) (index!55057 lt!661599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527839 () Bool)

(assert (=> b!1527839 (= e!851548 (Intermediate!13165 true index!487 x!534))))

(declare-fun b!1527840 () Bool)

(assert (=> b!1527840 (= e!851545 (Intermediate!13165 false index!487 x!534))))

(declare-fun b!1527841 () Bool)

(assert (=> b!1527841 (= e!851545 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159613 () Bool)

(assert (=> d!159613 e!851546))

(declare-fun c!140581 () Bool)

(assert (=> d!159613 (= c!140581 (and (is-Intermediate!13165 lt!661599) (undefined!13977 lt!661599)))))

(assert (=> d!159613 (= lt!661599 e!851548)))

(declare-fun c!140583 () Bool)

(assert (=> d!159613 (= c!140583 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159613 (= lt!661600 (select (arr!49000 a!2804) index!487))))

(assert (=> d!159613 (validMask!0 mask!2512)))

(assert (=> d!159613 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661599)))

(declare-fun b!1527842 () Bool)

(assert (=> b!1527842 (= e!851546 (bvsge (x!136739 lt!661599) #b01111111111111111111111111111110))))

(declare-fun b!1527843 () Bool)

(assert (=> b!1527843 (and (bvsge (index!55057 lt!661599) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661599) (size!49550 a!2804)))))

(declare-fun res!1045779 () Bool)

(assert (=> b!1527843 (= res!1045779 (= (select (arr!49000 a!2804) (index!55057 lt!661599)) (select (arr!49000 a!2804) j!70)))))

(assert (=> b!1527843 (=> res!1045779 e!851547)))

(assert (=> b!1527843 (= e!851549 e!851547)))

(assert (= (and d!159613 c!140583) b!1527839))

(assert (= (and d!159613 (not c!140583)) b!1527835))

(assert (= (and b!1527835 c!140582) b!1527840))

(assert (= (and b!1527835 (not c!140582)) b!1527841))

(assert (= (and d!159613 c!140581) b!1527842))

(assert (= (and d!159613 (not c!140581)) b!1527837))

(assert (= (and b!1527837 res!1045778) b!1527843))

(assert (= (and b!1527843 (not res!1045779)) b!1527836))

(assert (= (and b!1527836 (not res!1045780)) b!1527838))

(declare-fun m!1410733 () Bool)

(assert (=> b!1527836 m!1410733))

(assert (=> d!159613 m!1410659))

(assert (=> d!159613 m!1410623))

(assert (=> b!1527841 m!1410679))

(assert (=> b!1527841 m!1410679))

(assert (=> b!1527841 m!1410627))

(declare-fun m!1410735 () Bool)

(assert (=> b!1527841 m!1410735))

(assert (=> b!1527843 m!1410733))

(assert (=> b!1527838 m!1410733))

(assert (=> b!1527695 d!159613))

(declare-fun b!1527844 () Bool)

(declare-fun e!851553 () SeekEntryResult!13165)

(declare-fun e!851550 () SeekEntryResult!13165)

(assert (=> b!1527844 (= e!851553 e!851550)))

(declare-fun c!140585 () Bool)

(declare-fun lt!661602 () (_ BitVec 64))

(assert (=> b!1527844 (= c!140585 (or (= lt!661602 lt!661541) (= (bvadd lt!661602 lt!661602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527845 () Bool)

(declare-fun lt!661601 () SeekEntryResult!13165)

(assert (=> b!1527845 (and (bvsge (index!55057 lt!661601) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661601) (size!49550 lt!661542)))))

(declare-fun res!1045783 () Bool)

(assert (=> b!1527845 (= res!1045783 (= (select (arr!49000 lt!661542) (index!55057 lt!661601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851552 () Bool)

(assert (=> b!1527845 (=> res!1045783 e!851552)))

(declare-fun b!1527846 () Bool)

(declare-fun e!851551 () Bool)

(declare-fun e!851554 () Bool)

(assert (=> b!1527846 (= e!851551 e!851554)))

(declare-fun res!1045781 () Bool)

(assert (=> b!1527846 (= res!1045781 (and (is-Intermediate!13165 lt!661601) (not (undefined!13977 lt!661601)) (bvslt (x!136739 lt!661601) #b01111111111111111111111111111110) (bvsge (x!136739 lt!661601) #b00000000000000000000000000000000) (bvsge (x!136739 lt!661601) #b00000000000000000000000000000000)))))

(assert (=> b!1527846 (=> (not res!1045781) (not e!851554))))

(declare-fun b!1527847 () Bool)

(assert (=> b!1527847 (and (bvsge (index!55057 lt!661601) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661601) (size!49550 lt!661542)))))

(assert (=> b!1527847 (= e!851552 (= (select (arr!49000 lt!661542) (index!55057 lt!661601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527848 () Bool)

(assert (=> b!1527848 (= e!851553 (Intermediate!13165 true (toIndex!0 lt!661541 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527849 () Bool)

(assert (=> b!1527849 (= e!851550 (Intermediate!13165 false (toIndex!0 lt!661541 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527850 () Bool)

(assert (=> b!1527850 (= e!851550 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!661541 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!661541 lt!661542 mask!2512))))

(declare-fun d!159631 () Bool)

(assert (=> d!159631 e!851551))

(declare-fun c!140584 () Bool)

(assert (=> d!159631 (= c!140584 (and (is-Intermediate!13165 lt!661601) (undefined!13977 lt!661601)))))

(assert (=> d!159631 (= lt!661601 e!851553)))

(declare-fun c!140586 () Bool)

(assert (=> d!159631 (= c!140586 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159631 (= lt!661602 (select (arr!49000 lt!661542) (toIndex!0 lt!661541 mask!2512)))))

(assert (=> d!159631 (validMask!0 mask!2512)))

(assert (=> d!159631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661541 mask!2512) lt!661541 lt!661542 mask!2512) lt!661601)))

(declare-fun b!1527851 () Bool)

(assert (=> b!1527851 (= e!851551 (bvsge (x!136739 lt!661601) #b01111111111111111111111111111110))))

(declare-fun b!1527852 () Bool)

(assert (=> b!1527852 (and (bvsge (index!55057 lt!661601) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661601) (size!49550 lt!661542)))))

(declare-fun res!1045782 () Bool)

(assert (=> b!1527852 (= res!1045782 (= (select (arr!49000 lt!661542) (index!55057 lt!661601)) lt!661541))))

(assert (=> b!1527852 (=> res!1045782 e!851552)))

(assert (=> b!1527852 (= e!851554 e!851552)))

(assert (= (and d!159631 c!140586) b!1527848))

(assert (= (and d!159631 (not c!140586)) b!1527844))

(assert (= (and b!1527844 c!140585) b!1527849))

(assert (= (and b!1527844 (not c!140585)) b!1527850))

(assert (= (and d!159631 c!140584) b!1527851))

(assert (= (and d!159631 (not c!140584)) b!1527846))

(assert (= (and b!1527846 res!1045781) b!1527852))

(assert (= (and b!1527852 (not res!1045782)) b!1527845))

(assert (= (and b!1527845 (not res!1045783)) b!1527847))

(declare-fun m!1410737 () Bool)

(assert (=> b!1527845 m!1410737))

(assert (=> d!159631 m!1410635))

(declare-fun m!1410739 () Bool)

(assert (=> d!159631 m!1410739))

(assert (=> d!159631 m!1410623))

(assert (=> b!1527850 m!1410635))

(declare-fun m!1410741 () Bool)

(assert (=> b!1527850 m!1410741))

(assert (=> b!1527850 m!1410741))

(declare-fun m!1410743 () Bool)

(assert (=> b!1527850 m!1410743))

(assert (=> b!1527852 m!1410737))

(assert (=> b!1527847 m!1410737))

(assert (=> b!1527696 d!159631))

(declare-fun d!159633 () Bool)

(declare-fun lt!661608 () (_ BitVec 32))

(declare-fun lt!661607 () (_ BitVec 32))

(assert (=> d!159633 (= lt!661608 (bvmul (bvxor lt!661607 (bvlshr lt!661607 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159633 (= lt!661607 ((_ extract 31 0) (bvand (bvxor lt!661541 (bvlshr lt!661541 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159633 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045784 (let ((h!36914 ((_ extract 31 0) (bvand (bvxor lt!661541 (bvlshr lt!661541 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136744 (bvmul (bvxor h!36914 (bvlshr h!36914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136744 (bvlshr x!136744 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045784 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045784 #b00000000000000000000000000000000))))))

(assert (=> d!159633 (= (toIndex!0 lt!661541 mask!2512) (bvand (bvxor lt!661608 (bvlshr lt!661608 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527696 d!159633))

(declare-fun b!1527898 () Bool)

(declare-fun e!851579 () Bool)

(declare-fun call!68479 () Bool)

(assert (=> b!1527898 (= e!851579 call!68479)))

(declare-fun b!1527899 () Bool)

(declare-fun e!851581 () Bool)

(assert (=> b!1527899 (= e!851581 call!68479)))

(declare-fun bm!68476 () Bool)

(assert (=> bm!68476 (= call!68479 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527900 () Bool)

(assert (=> b!1527900 (= e!851581 e!851579)))

(declare-fun lt!661637 () (_ BitVec 64))

(assert (=> b!1527900 (= lt!661637 (select (arr!49000 a!2804) j!70))))

(declare-fun lt!661636 () Unit!51114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101547 (_ BitVec 64) (_ BitVec 32)) Unit!51114)

(assert (=> b!1527900 (= lt!661636 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661637 j!70))))

(declare-fun arrayContainsKey!0 (array!101547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1527900 (arrayContainsKey!0 a!2804 lt!661637 #b00000000000000000000000000000000)))

(declare-fun lt!661638 () Unit!51114)

(assert (=> b!1527900 (= lt!661638 lt!661636)))

(declare-fun res!1045789 () Bool)

(assert (=> b!1527900 (= res!1045789 (= (seekEntryOrOpen!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) (Found!13165 j!70)))))

(assert (=> b!1527900 (=> (not res!1045789) (not e!851579))))

(declare-fun d!159635 () Bool)

(declare-fun res!1045790 () Bool)

(declare-fun e!851580 () Bool)

(assert (=> d!159635 (=> res!1045790 e!851580)))

(assert (=> d!159635 (= res!1045790 (bvsge j!70 (size!49550 a!2804)))))

(assert (=> d!159635 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851580)))

(declare-fun b!1527897 () Bool)

(assert (=> b!1527897 (= e!851580 e!851581)))

(declare-fun c!140607 () Bool)

(assert (=> b!1527897 (= c!140607 (validKeyInArray!0 (select (arr!49000 a!2804) j!70)))))

(assert (= (and d!159635 (not res!1045790)) b!1527897))

(assert (= (and b!1527897 c!140607) b!1527900))

(assert (= (and b!1527897 (not c!140607)) b!1527899))

(assert (= (and b!1527900 res!1045789) b!1527898))

(assert (= (or b!1527898 b!1527899) bm!68476))

(declare-fun m!1410761 () Bool)

(assert (=> bm!68476 m!1410761))

(assert (=> b!1527900 m!1410627))

(declare-fun m!1410763 () Bool)

(assert (=> b!1527900 m!1410763))

(declare-fun m!1410765 () Bool)

(assert (=> b!1527900 m!1410765))

(assert (=> b!1527900 m!1410627))

(assert (=> b!1527900 m!1410633))

(assert (=> b!1527897 m!1410627))

(assert (=> b!1527897 m!1410627))

(assert (=> b!1527897 m!1410657))

(assert (=> b!1527697 d!159635))

(declare-fun d!159641 () Bool)

(assert (=> d!159641 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661641 () Unit!51114)

(declare-fun choose!38 (array!101547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51114)

(assert (=> d!159641 (= lt!661641 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159641 (validMask!0 mask!2512)))

(assert (=> d!159641 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661641)))

(declare-fun bs!43820 () Bool)

(assert (= bs!43820 d!159641))

(assert (=> bs!43820 m!1410661))

(declare-fun m!1410767 () Bool)

(assert (=> bs!43820 m!1410767))

(assert (=> bs!43820 m!1410623))

(assert (=> b!1527697 d!159641))

(declare-fun d!159643 () Bool)

(assert (=> d!159643 (= (validKeyInArray!0 (select (arr!49000 a!2804) j!70)) (and (not (= (select (arr!49000 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49000 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527703 d!159643))

(declare-fun b!1527901 () Bool)

(declare-fun e!851585 () SeekEntryResult!13165)

(declare-fun e!851582 () SeekEntryResult!13165)

(assert (=> b!1527901 (= e!851585 e!851582)))

(declare-fun lt!661643 () (_ BitVec 64))

(declare-fun c!140609 () Bool)

(assert (=> b!1527901 (= c!140609 (or (= lt!661643 (select (arr!49000 a!2804) j!70)) (= (bvadd lt!661643 lt!661643) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527902 () Bool)

(declare-fun lt!661642 () SeekEntryResult!13165)

(assert (=> b!1527902 (and (bvsge (index!55057 lt!661642) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661642) (size!49550 a!2804)))))

(declare-fun res!1045793 () Bool)

(assert (=> b!1527902 (= res!1045793 (= (select (arr!49000 a!2804) (index!55057 lt!661642)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851584 () Bool)

(assert (=> b!1527902 (=> res!1045793 e!851584)))

(declare-fun b!1527903 () Bool)

(declare-fun e!851583 () Bool)

(declare-fun e!851586 () Bool)

(assert (=> b!1527903 (= e!851583 e!851586)))

(declare-fun res!1045791 () Bool)

(assert (=> b!1527903 (= res!1045791 (and (is-Intermediate!13165 lt!661642) (not (undefined!13977 lt!661642)) (bvslt (x!136739 lt!661642) #b01111111111111111111111111111110) (bvsge (x!136739 lt!661642) #b00000000000000000000000000000000) (bvsge (x!136739 lt!661642) #b00000000000000000000000000000000)))))

(assert (=> b!1527903 (=> (not res!1045791) (not e!851586))))

(declare-fun b!1527904 () Bool)

(assert (=> b!1527904 (and (bvsge (index!55057 lt!661642) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661642) (size!49550 a!2804)))))

(assert (=> b!1527904 (= e!851584 (= (select (arr!49000 a!2804) (index!55057 lt!661642)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1527905 () Bool)

(assert (=> b!1527905 (= e!851585 (Intermediate!13165 true (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527906 () Bool)

(assert (=> b!1527906 (= e!851582 (Intermediate!13165 false (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527907 () Bool)

(assert (=> b!1527907 (= e!851582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159645 () Bool)

(assert (=> d!159645 e!851583))

(declare-fun c!140608 () Bool)

(assert (=> d!159645 (= c!140608 (and (is-Intermediate!13165 lt!661642) (undefined!13977 lt!661642)))))

(assert (=> d!159645 (= lt!661642 e!851585)))

(declare-fun c!140610 () Bool)

(assert (=> d!159645 (= c!140610 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159645 (= lt!661643 (select (arr!49000 a!2804) (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512)))))

(assert (=> d!159645 (validMask!0 mask!2512)))

(assert (=> d!159645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661642)))

(declare-fun b!1527908 () Bool)

(assert (=> b!1527908 (= e!851583 (bvsge (x!136739 lt!661642) #b01111111111111111111111111111110))))

(declare-fun b!1527909 () Bool)

(assert (=> b!1527909 (and (bvsge (index!55057 lt!661642) #b00000000000000000000000000000000) (bvslt (index!55057 lt!661642) (size!49550 a!2804)))))

(declare-fun res!1045792 () Bool)

(assert (=> b!1527909 (= res!1045792 (= (select (arr!49000 a!2804) (index!55057 lt!661642)) (select (arr!49000 a!2804) j!70)))))

(assert (=> b!1527909 (=> res!1045792 e!851584)))

(assert (=> b!1527909 (= e!851586 e!851584)))

(assert (= (and d!159645 c!140610) b!1527905))

(assert (= (and d!159645 (not c!140610)) b!1527901))

(assert (= (and b!1527901 c!140609) b!1527906))

(assert (= (and b!1527901 (not c!140609)) b!1527907))

(assert (= (and d!159645 c!140608) b!1527908))

(assert (= (and d!159645 (not c!140608)) b!1527903))

(assert (= (and b!1527903 res!1045791) b!1527909))

(assert (= (and b!1527909 (not res!1045792)) b!1527902))

(assert (= (and b!1527902 (not res!1045793)) b!1527904))

(declare-fun m!1410769 () Bool)

(assert (=> b!1527902 m!1410769))

(assert (=> d!159645 m!1410653))

(declare-fun m!1410771 () Bool)

(assert (=> d!159645 m!1410771))

(assert (=> d!159645 m!1410623))

(assert (=> b!1527907 m!1410653))

(declare-fun m!1410773 () Bool)

(assert (=> b!1527907 m!1410773))

(assert (=> b!1527907 m!1410773))

(assert (=> b!1527907 m!1410627))

(declare-fun m!1410775 () Bool)

(assert (=> b!1527907 m!1410775))

(assert (=> b!1527909 m!1410769))

(assert (=> b!1527904 m!1410769))

(assert (=> b!1527692 d!159645))

(declare-fun d!159647 () Bool)

(declare-fun lt!661645 () (_ BitVec 32))

(declare-fun lt!661644 () (_ BitVec 32))

(assert (=> d!159647 (= lt!661645 (bvmul (bvxor lt!661644 (bvlshr lt!661644 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159647 (= lt!661644 ((_ extract 31 0) (bvand (bvxor (select (arr!49000 a!2804) j!70) (bvlshr (select (arr!49000 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159647 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045784 (let ((h!36914 ((_ extract 31 0) (bvand (bvxor (select (arr!49000 a!2804) j!70) (bvlshr (select (arr!49000 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136744 (bvmul (bvxor h!36914 (bvlshr h!36914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136744 (bvlshr x!136744 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045784 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045784 #b00000000000000000000000000000000))))))

(assert (=> d!159647 (= (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (bvand (bvxor lt!661645 (bvlshr lt!661645 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527692 d!159647))

(declare-fun b!1527911 () Bool)

(declare-fun e!851587 () Bool)

(declare-fun call!68480 () Bool)

(assert (=> b!1527911 (= e!851587 call!68480)))

(declare-fun b!1527912 () Bool)

(declare-fun e!851589 () Bool)

(assert (=> b!1527912 (= e!851589 call!68480)))

(declare-fun bm!68477 () Bool)

(assert (=> bm!68477 (= call!68480 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1527913 () Bool)

(assert (=> b!1527913 (= e!851589 e!851587)))

(declare-fun lt!661647 () (_ BitVec 64))

(assert (=> b!1527913 (= lt!661647 (select (arr!49000 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661646 () Unit!51114)

(assert (=> b!1527913 (= lt!661646 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661647 #b00000000000000000000000000000000))))

(assert (=> b!1527913 (arrayContainsKey!0 a!2804 lt!661647 #b00000000000000000000000000000000)))

(declare-fun lt!661648 () Unit!51114)

(assert (=> b!1527913 (= lt!661648 lt!661646)))

(declare-fun res!1045794 () Bool)

(assert (=> b!1527913 (= res!1045794 (= (seekEntryOrOpen!0 (select (arr!49000 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13165 #b00000000000000000000000000000000)))))

(assert (=> b!1527913 (=> (not res!1045794) (not e!851587))))

(declare-fun d!159649 () Bool)

(declare-fun res!1045795 () Bool)

(declare-fun e!851588 () Bool)

(assert (=> d!159649 (=> res!1045795 e!851588)))

(assert (=> d!159649 (= res!1045795 (bvsge #b00000000000000000000000000000000 (size!49550 a!2804)))))

(assert (=> d!159649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851588)))

(declare-fun b!1527910 () Bool)

(assert (=> b!1527910 (= e!851588 e!851589)))

(declare-fun c!140611 () Bool)

(assert (=> b!1527910 (= c!140611 (validKeyInArray!0 (select (arr!49000 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159649 (not res!1045795)) b!1527910))

(assert (= (and b!1527910 c!140611) b!1527913))

(assert (= (and b!1527910 (not c!140611)) b!1527912))

(assert (= (and b!1527913 res!1045794) b!1527911))

(assert (= (or b!1527911 b!1527912) bm!68477))

(declare-fun m!1410777 () Bool)

(assert (=> bm!68477 m!1410777))

(declare-fun m!1410779 () Bool)

(assert (=> b!1527913 m!1410779))

(declare-fun m!1410781 () Bool)

(assert (=> b!1527913 m!1410781))

(declare-fun m!1410783 () Bool)

(assert (=> b!1527913 m!1410783))

(assert (=> b!1527913 m!1410779))

(declare-fun m!1410785 () Bool)

(assert (=> b!1527913 m!1410785))

(assert (=> b!1527910 m!1410779))

(assert (=> b!1527910 m!1410779))

(declare-fun m!1410787 () Bool)

(assert (=> b!1527910 m!1410787))

(assert (=> b!1527693 d!159649))

(declare-fun d!159651 () Bool)

(assert (=> d!159651 (= (validKeyInArray!0 (select (arr!49000 a!2804) i!961)) (and (not (= (select (arr!49000 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49000 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527704 d!159651))

(declare-fun d!159653 () Bool)

(declare-fun lt!661651 () SeekEntryResult!13165)

(assert (=> d!159653 (and (or (is-Undefined!13165 lt!661651) (not (is-Found!13165 lt!661651)) (and (bvsge (index!55056 lt!661651) #b00000000000000000000000000000000) (bvslt (index!55056 lt!661651) (size!49550 lt!661542)))) (or (is-Undefined!13165 lt!661651) (is-Found!13165 lt!661651) (not (is-MissingZero!13165 lt!661651)) (and (bvsge (index!55055 lt!661651) #b00000000000000000000000000000000) (bvslt (index!55055 lt!661651) (size!49550 lt!661542)))) (or (is-Undefined!13165 lt!661651) (is-Found!13165 lt!661651) (is-MissingZero!13165 lt!661651) (not (is-MissingVacant!13165 lt!661651)) (and (bvsge (index!55058 lt!661651) #b00000000000000000000000000000000) (bvslt (index!55058 lt!661651) (size!49550 lt!661542)))) (or (is-Undefined!13165 lt!661651) (ite (is-Found!13165 lt!661651) (= (select (arr!49000 lt!661542) (index!55056 lt!661651)) lt!661541) (ite (is-MissingZero!13165 lt!661651) (= (select (arr!49000 lt!661542) (index!55055 lt!661651)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13165 lt!661651) (= (select (arr!49000 lt!661542) (index!55058 lt!661651)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851591 () SeekEntryResult!13165)

(assert (=> d!159653 (= lt!661651 e!851591)))

(declare-fun c!140612 () Bool)

(declare-fun lt!661650 () SeekEntryResult!13165)

(assert (=> d!159653 (= c!140612 (and (is-Intermediate!13165 lt!661650) (undefined!13977 lt!661650)))))

(assert (=> d!159653 (= lt!661650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661541 mask!2512) lt!661541 lt!661542 mask!2512))))

(assert (=> d!159653 (validMask!0 mask!2512)))

(assert (=> d!159653 (= (seekEntryOrOpen!0 lt!661541 lt!661542 mask!2512) lt!661651)))

(declare-fun b!1527914 () Bool)

(assert (=> b!1527914 (= e!851591 Undefined!13165)))

(declare-fun b!1527915 () Bool)

(declare-fun e!851590 () SeekEntryResult!13165)

(assert (=> b!1527915 (= e!851590 (seekKeyOrZeroReturnVacant!0 (x!136739 lt!661650) (index!55057 lt!661650) (index!55057 lt!661650) lt!661541 lt!661542 mask!2512))))

(declare-fun b!1527916 () Bool)

(assert (=> b!1527916 (= e!851590 (MissingZero!13165 (index!55057 lt!661650)))))

(declare-fun b!1527917 () Bool)

(declare-fun e!851592 () SeekEntryResult!13165)

(assert (=> b!1527917 (= e!851592 (Found!13165 (index!55057 lt!661650)))))

(declare-fun b!1527918 () Bool)

(declare-fun c!140614 () Bool)

(declare-fun lt!661649 () (_ BitVec 64))

(assert (=> b!1527918 (= c!140614 (= lt!661649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527918 (= e!851592 e!851590)))

(declare-fun b!1527919 () Bool)

(assert (=> b!1527919 (= e!851591 e!851592)))

(assert (=> b!1527919 (= lt!661649 (select (arr!49000 lt!661542) (index!55057 lt!661650)))))

(declare-fun c!140613 () Bool)

(assert (=> b!1527919 (= c!140613 (= lt!661649 lt!661541))))

(assert (= (and d!159653 c!140612) b!1527914))

(assert (= (and d!159653 (not c!140612)) b!1527919))

(assert (= (and b!1527919 c!140613) b!1527917))

(assert (= (and b!1527919 (not c!140613)) b!1527918))

(assert (= (and b!1527918 c!140614) b!1527916))

(assert (= (and b!1527918 (not c!140614)) b!1527915))

(declare-fun m!1410789 () Bool)

(assert (=> d!159653 m!1410789))

(assert (=> d!159653 m!1410635))

(assert (=> d!159653 m!1410635))

(assert (=> d!159653 m!1410637))

(declare-fun m!1410791 () Bool)

(assert (=> d!159653 m!1410791))

(declare-fun m!1410793 () Bool)

(assert (=> d!159653 m!1410793))

(assert (=> d!159653 m!1410623))

(declare-fun m!1410795 () Bool)

(assert (=> b!1527915 m!1410795))

(declare-fun m!1410797 () Bool)

(assert (=> b!1527919 m!1410797))

(assert (=> b!1527694 d!159653))

(declare-fun b!1527920 () Bool)

(declare-fun e!851595 () SeekEntryResult!13165)

(declare-fun e!851594 () SeekEntryResult!13165)

(assert (=> b!1527920 (= e!851595 e!851594)))

(declare-fun c!140616 () Bool)

(declare-fun lt!661653 () (_ BitVec 64))

(assert (=> b!1527920 (= c!140616 (= lt!661653 lt!661541))))

(declare-fun d!159655 () Bool)

(declare-fun lt!661652 () SeekEntryResult!13165)

(assert (=> d!159655 (and (or (is-Undefined!13165 lt!661652) (not (is-Found!13165 lt!661652)) (and (bvsge (index!55056 lt!661652) #b00000000000000000000000000000000) (bvslt (index!55056 lt!661652) (size!49550 lt!661542)))) (or (is-Undefined!13165 lt!661652) (is-Found!13165 lt!661652) (not (is-MissingVacant!13165 lt!661652)) (not (= (index!55058 lt!661652) index!487)) (and (bvsge (index!55058 lt!661652) #b00000000000000000000000000000000) (bvslt (index!55058 lt!661652) (size!49550 lt!661542)))) (or (is-Undefined!13165 lt!661652) (ite (is-Found!13165 lt!661652) (= (select (arr!49000 lt!661542) (index!55056 lt!661652)) lt!661541) (and (is-MissingVacant!13165 lt!661652) (= (index!55058 lt!661652) index!487) (= (select (arr!49000 lt!661542) (index!55058 lt!661652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159655 (= lt!661652 e!851595)))

(declare-fun c!140615 () Bool)

(assert (=> d!159655 (= c!140615 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159655 (= lt!661653 (select (arr!49000 lt!661542) index!487))))

(assert (=> d!159655 (validMask!0 mask!2512)))

(assert (=> d!159655 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661541 lt!661542 mask!2512) lt!661652)))

(declare-fun b!1527921 () Bool)

(declare-fun e!851593 () SeekEntryResult!13165)

(assert (=> b!1527921 (= e!851593 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!661541 lt!661542 mask!2512))))

(declare-fun b!1527922 () Bool)

(assert (=> b!1527922 (= e!851593 (MissingVacant!13165 index!487))))

(declare-fun b!1527923 () Bool)

(assert (=> b!1527923 (= e!851594 (Found!13165 index!487))))

(declare-fun b!1527924 () Bool)

(assert (=> b!1527924 (= e!851595 Undefined!13165)))

(declare-fun b!1527925 () Bool)

(declare-fun c!140617 () Bool)

(assert (=> b!1527925 (= c!140617 (= lt!661653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527925 (= e!851594 e!851593)))

(assert (= (and d!159655 c!140615) b!1527924))

(assert (= (and d!159655 (not c!140615)) b!1527920))

(assert (= (and b!1527920 c!140616) b!1527923))

(assert (= (and b!1527920 (not c!140616)) b!1527925))

(assert (= (and b!1527925 c!140617) b!1527922))

(assert (= (and b!1527925 (not c!140617)) b!1527921))

(declare-fun m!1410799 () Bool)

(assert (=> d!159655 m!1410799))

(declare-fun m!1410801 () Bool)

(assert (=> d!159655 m!1410801))

(declare-fun m!1410803 () Bool)

(assert (=> d!159655 m!1410803))

(assert (=> d!159655 m!1410623))

(assert (=> b!1527921 m!1410679))

(assert (=> b!1527921 m!1410679))

(declare-fun m!1410805 () Bool)

(assert (=> b!1527921 m!1410805))

(assert (=> b!1527694 d!159655))

(declare-fun d!159657 () Bool)

(assert (=> d!159657 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130134 d!159657))

(declare-fun d!159665 () Bool)

(assert (=> d!159665 (= (array_inv!38028 a!2804) (bvsge (size!49550 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130134 d!159665))

(declare-fun b!1527998 () Bool)

(declare-fun c!140656 () Bool)

(declare-fun lt!661687 () (_ BitVec 64))

(assert (=> b!1527998 (= c!140656 (= lt!661687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851632 () SeekEntryResult!13165)

(declare-fun e!851634 () SeekEntryResult!13165)

(assert (=> b!1527998 (= e!851632 e!851634)))

(declare-fun d!159667 () Bool)

(declare-fun lt!661685 () SeekEntryResult!13165)

(assert (=> d!159667 (and (or (is-MissingVacant!13165 lt!661685) (not (is-Found!13165 lt!661685)) (and (bvsge (index!55056 lt!661685) #b00000000000000000000000000000000) (bvslt (index!55056 lt!661685) (size!49550 a!2804)))) (not (is-MissingVacant!13165 lt!661685)) (or (not (is-Found!13165 lt!661685)) (= (select (arr!49000 a!2804) (index!55056 lt!661685)) (select (arr!49000 a!2804) j!70))))))

(declare-fun e!851633 () SeekEntryResult!13165)

(assert (=> d!159667 (= lt!661685 e!851633)))

(declare-fun c!140654 () Bool)

(declare-fun lt!661686 () SeekEntryResult!13165)

(assert (=> d!159667 (= c!140654 (and (is-Intermediate!13165 lt!661686) (undefined!13977 lt!661686)))))

(assert (=> d!159667 (= lt!661686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159667 (validMask!0 mask!2512)))

(assert (=> d!159667 (= (seekEntry!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661685)))

(declare-fun b!1527999 () Bool)

(assert (=> b!1527999 (= e!851633 e!851632)))

(assert (=> b!1527999 (= lt!661687 (select (arr!49000 a!2804) (index!55057 lt!661686)))))

(declare-fun c!140655 () Bool)

(assert (=> b!1527999 (= c!140655 (= lt!661687 (select (arr!49000 a!2804) j!70)))))

(declare-fun b!1528000 () Bool)

(assert (=> b!1528000 (= e!851632 (Found!13165 (index!55057 lt!661686)))))

(declare-fun b!1528001 () Bool)

(declare-fun lt!661688 () SeekEntryResult!13165)

(assert (=> b!1528001 (= e!851634 (ite (is-MissingVacant!13165 lt!661688) (MissingZero!13165 (index!55058 lt!661688)) lt!661688))))

(assert (=> b!1528001 (= lt!661688 (seekKeyOrZeroReturnVacant!0 (x!136739 lt!661686) (index!55057 lt!661686) (index!55057 lt!661686) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528002 () Bool)

(assert (=> b!1528002 (= e!851634 (MissingZero!13165 (index!55057 lt!661686)))))

(declare-fun b!1528003 () Bool)

(assert (=> b!1528003 (= e!851633 Undefined!13165)))

(assert (= (and d!159667 c!140654) b!1528003))

(assert (= (and d!159667 (not c!140654)) b!1527999))

(assert (= (and b!1527999 c!140655) b!1528000))

(assert (= (and b!1527999 (not c!140655)) b!1527998))

(assert (= (and b!1527998 c!140656) b!1528002))

(assert (= (and b!1527998 (not c!140656)) b!1528001))

(declare-fun m!1410841 () Bool)

(assert (=> d!159667 m!1410841))

(assert (=> d!159667 m!1410627))

(assert (=> d!159667 m!1410653))

(assert (=> d!159667 m!1410653))

(assert (=> d!159667 m!1410627))

(assert (=> d!159667 m!1410655))

(assert (=> d!159667 m!1410623))

(declare-fun m!1410843 () Bool)

(assert (=> b!1527999 m!1410843))

(assert (=> b!1528001 m!1410627))

(declare-fun m!1410845 () Bool)

(assert (=> b!1528001 m!1410845))

(assert (=> b!1527700 d!159667))

(declare-fun b!1528034 () Bool)

(declare-fun e!851654 () Bool)

(declare-fun call!68483 () Bool)

(assert (=> b!1528034 (= e!851654 call!68483)))

(declare-fun bm!68480 () Bool)

(declare-fun c!140668 () Bool)

(assert (=> bm!68480 (= call!68483 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140668 (Cons!35479 (select (arr!49000 a!2804) #b00000000000000000000000000000000) Nil!35480) Nil!35480)))))

(declare-fun b!1528035 () Bool)

(declare-fun e!851656 () Bool)

(declare-fun e!851655 () Bool)

(assert (=> b!1528035 (= e!851656 e!851655)))

(declare-fun res!1045805 () Bool)

(assert (=> b!1528035 (=> (not res!1045805) (not e!851655))))

(declare-fun e!851657 () Bool)

(assert (=> b!1528035 (= res!1045805 (not e!851657))))

(declare-fun res!1045806 () Bool)

(assert (=> b!1528035 (=> (not res!1045806) (not e!851657))))

(assert (=> b!1528035 (= res!1045806 (validKeyInArray!0 (select (arr!49000 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159677 () Bool)

(declare-fun res!1045804 () Bool)

(assert (=> d!159677 (=> res!1045804 e!851656)))

(assert (=> d!159677 (= res!1045804 (bvsge #b00000000000000000000000000000000 (size!49550 a!2804)))))

(assert (=> d!159677 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35480) e!851656)))

(declare-fun b!1528036 () Bool)

(declare-fun contains!9996 (List!35483 (_ BitVec 64)) Bool)

(assert (=> b!1528036 (= e!851657 (contains!9996 Nil!35480 (select (arr!49000 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1528037 () Bool)

(assert (=> b!1528037 (= e!851654 call!68483)))

(declare-fun b!1528038 () Bool)

(assert (=> b!1528038 (= e!851655 e!851654)))

(assert (=> b!1528038 (= c!140668 (validKeyInArray!0 (select (arr!49000 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159677 (not res!1045804)) b!1528035))

(assert (= (and b!1528035 res!1045806) b!1528036))

(assert (= (and b!1528035 res!1045805) b!1528038))

(assert (= (and b!1528038 c!140668) b!1528034))

(assert (= (and b!1528038 (not c!140668)) b!1528037))

(assert (= (or b!1528034 b!1528037) bm!68480))

(assert (=> bm!68480 m!1410779))

(declare-fun m!1410857 () Bool)

(assert (=> bm!68480 m!1410857))

(assert (=> b!1528035 m!1410779))

(assert (=> b!1528035 m!1410779))

(assert (=> b!1528035 m!1410787))

(assert (=> b!1528036 m!1410779))

(assert (=> b!1528036 m!1410779))

(declare-fun m!1410859 () Bool)

(assert (=> b!1528036 m!1410859))

(assert (=> b!1528038 m!1410779))

(assert (=> b!1528038 m!1410779))

(assert (=> b!1528038 m!1410787))

(assert (=> b!1527701 d!159677))

(push 1)

