; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32822 () Bool)

(assert start!32822)

(declare-fun b!327540 () Bool)

(declare-fun res!180444 () Bool)

(declare-fun e!201402 () Bool)

(assert (=> b!327540 (=> (not res!180444) (not e!201402))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327540 (= res!180444 (validKeyInArray!0 k0!2497))))

(declare-fun b!327541 () Bool)

(declare-fun res!180436 () Bool)

(assert (=> b!327541 (=> (not res!180436) (not e!201402))))

(declare-datatypes ((array!16773 0))(
  ( (array!16774 (arr!7938 (Array (_ BitVec 32) (_ BitVec 64))) (size!8291 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16773)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3068 0))(
  ( (MissingZero!3068 (index!14448 (_ BitVec 32))) (Found!3068 (index!14449 (_ BitVec 32))) (Intermediate!3068 (undefined!3880 Bool) (index!14450 (_ BitVec 32)) (x!32713 (_ BitVec 32))) (Undefined!3068) (MissingVacant!3068 (index!14451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!327541 (= res!180436 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3068 i!1250)))))

(declare-fun res!180440 () Bool)

(assert (=> start!32822 (=> (not res!180440) (not e!201402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32822 (= res!180440 (validMask!0 mask!3777))))

(assert (=> start!32822 e!201402))

(declare-fun array_inv!5910 (array!16773) Bool)

(assert (=> start!32822 (array_inv!5910 a!3305)))

(assert (=> start!32822 true))

(declare-fun b!327542 () Bool)

(declare-fun res!180443 () Bool)

(declare-fun e!201403 () Bool)

(assert (=> b!327542 (=> (not res!180443) (not e!201403))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327542 (= res!180443 (and (= (select (arr!7938 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8291 a!3305))))))

(declare-fun b!327543 () Bool)

(declare-fun lt!157456 () SeekEntryResult!3068)

(get-info :version)

(assert (=> b!327543 (= e!201403 (and ((_ is Intermediate!3068) lt!157456) (bvslt (x!32713 lt!157456) (bvadd #b00000000000000000000000000000001 x!1490))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3068)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327543 (= lt!157456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327544 () Bool)

(declare-fun res!180437 () Bool)

(assert (=> b!327544 (=> (not res!180437) (not e!201402))))

(assert (=> b!327544 (= res!180437 (and (= (size!8291 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8291 a!3305))))))

(declare-fun b!327545 () Bool)

(declare-fun res!180441 () Bool)

(assert (=> b!327545 (=> (not res!180441) (not e!201403))))

(assert (=> b!327545 (= res!180441 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7938 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7938 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7938 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!327546 () Bool)

(assert (=> b!327546 (= e!201402 e!201403)))

(declare-fun res!180435 () Bool)

(assert (=> b!327546 (=> (not res!180435) (not e!201403))))

(declare-fun lt!157457 () SeekEntryResult!3068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327546 (= res!180435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157457))))

(assert (=> b!327546 (= lt!157457 (Intermediate!3068 false resIndex!58 resX!58))))

(declare-fun b!327547 () Bool)

(declare-fun res!180439 () Bool)

(assert (=> b!327547 (=> (not res!180439) (not e!201402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16773 (_ BitVec 32)) Bool)

(assert (=> b!327547 (= res!180439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327548 () Bool)

(declare-fun res!180438 () Bool)

(assert (=> b!327548 (=> (not res!180438) (not e!201403))))

(assert (=> b!327548 (= res!180438 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157457))))

(declare-fun b!327549 () Bool)

(declare-fun res!180442 () Bool)

(assert (=> b!327549 (=> (not res!180442) (not e!201402))))

(declare-fun arrayContainsKey!0 (array!16773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327549 (= res!180442 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32822 res!180440) b!327544))

(assert (= (and b!327544 res!180437) b!327540))

(assert (= (and b!327540 res!180444) b!327549))

(assert (= (and b!327549 res!180442) b!327541))

(assert (= (and b!327541 res!180436) b!327547))

(assert (= (and b!327547 res!180439) b!327546))

(assert (= (and b!327546 res!180435) b!327542))

(assert (= (and b!327542 res!180443) b!327548))

(assert (= (and b!327548 res!180438) b!327545))

(assert (= (and b!327545 res!180441) b!327543))

(declare-fun m!333295 () Bool)

(assert (=> b!327542 m!333295))

(declare-fun m!333297 () Bool)

(assert (=> b!327546 m!333297))

(assert (=> b!327546 m!333297))

(declare-fun m!333299 () Bool)

(assert (=> b!327546 m!333299))

(declare-fun m!333301 () Bool)

(assert (=> b!327547 m!333301))

(declare-fun m!333303 () Bool)

(assert (=> b!327540 m!333303))

(declare-fun m!333305 () Bool)

(assert (=> b!327541 m!333305))

(declare-fun m!333307 () Bool)

(assert (=> b!327548 m!333307))

(declare-fun m!333309 () Bool)

(assert (=> start!32822 m!333309))

(declare-fun m!333311 () Bool)

(assert (=> start!32822 m!333311))

(declare-fun m!333313 () Bool)

(assert (=> b!327549 m!333313))

(declare-fun m!333315 () Bool)

(assert (=> b!327543 m!333315))

(assert (=> b!327543 m!333315))

(declare-fun m!333317 () Bool)

(assert (=> b!327543 m!333317))

(declare-fun m!333319 () Bool)

(assert (=> b!327545 m!333319))

(check-sat (not start!32822) (not b!327540) (not b!327541) (not b!327543) (not b!327548) (not b!327549) (not b!327546) (not b!327547))
(check-sat)
(get-model)

(declare-fun d!69707 () Bool)

(declare-fun e!201437 () Bool)

(assert (=> d!69707 e!201437))

(declare-fun c!51193 () Bool)

(declare-fun lt!157475 () SeekEntryResult!3068)

(assert (=> d!69707 (= c!51193 (and ((_ is Intermediate!3068) lt!157475) (undefined!3880 lt!157475)))))

(declare-fun e!201433 () SeekEntryResult!3068)

(assert (=> d!69707 (= lt!157475 e!201433)))

(declare-fun c!51192 () Bool)

(assert (=> d!69707 (= c!51192 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157474 () (_ BitVec 64))

(assert (=> d!69707 (= lt!157474 (select (arr!7938 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!69707 (validMask!0 mask!3777)))

(assert (=> d!69707 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!157475)))

(declare-fun b!327628 () Bool)

(assert (=> b!327628 (and (bvsge (index!14450 lt!157475) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157475) (size!8291 a!3305)))))

(declare-fun e!201434 () Bool)

(assert (=> b!327628 (= e!201434 (= (select (arr!7938 a!3305) (index!14450 lt!157475)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327629 () Bool)

(assert (=> b!327629 (and (bvsge (index!14450 lt!157475) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157475) (size!8291 a!3305)))))

(declare-fun res!180513 () Bool)

(assert (=> b!327629 (= res!180513 (= (select (arr!7938 a!3305) (index!14450 lt!157475)) k0!2497))))

(assert (=> b!327629 (=> res!180513 e!201434)))

(declare-fun e!201436 () Bool)

(assert (=> b!327629 (= e!201436 e!201434)))

(declare-fun b!327630 () Bool)

(declare-fun e!201435 () SeekEntryResult!3068)

(assert (=> b!327630 (= e!201435 (Intermediate!3068 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!327631 () Bool)

(assert (=> b!327631 (= e!201437 (bvsge (x!32713 lt!157475) #b01111111111111111111111111111110))))

(declare-fun b!327632 () Bool)

(assert (=> b!327632 (= e!201437 e!201436)))

(declare-fun res!180511 () Bool)

(assert (=> b!327632 (= res!180511 (and ((_ is Intermediate!3068) lt!157475) (not (undefined!3880 lt!157475)) (bvslt (x!32713 lt!157475) #b01111111111111111111111111111110) (bvsge (x!32713 lt!157475) #b00000000000000000000000000000000) (bvsge (x!32713 lt!157475) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!327632 (=> (not res!180511) (not e!201436))))

(declare-fun b!327633 () Bool)

(assert (=> b!327633 (and (bvsge (index!14450 lt!157475) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157475) (size!8291 a!3305)))))

(declare-fun res!180512 () Bool)

(assert (=> b!327633 (= res!180512 (= (select (arr!7938 a!3305) (index!14450 lt!157475)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327633 (=> res!180512 e!201434)))

(declare-fun b!327634 () Bool)

(assert (=> b!327634 (= e!201433 e!201435)))

(declare-fun c!51194 () Bool)

(assert (=> b!327634 (= c!51194 (or (= lt!157474 k0!2497) (= (bvadd lt!157474 lt!157474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327635 () Bool)

(assert (=> b!327635 (= e!201433 (Intermediate!3068 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!327636 () Bool)

(assert (=> b!327636 (= e!201435 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69707 c!51192) b!327635))

(assert (= (and d!69707 (not c!51192)) b!327634))

(assert (= (and b!327634 c!51194) b!327630))

(assert (= (and b!327634 (not c!51194)) b!327636))

(assert (= (and d!69707 c!51193) b!327631))

(assert (= (and d!69707 (not c!51193)) b!327632))

(assert (= (and b!327632 res!180511) b!327629))

(assert (= (and b!327629 (not res!180513)) b!327633))

(assert (= (and b!327633 (not res!180512)) b!327628))

(assert (=> d!69707 m!333315))

(declare-fun m!333373 () Bool)

(assert (=> d!69707 m!333373))

(assert (=> d!69707 m!333309))

(declare-fun m!333375 () Bool)

(assert (=> b!327628 m!333375))

(assert (=> b!327629 m!333375))

(assert (=> b!327633 m!333375))

(assert (=> b!327636 m!333315))

(declare-fun m!333377 () Bool)

(assert (=> b!327636 m!333377))

(assert (=> b!327636 m!333377))

(declare-fun m!333379 () Bool)

(assert (=> b!327636 m!333379))

(assert (=> b!327543 d!69707))

(declare-fun d!69713 () Bool)

(declare-fun lt!157478 () (_ BitVec 32))

(assert (=> d!69713 (and (bvsge lt!157478 #b00000000000000000000000000000000) (bvslt lt!157478 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69713 (= lt!157478 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69713 (validMask!0 mask!3777)))

(assert (=> d!69713 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157478)))

(declare-fun bs!11351 () Bool)

(assert (= bs!11351 d!69713))

(declare-fun m!333381 () Bool)

(assert (=> bs!11351 m!333381))

(assert (=> bs!11351 m!333309))

(assert (=> b!327543 d!69713))

(declare-fun d!69721 () Bool)

(declare-fun e!201442 () Bool)

(assert (=> d!69721 e!201442))

(declare-fun c!51196 () Bool)

(declare-fun lt!157480 () SeekEntryResult!3068)

(assert (=> d!69721 (= c!51196 (and ((_ is Intermediate!3068) lt!157480) (undefined!3880 lt!157480)))))

(declare-fun e!201438 () SeekEntryResult!3068)

(assert (=> d!69721 (= lt!157480 e!201438)))

(declare-fun c!51195 () Bool)

(assert (=> d!69721 (= c!51195 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157479 () (_ BitVec 64))

(assert (=> d!69721 (= lt!157479 (select (arr!7938 a!3305) index!1840))))

(assert (=> d!69721 (validMask!0 mask!3777)))

(assert (=> d!69721 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157480)))

(declare-fun b!327637 () Bool)

(assert (=> b!327637 (and (bvsge (index!14450 lt!157480) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157480) (size!8291 a!3305)))))

(declare-fun e!201439 () Bool)

(assert (=> b!327637 (= e!201439 (= (select (arr!7938 a!3305) (index!14450 lt!157480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327638 () Bool)

(assert (=> b!327638 (and (bvsge (index!14450 lt!157480) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157480) (size!8291 a!3305)))))

(declare-fun res!180516 () Bool)

(assert (=> b!327638 (= res!180516 (= (select (arr!7938 a!3305) (index!14450 lt!157480)) k0!2497))))

(assert (=> b!327638 (=> res!180516 e!201439)))

(declare-fun e!201441 () Bool)

(assert (=> b!327638 (= e!201441 e!201439)))

(declare-fun b!327639 () Bool)

(declare-fun e!201440 () SeekEntryResult!3068)

(assert (=> b!327639 (= e!201440 (Intermediate!3068 false index!1840 x!1490))))

(declare-fun b!327640 () Bool)

(assert (=> b!327640 (= e!201442 (bvsge (x!32713 lt!157480) #b01111111111111111111111111111110))))

(declare-fun b!327641 () Bool)

(assert (=> b!327641 (= e!201442 e!201441)))

(declare-fun res!180514 () Bool)

(assert (=> b!327641 (= res!180514 (and ((_ is Intermediate!3068) lt!157480) (not (undefined!3880 lt!157480)) (bvslt (x!32713 lt!157480) #b01111111111111111111111111111110) (bvsge (x!32713 lt!157480) #b00000000000000000000000000000000) (bvsge (x!32713 lt!157480) x!1490)))))

(assert (=> b!327641 (=> (not res!180514) (not e!201441))))

(declare-fun b!327642 () Bool)

(assert (=> b!327642 (and (bvsge (index!14450 lt!157480) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157480) (size!8291 a!3305)))))

(declare-fun res!180515 () Bool)

(assert (=> b!327642 (= res!180515 (= (select (arr!7938 a!3305) (index!14450 lt!157480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327642 (=> res!180515 e!201439)))

(declare-fun b!327643 () Bool)

(assert (=> b!327643 (= e!201438 e!201440)))

(declare-fun c!51197 () Bool)

(assert (=> b!327643 (= c!51197 (or (= lt!157479 k0!2497) (= (bvadd lt!157479 lt!157479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327644 () Bool)

(assert (=> b!327644 (= e!201438 (Intermediate!3068 true index!1840 x!1490))))

(declare-fun b!327645 () Bool)

(assert (=> b!327645 (= e!201440 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69721 c!51195) b!327644))

(assert (= (and d!69721 (not c!51195)) b!327643))

(assert (= (and b!327643 c!51197) b!327639))

(assert (= (and b!327643 (not c!51197)) b!327645))

(assert (= (and d!69721 c!51196) b!327640))

(assert (= (and d!69721 (not c!51196)) b!327641))

(assert (= (and b!327641 res!180514) b!327638))

(assert (= (and b!327638 (not res!180516)) b!327642))

(assert (= (and b!327642 (not res!180515)) b!327637))

(assert (=> d!69721 m!333319))

(assert (=> d!69721 m!333309))

(declare-fun m!333383 () Bool)

(assert (=> b!327637 m!333383))

(assert (=> b!327638 m!333383))

(assert (=> b!327642 m!333383))

(assert (=> b!327645 m!333315))

(assert (=> b!327645 m!333315))

(declare-fun m!333385 () Bool)

(assert (=> b!327645 m!333385))

(assert (=> b!327548 d!69721))

(declare-fun d!69723 () Bool)

(declare-fun res!180521 () Bool)

(declare-fun e!201447 () Bool)

(assert (=> d!69723 (=> res!180521 e!201447)))

(assert (=> d!69723 (= res!180521 (= (select (arr!7938 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69723 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201447)))

(declare-fun b!327650 () Bool)

(declare-fun e!201448 () Bool)

(assert (=> b!327650 (= e!201447 e!201448)))

(declare-fun res!180522 () Bool)

(assert (=> b!327650 (=> (not res!180522) (not e!201448))))

(assert (=> b!327650 (= res!180522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8291 a!3305)))))

(declare-fun b!327651 () Bool)

(assert (=> b!327651 (= e!201448 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69723 (not res!180521)) b!327650))

(assert (= (and b!327650 res!180522) b!327651))

(declare-fun m!333387 () Bool)

(assert (=> d!69723 m!333387))

(declare-fun m!333389 () Bool)

(assert (=> b!327651 m!333389))

(assert (=> b!327549 d!69723))

(declare-fun d!69725 () Bool)

(assert (=> d!69725 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32822 d!69725))

(declare-fun d!69727 () Bool)

(assert (=> d!69727 (= (array_inv!5910 a!3305) (bvsge (size!8291 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32822 d!69727))

(declare-fun d!69729 () Bool)

(declare-fun res!180555 () Bool)

(declare-fun e!201496 () Bool)

(assert (=> d!69729 (=> res!180555 e!201496)))

(assert (=> d!69729 (= res!180555 (bvsge #b00000000000000000000000000000000 (size!8291 a!3305)))))

(assert (=> d!69729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201496)))

(declare-fun b!327729 () Bool)

(declare-fun e!201498 () Bool)

(declare-fun e!201497 () Bool)

(assert (=> b!327729 (= e!201498 e!201497)))

(declare-fun lt!157501 () (_ BitVec 64))

(assert (=> b!327729 (= lt!157501 (select (arr!7938 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10148 0))(
  ( (Unit!10149) )
))
(declare-fun lt!157502 () Unit!10148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16773 (_ BitVec 64) (_ BitVec 32)) Unit!10148)

(assert (=> b!327729 (= lt!157502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157501 #b00000000000000000000000000000000))))

(assert (=> b!327729 (arrayContainsKey!0 a!3305 lt!157501 #b00000000000000000000000000000000)))

(declare-fun lt!157503 () Unit!10148)

(assert (=> b!327729 (= lt!157503 lt!157502)))

(declare-fun res!180556 () Bool)

(assert (=> b!327729 (= res!180556 (= (seekEntryOrOpen!0 (select (arr!7938 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3068 #b00000000000000000000000000000000)))))

(assert (=> b!327729 (=> (not res!180556) (not e!201497))))

(declare-fun b!327730 () Bool)

(declare-fun call!26084 () Bool)

(assert (=> b!327730 (= e!201498 call!26084)))

(declare-fun b!327731 () Bool)

(assert (=> b!327731 (= e!201496 e!201498)))

(declare-fun c!51221 () Bool)

(assert (=> b!327731 (= c!51221 (validKeyInArray!0 (select (arr!7938 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26081 () Bool)

(assert (=> bm!26081 (= call!26084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327732 () Bool)

(assert (=> b!327732 (= e!201497 call!26084)))

(assert (= (and d!69729 (not res!180555)) b!327731))

(assert (= (and b!327731 c!51221) b!327729))

(assert (= (and b!327731 (not c!51221)) b!327730))

(assert (= (and b!327729 res!180556) b!327732))

(assert (= (or b!327732 b!327730) bm!26081))

(assert (=> b!327729 m!333387))

(declare-fun m!333415 () Bool)

(assert (=> b!327729 m!333415))

(declare-fun m!333417 () Bool)

(assert (=> b!327729 m!333417))

(assert (=> b!327729 m!333387))

(declare-fun m!333419 () Bool)

(assert (=> b!327729 m!333419))

(assert (=> b!327731 m!333387))

(assert (=> b!327731 m!333387))

(declare-fun m!333421 () Bool)

(assert (=> b!327731 m!333421))

(declare-fun m!333423 () Bool)

(assert (=> bm!26081 m!333423))

(assert (=> b!327547 d!69729))

(declare-fun d!69739 () Bool)

(assert (=> d!69739 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327540 d!69739))

(declare-fun d!69741 () Bool)

(declare-fun lt!157533 () SeekEntryResult!3068)

(assert (=> d!69741 (and (or ((_ is Undefined!3068) lt!157533) (not ((_ is Found!3068) lt!157533)) (and (bvsge (index!14449 lt!157533) #b00000000000000000000000000000000) (bvslt (index!14449 lt!157533) (size!8291 a!3305)))) (or ((_ is Undefined!3068) lt!157533) ((_ is Found!3068) lt!157533) (not ((_ is MissingZero!3068) lt!157533)) (and (bvsge (index!14448 lt!157533) #b00000000000000000000000000000000) (bvslt (index!14448 lt!157533) (size!8291 a!3305)))) (or ((_ is Undefined!3068) lt!157533) ((_ is Found!3068) lt!157533) ((_ is MissingZero!3068) lt!157533) (not ((_ is MissingVacant!3068) lt!157533)) (and (bvsge (index!14451 lt!157533) #b00000000000000000000000000000000) (bvslt (index!14451 lt!157533) (size!8291 a!3305)))) (or ((_ is Undefined!3068) lt!157533) (ite ((_ is Found!3068) lt!157533) (= (select (arr!7938 a!3305) (index!14449 lt!157533)) k0!2497) (ite ((_ is MissingZero!3068) lt!157533) (= (select (arr!7938 a!3305) (index!14448 lt!157533)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3068) lt!157533) (= (select (arr!7938 a!3305) (index!14451 lt!157533)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201518 () SeekEntryResult!3068)

(assert (=> d!69741 (= lt!157533 e!201518)))

(declare-fun c!51240 () Bool)

(declare-fun lt!157531 () SeekEntryResult!3068)

(assert (=> d!69741 (= c!51240 (and ((_ is Intermediate!3068) lt!157531) (undefined!3880 lt!157531)))))

(assert (=> d!69741 (= lt!157531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69741 (validMask!0 mask!3777)))

(assert (=> d!69741 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157533)))

(declare-fun b!327769 () Bool)

(declare-fun e!201517 () SeekEntryResult!3068)

(assert (=> b!327769 (= e!201517 (Found!3068 (index!14450 lt!157531)))))

(declare-fun b!327770 () Bool)

(assert (=> b!327770 (= e!201518 e!201517)))

(declare-fun lt!157532 () (_ BitVec 64))

(assert (=> b!327770 (= lt!157532 (select (arr!7938 a!3305) (index!14450 lt!157531)))))

(declare-fun c!51241 () Bool)

(assert (=> b!327770 (= c!51241 (= lt!157532 k0!2497))))

(declare-fun b!327771 () Bool)

(declare-fun c!51242 () Bool)

(assert (=> b!327771 (= c!51242 (= lt!157532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201519 () SeekEntryResult!3068)

(assert (=> b!327771 (= e!201517 e!201519)))

(declare-fun b!327772 () Bool)

(assert (=> b!327772 (= e!201519 (MissingZero!3068 (index!14450 lt!157531)))))

(declare-fun b!327773 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!327773 (= e!201519 (seekKeyOrZeroReturnVacant!0 (x!32713 lt!157531) (index!14450 lt!157531) (index!14450 lt!157531) k0!2497 a!3305 mask!3777))))

(declare-fun b!327774 () Bool)

(assert (=> b!327774 (= e!201518 Undefined!3068)))

(assert (= (and d!69741 c!51240) b!327774))

(assert (= (and d!69741 (not c!51240)) b!327770))

(assert (= (and b!327770 c!51241) b!327769))

(assert (= (and b!327770 (not c!51241)) b!327771))

(assert (= (and b!327771 c!51242) b!327772))

(assert (= (and b!327771 (not c!51242)) b!327773))

(assert (=> d!69741 m!333309))

(declare-fun m!333427 () Bool)

(assert (=> d!69741 m!333427))

(declare-fun m!333429 () Bool)

(assert (=> d!69741 m!333429))

(assert (=> d!69741 m!333297))

(assert (=> d!69741 m!333297))

(assert (=> d!69741 m!333299))

(declare-fun m!333431 () Bool)

(assert (=> d!69741 m!333431))

(declare-fun m!333433 () Bool)

(assert (=> b!327770 m!333433))

(declare-fun m!333435 () Bool)

(assert (=> b!327773 m!333435))

(assert (=> b!327541 d!69741))

(declare-fun d!69749 () Bool)

(declare-fun e!201524 () Bool)

(assert (=> d!69749 e!201524))

(declare-fun c!51244 () Bool)

(declare-fun lt!157535 () SeekEntryResult!3068)

(assert (=> d!69749 (= c!51244 (and ((_ is Intermediate!3068) lt!157535) (undefined!3880 lt!157535)))))

(declare-fun e!201520 () SeekEntryResult!3068)

(assert (=> d!69749 (= lt!157535 e!201520)))

(declare-fun c!51243 () Bool)

(assert (=> d!69749 (= c!51243 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157534 () (_ BitVec 64))

(assert (=> d!69749 (= lt!157534 (select (arr!7938 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69749 (validMask!0 mask!3777)))

(assert (=> d!69749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157535)))

(declare-fun b!327775 () Bool)

(assert (=> b!327775 (and (bvsge (index!14450 lt!157535) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157535) (size!8291 a!3305)))))

(declare-fun e!201521 () Bool)

(assert (=> b!327775 (= e!201521 (= (select (arr!7938 a!3305) (index!14450 lt!157535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327776 () Bool)

(assert (=> b!327776 (and (bvsge (index!14450 lt!157535) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157535) (size!8291 a!3305)))))

(declare-fun res!180559 () Bool)

(assert (=> b!327776 (= res!180559 (= (select (arr!7938 a!3305) (index!14450 lt!157535)) k0!2497))))

(assert (=> b!327776 (=> res!180559 e!201521)))

(declare-fun e!201523 () Bool)

(assert (=> b!327776 (= e!201523 e!201521)))

(declare-fun b!327777 () Bool)

(declare-fun e!201522 () SeekEntryResult!3068)

(assert (=> b!327777 (= e!201522 (Intermediate!3068 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327778 () Bool)

(assert (=> b!327778 (= e!201524 (bvsge (x!32713 lt!157535) #b01111111111111111111111111111110))))

(declare-fun b!327779 () Bool)

(assert (=> b!327779 (= e!201524 e!201523)))

(declare-fun res!180557 () Bool)

(assert (=> b!327779 (= res!180557 (and ((_ is Intermediate!3068) lt!157535) (not (undefined!3880 lt!157535)) (bvslt (x!32713 lt!157535) #b01111111111111111111111111111110) (bvsge (x!32713 lt!157535) #b00000000000000000000000000000000) (bvsge (x!32713 lt!157535) #b00000000000000000000000000000000)))))

(assert (=> b!327779 (=> (not res!180557) (not e!201523))))

(declare-fun b!327780 () Bool)

(assert (=> b!327780 (and (bvsge (index!14450 lt!157535) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157535) (size!8291 a!3305)))))

(declare-fun res!180558 () Bool)

(assert (=> b!327780 (= res!180558 (= (select (arr!7938 a!3305) (index!14450 lt!157535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327780 (=> res!180558 e!201521)))

(declare-fun b!327781 () Bool)

(assert (=> b!327781 (= e!201520 e!201522)))

(declare-fun c!51245 () Bool)

(assert (=> b!327781 (= c!51245 (or (= lt!157534 k0!2497) (= (bvadd lt!157534 lt!157534) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327782 () Bool)

(assert (=> b!327782 (= e!201520 (Intermediate!3068 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327783 () Bool)

(assert (=> b!327783 (= e!201522 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69749 c!51243) b!327782))

(assert (= (and d!69749 (not c!51243)) b!327781))

(assert (= (and b!327781 c!51245) b!327777))

(assert (= (and b!327781 (not c!51245)) b!327783))

(assert (= (and d!69749 c!51244) b!327778))

(assert (= (and d!69749 (not c!51244)) b!327779))

(assert (= (and b!327779 res!180557) b!327776))

(assert (= (and b!327776 (not res!180559)) b!327780))

(assert (= (and b!327780 (not res!180558)) b!327775))

(assert (=> d!69749 m!333297))

(declare-fun m!333437 () Bool)

(assert (=> d!69749 m!333437))

(assert (=> d!69749 m!333309))

(declare-fun m!333439 () Bool)

(assert (=> b!327775 m!333439))

(assert (=> b!327776 m!333439))

(assert (=> b!327780 m!333439))

(assert (=> b!327783 m!333297))

(declare-fun m!333441 () Bool)

(assert (=> b!327783 m!333441))

(assert (=> b!327783 m!333441))

(declare-fun m!333443 () Bool)

(assert (=> b!327783 m!333443))

(assert (=> b!327546 d!69749))

(declare-fun d!69751 () Bool)

(declare-fun lt!157547 () (_ BitVec 32))

(declare-fun lt!157546 () (_ BitVec 32))

(assert (=> d!69751 (= lt!157547 (bvmul (bvxor lt!157546 (bvlshr lt!157546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69751 (= lt!157546 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69751 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180560 (let ((h!5372 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32722 (bvmul (bvxor h!5372 (bvlshr h!5372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32722 (bvlshr x!32722 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180560 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180560 #b00000000000000000000000000000000))))))

(assert (=> d!69751 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157547 (bvlshr lt!157547 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327546 d!69751))

(check-sat (not b!327729) (not d!69749) (not b!327636) (not b!327645) (not d!69741) (not b!327731) (not d!69721) (not bm!26081) (not b!327651) (not b!327773) (not d!69707) (not b!327783) (not d!69713))
(check-sat)
