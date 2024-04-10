; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128718 () Bool)

(assert start!128718)

(declare-fun b!1508490 () Bool)

(declare-fun res!1028503 () Bool)

(declare-fun e!842722 () Bool)

(assert (=> b!1508490 (=> (not res!1028503) (not e!842722))))

(declare-datatypes ((array!100613 0))(
  ( (array!100614 (arr!48545 (Array (_ BitVec 32) (_ BitVec 64))) (size!49095 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100613)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508490 (= res!1028503 (validKeyInArray!0 (select (arr!48545 a!2804) j!70)))))

(declare-fun b!1508491 () Bool)

(declare-fun res!1028500 () Bool)

(assert (=> b!1508491 (=> (not res!1028500) (not e!842722))))

(declare-datatypes ((List!35028 0))(
  ( (Nil!35025) (Cons!35024 (h!36433 (_ BitVec 64)) (t!49722 List!35028)) )
))
(declare-fun arrayNoDuplicates!0 (array!100613 (_ BitVec 32) List!35028) Bool)

(assert (=> b!1508491 (= res!1028500 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35025))))

(declare-fun res!1028504 () Bool)

(assert (=> start!128718 (=> (not res!1028504) (not e!842722))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128718 (= res!1028504 (validMask!0 mask!2512))))

(assert (=> start!128718 e!842722))

(assert (=> start!128718 true))

(declare-fun array_inv!37573 (array!100613) Bool)

(assert (=> start!128718 (array_inv!37573 a!2804)))

(declare-fun b!1508492 () Bool)

(declare-fun res!1028498 () Bool)

(assert (=> b!1508492 (=> (not res!1028498) (not e!842722))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508492 (= res!1028498 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49095 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49095 a!2804))))))

(declare-fun b!1508493 () Bool)

(declare-fun e!842720 () Bool)

(assert (=> b!1508493 (= e!842722 e!842720)))

(declare-fun res!1028502 () Bool)

(assert (=> b!1508493 (=> (not res!1028502) (not e!842720))))

(declare-datatypes ((SeekEntryResult!12716 0))(
  ( (MissingZero!12716 (index!53259 (_ BitVec 32))) (Found!12716 (index!53260 (_ BitVec 32))) (Intermediate!12716 (undefined!13528 Bool) (index!53261 (_ BitVec 32)) (x!135020 (_ BitVec 32))) (Undefined!12716) (MissingVacant!12716 (index!53262 (_ BitVec 32))) )
))
(declare-fun lt!654642 () SeekEntryResult!12716)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100613 (_ BitVec 32)) SeekEntryResult!12716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508493 (= res!1028502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) (select (arr!48545 a!2804) j!70) a!2804 mask!2512) lt!654642))))

(assert (=> b!1508493 (= lt!654642 (Intermediate!12716 false resIndex!21 resX!21))))

(declare-fun b!1508494 () Bool)

(declare-fun res!1028506 () Bool)

(assert (=> b!1508494 (=> (not res!1028506) (not e!842722))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508494 (= res!1028506 (and (= (size!49095 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49095 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49095 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508495 () Bool)

(declare-fun res!1028501 () Bool)

(assert (=> b!1508495 (=> (not res!1028501) (not e!842722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100613 (_ BitVec 32)) Bool)

(assert (=> b!1508495 (= res!1028501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508496 () Bool)

(declare-fun res!1028505 () Bool)

(assert (=> b!1508496 (=> (not res!1028505) (not e!842722))))

(assert (=> b!1508496 (= res!1028505 (validKeyInArray!0 (select (arr!48545 a!2804) i!961)))))

(declare-fun b!1508497 () Bool)

(declare-fun lt!654643 () (_ BitVec 32))

(assert (=> b!1508497 (= e!842720 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654643 #b00000000000000000000000000000000) (bvsge lt!654643 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1508497 (= lt!654643 (toIndex!0 (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508498 () Bool)

(declare-fun res!1028499 () Bool)

(assert (=> b!1508498 (=> (not res!1028499) (not e!842720))))

(assert (=> b!1508498 (= res!1028499 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48545 a!2804) j!70) a!2804 mask!2512) lt!654642))))

(assert (= (and start!128718 res!1028504) b!1508494))

(assert (= (and b!1508494 res!1028506) b!1508496))

(assert (= (and b!1508496 res!1028505) b!1508490))

(assert (= (and b!1508490 res!1028503) b!1508495))

(assert (= (and b!1508495 res!1028501) b!1508491))

(assert (= (and b!1508491 res!1028500) b!1508492))

(assert (= (and b!1508492 res!1028498) b!1508493))

(assert (= (and b!1508493 res!1028502) b!1508498))

(assert (= (and b!1508498 res!1028499) b!1508497))

(declare-fun m!1390999 () Bool)

(assert (=> b!1508495 m!1390999))

(declare-fun m!1391001 () Bool)

(assert (=> b!1508491 m!1391001))

(declare-fun m!1391003 () Bool)

(assert (=> b!1508496 m!1391003))

(assert (=> b!1508496 m!1391003))

(declare-fun m!1391005 () Bool)

(assert (=> b!1508496 m!1391005))

(declare-fun m!1391007 () Bool)

(assert (=> b!1508497 m!1391007))

(declare-fun m!1391009 () Bool)

(assert (=> b!1508497 m!1391009))

(assert (=> b!1508497 m!1391009))

(declare-fun m!1391011 () Bool)

(assert (=> b!1508497 m!1391011))

(declare-fun m!1391013 () Bool)

(assert (=> start!128718 m!1391013))

(declare-fun m!1391015 () Bool)

(assert (=> start!128718 m!1391015))

(declare-fun m!1391017 () Bool)

(assert (=> b!1508498 m!1391017))

(assert (=> b!1508498 m!1391017))

(declare-fun m!1391019 () Bool)

(assert (=> b!1508498 m!1391019))

(assert (=> b!1508493 m!1391017))

(assert (=> b!1508493 m!1391017))

(declare-fun m!1391021 () Bool)

(assert (=> b!1508493 m!1391021))

(assert (=> b!1508493 m!1391021))

(assert (=> b!1508493 m!1391017))

(declare-fun m!1391023 () Bool)

(assert (=> b!1508493 m!1391023))

(assert (=> b!1508490 m!1391017))

(assert (=> b!1508490 m!1391017))

(declare-fun m!1391025 () Bool)

(assert (=> b!1508490 m!1391025))

(push 1)

(assert (not b!1508495))

(assert (not b!1508491))

(assert (not b!1508498))

(assert (not b!1508490))

(assert (not b!1508493))

(assert (not b!1508496))

(assert (not b!1508497))

(assert (not start!128718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1508615 () Bool)

(declare-fun lt!654687 () SeekEntryResult!12716)

(assert (=> b!1508615 (and (bvsge (index!53261 lt!654687) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654687) (size!49095 a!2804)))))

(declare-fun res!1028587 () Bool)

(assert (=> b!1508615 (= res!1028587 (= (select (arr!48545 a!2804) (index!53261 lt!654687)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842781 () Bool)

(assert (=> b!1508615 (=> res!1028587 e!842781)))

(declare-fun d!158447 () Bool)

(declare-fun e!842779 () Bool)

(assert (=> d!158447 e!842779))

(declare-fun c!139556 () Bool)

(assert (=> d!158447 (= c!139556 (and (is-Intermediate!12716 lt!654687) (undefined!13528 lt!654687)))))

(declare-fun e!842777 () SeekEntryResult!12716)

(assert (=> d!158447 (= lt!654687 e!842777)))

(declare-fun c!139557 () Bool)

(assert (=> d!158447 (= c!139557 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654686 () (_ BitVec 64))

(assert (=> d!158447 (= lt!654686 (select (arr!48545 a!2804) index!487))))

(assert (=> d!158447 (validMask!0 mask!2512)))

(assert (=> d!158447 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48545 a!2804) j!70) a!2804 mask!2512) lt!654687)))

(declare-fun b!1508616 () Bool)

(declare-fun e!842780 () SeekEntryResult!12716)

(assert (=> b!1508616 (= e!842780 (Intermediate!12716 false index!487 x!534))))

(declare-fun b!1508617 () Bool)

(assert (=> b!1508617 (and (bvsge (index!53261 lt!654687) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654687) (size!49095 a!2804)))))

(assert (=> b!1508617 (= e!842781 (= (select (arr!48545 a!2804) (index!53261 lt!654687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508618 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508618 (= e!842780 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48545 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508619 () Bool)

(assert (=> b!1508619 (= e!842777 (Intermediate!12716 true index!487 x!534))))

(declare-fun b!1508620 () Bool)

(assert (=> b!1508620 (= e!842779 (bvsge (x!135020 lt!654687) #b01111111111111111111111111111110))))

(declare-fun b!1508621 () Bool)

(declare-fun e!842778 () Bool)

(assert (=> b!1508621 (= e!842779 e!842778)))

(declare-fun res!1028586 () Bool)

(assert (=> b!1508621 (= res!1028586 (and (is-Intermediate!12716 lt!654687) (not (undefined!13528 lt!654687)) (bvslt (x!135020 lt!654687) #b01111111111111111111111111111110) (bvsge (x!135020 lt!654687) #b00000000000000000000000000000000) (bvsge (x!135020 lt!654687) x!534)))))

(assert (=> b!1508621 (=> (not res!1028586) (not e!842778))))

(declare-fun b!1508622 () Bool)

(assert (=> b!1508622 (= e!842777 e!842780)))

(declare-fun c!139558 () Bool)

(assert (=> b!1508622 (= c!139558 (or (= lt!654686 (select (arr!48545 a!2804) j!70)) (= (bvadd lt!654686 lt!654686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508623 () Bool)

(assert (=> b!1508623 (and (bvsge (index!53261 lt!654687) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654687) (size!49095 a!2804)))))

(declare-fun res!1028585 () Bool)

(assert (=> b!1508623 (= res!1028585 (= (select (arr!48545 a!2804) (index!53261 lt!654687)) (select (arr!48545 a!2804) j!70)))))

(assert (=> b!1508623 (=> res!1028585 e!842781)))

(assert (=> b!1508623 (= e!842778 e!842781)))

(assert (= (and d!158447 c!139557) b!1508619))

(assert (= (and d!158447 (not c!139557)) b!1508622))

(assert (= (and b!1508622 c!139558) b!1508616))

(assert (= (and b!1508622 (not c!139558)) b!1508618))

(assert (= (and d!158447 c!139556) b!1508620))

(assert (= (and d!158447 (not c!139556)) b!1508621))

(assert (= (and b!1508621 res!1028586) b!1508623))

(assert (= (and b!1508623 (not res!1028585)) b!1508615))

(assert (= (and b!1508615 (not res!1028587)) b!1508617))

(declare-fun m!1391099 () Bool)

(assert (=> d!158447 m!1391099))

(assert (=> d!158447 m!1391013))

(declare-fun m!1391101 () Bool)

(assert (=> b!1508618 m!1391101))

(assert (=> b!1508618 m!1391101))

(assert (=> b!1508618 m!1391017))

(declare-fun m!1391103 () Bool)

(assert (=> b!1508618 m!1391103))

(declare-fun m!1391105 () Bool)

(assert (=> b!1508623 m!1391105))

(assert (=> b!1508615 m!1391105))

(assert (=> b!1508617 m!1391105))

(assert (=> b!1508498 d!158447))

(declare-fun d!158461 () Bool)

(assert (=> d!158461 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128718 d!158461))

(declare-fun d!158471 () Bool)

(assert (=> d!158471 (= (array_inv!37573 a!2804) (bvsge (size!49095 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128718 d!158471))

(declare-fun b!1508636 () Bool)

(declare-fun lt!654698 () SeekEntryResult!12716)

(assert (=> b!1508636 (and (bvsge (index!53261 lt!654698) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654698) (size!49095 a!2804)))))

(declare-fun res!1028596 () Bool)

(assert (=> b!1508636 (= res!1028596 (= (select (arr!48545 a!2804) (index!53261 lt!654698)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842795 () Bool)

(assert (=> b!1508636 (=> res!1028596 e!842795)))

(declare-fun d!158473 () Bool)

(declare-fun e!842793 () Bool)

(assert (=> d!158473 e!842793))

(declare-fun c!139562 () Bool)

(assert (=> d!158473 (= c!139562 (and (is-Intermediate!12716 lt!654698) (undefined!13528 lt!654698)))))

(declare-fun e!842791 () SeekEntryResult!12716)

(assert (=> d!158473 (= lt!654698 e!842791)))

(declare-fun c!139563 () Bool)

(assert (=> d!158473 (= c!139563 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654697 () (_ BitVec 64))

(assert (=> d!158473 (= lt!654697 (select (arr!48545 a!2804) (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512)))))

(assert (=> d!158473 (validMask!0 mask!2512)))

(assert (=> d!158473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) (select (arr!48545 a!2804) j!70) a!2804 mask!2512) lt!654698)))

(declare-fun b!1508637 () Bool)

(declare-fun e!842794 () SeekEntryResult!12716)

(assert (=> b!1508637 (= e!842794 (Intermediate!12716 false (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508638 () Bool)

(assert (=> b!1508638 (and (bvsge (index!53261 lt!654698) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654698) (size!49095 a!2804)))))

(assert (=> b!1508638 (= e!842795 (= (select (arr!48545 a!2804) (index!53261 lt!654698)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508639 () Bool)

(assert (=> b!1508639 (= e!842794 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48545 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508640 () Bool)

(assert (=> b!1508640 (= e!842791 (Intermediate!12716 true (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508641 () Bool)

(assert (=> b!1508641 (= e!842793 (bvsge (x!135020 lt!654698) #b01111111111111111111111111111110))))

(declare-fun b!1508642 () Bool)

(declare-fun e!842792 () Bool)

(assert (=> b!1508642 (= e!842793 e!842792)))

(declare-fun res!1028595 () Bool)

(assert (=> b!1508642 (= res!1028595 (and (is-Intermediate!12716 lt!654698) (not (undefined!13528 lt!654698)) (bvslt (x!135020 lt!654698) #b01111111111111111111111111111110) (bvsge (x!135020 lt!654698) #b00000000000000000000000000000000) (bvsge (x!135020 lt!654698) #b00000000000000000000000000000000)))))

(assert (=> b!1508642 (=> (not res!1028595) (not e!842792))))

(declare-fun b!1508643 () Bool)

(assert (=> b!1508643 (= e!842791 e!842794)))

(declare-fun c!139564 () Bool)

(assert (=> b!1508643 (= c!139564 (or (= lt!654697 (select (arr!48545 a!2804) j!70)) (= (bvadd lt!654697 lt!654697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508644 () Bool)

(assert (=> b!1508644 (and (bvsge (index!53261 lt!654698) #b00000000000000000000000000000000) (bvslt (index!53261 lt!654698) (size!49095 a!2804)))))

(declare-fun res!1028594 () Bool)

(assert (=> b!1508644 (= res!1028594 (= (select (arr!48545 a!2804) (index!53261 lt!654698)) (select (arr!48545 a!2804) j!70)))))

(assert (=> b!1508644 (=> res!1028594 e!842795)))

(assert (=> b!1508644 (= e!842792 e!842795)))

(assert (= (and d!158473 c!139563) b!1508640))

(assert (= (and d!158473 (not c!139563)) b!1508643))

(assert (= (and b!1508643 c!139564) b!1508637))

(assert (= (and b!1508643 (not c!139564)) b!1508639))

(assert (= (and d!158473 c!139562) b!1508641))

(assert (= (and d!158473 (not c!139562)) b!1508642))

(assert (= (and b!1508642 res!1028595) b!1508644))

(assert (= (and b!1508644 (not res!1028594)) b!1508636))

(assert (= (and b!1508636 (not res!1028596)) b!1508638))

(assert (=> d!158473 m!1391021))

(declare-fun m!1391119 () Bool)

(assert (=> d!158473 m!1391119))

(assert (=> d!158473 m!1391013))

(assert (=> b!1508639 m!1391021))

(declare-fun m!1391121 () Bool)

(assert (=> b!1508639 m!1391121))

(assert (=> b!1508639 m!1391121))

(assert (=> b!1508639 m!1391017))

(declare-fun m!1391123 () Bool)

(assert (=> b!1508639 m!1391123))

(declare-fun m!1391125 () Bool)

(assert (=> b!1508644 m!1391125))

(assert (=> b!1508636 m!1391125))

(assert (=> b!1508638 m!1391125))

(assert (=> b!1508493 d!158473))

(declare-fun d!158475 () Bool)

(declare-fun lt!654709 () (_ BitVec 32))

(declare-fun lt!654708 () (_ BitVec 32))

(assert (=> d!158475 (= lt!654709 (bvmul (bvxor lt!654708 (bvlshr lt!654708 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158475 (= lt!654708 ((_ extract 31 0) (bvand (bvxor (select (arr!48545 a!2804) j!70) (bvlshr (select (arr!48545 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158475 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028599 (let ((h!36438 ((_ extract 31 0) (bvand (bvxor (select (arr!48545 a!2804) j!70) (bvlshr (select (arr!48545 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135027 (bvmul (bvxor h!36438 (bvlshr h!36438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135027 (bvlshr x!135027 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028599 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028599 #b00000000000000000000000000000000))))))

(assert (=> d!158475 (= (toIndex!0 (select (arr!48545 a!2804) j!70) mask!2512) (bvand (bvxor lt!654709 (bvlshr lt!654709 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508493 d!158475))

(declare-fun d!158483 () Bool)

(declare-fun lt!654711 () (_ BitVec 32))

(declare-fun lt!654710 () (_ BitVec 32))

(assert (=> d!158483 (= lt!654711 (bvmul (bvxor lt!654710 (bvlshr lt!654710 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158483 (= lt!654710 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158483 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028599 (let ((h!36438 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135027 (bvmul (bvxor h!36438 (bvlshr h!36438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135027 (bvlshr x!135027 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028599 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028599 #b00000000000000000000000000000000))))))

(assert (=> d!158483 (= (toIndex!0 (select (store (arr!48545 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!654711 (bvlshr lt!654711 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508497 d!158483))

(declare-fun d!158485 () Bool)

(assert (=> d!158485 (= (validKeyInArray!0 (select (arr!48545 a!2804) i!961)) (and (not (= (select (arr!48545 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48545 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508496 d!158485))

(declare-fun b!1508701 () Bool)

(declare-fun e!842836 () Bool)

(declare-fun call!68304 () Bool)

(assert (=> b!1508701 (= e!842836 call!68304)))

(declare-fun b!1508702 () Bool)

(declare-fun e!842837 () Bool)

(declare-fun contains!9974 (List!35028 (_ BitVec 64)) Bool)

(assert (=> b!1508702 (= e!842837 (contains!9974 Nil!35025 (select (arr!48545 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508703 () Bool)

(declare-fun e!842835 () Bool)

(declare-fun e!842834 () Bool)

(assert (=> b!1508703 (= e!842835 e!842834)))

(declare-fun res!1028624 () Bool)

(assert (=> b!1508703 (=> (not res!1028624) (not e!842834))))

(assert (=> b!1508703 (= res!1028624 (not e!842837))))

(declare-fun res!1028625 () Bool)

(assert (=> b!1508703 (=> (not res!1028625) (not e!842837))))

(assert (=> b!1508703 (= res!1028625 (validKeyInArray!0 (select (arr!48545 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158487 () Bool)

(declare-fun res!1028626 () Bool)

(assert (=> d!158487 (=> res!1028626 e!842835)))

(assert (=> d!158487 (= res!1028626 (bvsge #b00000000000000000000000000000000 (size!49095 a!2804)))))

(assert (=> d!158487 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35025) e!842835)))

(declare-fun b!1508704 () Bool)

(assert (=> b!1508704 (= e!842836 call!68304)))

(declare-fun bm!68301 () Bool)

(declare-fun c!139580 () Bool)

(assert (=> bm!68301 (= call!68304 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139580 (Cons!35024 (select (arr!48545 a!2804) #b00000000000000000000000000000000) Nil!35025) Nil!35025)))))

(declare-fun b!1508705 () Bool)

(assert (=> b!1508705 (= e!842834 e!842836)))

(assert (=> b!1508705 (= c!139580 (validKeyInArray!0 (select (arr!48545 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158487 (not res!1028626)) b!1508703))

(assert (= (and b!1508703 res!1028625) b!1508702))

(assert (= (and b!1508703 res!1028624) b!1508705))

(assert (= (and b!1508705 c!139580) b!1508701))

(assert (= (and b!1508705 (not c!139580)) b!1508704))

(assert (= (or b!1508701 b!1508704) bm!68301))

(declare-fun m!1391151 () Bool)

(assert (=> b!1508702 m!1391151))

(assert (=> b!1508702 m!1391151))

(declare-fun m!1391153 () Bool)

(assert (=> b!1508702 m!1391153))

(assert (=> b!1508703 m!1391151))

(assert (=> b!1508703 m!1391151))

(declare-fun m!1391155 () Bool)

(assert (=> b!1508703 m!1391155))

(assert (=> bm!68301 m!1391151))

(declare-fun m!1391157 () Bool)

(assert (=> bm!68301 m!1391157))

(assert (=> b!1508705 m!1391151))

(assert (=> b!1508705 m!1391151))

(assert (=> b!1508705 m!1391155))

(assert (=> b!1508491 d!158487))

(declare-fun d!158495 () Bool)

(assert (=> d!158495 (= (validKeyInArray!0 (select (arr!48545 a!2804) j!70)) (and (not (= (select (arr!48545 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48545 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508490 d!158495))

(declare-fun b!1508723 () Bool)

(declare-fun e!842849 () Bool)

(declare-fun call!68307 () Bool)

(assert (=> b!1508723 (= e!842849 call!68307)))

(declare-fun b!1508724 () Bool)

(declare-fun e!842851 () Bool)

(assert (=> b!1508724 (= e!842851 e!842849)))

(declare-fun c!139586 () Bool)

(assert (=> b!1508724 (= c!139586 (validKeyInArray!0 (select (arr!48545 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158497 () Bool)

(declare-fun res!1028634 () Bool)

(assert (=> d!158497 (=> res!1028634 e!842851)))

(assert (=> d!158497 (= res!1028634 (bvsge #b00000000000000000000000000000000 (size!49095 a!2804)))))

(assert (=> d!158497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842851)))

(declare-fun b!1508725 () Bool)

(declare-fun e!842850 () Bool)

(assert (=> b!1508725 (= e!842850 call!68307)))

(declare-fun bm!68304 () Bool)

(assert (=> bm!68304 (= call!68307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1508726 () Bool)

(assert (=> b!1508726 (= e!842849 e!842850)))

(declare-fun lt!654728 () (_ BitVec 64))

(assert (=> b!1508726 (= lt!654728 (select (arr!48545 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50346 0))(
  ( (Unit!50347) )
))
(declare-fun lt!654730 () Unit!50346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100613 (_ BitVec 64) (_ BitVec 32)) Unit!50346)

(assert (=> b!1508726 (= lt!654730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654728 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508726 (arrayContainsKey!0 a!2804 lt!654728 #b00000000000000000000000000000000)))

(declare-fun lt!654729 () Unit!50346)

(assert (=> b!1508726 (= lt!654729 lt!654730)))

(declare-fun res!1028635 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100613 (_ BitVec 32)) SeekEntryResult!12716)

(assert (=> b!1508726 (= res!1028635 (= (seekEntryOrOpen!0 (select (arr!48545 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12716 #b00000000000000000000000000000000)))))

(assert (=> b!1508726 (=> (not res!1028635) (not e!842850))))

(assert (= (and d!158497 (not res!1028634)) b!1508724))

(assert (= (and b!1508724 c!139586) b!1508726))

(assert (= (and b!1508724 (not c!139586)) b!1508723))

(assert (= (and b!1508726 res!1028635) b!1508725))

(assert (= (or b!1508725 b!1508723) bm!68304))

(assert (=> b!1508724 m!1391151))

(assert (=> b!1508724 m!1391151))

(assert (=> b!1508724 m!1391155))

(declare-fun m!1391167 () Bool)

(assert (=> bm!68304 m!1391167))

(assert (=> b!1508726 m!1391151))

(declare-fun m!1391169 () Bool)

(assert (=> b!1508726 m!1391169))

(declare-fun m!1391171 () Bool)

(assert (=> b!1508726 m!1391171))

(assert (=> b!1508726 m!1391151))

(declare-fun m!1391173 () Bool)

(assert (=> b!1508726 m!1391173))

(assert (=> b!1508495 d!158497))

(push 1)

(assert (not b!1508618))

(assert (not b!1508639))

(assert (not b!1508726))

(assert (not b!1508705))

(assert (not b!1508724))

(assert (not d!158473))

(assert (not b!1508702))

(assert (not bm!68304))

(assert (not bm!68301))

(assert (not d!158447))

(assert (not b!1508703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

