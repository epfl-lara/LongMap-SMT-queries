; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49450 () Bool)

(assert start!49450)

(declare-fun b!544557 () Bool)

(declare-fun res!338826 () Bool)

(declare-fun e!314817 () Bool)

(assert (=> b!544557 (=> (not res!338826) (not e!314817))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!34377 0))(
  ( (array!34378 (arr!16520 (Array (_ BitVec 32) (_ BitVec 64))) (size!16884 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34377)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!544557 (= res!338826 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16884 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16884 a!3154)) (= (select (arr!16520 a!3154) resIndex!32) (select (arr!16520 a!3154) j!147))))))

(declare-fun b!544558 () Bool)

(declare-fun e!314816 () Bool)

(assert (=> b!544558 (= e!314817 e!314816)))

(declare-fun res!338830 () Bool)

(assert (=> b!544558 (=> (not res!338830) (not e!314816))))

(declare-datatypes ((SeekEntryResult!4978 0))(
  ( (MissingZero!4978 (index!22136 (_ BitVec 32))) (Found!4978 (index!22137 (_ BitVec 32))) (Intermediate!4978 (undefined!5790 Bool) (index!22138 (_ BitVec 32)) (x!51048 (_ BitVec 32))) (Undefined!4978) (MissingVacant!4978 (index!22139 (_ BitVec 32))) )
))
(declare-fun lt!248521 () SeekEntryResult!4978)

(assert (=> b!544558 (= res!338830 (= lt!248521 (Intermediate!4978 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34377 (_ BitVec 32)) SeekEntryResult!4978)

(assert (=> b!544558 (= lt!248521 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16520 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544559 () Bool)

(declare-fun res!338822 () Bool)

(assert (=> b!544559 (=> (not res!338822) (not e!314816))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544559 (= res!338822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) (select (arr!16520 a!3154) j!147) a!3154 mask!3216) lt!248521))))

(declare-fun b!544560 () Bool)

(declare-fun e!314814 () Bool)

(assert (=> b!544560 (= e!314814 e!314817)))

(declare-fun res!338825 () Bool)

(assert (=> b!544560 (=> (not res!338825) (not e!314817))))

(declare-fun lt!248519 () SeekEntryResult!4978)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544560 (= res!338825 (or (= lt!248519 (MissingZero!4978 i!1153)) (= lt!248519 (MissingVacant!4978 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34377 (_ BitVec 32)) SeekEntryResult!4978)

(assert (=> b!544560 (= lt!248519 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544561 () Bool)

(declare-fun res!338821 () Bool)

(assert (=> b!544561 (=> (not res!338821) (not e!314814))))

(assert (=> b!544561 (= res!338821 (and (= (size!16884 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16884 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16884 a!3154)) (not (= i!1153 j!147))))))

(declare-fun lt!248520 () (_ BitVec 32))

(declare-fun b!544562 () Bool)

(assert (=> b!544562 (= e!314816 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (or (bvslt lt!248520 #b00000000000000000000000000000000) (bvsge lt!248520 (size!16884 a!3154)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544562 (= lt!248520 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544563 () Bool)

(declare-fun res!338824 () Bool)

(assert (=> b!544563 (=> (not res!338824) (not e!314817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34377 (_ BitVec 32)) Bool)

(assert (=> b!544563 (= res!338824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544564 () Bool)

(declare-fun res!338828 () Bool)

(assert (=> b!544564 (=> (not res!338828) (not e!314814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544564 (= res!338828 (validKeyInArray!0 k!1998))))

(declare-fun b!544566 () Bool)

(declare-fun res!338827 () Bool)

(assert (=> b!544566 (=> (not res!338827) (not e!314816))))

(assert (=> b!544566 (= res!338827 (and (not (= (select (arr!16520 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16520 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16520 a!3154) index!1177) (select (arr!16520 a!3154) j!147)))))))

(declare-fun b!544567 () Bool)

(declare-fun res!338820 () Bool)

(assert (=> b!544567 (=> (not res!338820) (not e!314814))))

(assert (=> b!544567 (= res!338820 (validKeyInArray!0 (select (arr!16520 a!3154) j!147)))))

(declare-fun b!544568 () Bool)

(declare-fun res!338831 () Bool)

(assert (=> b!544568 (=> (not res!338831) (not e!314814))))

(declare-fun arrayContainsKey!0 (array!34377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544568 (= res!338831 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338829 () Bool)

(assert (=> start!49450 (=> (not res!338829) (not e!314814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49450 (= res!338829 (validMask!0 mask!3216))))

(assert (=> start!49450 e!314814))

(assert (=> start!49450 true))

(declare-fun array_inv!12316 (array!34377) Bool)

(assert (=> start!49450 (array_inv!12316 a!3154)))

(declare-fun b!544565 () Bool)

(declare-fun res!338823 () Bool)

(assert (=> b!544565 (=> (not res!338823) (not e!314817))))

(declare-datatypes ((List!10639 0))(
  ( (Nil!10636) (Cons!10635 (h!11593 (_ BitVec 64)) (t!16867 List!10639)) )
))
(declare-fun arrayNoDuplicates!0 (array!34377 (_ BitVec 32) List!10639) Bool)

(assert (=> b!544565 (= res!338823 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10636))))

(assert (= (and start!49450 res!338829) b!544561))

(assert (= (and b!544561 res!338821) b!544567))

(assert (= (and b!544567 res!338820) b!544564))

(assert (= (and b!544564 res!338828) b!544568))

(assert (= (and b!544568 res!338831) b!544560))

(assert (= (and b!544560 res!338825) b!544563))

(assert (= (and b!544563 res!338824) b!544565))

(assert (= (and b!544565 res!338823) b!544557))

(assert (= (and b!544557 res!338826) b!544558))

(assert (= (and b!544558 res!338830) b!544559))

(assert (= (and b!544559 res!338822) b!544566))

(assert (= (and b!544566 res!338827) b!544562))

(declare-fun m!522435 () Bool)

(assert (=> start!49450 m!522435))

(declare-fun m!522437 () Bool)

(assert (=> start!49450 m!522437))

(declare-fun m!522439 () Bool)

(assert (=> b!544567 m!522439))

(assert (=> b!544567 m!522439))

(declare-fun m!522441 () Bool)

(assert (=> b!544567 m!522441))

(declare-fun m!522443 () Bool)

(assert (=> b!544562 m!522443))

(assert (=> b!544559 m!522439))

(assert (=> b!544559 m!522439))

(declare-fun m!522445 () Bool)

(assert (=> b!544559 m!522445))

(assert (=> b!544559 m!522445))

(assert (=> b!544559 m!522439))

(declare-fun m!522447 () Bool)

(assert (=> b!544559 m!522447))

(declare-fun m!522449 () Bool)

(assert (=> b!544560 m!522449))

(declare-fun m!522451 () Bool)

(assert (=> b!544566 m!522451))

(assert (=> b!544566 m!522439))

(declare-fun m!522453 () Bool)

(assert (=> b!544557 m!522453))

(assert (=> b!544557 m!522439))

(declare-fun m!522455 () Bool)

(assert (=> b!544565 m!522455))

(declare-fun m!522457 () Bool)

(assert (=> b!544564 m!522457))

(declare-fun m!522459 () Bool)

(assert (=> b!544563 m!522459))

(declare-fun m!522461 () Bool)

(assert (=> b!544568 m!522461))

(assert (=> b!544558 m!522439))

(assert (=> b!544558 m!522439))

(declare-fun m!522463 () Bool)

(assert (=> b!544558 m!522463))

(push 1)

(assert (not b!544562))

(assert (not b!544568))

(assert (not b!544558))

(assert (not b!544567))

(assert (not b!544563))

(assert (not b!544560))

(assert (not b!544565))

(assert (not start!49450))

(assert (not b!544564))

(assert (not b!544559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!544610 () Bool)

(declare-fun e!314848 () Bool)

(declare-fun call!32099 () Bool)

(assert (=> b!544610 (= e!314848 call!32099)))

(declare-fun b!544611 () Bool)

(declare-fun e!314847 () Bool)

(assert (=> b!544611 (= e!314847 call!32099)))

(declare-fun b!544612 () Bool)

(declare-fun e!314846 () Bool)

(assert (=> b!544612 (= e!314846 e!314847)))

(declare-fun c!63203 () Bool)

(assert (=> b!544612 (= c!63203 (validKeyInArray!0 (select (arr!16520 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32096 () Bool)

(assert (=> bm!32096 (= call!32099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544613 () Bool)

(assert (=> b!544613 (= e!314847 e!314848)))

(declare-fun lt!248538 () (_ BitVec 64))

(assert (=> b!544613 (= lt!248538 (select (arr!16520 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16912 0))(
  ( (Unit!16913) )
))
(declare-fun lt!248537 () Unit!16912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34377 (_ BitVec 64) (_ BitVec 32)) Unit!16912)

(assert (=> b!544613 (= lt!248537 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248538 #b00000000000000000000000000000000))))

(assert (=> b!544613 (arrayContainsKey!0 a!3154 lt!248538 #b00000000000000000000000000000000)))

(declare-fun lt!248536 () Unit!16912)

(assert (=> b!544613 (= lt!248536 lt!248537)))

(declare-fun res!338852 () Bool)

(assert (=> b!544613 (= res!338852 (= (seekEntryOrOpen!0 (select (arr!16520 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4978 #b00000000000000000000000000000000)))))

(assert (=> b!544613 (=> (not res!338852) (not e!314848))))

(declare-fun d!82101 () Bool)

(declare-fun res!338851 () Bool)

(assert (=> d!82101 (=> res!338851 e!314846)))

(assert (=> d!82101 (= res!338851 (bvsge #b00000000000000000000000000000000 (size!16884 a!3154)))))

(assert (=> d!82101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314846)))

(assert (= (and d!82101 (not res!338851)) b!544612))

(assert (= (and b!544612 c!63203) b!544613))

(assert (= (and b!544612 (not c!63203)) b!544611))

(assert (= (and b!544613 res!338852) b!544610))

(assert (= (or b!544610 b!544611) bm!32096))

(declare-fun m!522473 () Bool)

(assert (=> b!544612 m!522473))

(assert (=> b!544612 m!522473))

(declare-fun m!522475 () Bool)

(assert (=> b!544612 m!522475))

(declare-fun m!522477 () Bool)

(assert (=> bm!32096 m!522477))

(assert (=> b!544613 m!522473))

(declare-fun m!522479 () Bool)

(assert (=> b!544613 m!522479))

(declare-fun m!522481 () Bool)

(assert (=> b!544613 m!522481))

(assert (=> b!544613 m!522473))

(declare-fun m!522483 () Bool)

(assert (=> b!544613 m!522483))

(assert (=> b!544563 d!82101))

(declare-fun d!82103 () Bool)

(declare-fun res!338860 () Bool)

(declare-fun e!314864 () Bool)

(assert (=> d!82103 (=> res!338860 e!314864)))

(assert (=> d!82103 (= res!338860 (= (select (arr!16520 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!82103 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!314864)))

(declare-fun b!544639 () Bool)

(declare-fun e!314865 () Bool)

(assert (=> b!544639 (= e!314864 e!314865)))

(declare-fun res!338861 () Bool)

(assert (=> b!544639 (=> (not res!338861) (not e!314865))))

(assert (=> b!544639 (= res!338861 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16884 a!3154)))))

(declare-fun b!544640 () Bool)

(assert (=> b!544640 (= e!314865 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82103 (not res!338860)) b!544639))

(assert (= (and b!544639 res!338861) b!544640))

(assert (=> d!82103 m!522473))

(declare-fun m!522489 () Bool)

(assert (=> b!544640 m!522489))

(assert (=> b!544568 d!82103))

(declare-fun e!314904 () SeekEntryResult!4978)

(declare-fun b!544701 () Bool)

(assert (=> b!544701 (= e!314904 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16520 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544702 () Bool)

(declare-fun lt!248564 () SeekEntryResult!4978)

(assert (=> b!544702 (and (bvsge (index!22138 lt!248564) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248564) (size!16884 a!3154)))))

(declare-fun res!338888 () Bool)

(assert (=> b!544702 (= res!338888 (= (select (arr!16520 a!3154) (index!22138 lt!248564)) (select (arr!16520 a!3154) j!147)))))

(declare-fun e!314907 () Bool)

(assert (=> b!544702 (=> res!338888 e!314907)))

(declare-fun e!314905 () Bool)

(assert (=> b!544702 (= e!314905 e!314907)))

(declare-fun b!544703 () Bool)

(declare-fun e!314908 () SeekEntryResult!4978)

(assert (=> b!544703 (= e!314908 (Intermediate!4978 true index!1177 x!1030))))

(declare-fun b!544704 () Bool)

(declare-fun e!314906 () Bool)

(assert (=> b!544704 (= e!314906 e!314905)))

(declare-fun res!338886 () Bool)

(assert (=> b!544704 (= res!338886 (and (is-Intermediate!4978 lt!248564) (not (undefined!5790 lt!248564)) (bvslt (x!51048 lt!248564) #b01111111111111111111111111111110) (bvsge (x!51048 lt!248564) #b00000000000000000000000000000000) (bvsge (x!51048 lt!248564) x!1030)))))

(assert (=> b!544704 (=> (not res!338886) (not e!314905))))

(declare-fun b!544705 () Bool)

(assert (=> b!544705 (and (bvsge (index!22138 lt!248564) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248564) (size!16884 a!3154)))))

(declare-fun res!338887 () Bool)

(assert (=> b!544705 (= res!338887 (= (select (arr!16520 a!3154) (index!22138 lt!248564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544705 (=> res!338887 e!314907)))

(declare-fun b!544707 () Bool)

(assert (=> b!544707 (= e!314908 e!314904)))

(declare-fun lt!248563 () (_ BitVec 64))

(declare-fun c!63232 () Bool)

(assert (=> b!544707 (= c!63232 (or (= lt!248563 (select (arr!16520 a!3154) j!147)) (= (bvadd lt!248563 lt!248563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544708 () Bool)

(assert (=> b!544708 (and (bvsge (index!22138 lt!248564) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248564) (size!16884 a!3154)))))

(assert (=> b!544708 (= e!314907 (= (select (arr!16520 a!3154) (index!22138 lt!248564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544709 () Bool)

(assert (=> b!544709 (= e!314906 (bvsge (x!51048 lt!248564) #b01111111111111111111111111111110))))

(declare-fun d!82107 () Bool)

(assert (=> d!82107 e!314906))

(declare-fun c!63233 () Bool)

(assert (=> d!82107 (= c!63233 (and (is-Intermediate!4978 lt!248564) (undefined!5790 lt!248564)))))

(assert (=> d!82107 (= lt!248564 e!314908)))

(declare-fun c!63231 () Bool)

(assert (=> d!82107 (= c!63231 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!82107 (= lt!248563 (select (arr!16520 a!3154) index!1177))))

(assert (=> d!82107 (validMask!0 mask!3216)))

(assert (=> d!82107 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16520 a!3154) j!147) a!3154 mask!3216) lt!248564)))

(declare-fun b!544706 () Bool)

(assert (=> b!544706 (= e!314904 (Intermediate!4978 false index!1177 x!1030))))

(assert (= (and d!82107 c!63231) b!544703))

(assert (= (and d!82107 (not c!63231)) b!544707))

(assert (= (and b!544707 c!63232) b!544706))

(assert (= (and b!544707 (not c!63232)) b!544701))

(assert (= (and d!82107 c!63233) b!544709))

(assert (= (and d!82107 (not c!63233)) b!544704))

(assert (= (and b!544704 res!338886) b!544702))

(assert (= (and b!544702 (not res!338888)) b!544705))

(assert (= (and b!544705 (not res!338887)) b!544708))

(declare-fun m!522515 () Bool)

(assert (=> b!544708 m!522515))

(assert (=> b!544705 m!522515))

(assert (=> d!82107 m!522451))

(assert (=> d!82107 m!522435))

(assert (=> b!544701 m!522443))

(assert (=> b!544701 m!522443))

(assert (=> b!544701 m!522439))

(declare-fun m!522517 () Bool)

(assert (=> b!544701 m!522517))

(assert (=> b!544702 m!522515))

(assert (=> b!544558 d!82107))

(declare-fun d!82117 () Bool)

(assert (=> d!82117 (= (validKeyInArray!0 (select (arr!16520 a!3154) j!147)) (and (not (= (select (arr!16520 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16520 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544567 d!82117))

(declare-fun d!82119 () Bool)

(declare-fun lt!248569 () (_ BitVec 32))

(assert (=> d!82119 (and (bvsge lt!248569 #b00000000000000000000000000000000) (bvslt lt!248569 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82119 (= lt!248569 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82119 (validMask!0 mask!3216)))

(assert (=> d!82119 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248569)))

(declare-fun bs!16990 () Bool)

(assert (= bs!16990 d!82119))

(declare-fun m!522523 () Bool)

(assert (=> bs!16990 m!522523))

(assert (=> bs!16990 m!522435))

(assert (=> b!544562 d!82119))

(declare-fun d!82125 () Bool)

(assert (=> d!82125 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49450 d!82125))

(declare-fun d!82133 () Bool)

(assert (=> d!82133 (= (array_inv!12316 a!3154) (bvsge (size!16884 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49450 d!82133))

(declare-fun b!544800 () Bool)

(declare-fun e!314967 () SeekEntryResult!4978)

(declare-fun lt!248615 () SeekEntryResult!4978)

(assert (=> b!544800 (= e!314967 (Found!4978 (index!22138 lt!248615)))))

(declare-fun d!82137 () Bool)

(declare-fun lt!248614 () SeekEntryResult!4978)

(assert (=> d!82137 (and (or (is-Undefined!4978 lt!248614) (not (is-Found!4978 lt!248614)) (and (bvsge (index!22137 lt!248614) #b00000000000000000000000000000000) (bvslt (index!22137 lt!248614) (size!16884 a!3154)))) (or (is-Undefined!4978 lt!248614) (is-Found!4978 lt!248614) (not (is-MissingZero!4978 lt!248614)) (and (bvsge (index!22136 lt!248614) #b00000000000000000000000000000000) (bvslt (index!22136 lt!248614) (size!16884 a!3154)))) (or (is-Undefined!4978 lt!248614) (is-Found!4978 lt!248614) (is-MissingZero!4978 lt!248614) (not (is-MissingVacant!4978 lt!248614)) (and (bvsge (index!22139 lt!248614) #b00000000000000000000000000000000) (bvslt (index!22139 lt!248614) (size!16884 a!3154)))) (or (is-Undefined!4978 lt!248614) (ite (is-Found!4978 lt!248614) (= (select (arr!16520 a!3154) (index!22137 lt!248614)) k!1998) (ite (is-MissingZero!4978 lt!248614) (= (select (arr!16520 a!3154) (index!22136 lt!248614)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4978 lt!248614) (= (select (arr!16520 a!3154) (index!22139 lt!248614)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!314966 () SeekEntryResult!4978)

(assert (=> d!82137 (= lt!248614 e!314966)))

(declare-fun c!63265 () Bool)

(assert (=> d!82137 (= c!63265 (and (is-Intermediate!4978 lt!248615) (undefined!5790 lt!248615)))))

(assert (=> d!82137 (= lt!248615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82137 (validMask!0 mask!3216)))

(assert (=> d!82137 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248614)))

(declare-fun b!544801 () Bool)

(declare-fun e!314968 () SeekEntryResult!4978)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34377 (_ BitVec 32)) SeekEntryResult!4978)

(assert (=> b!544801 (= e!314968 (seekKeyOrZeroReturnVacant!0 (x!51048 lt!248615) (index!22138 lt!248615) (index!22138 lt!248615) k!1998 a!3154 mask!3216))))

(declare-fun b!544802 () Bool)

(assert (=> b!544802 (= e!314966 Undefined!4978)))

(declare-fun b!544803 () Bool)

(declare-fun c!63266 () Bool)

(declare-fun lt!248613 () (_ BitVec 64))

(assert (=> b!544803 (= c!63266 (= lt!248613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544803 (= e!314967 e!314968)))

(declare-fun b!544804 () Bool)

(assert (=> b!544804 (= e!314966 e!314967)))

(assert (=> b!544804 (= lt!248613 (select (arr!16520 a!3154) (index!22138 lt!248615)))))

(declare-fun c!63264 () Bool)

(assert (=> b!544804 (= c!63264 (= lt!248613 k!1998))))

(declare-fun b!544805 () Bool)

(assert (=> b!544805 (= e!314968 (MissingZero!4978 (index!22138 lt!248615)))))

(assert (= (and d!82137 c!63265) b!544802))

(assert (= (and d!82137 (not c!63265)) b!544804))

(assert (= (and b!544804 c!63264) b!544800))

(assert (= (and b!544804 (not c!63264)) b!544803))

(assert (= (and b!544803 c!63266) b!544805))

(assert (= (and b!544803 (not c!63266)) b!544801))

(declare-fun m!522575 () Bool)

(assert (=> d!82137 m!522575))

(declare-fun m!522577 () Bool)

(assert (=> d!82137 m!522577))

(declare-fun m!522579 () Bool)

(assert (=> d!82137 m!522579))

(declare-fun m!522581 () Bool)

(assert (=> d!82137 m!522581))

(assert (=> d!82137 m!522575))

(assert (=> d!82137 m!522435))

(declare-fun m!522583 () Bool)

(assert (=> d!82137 m!522583))

(declare-fun m!522585 () Bool)

(assert (=> b!544801 m!522585))

(declare-fun m!522587 () Bool)

(assert (=> b!544804 m!522587))

(assert (=> b!544560 d!82137))

(declare-fun e!314969 () SeekEntryResult!4978)

(declare-fun b!544806 () Bool)

(assert (=> b!544806 (= e!314969 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16520 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544807 () Bool)

(declare-fun lt!248617 () SeekEntryResult!4978)

(assert (=> b!544807 (and (bvsge (index!22138 lt!248617) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248617) (size!16884 a!3154)))))

(declare-fun res!338923 () Bool)

(assert (=> b!544807 (= res!338923 (= (select (arr!16520 a!3154) (index!22138 lt!248617)) (select (arr!16520 a!3154) j!147)))))

(declare-fun e!314972 () Bool)

(assert (=> b!544807 (=> res!338923 e!314972)))

(declare-fun e!314970 () Bool)

(assert (=> b!544807 (= e!314970 e!314972)))

(declare-fun b!544808 () Bool)

(declare-fun e!314973 () SeekEntryResult!4978)

(assert (=> b!544808 (= e!314973 (Intermediate!4978 true (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544809 () Bool)

(declare-fun e!314971 () Bool)

(assert (=> b!544809 (= e!314971 e!314970)))

(declare-fun res!338921 () Bool)

(assert (=> b!544809 (= res!338921 (and (is-Intermediate!4978 lt!248617) (not (undefined!5790 lt!248617)) (bvslt (x!51048 lt!248617) #b01111111111111111111111111111110) (bvsge (x!51048 lt!248617) #b00000000000000000000000000000000) (bvsge (x!51048 lt!248617) #b00000000000000000000000000000000)))))

(assert (=> b!544809 (=> (not res!338921) (not e!314970))))

(declare-fun b!544810 () Bool)

(assert (=> b!544810 (and (bvsge (index!22138 lt!248617) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248617) (size!16884 a!3154)))))

(declare-fun res!338922 () Bool)

(assert (=> b!544810 (= res!338922 (= (select (arr!16520 a!3154) (index!22138 lt!248617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544810 (=> res!338922 e!314972)))

(declare-fun b!544812 () Bool)

(assert (=> b!544812 (= e!314973 e!314969)))

(declare-fun lt!248616 () (_ BitVec 64))

(declare-fun c!63268 () Bool)

(assert (=> b!544812 (= c!63268 (or (= lt!248616 (select (arr!16520 a!3154) j!147)) (= (bvadd lt!248616 lt!248616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544813 () Bool)

(assert (=> b!544813 (and (bvsge (index!22138 lt!248617) #b00000000000000000000000000000000) (bvslt (index!22138 lt!248617) (size!16884 a!3154)))))

(assert (=> b!544813 (= e!314972 (= (select (arr!16520 a!3154) (index!22138 lt!248617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544814 () Bool)

(assert (=> b!544814 (= e!314971 (bvsge (x!51048 lt!248617) #b01111111111111111111111111111110))))

(declare-fun d!82149 () Bool)

(assert (=> d!82149 e!314971))

(declare-fun c!63269 () Bool)

(assert (=> d!82149 (= c!63269 (and (is-Intermediate!4978 lt!248617) (undefined!5790 lt!248617)))))

(assert (=> d!82149 (= lt!248617 e!314973)))

(declare-fun c!63267 () Bool)

(assert (=> d!82149 (= c!63267 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82149 (= lt!248616 (select (arr!16520 a!3154) (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216)))))

(assert (=> d!82149 (validMask!0 mask!3216)))

(assert (=> d!82149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) (select (arr!16520 a!3154) j!147) a!3154 mask!3216) lt!248617)))

(declare-fun b!544811 () Bool)

(assert (=> b!544811 (= e!314969 (Intermediate!4978 false (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

