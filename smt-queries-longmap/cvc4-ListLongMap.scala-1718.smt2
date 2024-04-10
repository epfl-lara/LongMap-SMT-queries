; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31656 () Bool)

(assert start!31656)

(declare-datatypes ((array!16129 0))(
  ( (array!16130 (arr!7633 (Array (_ BitVec 32) (_ BitVec 64))) (size!7985 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16129)

(declare-fun b!316590 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2773 0))(
  ( (MissingZero!2773 (index!13268 (_ BitVec 32))) (Found!2773 (index!13269 (_ BitVec 32))) (Intermediate!2773 (undefined!3585 Bool) (index!13270 (_ BitVec 32)) (x!31516 (_ BitVec 32))) (Undefined!2773) (MissingVacant!2773 (index!13271 (_ BitVec 32))) )
))
(declare-fun lt!154619 () SeekEntryResult!2773)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun e!196903 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16129 (_ BitVec 32)) SeekEntryResult!2773)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316590 (= e!196903 (not (= lt!154619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))))

(declare-fun b!316591 () Bool)

(declare-fun res!171523 () Bool)

(declare-fun e!196901 () Bool)

(assert (=> b!316591 (=> (not res!171523) (not e!196901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316591 (= res!171523 (validKeyInArray!0 k!2441))))

(declare-fun b!316592 () Bool)

(declare-fun res!171526 () Bool)

(declare-fun e!196902 () Bool)

(assert (=> b!316592 (=> (not res!171526) (not e!196902))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316592 (= res!171526 (and (= (select (arr!7633 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7985 a!3293))))))

(declare-fun b!316593 () Bool)

(assert (=> b!316593 (= e!196902 e!196903)))

(declare-fun res!171530 () Bool)

(assert (=> b!316593 (=> (not res!171530) (not e!196903))))

(declare-fun lt!154620 () SeekEntryResult!2773)

(assert (=> b!316593 (= res!171530 (and (= lt!154619 lt!154620) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7633 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316593 (= lt!154619 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316594 () Bool)

(declare-fun res!171531 () Bool)

(assert (=> b!316594 (=> (not res!171531) (not e!196901))))

(declare-fun arrayContainsKey!0 (array!16129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316594 (= res!171531 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316595 () Bool)

(assert (=> b!316595 (= e!196901 e!196902)))

(declare-fun res!171527 () Bool)

(assert (=> b!316595 (=> (not res!171527) (not e!196902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316595 (= res!171527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154620))))

(assert (=> b!316595 (= lt!154620 (Intermediate!2773 false resIndex!52 resX!52))))

(declare-fun b!316596 () Bool)

(declare-fun res!171524 () Bool)

(assert (=> b!316596 (=> (not res!171524) (not e!196901))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16129 (_ BitVec 32)) SeekEntryResult!2773)

(assert (=> b!316596 (= res!171524 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2773 i!1240)))))

(declare-fun b!316597 () Bool)

(declare-fun res!171528 () Bool)

(assert (=> b!316597 (=> (not res!171528) (not e!196901))))

(assert (=> b!316597 (= res!171528 (and (= (size!7985 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7985 a!3293))))))

(declare-fun res!171529 () Bool)

(assert (=> start!31656 (=> (not res!171529) (not e!196901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31656 (= res!171529 (validMask!0 mask!3709))))

(assert (=> start!31656 e!196901))

(declare-fun array_inv!5596 (array!16129) Bool)

(assert (=> start!31656 (array_inv!5596 a!3293)))

(assert (=> start!31656 true))

(declare-fun b!316598 () Bool)

(declare-fun res!171525 () Bool)

(assert (=> b!316598 (=> (not res!171525) (not e!196901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16129 (_ BitVec 32)) Bool)

(assert (=> b!316598 (= res!171525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31656 res!171529) b!316597))

(assert (= (and b!316597 res!171528) b!316591))

(assert (= (and b!316591 res!171523) b!316594))

(assert (= (and b!316594 res!171531) b!316596))

(assert (= (and b!316596 res!171524) b!316598))

(assert (= (and b!316598 res!171525) b!316595))

(assert (= (and b!316595 res!171527) b!316592))

(assert (= (and b!316592 res!171526) b!316593))

(assert (= (and b!316593 res!171530) b!316590))

(declare-fun m!325443 () Bool)

(assert (=> start!31656 m!325443))

(declare-fun m!325445 () Bool)

(assert (=> start!31656 m!325445))

(declare-fun m!325447 () Bool)

(assert (=> b!316595 m!325447))

(assert (=> b!316595 m!325447))

(declare-fun m!325449 () Bool)

(assert (=> b!316595 m!325449))

(declare-fun m!325451 () Bool)

(assert (=> b!316593 m!325451))

(declare-fun m!325453 () Bool)

(assert (=> b!316593 m!325453))

(declare-fun m!325455 () Bool)

(assert (=> b!316591 m!325455))

(declare-fun m!325457 () Bool)

(assert (=> b!316598 m!325457))

(declare-fun m!325459 () Bool)

(assert (=> b!316594 m!325459))

(declare-fun m!325461 () Bool)

(assert (=> b!316590 m!325461))

(assert (=> b!316590 m!325461))

(declare-fun m!325463 () Bool)

(assert (=> b!316590 m!325463))

(declare-fun m!325465 () Bool)

(assert (=> b!316592 m!325465))

(declare-fun m!325467 () Bool)

(assert (=> b!316596 m!325467))

(push 1)

(assert (not start!31656))

(assert (not b!316596))

(assert (not b!316598))

(assert (not b!316591))

(assert (not b!316595))

(assert (not b!316590))

(assert (not b!316593))

(assert (not b!316594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69053 () Bool)

(assert (=> d!69053 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31656 d!69053))

(declare-fun d!69057 () Bool)

(assert (=> d!69057 (= (array_inv!5596 a!3293) (bvsge (size!7985 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31656 d!69057))

(declare-fun b!316692 () Bool)

(declare-fun e!196957 () Bool)

(declare-fun e!196960 () Bool)

(assert (=> b!316692 (= e!196957 e!196960)))

(declare-fun res!171560 () Bool)

(declare-fun lt!154656 () SeekEntryResult!2773)

(assert (=> b!316692 (= res!171560 (and (is-Intermediate!2773 lt!154656) (not (undefined!3585 lt!154656)) (bvslt (x!31516 lt!154656) #b01111111111111111111111111111110) (bvsge (x!31516 lt!154656) #b00000000000000000000000000000000) (bvsge (x!31516 lt!154656) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316692 (=> (not res!171560) (not e!196960))))

(declare-fun b!316693 () Bool)

(assert (=> b!316693 (and (bvsge (index!13270 lt!154656) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154656) (size!7985 a!3293)))))

(declare-fun e!196959 () Bool)

(assert (=> b!316693 (= e!196959 (= (select (arr!7633 a!3293) (index!13270 lt!154656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316694 () Bool)

(declare-fun e!196958 () SeekEntryResult!2773)

(assert (=> b!316694 (= e!196958 (Intermediate!2773 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316695 () Bool)

(assert (=> b!316695 (= e!196958 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316696 () Bool)

(assert (=> b!316696 (and (bvsge (index!13270 lt!154656) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154656) (size!7985 a!3293)))))

(declare-fun res!171559 () Bool)

(assert (=> b!316696 (= res!171559 (= (select (arr!7633 a!3293) (index!13270 lt!154656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316696 (=> res!171559 e!196959)))

(declare-fun b!316697 () Bool)

(assert (=> b!316697 (and (bvsge (index!13270 lt!154656) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154656) (size!7985 a!3293)))))

(declare-fun res!171561 () Bool)

(assert (=> b!316697 (= res!171561 (= (select (arr!7633 a!3293) (index!13270 lt!154656)) k!2441))))

(assert (=> b!316697 (=> res!171561 e!196959)))

(assert (=> b!316697 (= e!196960 e!196959)))

(declare-fun d!69059 () Bool)

(assert (=> d!69059 e!196957))

(declare-fun c!50187 () Bool)

(assert (=> d!69059 (= c!50187 (and (is-Intermediate!2773 lt!154656) (undefined!3585 lt!154656)))))

(declare-fun e!196961 () SeekEntryResult!2773)

(assert (=> d!69059 (= lt!154656 e!196961)))

(declare-fun c!50185 () Bool)

(assert (=> d!69059 (= c!50185 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154657 () (_ BitVec 64))

(assert (=> d!69059 (= lt!154657 (select (arr!7633 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!69059 (validMask!0 mask!3709)))

(assert (=> d!69059 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154656)))

(declare-fun b!316698 () Bool)

(assert (=> b!316698 (= e!196961 e!196958)))

(declare-fun c!50186 () Bool)

(assert (=> b!316698 (= c!50186 (or (= lt!154657 k!2441) (= (bvadd lt!154657 lt!154657) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316699 () Bool)

(assert (=> b!316699 (= e!196961 (Intermediate!2773 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316700 () Bool)

(assert (=> b!316700 (= e!196957 (bvsge (x!31516 lt!154656) #b01111111111111111111111111111110))))

(assert (= (and d!69059 c!50185) b!316699))

(assert (= (and d!69059 (not c!50185)) b!316698))

(assert (= (and b!316698 c!50186) b!316694))

(assert (= (and b!316698 (not c!50186)) b!316695))

(assert (= (and d!69059 c!50187) b!316700))

(assert (= (and d!69059 (not c!50187)) b!316692))

(assert (= (and b!316692 res!171560) b!316697))

(assert (= (and b!316697 (not res!171561)) b!316696))

(assert (= (and b!316696 (not res!171559)) b!316693))

(declare-fun m!325513 () Bool)

(assert (=> b!316693 m!325513))

(assert (=> b!316697 m!325513))

(assert (=> b!316695 m!325461))

(declare-fun m!325515 () Bool)

(assert (=> b!316695 m!325515))

(assert (=> b!316695 m!325515))

(declare-fun m!325517 () Bool)

(assert (=> b!316695 m!325517))

(assert (=> b!316696 m!325513))

(assert (=> d!69059 m!325461))

(declare-fun m!325519 () Bool)

(assert (=> d!69059 m!325519))

(assert (=> d!69059 m!325443))

(assert (=> b!316590 d!69059))

(declare-fun d!69071 () Bool)

(declare-fun lt!154664 () (_ BitVec 32))

(assert (=> d!69071 (and (bvsge lt!154664 #b00000000000000000000000000000000) (bvslt lt!154664 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69071 (= lt!154664 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69071 (validMask!0 mask!3709)))

(assert (=> d!69071 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154664)))

(declare-fun bs!11052 () Bool)

(assert (= bs!11052 d!69071))

(declare-fun m!325521 () Bool)

(assert (=> bs!11052 m!325521))

(assert (=> bs!11052 m!325443))

(assert (=> b!316590 d!69071))

(declare-fun b!316709 () Bool)

(declare-fun e!196966 () Bool)

(declare-fun e!196969 () Bool)

(assert (=> b!316709 (= e!196966 e!196969)))

(declare-fun res!171564 () Bool)

(declare-fun lt!154665 () SeekEntryResult!2773)

(assert (=> b!316709 (= res!171564 (and (is-Intermediate!2773 lt!154665) (not (undefined!3585 lt!154665)) (bvslt (x!31516 lt!154665) #b01111111111111111111111111111110) (bvsge (x!31516 lt!154665) #b00000000000000000000000000000000) (bvsge (x!31516 lt!154665) x!1427)))))

(assert (=> b!316709 (=> (not res!171564) (not e!196969))))

(declare-fun b!316710 () Bool)

(assert (=> b!316710 (and (bvsge (index!13270 lt!154665) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154665) (size!7985 a!3293)))))

(declare-fun e!196968 () Bool)

(assert (=> b!316710 (= e!196968 (= (select (arr!7633 a!3293) (index!13270 lt!154665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316711 () Bool)

(declare-fun e!196967 () SeekEntryResult!2773)

(assert (=> b!316711 (= e!196967 (Intermediate!2773 false index!1781 x!1427))))

(declare-fun b!316712 () Bool)

(assert (=> b!316712 (= e!196967 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316713 () Bool)

(assert (=> b!316713 (and (bvsge (index!13270 lt!154665) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154665) (size!7985 a!3293)))))

(declare-fun res!171563 () Bool)

(assert (=> b!316713 (= res!171563 (= (select (arr!7633 a!3293) (index!13270 lt!154665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316713 (=> res!171563 e!196968)))

(declare-fun b!316714 () Bool)

(assert (=> b!316714 (and (bvsge (index!13270 lt!154665) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154665) (size!7985 a!3293)))))

(declare-fun res!171565 () Bool)

(assert (=> b!316714 (= res!171565 (= (select (arr!7633 a!3293) (index!13270 lt!154665)) k!2441))))

(assert (=> b!316714 (=> res!171565 e!196968)))

(assert (=> b!316714 (= e!196969 e!196968)))

(declare-fun d!69073 () Bool)

(assert (=> d!69073 e!196966))

(declare-fun c!50194 () Bool)

(assert (=> d!69073 (= c!50194 (and (is-Intermediate!2773 lt!154665) (undefined!3585 lt!154665)))))

(declare-fun e!196970 () SeekEntryResult!2773)

(assert (=> d!69073 (= lt!154665 e!196970)))

(declare-fun c!50192 () Bool)

(assert (=> d!69073 (= c!50192 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154666 () (_ BitVec 64))

(assert (=> d!69073 (= lt!154666 (select (arr!7633 a!3293) index!1781))))

(assert (=> d!69073 (validMask!0 mask!3709)))

(assert (=> d!69073 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154665)))

(declare-fun b!316715 () Bool)

(assert (=> b!316715 (= e!196970 e!196967)))

(declare-fun c!50193 () Bool)

(assert (=> b!316715 (= c!50193 (or (= lt!154666 k!2441) (= (bvadd lt!154666 lt!154666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316716 () Bool)

(assert (=> b!316716 (= e!196970 (Intermediate!2773 true index!1781 x!1427))))

(declare-fun b!316717 () Bool)

(assert (=> b!316717 (= e!196966 (bvsge (x!31516 lt!154665) #b01111111111111111111111111111110))))

(assert (= (and d!69073 c!50192) b!316716))

(assert (= (and d!69073 (not c!50192)) b!316715))

(assert (= (and b!316715 c!50193) b!316711))

(assert (= (and b!316715 (not c!50193)) b!316712))

(assert (= (and d!69073 c!50194) b!316717))

(assert (= (and d!69073 (not c!50194)) b!316709))

(assert (= (and b!316709 res!171564) b!316714))

(assert (= (and b!316714 (not res!171565)) b!316713))

(assert (= (and b!316713 (not res!171563)) b!316710))

(declare-fun m!325523 () Bool)

(assert (=> b!316710 m!325523))

(assert (=> b!316714 m!325523))

(assert (=> b!316712 m!325461))

(assert (=> b!316712 m!325461))

(declare-fun m!325525 () Bool)

(assert (=> b!316712 m!325525))

(assert (=> b!316713 m!325523))

(assert (=> d!69073 m!325451))

(assert (=> d!69073 m!325443))

(assert (=> b!316593 d!69073))

(declare-fun b!316722 () Bool)

(declare-fun e!196973 () Bool)

(declare-fun e!196976 () Bool)

(assert (=> b!316722 (= e!196973 e!196976)))

(declare-fun res!171567 () Bool)

(declare-fun lt!154671 () SeekEntryResult!2773)

(assert (=> b!316722 (= res!171567 (and (is-Intermediate!2773 lt!154671) (not (undefined!3585 lt!154671)) (bvslt (x!31516 lt!154671) #b01111111111111111111111111111110) (bvsge (x!31516 lt!154671) #b00000000000000000000000000000000) (bvsge (x!31516 lt!154671) #b00000000000000000000000000000000)))))

(assert (=> b!316722 (=> (not res!171567) (not e!196976))))

(declare-fun b!316723 () Bool)

(assert (=> b!316723 (and (bvsge (index!13270 lt!154671) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154671) (size!7985 a!3293)))))

(declare-fun e!196975 () Bool)

(assert (=> b!316723 (= e!196975 (= (select (arr!7633 a!3293) (index!13270 lt!154671)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316724 () Bool)

(declare-fun e!196974 () SeekEntryResult!2773)

(assert (=> b!316724 (= e!196974 (Intermediate!2773 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316725 () Bool)

(assert (=> b!316725 (= e!196974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316726 () Bool)

(assert (=> b!316726 (and (bvsge (index!13270 lt!154671) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154671) (size!7985 a!3293)))))

(declare-fun res!171566 () Bool)

(assert (=> b!316726 (= res!171566 (= (select (arr!7633 a!3293) (index!13270 lt!154671)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316726 (=> res!171566 e!196975)))

(declare-fun b!316727 () Bool)

(assert (=> b!316727 (and (bvsge (index!13270 lt!154671) #b00000000000000000000000000000000) (bvslt (index!13270 lt!154671) (size!7985 a!3293)))))

(declare-fun res!171568 () Bool)

(assert (=> b!316727 (= res!171568 (= (select (arr!7633 a!3293) (index!13270 lt!154671)) k!2441))))

(assert (=> b!316727 (=> res!171568 e!196975)))

(assert (=> b!316727 (= e!196976 e!196975)))

(declare-fun d!69075 () Bool)

(assert (=> d!69075 e!196973))

(declare-fun c!50199 () Bool)

(assert (=> d!69075 (= c!50199 (and (is-Intermediate!2773 lt!154671) (undefined!3585 lt!154671)))))

(declare-fun e!196977 () SeekEntryResult!2773)

(assert (=> d!69075 (= lt!154671 e!196977)))

(declare-fun c!50197 () Bool)

(assert (=> d!69075 (= c!50197 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154672 () (_ BitVec 64))

(assert (=> d!69075 (= lt!154672 (select (arr!7633 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69075 (validMask!0 mask!3709)))

(assert (=> d!69075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154671)))

(declare-fun b!316728 () Bool)

(assert (=> b!316728 (= e!196977 e!196974)))

(declare-fun c!50198 () Bool)

(assert (=> b!316728 (= c!50198 (or (= lt!154672 k!2441) (= (bvadd lt!154672 lt!154672) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316729 () Bool)

(assert (=> b!316729 (= e!196977 (Intermediate!2773 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316730 () Bool)

(assert (=> b!316730 (= e!196973 (bvsge (x!31516 lt!154671) #b01111111111111111111111111111110))))

(assert (= (and d!69075 c!50197) b!316729))

(assert (= (and d!69075 (not c!50197)) b!316728))

(assert (= (and b!316728 c!50198) b!316724))

(assert (= (and b!316728 (not c!50198)) b!316725))

(assert (= (and d!69075 c!50199) b!316730))

(assert (= (and d!69075 (not c!50199)) b!316722))

(assert (= (and b!316722 res!171567) b!316727))

(assert (= (and b!316727 (not res!171568)) b!316726))

(assert (= (and b!316726 (not res!171566)) b!316723))

(declare-fun m!325527 () Bool)

(assert (=> b!316723 m!325527))

(assert (=> b!316727 m!325527))

(assert (=> b!316725 m!325447))

(declare-fun m!325529 () Bool)

(assert (=> b!316725 m!325529))

(assert (=> b!316725 m!325529))

(declare-fun m!325531 () Bool)

(assert (=> b!316725 m!325531))

(assert (=> b!316726 m!325527))

(assert (=> d!69075 m!325447))

(declare-fun m!325533 () Bool)

(assert (=> d!69075 m!325533))

(assert (=> d!69075 m!325443))

(assert (=> b!316595 d!69075))

(declare-fun d!69079 () Bool)

(declare-fun lt!154682 () (_ BitVec 32))

(declare-fun lt!154681 () (_ BitVec 32))

(assert (=> d!69079 (= lt!154682 (bvmul (bvxor lt!154681 (bvlshr lt!154681 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69079 (= lt!154681 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69079 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171575 (let ((h!5374 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31523 (bvmul (bvxor h!5374 (bvlshr h!5374 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31523 (bvlshr x!31523 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171575 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171575 #b00000000000000000000000000000000))))))

(assert (=> d!69079 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154682 (bvlshr lt!154682 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316595 d!69079))

(declare-fun d!69081 () Bool)

(declare-fun res!171591 () Bool)

(declare-fun e!197001 () Bool)

(assert (=> d!69081 (=> res!171591 e!197001)))

(assert (=> d!69081 (= res!171591 (= (select (arr!7633 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69081 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!197001)))

(declare-fun b!316762 () Bool)

(declare-fun e!197002 () Bool)

(assert (=> b!316762 (= e!197001 e!197002)))

(declare-fun res!171592 () Bool)

(assert (=> b!316762 (=> (not res!171592) (not e!197002))))

(assert (=> b!316762 (= res!171592 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7985 a!3293)))))

(declare-fun b!316763 () Bool)

(assert (=> b!316763 (= e!197002 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69081 (not res!171591)) b!316762))

(assert (= (and b!316762 res!171592) b!316763))

(declare-fun m!325539 () Bool)

(assert (=> d!69081 m!325539))

(declare-fun m!325541 () Bool)

(assert (=> b!316763 m!325541))

(assert (=> b!316594 d!69081))

(declare-fun b!316806 () Bool)

(declare-fun e!197031 () SeekEntryResult!2773)

(assert (=> b!316806 (= e!197031 Undefined!2773)))

(declare-fun b!316807 () Bool)

(declare-fun e!197030 () SeekEntryResult!2773)

(assert (=> b!316807 (= e!197031 e!197030)))

(declare-fun lt!154713 () (_ BitVec 64))

(declare-fun lt!154711 () SeekEntryResult!2773)

(assert (=> b!316807 (= lt!154713 (select (arr!7633 a!3293) (index!13270 lt!154711)))))

(declare-fun c!50220 () Bool)

(assert (=> b!316807 (= c!50220 (= lt!154713 k!2441))))

(declare-fun b!316808 () Bool)

(declare-fun e!197032 () SeekEntryResult!2773)

(assert (=> b!316808 (= e!197032 (MissingZero!2773 (index!13270 lt!154711)))))

(declare-fun d!69085 () Bool)

(declare-fun lt!154712 () SeekEntryResult!2773)

(assert (=> d!69085 (and (or (is-Undefined!2773 lt!154712) (not (is-Found!2773 lt!154712)) (and (bvsge (index!13269 lt!154712) #b00000000000000000000000000000000) (bvslt (index!13269 lt!154712) (size!7985 a!3293)))) (or (is-Undefined!2773 lt!154712) (is-Found!2773 lt!154712) (not (is-MissingZero!2773 lt!154712)) (and (bvsge (index!13268 lt!154712) #b00000000000000000000000000000000) (bvslt (index!13268 lt!154712) (size!7985 a!3293)))) (or (is-Undefined!2773 lt!154712) (is-Found!2773 lt!154712) (is-MissingZero!2773 lt!154712) (not (is-MissingVacant!2773 lt!154712)) (and (bvsge (index!13271 lt!154712) #b00000000000000000000000000000000) (bvslt (index!13271 lt!154712) (size!7985 a!3293)))) (or (is-Undefined!2773 lt!154712) (ite (is-Found!2773 lt!154712) (= (select (arr!7633 a!3293) (index!13269 lt!154712)) k!2441) (ite (is-MissingZero!2773 lt!154712) (= (select (arr!7633 a!3293) (index!13268 lt!154712)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2773 lt!154712) (= (select (arr!7633 a!3293) (index!13271 lt!154712)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69085 (= lt!154712 e!197031)))

(declare-fun c!50219 () Bool)

(assert (=> d!69085 (= c!50219 (and (is-Intermediate!2773 lt!154711) (undefined!3585 lt!154711)))))

(assert (=> d!69085 (= lt!154711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69085 (validMask!0 mask!3709)))

(assert (=> d!69085 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154712)))

(declare-fun b!316809 () Bool)

(declare-fun c!50218 () Bool)

(assert (=> b!316809 (= c!50218 (= lt!154713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316809 (= e!197030 e!197032)))

(declare-fun b!316810 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16129 (_ BitVec 32)) SeekEntryResult!2773)

(assert (=> b!316810 (= e!197032 (seekKeyOrZeroReturnVacant!0 (x!31516 lt!154711) (index!13270 lt!154711) (index!13270 lt!154711) k!2441 a!3293 mask!3709))))

(declare-fun b!316811 () Bool)

(assert (=> b!316811 (= e!197030 (Found!2773 (index!13270 lt!154711)))))

(assert (= (and d!69085 c!50219) b!316806))

(assert (= (and d!69085 (not c!50219)) b!316807))

(assert (= (and b!316807 c!50220) b!316811))

(assert (= (and b!316807 (not c!50220)) b!316809))

(assert (= (and b!316809 c!50218) b!316808))

(assert (= (and b!316809 (not c!50218)) b!316810))

(declare-fun m!325577 () Bool)

(assert (=> b!316807 m!325577))

(declare-fun m!325579 () Bool)

(assert (=> d!69085 m!325579))

(assert (=> d!69085 m!325447))

(assert (=> d!69085 m!325449))

(declare-fun m!325581 () Bool)

(assert (=> d!69085 m!325581))

(assert (=> d!69085 m!325447))

(assert (=> d!69085 m!325443))

(declare-fun m!325583 () Bool)

(assert (=> d!69085 m!325583))

(declare-fun m!325585 () Bool)

(assert (=> b!316810 m!325585))

(assert (=> b!316596 d!69085))

(declare-fun b!316832 () Bool)

(declare-fun e!197045 () Bool)

(declare-fun e!197046 () Bool)

(assert (=> b!316832 (= e!197045 e!197046)))

(declare-fun lt!154727 () (_ BitVec 64))

(assert (=> b!316832 (= lt!154727 (select (arr!7633 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9786 0))(
  ( (Unit!9787) )
))
(declare-fun lt!154726 () Unit!9786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16129 (_ BitVec 64) (_ BitVec 32)) Unit!9786)

(assert (=> b!316832 (= lt!154726 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154727 #b00000000000000000000000000000000))))

(assert (=> b!316832 (arrayContainsKey!0 a!3293 lt!154727 #b00000000000000000000000000000000)))

(declare-fun lt!154728 () Unit!9786)

(assert (=> b!316832 (= lt!154728 lt!154726)))

(declare-fun res!171615 () Bool)

(assert (=> b!316832 (= res!171615 (= (seekEntryOrOpen!0 (select (arr!7633 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2773 #b00000000000000000000000000000000)))))

(assert (=> b!316832 (=> (not res!171615) (not e!197046))))

(declare-fun b!316833 () Bool)

(declare-fun call!26017 () Bool)

(assert (=> b!316833 (= e!197046 call!26017)))

(declare-fun b!316834 () Bool)

(declare-fun e!197047 () Bool)

(assert (=> b!316834 (= e!197047 e!197045)))

(declare-fun c!50229 () Bool)

(assert (=> b!316834 (= c!50229 (validKeyInArray!0 (select (arr!7633 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!69107 () Bool)

(declare-fun res!171614 () Bool)

(assert (=> d!69107 (=> res!171614 e!197047)))

(assert (=> d!69107 (= res!171614 (bvsge #b00000000000000000000000000000000 (size!7985 a!3293)))))

(assert (=> d!69107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!197047)))

(declare-fun b!316835 () Bool)

(assert (=> b!316835 (= e!197045 call!26017)))

(declare-fun bm!26014 () Bool)

(assert (=> bm!26014 (= call!26017 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!69107 (not res!171614)) b!316834))

(assert (= (and b!316834 c!50229) b!316832))

(assert (= (and b!316834 (not c!50229)) b!316835))

(assert (= (and b!316832 res!171615) b!316833))

(assert (= (or b!316833 b!316835) bm!26014))

(assert (=> b!316832 m!325539))

