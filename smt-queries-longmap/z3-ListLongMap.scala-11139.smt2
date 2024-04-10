; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130132 () Bool)

(assert start!130132)

(declare-fun b!1527653 () Bool)

(declare-fun e!851445 () Bool)

(declare-datatypes ((SeekEntryResult!13164 0))(
  ( (MissingZero!13164 (index!55051 (_ BitVec 32))) (Found!13164 (index!55052 (_ BitVec 32))) (Intermediate!13164 (undefined!13976 Bool) (index!55053 (_ BitVec 32)) (x!136738 (_ BitVec 32))) (Undefined!13164) (MissingVacant!13164 (index!55054 (_ BitVec 32))) )
))
(declare-fun lt!661525 () SeekEntryResult!13164)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527653 (= e!851445 (= lt!661525 (Found!13164 j!70)))))

(declare-fun e!851444 () Bool)

(assert (=> b!1527653 e!851444))

(declare-fun res!1045688 () Bool)

(assert (=> b!1527653 (=> (not res!1045688) (not e!851444))))

(declare-fun lt!661522 () SeekEntryResult!13164)

(assert (=> b!1527653 (= res!1045688 (= lt!661522 lt!661525))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101545 0))(
  ( (array!101546 (arr!48999 (Array (_ BitVec 32) (_ BitVec 64))) (size!49549 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101545)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101545 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527653 (= lt!661525 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101545 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527653 (= lt!661522 (seekEntryOrOpen!0 (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1045696 () Bool)

(declare-fun e!851441 () Bool)

(assert (=> start!130132 (=> (not res!1045696) (not e!851441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130132 (= res!1045696 (validMask!0 mask!2512))))

(assert (=> start!130132 e!851441))

(assert (=> start!130132 true))

(declare-fun array_inv!38027 (array!101545) Bool)

(assert (=> start!130132 (array_inv!38027 a!2804)))

(declare-fun b!1527654 () Bool)

(declare-fun res!1045694 () Bool)

(assert (=> b!1527654 (=> (not res!1045694) (not e!851441))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527654 (= res!1045694 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49549 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49549 a!2804))))))

(declare-fun b!1527655 () Bool)

(declare-fun res!1045689 () Bool)

(assert (=> b!1527655 (=> (not res!1045689) (not e!851441))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527655 (= res!1045689 (validKeyInArray!0 (select (arr!48999 a!2804) i!961)))))

(declare-fun b!1527656 () Bool)

(declare-fun res!1045693 () Bool)

(assert (=> b!1527656 (=> (not res!1045693) (not e!851441))))

(assert (=> b!1527656 (= res!1045693 (and (= (size!49549 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49549 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49549 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527657 () Bool)

(declare-fun e!851442 () Bool)

(declare-fun e!851443 () Bool)

(assert (=> b!1527657 (= e!851442 e!851443)))

(declare-fun res!1045698 () Bool)

(assert (=> b!1527657 (=> (not res!1045698) (not e!851443))))

(declare-fun lt!661523 () (_ BitVec 64))

(declare-fun lt!661520 () SeekEntryResult!13164)

(declare-fun lt!661519 () array!101545)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101545 (_ BitVec 32)) SeekEntryResult!13164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527657 (= res!1045698 (= lt!661520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661523 mask!2512) lt!661523 lt!661519 mask!2512)))))

(assert (=> b!1527657 (= lt!661523 (select (store (arr!48999 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527657 (= lt!661519 (array!101546 (store (arr!48999 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49549 a!2804)))))

(declare-fun b!1527658 () Bool)

(declare-fun res!1045695 () Bool)

(assert (=> b!1527658 (=> (not res!1045695) (not e!851441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101545 (_ BitVec 32)) Bool)

(assert (=> b!1527658 (= res!1045695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527659 () Bool)

(assert (=> b!1527659 (= e!851443 (not e!851445))))

(declare-fun res!1045687 () Bool)

(assert (=> b!1527659 (=> res!1045687 e!851445)))

(assert (=> b!1527659 (= res!1045687 (or (not (= (select (arr!48999 a!2804) j!70) lt!661523)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48999 a!2804) index!487) (select (arr!48999 a!2804) j!70)) (not (= (select (arr!48999 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851446 () Bool)

(assert (=> b!1527659 e!851446))

(declare-fun res!1045691 () Bool)

(assert (=> b!1527659 (=> (not res!1045691) (not e!851446))))

(assert (=> b!1527659 (= res!1045691 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51112 0))(
  ( (Unit!51113) )
))
(declare-fun lt!661521 () Unit!51112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51112)

(assert (=> b!1527659 (= lt!661521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527660 () Bool)

(assert (=> b!1527660 (= e!851444 (= (seekEntryOrOpen!0 lt!661523 lt!661519 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661523 lt!661519 mask!2512)))))

(declare-fun b!1527661 () Bool)

(declare-fun res!1045692 () Bool)

(assert (=> b!1527661 (=> (not res!1045692) (not e!851441))))

(assert (=> b!1527661 (= res!1045692 (validKeyInArray!0 (select (arr!48999 a!2804) j!70)))))

(declare-fun b!1527662 () Bool)

(declare-fun res!1045697 () Bool)

(assert (=> b!1527662 (=> (not res!1045697) (not e!851441))))

(declare-datatypes ((List!35482 0))(
  ( (Nil!35479) (Cons!35478 (h!36911 (_ BitVec 64)) (t!50176 List!35482)) )
))
(declare-fun arrayNoDuplicates!0 (array!101545 (_ BitVec 32) List!35482) Bool)

(assert (=> b!1527662 (= res!1045697 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35479))))

(declare-fun b!1527663 () Bool)

(assert (=> b!1527663 (= e!851441 e!851442)))

(declare-fun res!1045699 () Bool)

(assert (=> b!1527663 (=> (not res!1045699) (not e!851442))))

(declare-fun lt!661524 () SeekEntryResult!13164)

(assert (=> b!1527663 (= res!1045699 (= lt!661520 lt!661524))))

(assert (=> b!1527663 (= lt!661524 (Intermediate!13164 false resIndex!21 resX!21))))

(assert (=> b!1527663 (= lt!661520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527664 () Bool)

(declare-fun res!1045690 () Bool)

(assert (=> b!1527664 (=> (not res!1045690) (not e!851442))))

(assert (=> b!1527664 (= res!1045690 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661524))))

(declare-fun b!1527665 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101545 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527665 (= e!851446 (= (seekEntry!0 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) (Found!13164 j!70)))))

(assert (= (and start!130132 res!1045696) b!1527656))

(assert (= (and b!1527656 res!1045693) b!1527655))

(assert (= (and b!1527655 res!1045689) b!1527661))

(assert (= (and b!1527661 res!1045692) b!1527658))

(assert (= (and b!1527658 res!1045695) b!1527662))

(assert (= (and b!1527662 res!1045697) b!1527654))

(assert (= (and b!1527654 res!1045694) b!1527663))

(assert (= (and b!1527663 res!1045699) b!1527664))

(assert (= (and b!1527664 res!1045690) b!1527657))

(assert (= (and b!1527657 res!1045698) b!1527659))

(assert (= (and b!1527659 res!1045691) b!1527665))

(assert (= (and b!1527659 (not res!1045687)) b!1527653))

(assert (= (and b!1527653 res!1045688) b!1527660))

(declare-fun m!1410577 () Bool)

(assert (=> b!1527653 m!1410577))

(assert (=> b!1527653 m!1410577))

(declare-fun m!1410579 () Bool)

(assert (=> b!1527653 m!1410579))

(assert (=> b!1527653 m!1410577))

(declare-fun m!1410581 () Bool)

(assert (=> b!1527653 m!1410581))

(declare-fun m!1410583 () Bool)

(assert (=> b!1527655 m!1410583))

(assert (=> b!1527655 m!1410583))

(declare-fun m!1410585 () Bool)

(assert (=> b!1527655 m!1410585))

(assert (=> b!1527665 m!1410577))

(assert (=> b!1527665 m!1410577))

(declare-fun m!1410587 () Bool)

(assert (=> b!1527665 m!1410587))

(declare-fun m!1410589 () Bool)

(assert (=> b!1527657 m!1410589))

(assert (=> b!1527657 m!1410589))

(declare-fun m!1410591 () Bool)

(assert (=> b!1527657 m!1410591))

(declare-fun m!1410593 () Bool)

(assert (=> b!1527657 m!1410593))

(declare-fun m!1410595 () Bool)

(assert (=> b!1527657 m!1410595))

(declare-fun m!1410597 () Bool)

(assert (=> b!1527658 m!1410597))

(declare-fun m!1410599 () Bool)

(assert (=> b!1527660 m!1410599))

(declare-fun m!1410601 () Bool)

(assert (=> b!1527660 m!1410601))

(declare-fun m!1410603 () Bool)

(assert (=> start!130132 m!1410603))

(declare-fun m!1410605 () Bool)

(assert (=> start!130132 m!1410605))

(assert (=> b!1527663 m!1410577))

(assert (=> b!1527663 m!1410577))

(declare-fun m!1410607 () Bool)

(assert (=> b!1527663 m!1410607))

(assert (=> b!1527663 m!1410607))

(assert (=> b!1527663 m!1410577))

(declare-fun m!1410609 () Bool)

(assert (=> b!1527663 m!1410609))

(assert (=> b!1527661 m!1410577))

(assert (=> b!1527661 m!1410577))

(declare-fun m!1410611 () Bool)

(assert (=> b!1527661 m!1410611))

(declare-fun m!1410613 () Bool)

(assert (=> b!1527662 m!1410613))

(assert (=> b!1527659 m!1410577))

(declare-fun m!1410615 () Bool)

(assert (=> b!1527659 m!1410615))

(declare-fun m!1410617 () Bool)

(assert (=> b!1527659 m!1410617))

(declare-fun m!1410619 () Bool)

(assert (=> b!1527659 m!1410619))

(assert (=> b!1527664 m!1410577))

(assert (=> b!1527664 m!1410577))

(declare-fun m!1410621 () Bool)

(assert (=> b!1527664 m!1410621))

(check-sat (not b!1527665) (not b!1527655) (not b!1527657) (not b!1527664) (not b!1527653) (not b!1527661) (not start!130132) (not b!1527660) (not b!1527663) (not b!1527658) (not b!1527659) (not b!1527662))
(check-sat)
(get-model)

(declare-fun lt!661633 () SeekEntryResult!13164)

(declare-fun b!1527891 () Bool)

(declare-fun e!851578 () SeekEntryResult!13164)

(assert (=> b!1527891 (= e!851578 (seekKeyOrZeroReturnVacant!0 (x!136738 lt!661633) (index!55053 lt!661633) (index!55053 lt!661633) lt!661523 lt!661519 mask!2512))))

(declare-fun d!159623 () Bool)

(declare-fun lt!661635 () SeekEntryResult!13164)

(get-info :version)

(assert (=> d!159623 (and (or ((_ is Undefined!13164) lt!661635) (not ((_ is Found!13164) lt!661635)) (and (bvsge (index!55052 lt!661635) #b00000000000000000000000000000000) (bvslt (index!55052 lt!661635) (size!49549 lt!661519)))) (or ((_ is Undefined!13164) lt!661635) ((_ is Found!13164) lt!661635) (not ((_ is MissingZero!13164) lt!661635)) (and (bvsge (index!55051 lt!661635) #b00000000000000000000000000000000) (bvslt (index!55051 lt!661635) (size!49549 lt!661519)))) (or ((_ is Undefined!13164) lt!661635) ((_ is Found!13164) lt!661635) ((_ is MissingZero!13164) lt!661635) (not ((_ is MissingVacant!13164) lt!661635)) (and (bvsge (index!55054 lt!661635) #b00000000000000000000000000000000) (bvslt (index!55054 lt!661635) (size!49549 lt!661519)))) (or ((_ is Undefined!13164) lt!661635) (ite ((_ is Found!13164) lt!661635) (= (select (arr!48999 lt!661519) (index!55052 lt!661635)) lt!661523) (ite ((_ is MissingZero!13164) lt!661635) (= (select (arr!48999 lt!661519) (index!55051 lt!661635)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13164) lt!661635) (= (select (arr!48999 lt!661519) (index!55054 lt!661635)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851576 () SeekEntryResult!13164)

(assert (=> d!159623 (= lt!661635 e!851576)))

(declare-fun c!140606 () Bool)

(assert (=> d!159623 (= c!140606 (and ((_ is Intermediate!13164) lt!661633) (undefined!13976 lt!661633)))))

(assert (=> d!159623 (= lt!661633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661523 mask!2512) lt!661523 lt!661519 mask!2512))))

(assert (=> d!159623 (validMask!0 mask!2512)))

(assert (=> d!159623 (= (seekEntryOrOpen!0 lt!661523 lt!661519 mask!2512) lt!661635)))

(declare-fun b!1527892 () Bool)

(assert (=> b!1527892 (= e!851578 (MissingZero!13164 (index!55053 lt!661633)))))

(declare-fun b!1527893 () Bool)

(declare-fun e!851577 () SeekEntryResult!13164)

(assert (=> b!1527893 (= e!851576 e!851577)))

(declare-fun lt!661634 () (_ BitVec 64))

(assert (=> b!1527893 (= lt!661634 (select (arr!48999 lt!661519) (index!55053 lt!661633)))))

(declare-fun c!140604 () Bool)

(assert (=> b!1527893 (= c!140604 (= lt!661634 lt!661523))))

(declare-fun b!1527894 () Bool)

(assert (=> b!1527894 (= e!851576 Undefined!13164)))

(declare-fun b!1527895 () Bool)

(declare-fun c!140605 () Bool)

(assert (=> b!1527895 (= c!140605 (= lt!661634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527895 (= e!851577 e!851578)))

(declare-fun b!1527896 () Bool)

(assert (=> b!1527896 (= e!851577 (Found!13164 (index!55053 lt!661633)))))

(assert (= (and d!159623 c!140606) b!1527894))

(assert (= (and d!159623 (not c!140606)) b!1527893))

(assert (= (and b!1527893 c!140604) b!1527896))

(assert (= (and b!1527893 (not c!140604)) b!1527895))

(assert (= (and b!1527895 c!140605) b!1527892))

(assert (= (and b!1527895 (not c!140605)) b!1527891))

(declare-fun m!1410751 () Bool)

(assert (=> b!1527891 m!1410751))

(declare-fun m!1410753 () Bool)

(assert (=> d!159623 m!1410753))

(assert (=> d!159623 m!1410589))

(assert (=> d!159623 m!1410589))

(assert (=> d!159623 m!1410591))

(assert (=> d!159623 m!1410603))

(declare-fun m!1410755 () Bool)

(assert (=> d!159623 m!1410755))

(declare-fun m!1410757 () Bool)

(assert (=> d!159623 m!1410757))

(declare-fun m!1410759 () Bool)

(assert (=> b!1527893 m!1410759))

(assert (=> b!1527660 d!159623))

(declare-fun b!1527950 () Bool)

(declare-fun e!851609 () SeekEntryResult!13164)

(declare-fun e!851608 () SeekEntryResult!13164)

(assert (=> b!1527950 (= e!851609 e!851608)))

(declare-fun c!140630 () Bool)

(declare-fun lt!661665 () (_ BitVec 64))

(assert (=> b!1527950 (= c!140630 (= lt!661665 lt!661523))))

(declare-fun b!1527951 () Bool)

(declare-fun e!851610 () SeekEntryResult!13164)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527951 (= e!851610 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!661523 lt!661519 mask!2512))))

(declare-fun b!1527952 () Bool)

(assert (=> b!1527952 (= e!851609 Undefined!13164)))

(declare-fun b!1527953 () Bool)

(assert (=> b!1527953 (= e!851608 (Found!13164 index!487))))

(declare-fun b!1527954 () Bool)

(assert (=> b!1527954 (= e!851610 (MissingVacant!13164 index!487))))

(declare-fun d!159639 () Bool)

(declare-fun lt!661664 () SeekEntryResult!13164)

(assert (=> d!159639 (and (or ((_ is Undefined!13164) lt!661664) (not ((_ is Found!13164) lt!661664)) (and (bvsge (index!55052 lt!661664) #b00000000000000000000000000000000) (bvslt (index!55052 lt!661664) (size!49549 lt!661519)))) (or ((_ is Undefined!13164) lt!661664) ((_ is Found!13164) lt!661664) (not ((_ is MissingVacant!13164) lt!661664)) (not (= (index!55054 lt!661664) index!487)) (and (bvsge (index!55054 lt!661664) #b00000000000000000000000000000000) (bvslt (index!55054 lt!661664) (size!49549 lt!661519)))) (or ((_ is Undefined!13164) lt!661664) (ite ((_ is Found!13164) lt!661664) (= (select (arr!48999 lt!661519) (index!55052 lt!661664)) lt!661523) (and ((_ is MissingVacant!13164) lt!661664) (= (index!55054 lt!661664) index!487) (= (select (arr!48999 lt!661519) (index!55054 lt!661664)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159639 (= lt!661664 e!851609)))

(declare-fun c!140632 () Bool)

(assert (=> d!159639 (= c!140632 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159639 (= lt!661665 (select (arr!48999 lt!661519) index!487))))

(assert (=> d!159639 (validMask!0 mask!2512)))

(assert (=> d!159639 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661523 lt!661519 mask!2512) lt!661664)))

(declare-fun b!1527955 () Bool)

(declare-fun c!140631 () Bool)

(assert (=> b!1527955 (= c!140631 (= lt!661665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527955 (= e!851608 e!851610)))

(assert (= (and d!159639 c!140632) b!1527952))

(assert (= (and d!159639 (not c!140632)) b!1527950))

(assert (= (and b!1527950 c!140630) b!1527953))

(assert (= (and b!1527950 (not c!140630)) b!1527955))

(assert (= (and b!1527955 c!140631) b!1527954))

(assert (= (and b!1527955 (not c!140631)) b!1527951))

(declare-fun m!1410807 () Bool)

(assert (=> b!1527951 m!1410807))

(assert (=> b!1527951 m!1410807))

(declare-fun m!1410809 () Bool)

(assert (=> b!1527951 m!1410809))

(declare-fun m!1410811 () Bool)

(assert (=> d!159639 m!1410811))

(declare-fun m!1410813 () Bool)

(assert (=> d!159639 m!1410813))

(declare-fun m!1410815 () Bool)

(assert (=> d!159639 m!1410815))

(assert (=> d!159639 m!1410603))

(assert (=> b!1527660 d!159639))

(declare-fun d!159659 () Bool)

(assert (=> d!159659 (= (validKeyInArray!0 (select (arr!48999 a!2804) j!70)) (and (not (= (select (arr!48999 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48999 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527661 d!159659))

(declare-fun d!159661 () Bool)

(assert (=> d!159661 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130132 d!159661))

(declare-fun d!159669 () Bool)

(assert (=> d!159669 (= (array_inv!38027 a!2804) (bvsge (size!49549 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130132 d!159669))

(declare-fun b!1528043 () Bool)

(declare-fun lt!661697 () SeekEntryResult!13164)

(assert (=> b!1528043 (and (bvsge (index!55053 lt!661697) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661697) (size!49549 lt!661519)))))

(declare-fun res!1045812 () Bool)

(assert (=> b!1528043 (= res!1045812 (= (select (arr!48999 lt!661519) (index!55053 lt!661697)) lt!661523))))

(declare-fun e!851663 () Bool)

(assert (=> b!1528043 (=> res!1045812 e!851663)))

(declare-fun e!851664 () Bool)

(assert (=> b!1528043 (= e!851664 e!851663)))

(declare-fun b!1528045 () Bool)

(declare-fun e!851660 () Bool)

(assert (=> b!1528045 (= e!851660 e!851664)))

(declare-fun res!1045813 () Bool)

(assert (=> b!1528045 (= res!1045813 (and ((_ is Intermediate!13164) lt!661697) (not (undefined!13976 lt!661697)) (bvslt (x!136738 lt!661697) #b01111111111111111111111111111110) (bvsge (x!136738 lt!661697) #b00000000000000000000000000000000) (bvsge (x!136738 lt!661697) #b00000000000000000000000000000000)))))

(assert (=> b!1528045 (=> (not res!1045813) (not e!851664))))

(declare-fun b!1528046 () Bool)

(declare-fun e!851662 () SeekEntryResult!13164)

(declare-fun e!851661 () SeekEntryResult!13164)

(assert (=> b!1528046 (= e!851662 e!851661)))

(declare-fun c!140669 () Bool)

(declare-fun lt!661696 () (_ BitVec 64))

(assert (=> b!1528046 (= c!140669 (or (= lt!661696 lt!661523) (= (bvadd lt!661696 lt!661696) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1528047 () Bool)

(assert (=> b!1528047 (= e!851661 (Intermediate!13164 false (toIndex!0 lt!661523 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1528048 () Bool)

(assert (=> b!1528048 (and (bvsge (index!55053 lt!661697) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661697) (size!49549 lt!661519)))))

(declare-fun res!1045811 () Bool)

(assert (=> b!1528048 (= res!1045811 (= (select (arr!48999 lt!661519) (index!55053 lt!661697)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1528048 (=> res!1045811 e!851663)))

(declare-fun b!1528049 () Bool)

(assert (=> b!1528049 (= e!851662 (Intermediate!13164 true (toIndex!0 lt!661523 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1528044 () Bool)

(assert (=> b!1528044 (= e!851661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!661523 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!661523 lt!661519 mask!2512))))

(declare-fun d!159671 () Bool)

(assert (=> d!159671 e!851660))

(declare-fun c!140670 () Bool)

(assert (=> d!159671 (= c!140670 (and ((_ is Intermediate!13164) lt!661697) (undefined!13976 lt!661697)))))

(assert (=> d!159671 (= lt!661697 e!851662)))

(declare-fun c!140671 () Bool)

(assert (=> d!159671 (= c!140671 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159671 (= lt!661696 (select (arr!48999 lt!661519) (toIndex!0 lt!661523 mask!2512)))))

(assert (=> d!159671 (validMask!0 mask!2512)))

(assert (=> d!159671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661523 mask!2512) lt!661523 lt!661519 mask!2512) lt!661697)))

(declare-fun b!1528050 () Bool)

(assert (=> b!1528050 (= e!851660 (bvsge (x!136738 lt!661697) #b01111111111111111111111111111110))))

(declare-fun b!1528051 () Bool)

(assert (=> b!1528051 (and (bvsge (index!55053 lt!661697) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661697) (size!49549 lt!661519)))))

(assert (=> b!1528051 (= e!851663 (= (select (arr!48999 lt!661519) (index!55053 lt!661697)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159671 c!140671) b!1528049))

(assert (= (and d!159671 (not c!140671)) b!1528046))

(assert (= (and b!1528046 c!140669) b!1528047))

(assert (= (and b!1528046 (not c!140669)) b!1528044))

(assert (= (and d!159671 c!140670) b!1528050))

(assert (= (and d!159671 (not c!140670)) b!1528045))

(assert (= (and b!1528045 res!1045813) b!1528043))

(assert (= (and b!1528043 (not res!1045812)) b!1528048))

(assert (= (and b!1528048 (not res!1045811)) b!1528051))

(declare-fun m!1410861 () Bool)

(assert (=> b!1528051 m!1410861))

(assert (=> b!1528048 m!1410861))

(assert (=> b!1528043 m!1410861))

(assert (=> b!1528044 m!1410589))

(declare-fun m!1410863 () Bool)

(assert (=> b!1528044 m!1410863))

(assert (=> b!1528044 m!1410863))

(declare-fun m!1410865 () Bool)

(assert (=> b!1528044 m!1410865))

(assert (=> d!159671 m!1410589))

(declare-fun m!1410867 () Bool)

(assert (=> d!159671 m!1410867))

(assert (=> d!159671 m!1410603))

(assert (=> b!1527657 d!159671))

(declare-fun d!159679 () Bool)

(declare-fun lt!661703 () (_ BitVec 32))

(declare-fun lt!661702 () (_ BitVec 32))

(assert (=> d!159679 (= lt!661703 (bvmul (bvxor lt!661702 (bvlshr lt!661702 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159679 (= lt!661702 ((_ extract 31 0) (bvand (bvxor lt!661523 (bvlshr lt!661523 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159679 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045814 (let ((h!36915 ((_ extract 31 0) (bvand (bvxor lt!661523 (bvlshr lt!661523 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136748 (bvmul (bvxor h!36915 (bvlshr h!36915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136748 (bvlshr x!136748 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045814 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045814 #b00000000000000000000000000000000))))))

(assert (=> d!159679 (= (toIndex!0 lt!661523 mask!2512) (bvand (bvxor lt!661703 (bvlshr lt!661703 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527657 d!159679))

(declare-fun bm!68483 () Bool)

(declare-fun call!68486 () Bool)

(assert (=> bm!68483 (= call!68486 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159681 () Bool)

(declare-fun res!1045819 () Bool)

(declare-fun e!851672 () Bool)

(assert (=> d!159681 (=> res!1045819 e!851672)))

(assert (=> d!159681 (= res!1045819 (bvsge #b00000000000000000000000000000000 (size!49549 a!2804)))))

(assert (=> d!159681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851672)))

(declare-fun b!1528060 () Bool)

(declare-fun e!851671 () Bool)

(declare-fun e!851673 () Bool)

(assert (=> b!1528060 (= e!851671 e!851673)))

(declare-fun lt!661711 () (_ BitVec 64))

(assert (=> b!1528060 (= lt!661711 (select (arr!48999 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661712 () Unit!51112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101545 (_ BitVec 64) (_ BitVec 32)) Unit!51112)

(assert (=> b!1528060 (= lt!661712 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661711 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1528060 (arrayContainsKey!0 a!2804 lt!661711 #b00000000000000000000000000000000)))

(declare-fun lt!661710 () Unit!51112)

(assert (=> b!1528060 (= lt!661710 lt!661712)))

(declare-fun res!1045820 () Bool)

(assert (=> b!1528060 (= res!1045820 (= (seekEntryOrOpen!0 (select (arr!48999 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13164 #b00000000000000000000000000000000)))))

(assert (=> b!1528060 (=> (not res!1045820) (not e!851673))))

(declare-fun b!1528061 () Bool)

(assert (=> b!1528061 (= e!851671 call!68486)))

(declare-fun b!1528062 () Bool)

(assert (=> b!1528062 (= e!851672 e!851671)))

(declare-fun c!140674 () Bool)

(assert (=> b!1528062 (= c!140674 (validKeyInArray!0 (select (arr!48999 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1528063 () Bool)

(assert (=> b!1528063 (= e!851673 call!68486)))

(assert (= (and d!159681 (not res!1045819)) b!1528062))

(assert (= (and b!1528062 c!140674) b!1528060))

(assert (= (and b!1528062 (not c!140674)) b!1528061))

(assert (= (and b!1528060 res!1045820) b!1528063))

(assert (= (or b!1528063 b!1528061) bm!68483))

(declare-fun m!1410869 () Bool)

(assert (=> bm!68483 m!1410869))

(declare-fun m!1410871 () Bool)

(assert (=> b!1528060 m!1410871))

(declare-fun m!1410873 () Bool)

(assert (=> b!1528060 m!1410873))

(declare-fun m!1410875 () Bool)

(assert (=> b!1528060 m!1410875))

(assert (=> b!1528060 m!1410871))

(declare-fun m!1410877 () Bool)

(assert (=> b!1528060 m!1410877))

(assert (=> b!1528062 m!1410871))

(assert (=> b!1528062 m!1410871))

(declare-fun m!1410879 () Bool)

(assert (=> b!1528062 m!1410879))

(assert (=> b!1527658 d!159681))

(declare-fun call!68487 () Bool)

(declare-fun bm!68484 () Bool)

(assert (=> bm!68484 (= call!68487 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159683 () Bool)

(declare-fun res!1045821 () Bool)

(declare-fun e!851675 () Bool)

(assert (=> d!159683 (=> res!1045821 e!851675)))

(assert (=> d!159683 (= res!1045821 (bvsge j!70 (size!49549 a!2804)))))

(assert (=> d!159683 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851675)))

(declare-fun b!1528064 () Bool)

(declare-fun e!851674 () Bool)

(declare-fun e!851676 () Bool)

(assert (=> b!1528064 (= e!851674 e!851676)))

(declare-fun lt!661714 () (_ BitVec 64))

(assert (=> b!1528064 (= lt!661714 (select (arr!48999 a!2804) j!70))))

(declare-fun lt!661715 () Unit!51112)

(assert (=> b!1528064 (= lt!661715 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661714 j!70))))

(assert (=> b!1528064 (arrayContainsKey!0 a!2804 lt!661714 #b00000000000000000000000000000000)))

(declare-fun lt!661713 () Unit!51112)

(assert (=> b!1528064 (= lt!661713 lt!661715)))

(declare-fun res!1045822 () Bool)

(assert (=> b!1528064 (= res!1045822 (= (seekEntryOrOpen!0 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) (Found!13164 j!70)))))

(assert (=> b!1528064 (=> (not res!1045822) (not e!851676))))

(declare-fun b!1528065 () Bool)

(assert (=> b!1528065 (= e!851674 call!68487)))

(declare-fun b!1528066 () Bool)

(assert (=> b!1528066 (= e!851675 e!851674)))

(declare-fun c!140675 () Bool)

(assert (=> b!1528066 (= c!140675 (validKeyInArray!0 (select (arr!48999 a!2804) j!70)))))

(declare-fun b!1528067 () Bool)

(assert (=> b!1528067 (= e!851676 call!68487)))

(assert (= (and d!159683 (not res!1045821)) b!1528066))

(assert (= (and b!1528066 c!140675) b!1528064))

(assert (= (and b!1528066 (not c!140675)) b!1528065))

(assert (= (and b!1528064 res!1045822) b!1528067))

(assert (= (or b!1528067 b!1528065) bm!68484))

(declare-fun m!1410881 () Bool)

(assert (=> bm!68484 m!1410881))

(assert (=> b!1528064 m!1410577))

(declare-fun m!1410883 () Bool)

(assert (=> b!1528064 m!1410883))

(declare-fun m!1410885 () Bool)

(assert (=> b!1528064 m!1410885))

(assert (=> b!1528064 m!1410577))

(assert (=> b!1528064 m!1410581))

(assert (=> b!1528066 m!1410577))

(assert (=> b!1528066 m!1410577))

(assert (=> b!1528066 m!1410611))

(assert (=> b!1527659 d!159683))

(declare-fun d!159685 () Bool)

(assert (=> d!159685 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661718 () Unit!51112)

(declare-fun choose!38 (array!101545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51112)

(assert (=> d!159685 (= lt!661718 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159685 (validMask!0 mask!2512)))

(assert (=> d!159685 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661718)))

(declare-fun bs!43821 () Bool)

(assert (= bs!43821 d!159685))

(assert (=> bs!43821 m!1410617))

(declare-fun m!1410887 () Bool)

(assert (=> bs!43821 m!1410887))

(assert (=> bs!43821 m!1410603))

(assert (=> b!1527659 d!159685))

(declare-fun b!1528080 () Bool)

(declare-fun c!140683 () Bool)

(declare-fun lt!661727 () (_ BitVec 64))

(assert (=> b!1528080 (= c!140683 (= lt!661727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851684 () SeekEntryResult!13164)

(declare-fun e!851683 () SeekEntryResult!13164)

(assert (=> b!1528080 (= e!851684 e!851683)))

(declare-fun b!1528081 () Bool)

(declare-fun lt!661730 () SeekEntryResult!13164)

(assert (=> b!1528081 (= e!851684 (Found!13164 (index!55053 lt!661730)))))

(declare-fun b!1528083 () Bool)

(declare-fun lt!661728 () SeekEntryResult!13164)

(assert (=> b!1528083 (= e!851683 (ite ((_ is MissingVacant!13164) lt!661728) (MissingZero!13164 (index!55054 lt!661728)) lt!661728))))

(assert (=> b!1528083 (= lt!661728 (seekKeyOrZeroReturnVacant!0 (x!136738 lt!661730) (index!55053 lt!661730) (index!55053 lt!661730) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528082 () Bool)

(declare-fun e!851685 () SeekEntryResult!13164)

(assert (=> b!1528082 (= e!851685 e!851684)))

(assert (=> b!1528082 (= lt!661727 (select (arr!48999 a!2804) (index!55053 lt!661730)))))

(declare-fun c!140684 () Bool)

(assert (=> b!1528082 (= c!140684 (= lt!661727 (select (arr!48999 a!2804) j!70)))))

(declare-fun d!159687 () Bool)

(declare-fun lt!661729 () SeekEntryResult!13164)

(assert (=> d!159687 (and (or ((_ is MissingVacant!13164) lt!661729) (not ((_ is Found!13164) lt!661729)) (and (bvsge (index!55052 lt!661729) #b00000000000000000000000000000000) (bvslt (index!55052 lt!661729) (size!49549 a!2804)))) (not ((_ is MissingVacant!13164) lt!661729)) (or (not ((_ is Found!13164) lt!661729)) (= (select (arr!48999 a!2804) (index!55052 lt!661729)) (select (arr!48999 a!2804) j!70))))))

(assert (=> d!159687 (= lt!661729 e!851685)))

(declare-fun c!140682 () Bool)

(assert (=> d!159687 (= c!140682 (and ((_ is Intermediate!13164) lt!661730) (undefined!13976 lt!661730)))))

(assert (=> d!159687 (= lt!661730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159687 (validMask!0 mask!2512)))

(assert (=> d!159687 (= (seekEntry!0 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661729)))

(declare-fun b!1528084 () Bool)

(assert (=> b!1528084 (= e!851685 Undefined!13164)))

(declare-fun b!1528085 () Bool)

(assert (=> b!1528085 (= e!851683 (MissingZero!13164 (index!55053 lt!661730)))))

(assert (= (and d!159687 c!140682) b!1528084))

(assert (= (and d!159687 (not c!140682)) b!1528082))

(assert (= (and b!1528082 c!140684) b!1528081))

(assert (= (and b!1528082 (not c!140684)) b!1528080))

(assert (= (and b!1528080 c!140683) b!1528085))

(assert (= (and b!1528080 (not c!140683)) b!1528083))

(assert (=> b!1528083 m!1410577))

(declare-fun m!1410889 () Bool)

(assert (=> b!1528083 m!1410889))

(declare-fun m!1410891 () Bool)

(assert (=> b!1528082 m!1410891))

(declare-fun m!1410893 () Bool)

(assert (=> d!159687 m!1410893))

(assert (=> d!159687 m!1410577))

(assert (=> d!159687 m!1410607))

(assert (=> d!159687 m!1410607))

(assert (=> d!159687 m!1410577))

(assert (=> d!159687 m!1410609))

(assert (=> d!159687 m!1410603))

(assert (=> b!1527665 d!159687))

(declare-fun d!159689 () Bool)

(assert (=> d!159689 (= (validKeyInArray!0 (select (arr!48999 a!2804) i!961)) (and (not (= (select (arr!48999 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48999 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527655 d!159689))

(declare-fun d!159691 () Bool)

(declare-fun res!1045830 () Bool)

(declare-fun e!851694 () Bool)

(assert (=> d!159691 (=> res!1045830 e!851694)))

(assert (=> d!159691 (= res!1045830 (bvsge #b00000000000000000000000000000000 (size!49549 a!2804)))))

(assert (=> d!159691 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35479) e!851694)))

(declare-fun b!1528096 () Bool)

(declare-fun e!851697 () Bool)

(declare-fun e!851695 () Bool)

(assert (=> b!1528096 (= e!851697 e!851695)))

(declare-fun c!140687 () Bool)

(assert (=> b!1528096 (= c!140687 (validKeyInArray!0 (select (arr!48999 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1528097 () Bool)

(declare-fun e!851696 () Bool)

(declare-fun contains!9995 (List!35482 (_ BitVec 64)) Bool)

(assert (=> b!1528097 (= e!851696 (contains!9995 Nil!35479 (select (arr!48999 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1528098 () Bool)

(assert (=> b!1528098 (= e!851694 e!851697)))

(declare-fun res!1045829 () Bool)

(assert (=> b!1528098 (=> (not res!1045829) (not e!851697))))

(assert (=> b!1528098 (= res!1045829 (not e!851696))))

(declare-fun res!1045831 () Bool)

(assert (=> b!1528098 (=> (not res!1045831) (not e!851696))))

(assert (=> b!1528098 (= res!1045831 (validKeyInArray!0 (select (arr!48999 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1528099 () Bool)

(declare-fun call!68490 () Bool)

(assert (=> b!1528099 (= e!851695 call!68490)))

(declare-fun b!1528100 () Bool)

(assert (=> b!1528100 (= e!851695 call!68490)))

(declare-fun bm!68487 () Bool)

(assert (=> bm!68487 (= call!68490 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140687 (Cons!35478 (select (arr!48999 a!2804) #b00000000000000000000000000000000) Nil!35479) Nil!35479)))))

(assert (= (and d!159691 (not res!1045830)) b!1528098))

(assert (= (and b!1528098 res!1045831) b!1528097))

(assert (= (and b!1528098 res!1045829) b!1528096))

(assert (= (and b!1528096 c!140687) b!1528100))

(assert (= (and b!1528096 (not c!140687)) b!1528099))

(assert (= (or b!1528100 b!1528099) bm!68487))

(assert (=> b!1528096 m!1410871))

(assert (=> b!1528096 m!1410871))

(assert (=> b!1528096 m!1410879))

(assert (=> b!1528097 m!1410871))

(assert (=> b!1528097 m!1410871))

(declare-fun m!1410895 () Bool)

(assert (=> b!1528097 m!1410895))

(assert (=> b!1528098 m!1410871))

(assert (=> b!1528098 m!1410871))

(assert (=> b!1528098 m!1410879))

(assert (=> bm!68487 m!1410871))

(declare-fun m!1410897 () Bool)

(assert (=> bm!68487 m!1410897))

(assert (=> b!1527662 d!159691))

(declare-fun b!1528101 () Bool)

(declare-fun lt!661732 () SeekEntryResult!13164)

(assert (=> b!1528101 (and (bvsge (index!55053 lt!661732) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661732) (size!49549 a!2804)))))

(declare-fun res!1045833 () Bool)

(assert (=> b!1528101 (= res!1045833 (= (select (arr!48999 a!2804) (index!55053 lt!661732)) (select (arr!48999 a!2804) j!70)))))

(declare-fun e!851701 () Bool)

(assert (=> b!1528101 (=> res!1045833 e!851701)))

(declare-fun e!851702 () Bool)

(assert (=> b!1528101 (= e!851702 e!851701)))

(declare-fun b!1528103 () Bool)

(declare-fun e!851698 () Bool)

(assert (=> b!1528103 (= e!851698 e!851702)))

(declare-fun res!1045834 () Bool)

(assert (=> b!1528103 (= res!1045834 (and ((_ is Intermediate!13164) lt!661732) (not (undefined!13976 lt!661732)) (bvslt (x!136738 lt!661732) #b01111111111111111111111111111110) (bvsge (x!136738 lt!661732) #b00000000000000000000000000000000) (bvsge (x!136738 lt!661732) #b00000000000000000000000000000000)))))

(assert (=> b!1528103 (=> (not res!1045834) (not e!851702))))

(declare-fun b!1528104 () Bool)

(declare-fun e!851700 () SeekEntryResult!13164)

(declare-fun e!851699 () SeekEntryResult!13164)

(assert (=> b!1528104 (= e!851700 e!851699)))

(declare-fun lt!661731 () (_ BitVec 64))

(declare-fun c!140688 () Bool)

(assert (=> b!1528104 (= c!140688 (or (= lt!661731 (select (arr!48999 a!2804) j!70)) (= (bvadd lt!661731 lt!661731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1528105 () Bool)

(assert (=> b!1528105 (= e!851699 (Intermediate!13164 false (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1528106 () Bool)

(assert (=> b!1528106 (and (bvsge (index!55053 lt!661732) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661732) (size!49549 a!2804)))))

(declare-fun res!1045832 () Bool)

(assert (=> b!1528106 (= res!1045832 (= (select (arr!48999 a!2804) (index!55053 lt!661732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1528106 (=> res!1045832 e!851701)))

(declare-fun b!1528107 () Bool)

(assert (=> b!1528107 (= e!851700 (Intermediate!13164 true (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1528102 () Bool)

(assert (=> b!1528102 (= e!851699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159693 () Bool)

(assert (=> d!159693 e!851698))

(declare-fun c!140689 () Bool)

(assert (=> d!159693 (= c!140689 (and ((_ is Intermediate!13164) lt!661732) (undefined!13976 lt!661732)))))

(assert (=> d!159693 (= lt!661732 e!851700)))

(declare-fun c!140690 () Bool)

(assert (=> d!159693 (= c!140690 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159693 (= lt!661731 (select (arr!48999 a!2804) (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512)))))

(assert (=> d!159693 (validMask!0 mask!2512)))

(assert (=> d!159693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661732)))

(declare-fun b!1528108 () Bool)

(assert (=> b!1528108 (= e!851698 (bvsge (x!136738 lt!661732) #b01111111111111111111111111111110))))

(declare-fun b!1528109 () Bool)

(assert (=> b!1528109 (and (bvsge (index!55053 lt!661732) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661732) (size!49549 a!2804)))))

(assert (=> b!1528109 (= e!851701 (= (select (arr!48999 a!2804) (index!55053 lt!661732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159693 c!140690) b!1528107))

(assert (= (and d!159693 (not c!140690)) b!1528104))

(assert (= (and b!1528104 c!140688) b!1528105))

(assert (= (and b!1528104 (not c!140688)) b!1528102))

(assert (= (and d!159693 c!140689) b!1528108))

(assert (= (and d!159693 (not c!140689)) b!1528103))

(assert (= (and b!1528103 res!1045834) b!1528101))

(assert (= (and b!1528101 (not res!1045833)) b!1528106))

(assert (= (and b!1528106 (not res!1045832)) b!1528109))

(declare-fun m!1410899 () Bool)

(assert (=> b!1528109 m!1410899))

(assert (=> b!1528106 m!1410899))

(assert (=> b!1528101 m!1410899))

(assert (=> b!1528102 m!1410607))

(declare-fun m!1410901 () Bool)

(assert (=> b!1528102 m!1410901))

(assert (=> b!1528102 m!1410901))

(assert (=> b!1528102 m!1410577))

(declare-fun m!1410903 () Bool)

(assert (=> b!1528102 m!1410903))

(assert (=> d!159693 m!1410607))

(declare-fun m!1410905 () Bool)

(assert (=> d!159693 m!1410905))

(assert (=> d!159693 m!1410603))

(assert (=> b!1527663 d!159693))

(declare-fun d!159695 () Bool)

(declare-fun lt!661734 () (_ BitVec 32))

(declare-fun lt!661733 () (_ BitVec 32))

(assert (=> d!159695 (= lt!661734 (bvmul (bvxor lt!661733 (bvlshr lt!661733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159695 (= lt!661733 ((_ extract 31 0) (bvand (bvxor (select (arr!48999 a!2804) j!70) (bvlshr (select (arr!48999 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159695 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1045814 (let ((h!36915 ((_ extract 31 0) (bvand (bvxor (select (arr!48999 a!2804) j!70) (bvlshr (select (arr!48999 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136748 (bvmul (bvxor h!36915 (bvlshr h!36915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136748 (bvlshr x!136748 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1045814 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1045814 #b00000000000000000000000000000000))))))

(assert (=> d!159695 (= (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) (bvand (bvxor lt!661734 (bvlshr lt!661734 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527663 d!159695))

(declare-fun b!1528110 () Bool)

(declare-fun e!851704 () SeekEntryResult!13164)

(declare-fun e!851703 () SeekEntryResult!13164)

(assert (=> b!1528110 (= e!851704 e!851703)))

(declare-fun lt!661736 () (_ BitVec 64))

(declare-fun c!140691 () Bool)

(assert (=> b!1528110 (= c!140691 (= lt!661736 (select (arr!48999 a!2804) j!70)))))

(declare-fun e!851705 () SeekEntryResult!13164)

(declare-fun b!1528111 () Bool)

(assert (=> b!1528111 (= e!851705 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528112 () Bool)

(assert (=> b!1528112 (= e!851704 Undefined!13164)))

(declare-fun b!1528113 () Bool)

(assert (=> b!1528113 (= e!851703 (Found!13164 index!487))))

(declare-fun b!1528114 () Bool)

(assert (=> b!1528114 (= e!851705 (MissingVacant!13164 index!487))))

(declare-fun lt!661735 () SeekEntryResult!13164)

(declare-fun d!159697 () Bool)

(assert (=> d!159697 (and (or ((_ is Undefined!13164) lt!661735) (not ((_ is Found!13164) lt!661735)) (and (bvsge (index!55052 lt!661735) #b00000000000000000000000000000000) (bvslt (index!55052 lt!661735) (size!49549 a!2804)))) (or ((_ is Undefined!13164) lt!661735) ((_ is Found!13164) lt!661735) (not ((_ is MissingVacant!13164) lt!661735)) (not (= (index!55054 lt!661735) index!487)) (and (bvsge (index!55054 lt!661735) #b00000000000000000000000000000000) (bvslt (index!55054 lt!661735) (size!49549 a!2804)))) (or ((_ is Undefined!13164) lt!661735) (ite ((_ is Found!13164) lt!661735) (= (select (arr!48999 a!2804) (index!55052 lt!661735)) (select (arr!48999 a!2804) j!70)) (and ((_ is MissingVacant!13164) lt!661735) (= (index!55054 lt!661735) index!487) (= (select (arr!48999 a!2804) (index!55054 lt!661735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159697 (= lt!661735 e!851704)))

(declare-fun c!140693 () Bool)

(assert (=> d!159697 (= c!140693 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159697 (= lt!661736 (select (arr!48999 a!2804) index!487))))

(assert (=> d!159697 (validMask!0 mask!2512)))

(assert (=> d!159697 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661735)))

(declare-fun b!1528115 () Bool)

(declare-fun c!140692 () Bool)

(assert (=> b!1528115 (= c!140692 (= lt!661736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1528115 (= e!851703 e!851705)))

(assert (= (and d!159697 c!140693) b!1528112))

(assert (= (and d!159697 (not c!140693)) b!1528110))

(assert (= (and b!1528110 c!140691) b!1528113))

(assert (= (and b!1528110 (not c!140691)) b!1528115))

(assert (= (and b!1528115 c!140692) b!1528114))

(assert (= (and b!1528115 (not c!140692)) b!1528111))

(assert (=> b!1528111 m!1410807))

(assert (=> b!1528111 m!1410807))

(assert (=> b!1528111 m!1410577))

(declare-fun m!1410907 () Bool)

(assert (=> b!1528111 m!1410907))

(declare-fun m!1410909 () Bool)

(assert (=> d!159697 m!1410909))

(declare-fun m!1410911 () Bool)

(assert (=> d!159697 m!1410911))

(assert (=> d!159697 m!1410615))

(assert (=> d!159697 m!1410603))

(assert (=> b!1527653 d!159697))

(declare-fun e!851708 () SeekEntryResult!13164)

(declare-fun b!1528116 () Bool)

(declare-fun lt!661737 () SeekEntryResult!13164)

(assert (=> b!1528116 (= e!851708 (seekKeyOrZeroReturnVacant!0 (x!136738 lt!661737) (index!55053 lt!661737) (index!55053 lt!661737) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159699 () Bool)

(declare-fun lt!661739 () SeekEntryResult!13164)

(assert (=> d!159699 (and (or ((_ is Undefined!13164) lt!661739) (not ((_ is Found!13164) lt!661739)) (and (bvsge (index!55052 lt!661739) #b00000000000000000000000000000000) (bvslt (index!55052 lt!661739) (size!49549 a!2804)))) (or ((_ is Undefined!13164) lt!661739) ((_ is Found!13164) lt!661739) (not ((_ is MissingZero!13164) lt!661739)) (and (bvsge (index!55051 lt!661739) #b00000000000000000000000000000000) (bvslt (index!55051 lt!661739) (size!49549 a!2804)))) (or ((_ is Undefined!13164) lt!661739) ((_ is Found!13164) lt!661739) ((_ is MissingZero!13164) lt!661739) (not ((_ is MissingVacant!13164) lt!661739)) (and (bvsge (index!55054 lt!661739) #b00000000000000000000000000000000) (bvslt (index!55054 lt!661739) (size!49549 a!2804)))) (or ((_ is Undefined!13164) lt!661739) (ite ((_ is Found!13164) lt!661739) (= (select (arr!48999 a!2804) (index!55052 lt!661739)) (select (arr!48999 a!2804) j!70)) (ite ((_ is MissingZero!13164) lt!661739) (= (select (arr!48999 a!2804) (index!55051 lt!661739)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13164) lt!661739) (= (select (arr!48999 a!2804) (index!55054 lt!661739)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851706 () SeekEntryResult!13164)

(assert (=> d!159699 (= lt!661739 e!851706)))

(declare-fun c!140696 () Bool)

(assert (=> d!159699 (= c!140696 (and ((_ is Intermediate!13164) lt!661737) (undefined!13976 lt!661737)))))

(assert (=> d!159699 (= lt!661737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48999 a!2804) j!70) mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159699 (validMask!0 mask!2512)))

(assert (=> d!159699 (= (seekEntryOrOpen!0 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661739)))

(declare-fun b!1528117 () Bool)

(assert (=> b!1528117 (= e!851708 (MissingZero!13164 (index!55053 lt!661737)))))

(declare-fun b!1528118 () Bool)

(declare-fun e!851707 () SeekEntryResult!13164)

(assert (=> b!1528118 (= e!851706 e!851707)))

(declare-fun lt!661738 () (_ BitVec 64))

(assert (=> b!1528118 (= lt!661738 (select (arr!48999 a!2804) (index!55053 lt!661737)))))

(declare-fun c!140694 () Bool)

(assert (=> b!1528118 (= c!140694 (= lt!661738 (select (arr!48999 a!2804) j!70)))))

(declare-fun b!1528119 () Bool)

(assert (=> b!1528119 (= e!851706 Undefined!13164)))

(declare-fun b!1528120 () Bool)

(declare-fun c!140695 () Bool)

(assert (=> b!1528120 (= c!140695 (= lt!661738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1528120 (= e!851707 e!851708)))

(declare-fun b!1528121 () Bool)

(assert (=> b!1528121 (= e!851707 (Found!13164 (index!55053 lt!661737)))))

(assert (= (and d!159699 c!140696) b!1528119))

(assert (= (and d!159699 (not c!140696)) b!1528118))

(assert (= (and b!1528118 c!140694) b!1528121))

(assert (= (and b!1528118 (not c!140694)) b!1528120))

(assert (= (and b!1528120 c!140695) b!1528117))

(assert (= (and b!1528120 (not c!140695)) b!1528116))

(assert (=> b!1528116 m!1410577))

(declare-fun m!1410913 () Bool)

(assert (=> b!1528116 m!1410913))

(declare-fun m!1410915 () Bool)

(assert (=> d!159699 m!1410915))

(assert (=> d!159699 m!1410577))

(assert (=> d!159699 m!1410607))

(assert (=> d!159699 m!1410607))

(assert (=> d!159699 m!1410577))

(assert (=> d!159699 m!1410609))

(assert (=> d!159699 m!1410603))

(declare-fun m!1410917 () Bool)

(assert (=> d!159699 m!1410917))

(declare-fun m!1410919 () Bool)

(assert (=> d!159699 m!1410919))

(declare-fun m!1410921 () Bool)

(assert (=> b!1528118 m!1410921))

(assert (=> b!1527653 d!159699))

(declare-fun b!1528122 () Bool)

(declare-fun lt!661741 () SeekEntryResult!13164)

(assert (=> b!1528122 (and (bvsge (index!55053 lt!661741) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661741) (size!49549 a!2804)))))

(declare-fun res!1045836 () Bool)

(assert (=> b!1528122 (= res!1045836 (= (select (arr!48999 a!2804) (index!55053 lt!661741)) (select (arr!48999 a!2804) j!70)))))

(declare-fun e!851712 () Bool)

(assert (=> b!1528122 (=> res!1045836 e!851712)))

(declare-fun e!851713 () Bool)

(assert (=> b!1528122 (= e!851713 e!851712)))

(declare-fun b!1528124 () Bool)

(declare-fun e!851709 () Bool)

(assert (=> b!1528124 (= e!851709 e!851713)))

(declare-fun res!1045837 () Bool)

(assert (=> b!1528124 (= res!1045837 (and ((_ is Intermediate!13164) lt!661741) (not (undefined!13976 lt!661741)) (bvslt (x!136738 lt!661741) #b01111111111111111111111111111110) (bvsge (x!136738 lt!661741) #b00000000000000000000000000000000) (bvsge (x!136738 lt!661741) x!534)))))

(assert (=> b!1528124 (=> (not res!1045837) (not e!851713))))

(declare-fun b!1528125 () Bool)

(declare-fun e!851711 () SeekEntryResult!13164)

(declare-fun e!851710 () SeekEntryResult!13164)

(assert (=> b!1528125 (= e!851711 e!851710)))

(declare-fun c!140697 () Bool)

(declare-fun lt!661740 () (_ BitVec 64))

(assert (=> b!1528125 (= c!140697 (or (= lt!661740 (select (arr!48999 a!2804) j!70)) (= (bvadd lt!661740 lt!661740) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1528126 () Bool)

(assert (=> b!1528126 (= e!851710 (Intermediate!13164 false index!487 x!534))))

(declare-fun b!1528127 () Bool)

(assert (=> b!1528127 (and (bvsge (index!55053 lt!661741) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661741) (size!49549 a!2804)))))

(declare-fun res!1045835 () Bool)

(assert (=> b!1528127 (= res!1045835 (= (select (arr!48999 a!2804) (index!55053 lt!661741)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1528127 (=> res!1045835 e!851712)))

(declare-fun b!1528128 () Bool)

(assert (=> b!1528128 (= e!851711 (Intermediate!13164 true index!487 x!534))))

(declare-fun b!1528123 () Bool)

(assert (=> b!1528123 (= e!851710 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48999 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159701 () Bool)

(assert (=> d!159701 e!851709))

(declare-fun c!140698 () Bool)

(assert (=> d!159701 (= c!140698 (and ((_ is Intermediate!13164) lt!661741) (undefined!13976 lt!661741)))))

(assert (=> d!159701 (= lt!661741 e!851711)))

(declare-fun c!140699 () Bool)

(assert (=> d!159701 (= c!140699 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159701 (= lt!661740 (select (arr!48999 a!2804) index!487))))

(assert (=> d!159701 (validMask!0 mask!2512)))

(assert (=> d!159701 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48999 a!2804) j!70) a!2804 mask!2512) lt!661741)))

(declare-fun b!1528129 () Bool)

(assert (=> b!1528129 (= e!851709 (bvsge (x!136738 lt!661741) #b01111111111111111111111111111110))))

(declare-fun b!1528130 () Bool)

(assert (=> b!1528130 (and (bvsge (index!55053 lt!661741) #b00000000000000000000000000000000) (bvslt (index!55053 lt!661741) (size!49549 a!2804)))))

(assert (=> b!1528130 (= e!851712 (= (select (arr!48999 a!2804) (index!55053 lt!661741)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159701 c!140699) b!1528128))

(assert (= (and d!159701 (not c!140699)) b!1528125))

(assert (= (and b!1528125 c!140697) b!1528126))

(assert (= (and b!1528125 (not c!140697)) b!1528123))

(assert (= (and d!159701 c!140698) b!1528129))

(assert (= (and d!159701 (not c!140698)) b!1528124))

(assert (= (and b!1528124 res!1045837) b!1528122))

(assert (= (and b!1528122 (not res!1045836)) b!1528127))

(assert (= (and b!1528127 (not res!1045835)) b!1528130))

(declare-fun m!1410923 () Bool)

(assert (=> b!1528130 m!1410923))

(assert (=> b!1528127 m!1410923))

(assert (=> b!1528122 m!1410923))

(assert (=> b!1528123 m!1410807))

(assert (=> b!1528123 m!1410807))

(assert (=> b!1528123 m!1410577))

(declare-fun m!1410925 () Bool)

(assert (=> b!1528123 m!1410925))

(assert (=> d!159701 m!1410615))

(assert (=> d!159701 m!1410603))

(assert (=> b!1527664 d!159701))

(check-sat (not b!1528116) (not d!159687) (not b!1528096) (not b!1528098) (not d!159693) (not b!1528097) (not b!1528066) (not d!159623) (not d!159699) (not b!1528044) (not bm!68483) (not bm!68487) (not b!1527951) (not d!159697) (not b!1527891) (not d!159639) (not b!1528083) (not b!1528062) (not bm!68484) (not b!1528123) (not d!159685) (not b!1528060) (not d!159671) (not b!1528111) (not b!1528102) (not d!159701) (not b!1528064))
