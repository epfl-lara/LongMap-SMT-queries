; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31638 () Bool)

(assert start!31638)

(declare-fun b!316483 () Bool)

(declare-fun res!171471 () Bool)

(declare-fun e!196844 () Bool)

(assert (=> b!316483 (=> (not res!171471) (not e!196844))))

(declare-datatypes ((array!16124 0))(
  ( (array!16125 (arr!7630 (Array (_ BitVec 32) (_ BitVec 64))) (size!7982 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16124)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316483 (= res!171471 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316484 () Bool)

(declare-fun res!171469 () Bool)

(assert (=> b!316484 (=> (not res!171469) (not e!196844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316484 (= res!171469 (validKeyInArray!0 k0!2441))))

(declare-fun b!316485 () Bool)

(declare-fun e!196843 () Bool)

(assert (=> b!316485 (= e!196844 e!196843)))

(declare-fun res!171472 () Bool)

(assert (=> b!316485 (=> (not res!171472) (not e!196843))))

(declare-datatypes ((SeekEntryResult!2735 0))(
  ( (MissingZero!2735 (index!13116 (_ BitVec 32))) (Found!2735 (index!13117 (_ BitVec 32))) (Intermediate!2735 (undefined!3547 Bool) (index!13118 (_ BitVec 32)) (x!31475 (_ BitVec 32))) (Undefined!2735) (MissingVacant!2735 (index!13119 (_ BitVec 32))) )
))
(declare-fun lt!154626 () SeekEntryResult!2735)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16124 (_ BitVec 32)) SeekEntryResult!2735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316485 (= res!171472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154626))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316485 (= lt!154626 (Intermediate!2735 false resIndex!52 resX!52))))

(declare-fun b!316486 () Bool)

(declare-fun res!171470 () Bool)

(assert (=> b!316486 (=> (not res!171470) (not e!196844))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16124 (_ BitVec 32)) SeekEntryResult!2735)

(assert (=> b!316486 (= res!171470 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2735 i!1240)))))

(declare-fun b!316487 () Bool)

(declare-fun res!171473 () Bool)

(assert (=> b!316487 (=> (not res!171473) (not e!196843))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316487 (= res!171473 (and (= (select (arr!7630 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7982 a!3293))))))

(declare-fun b!316488 () Bool)

(declare-fun e!196845 () Bool)

(assert (=> b!316488 (= e!196843 e!196845)))

(declare-fun res!171466 () Bool)

(assert (=> b!316488 (=> (not res!171466) (not e!196845))))

(declare-fun lt!154625 () SeekEntryResult!2735)

(assert (=> b!316488 (= res!171466 (and (= lt!154625 lt!154626) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7630 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316488 (= lt!154625 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!171468 () Bool)

(assert (=> start!31638 (=> (not res!171468) (not e!196844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31638 (= res!171468 (validMask!0 mask!3709))))

(assert (=> start!31638 e!196844))

(declare-fun array_inv!5580 (array!16124) Bool)

(assert (=> start!31638 (array_inv!5580 a!3293)))

(assert (=> start!31638 true))

(declare-fun b!316489 () Bool)

(declare-fun res!171474 () Bool)

(assert (=> b!316489 (=> (not res!171474) (not e!196844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16124 (_ BitVec 32)) Bool)

(assert (=> b!316489 (= res!171474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316490 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316490 (= e!196845 (not (= lt!154625 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!316491 () Bool)

(declare-fun res!171467 () Bool)

(assert (=> b!316491 (=> (not res!171467) (not e!196844))))

(assert (=> b!316491 (= res!171467 (and (= (size!7982 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7982 a!3293))))))

(assert (= (and start!31638 res!171468) b!316491))

(assert (= (and b!316491 res!171467) b!316484))

(assert (= (and b!316484 res!171469) b!316483))

(assert (= (and b!316483 res!171471) b!316486))

(assert (= (and b!316486 res!171470) b!316489))

(assert (= (and b!316489 res!171474) b!316485))

(assert (= (and b!316485 res!171472) b!316487))

(assert (= (and b!316487 res!171473) b!316488))

(assert (= (and b!316488 res!171466) b!316490))

(declare-fun m!325549 () Bool)

(assert (=> b!316488 m!325549))

(declare-fun m!325551 () Bool)

(assert (=> b!316488 m!325551))

(declare-fun m!325553 () Bool)

(assert (=> start!31638 m!325553))

(declare-fun m!325555 () Bool)

(assert (=> start!31638 m!325555))

(declare-fun m!325557 () Bool)

(assert (=> b!316489 m!325557))

(declare-fun m!325559 () Bool)

(assert (=> b!316485 m!325559))

(assert (=> b!316485 m!325559))

(declare-fun m!325561 () Bool)

(assert (=> b!316485 m!325561))

(declare-fun m!325563 () Bool)

(assert (=> b!316483 m!325563))

(declare-fun m!325565 () Bool)

(assert (=> b!316487 m!325565))

(declare-fun m!325567 () Bool)

(assert (=> b!316490 m!325567))

(assert (=> b!316490 m!325567))

(declare-fun m!325569 () Bool)

(assert (=> b!316490 m!325569))

(declare-fun m!325571 () Bool)

(assert (=> b!316486 m!325571))

(declare-fun m!325573 () Bool)

(assert (=> b!316484 m!325573))

(check-sat (not b!316483) (not start!31638) (not b!316490) (not b!316484) (not b!316486) (not b!316489) (not b!316485) (not b!316488))
(check-sat)
(get-model)

(declare-fun d!69077 () Bool)

(assert (=> d!69077 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31638 d!69077))

(declare-fun d!69081 () Bool)

(assert (=> d!69081 (= (array_inv!5580 a!3293) (bvsge (size!7982 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31638 d!69081))

(declare-fun d!69083 () Bool)

(declare-fun res!171533 () Bool)

(declare-fun e!196874 () Bool)

(assert (=> d!69083 (=> res!171533 e!196874)))

(assert (=> d!69083 (= res!171533 (= (select (arr!7630 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69083 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196874)))

(declare-fun b!316550 () Bool)

(declare-fun e!196875 () Bool)

(assert (=> b!316550 (= e!196874 e!196875)))

(declare-fun res!171534 () Bool)

(assert (=> b!316550 (=> (not res!171534) (not e!196875))))

(assert (=> b!316550 (= res!171534 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7982 a!3293)))))

(declare-fun b!316551 () Bool)

(assert (=> b!316551 (= e!196875 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69083 (not res!171533)) b!316550))

(assert (= (and b!316550 res!171534) b!316551))

(declare-fun m!325627 () Bool)

(assert (=> d!69083 m!325627))

(declare-fun m!325629 () Bool)

(assert (=> b!316551 m!325629))

(assert (=> b!316483 d!69083))

(declare-fun d!69085 () Bool)

(assert (=> d!69085 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316484 d!69085))

(declare-fun b!316562 () Bool)

(declare-fun e!196883 () Bool)

(declare-fun e!196884 () Bool)

(assert (=> b!316562 (= e!196883 e!196884)))

(declare-fun lt!154651 () (_ BitVec 64))

(assert (=> b!316562 (= lt!154651 (select (arr!7630 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9746 0))(
  ( (Unit!9747) )
))
(declare-fun lt!154650 () Unit!9746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16124 (_ BitVec 64) (_ BitVec 32)) Unit!9746)

(assert (=> b!316562 (= lt!154650 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154651 #b00000000000000000000000000000000))))

(assert (=> b!316562 (arrayContainsKey!0 a!3293 lt!154651 #b00000000000000000000000000000000)))

(declare-fun lt!154649 () Unit!9746)

(assert (=> b!316562 (= lt!154649 lt!154650)))

(declare-fun res!171539 () Bool)

(assert (=> b!316562 (= res!171539 (= (seekEntryOrOpen!0 (select (arr!7630 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2735 #b00000000000000000000000000000000)))))

(assert (=> b!316562 (=> (not res!171539) (not e!196884))))

(declare-fun b!316563 () Bool)

(declare-fun call!25997 () Bool)

(assert (=> b!316563 (= e!196884 call!25997)))

(declare-fun d!69087 () Bool)

(declare-fun res!171540 () Bool)

(declare-fun e!196882 () Bool)

(assert (=> d!69087 (=> res!171540 e!196882)))

(assert (=> d!69087 (= res!171540 (bvsge #b00000000000000000000000000000000 (size!7982 a!3293)))))

(assert (=> d!69087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196882)))

(declare-fun b!316564 () Bool)

(assert (=> b!316564 (= e!196882 e!196883)))

(declare-fun c!50129 () Bool)

(assert (=> b!316564 (= c!50129 (validKeyInArray!0 (select (arr!7630 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!316565 () Bool)

(assert (=> b!316565 (= e!196883 call!25997)))

(declare-fun bm!25994 () Bool)

(assert (=> bm!25994 (= call!25997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!69087 (not res!171540)) b!316564))

(assert (= (and b!316564 c!50129) b!316562))

(assert (= (and b!316564 (not c!50129)) b!316565))

(assert (= (and b!316562 res!171539) b!316563))

(assert (= (or b!316563 b!316565) bm!25994))

(assert (=> b!316562 m!325627))

(declare-fun m!325631 () Bool)

(assert (=> b!316562 m!325631))

(declare-fun m!325633 () Bool)

(assert (=> b!316562 m!325633))

(assert (=> b!316562 m!325627))

(declare-fun m!325635 () Bool)

(assert (=> b!316562 m!325635))

(assert (=> b!316564 m!325627))

(assert (=> b!316564 m!325627))

(declare-fun m!325637 () Bool)

(assert (=> b!316564 m!325637))

(declare-fun m!325639 () Bool)

(assert (=> bm!25994 m!325639))

(assert (=> b!316489 d!69087))

(declare-fun b!316624 () Bool)

(declare-fun e!196919 () SeekEntryResult!2735)

(assert (=> b!316624 (= e!196919 (Intermediate!2735 true index!1781 x!1427))))

(declare-fun b!316625 () Bool)

(declare-fun lt!154670 () SeekEntryResult!2735)

(assert (=> b!316625 (and (bvsge (index!13118 lt!154670) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154670) (size!7982 a!3293)))))

(declare-fun e!196923 () Bool)

(assert (=> b!316625 (= e!196923 (= (select (arr!7630 a!3293) (index!13118 lt!154670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196921 () SeekEntryResult!2735)

(declare-fun b!316626 () Bool)

(assert (=> b!316626 (= e!196921 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316627 () Bool)

(declare-fun e!196920 () Bool)

(declare-fun e!196922 () Bool)

(assert (=> b!316627 (= e!196920 e!196922)))

(declare-fun res!171555 () Bool)

(get-info :version)

(assert (=> b!316627 (= res!171555 (and ((_ is Intermediate!2735) lt!154670) (not (undefined!3547 lt!154670)) (bvslt (x!31475 lt!154670) #b01111111111111111111111111111110) (bvsge (x!31475 lt!154670) #b00000000000000000000000000000000) (bvsge (x!31475 lt!154670) x!1427)))))

(assert (=> b!316627 (=> (not res!171555) (not e!196922))))

(declare-fun b!316628 () Bool)

(assert (=> b!316628 (and (bvsge (index!13118 lt!154670) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154670) (size!7982 a!3293)))))

(declare-fun res!171553 () Bool)

(assert (=> b!316628 (= res!171553 (= (select (arr!7630 a!3293) (index!13118 lt!154670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316628 (=> res!171553 e!196923)))

(declare-fun b!316629 () Bool)

(assert (=> b!316629 (= e!196921 (Intermediate!2735 false index!1781 x!1427))))

(declare-fun b!316630 () Bool)

(assert (=> b!316630 (= e!196920 (bvsge (x!31475 lt!154670) #b01111111111111111111111111111110))))

(declare-fun d!69091 () Bool)

(assert (=> d!69091 e!196920))

(declare-fun c!50154 () Bool)

(assert (=> d!69091 (= c!50154 (and ((_ is Intermediate!2735) lt!154670) (undefined!3547 lt!154670)))))

(assert (=> d!69091 (= lt!154670 e!196919)))

(declare-fun c!50156 () Bool)

(assert (=> d!69091 (= c!50156 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154671 () (_ BitVec 64))

(assert (=> d!69091 (= lt!154671 (select (arr!7630 a!3293) index!1781))))

(assert (=> d!69091 (validMask!0 mask!3709)))

(assert (=> d!69091 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154670)))

(declare-fun b!316631 () Bool)

(assert (=> b!316631 (and (bvsge (index!13118 lt!154670) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154670) (size!7982 a!3293)))))

(declare-fun res!171554 () Bool)

(assert (=> b!316631 (= res!171554 (= (select (arr!7630 a!3293) (index!13118 lt!154670)) k0!2441))))

(assert (=> b!316631 (=> res!171554 e!196923)))

(assert (=> b!316631 (= e!196922 e!196923)))

(declare-fun b!316632 () Bool)

(assert (=> b!316632 (= e!196919 e!196921)))

(declare-fun c!50155 () Bool)

(assert (=> b!316632 (= c!50155 (or (= lt!154671 k0!2441) (= (bvadd lt!154671 lt!154671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69091 c!50156) b!316624))

(assert (= (and d!69091 (not c!50156)) b!316632))

(assert (= (and b!316632 c!50155) b!316629))

(assert (= (and b!316632 (not c!50155)) b!316626))

(assert (= (and d!69091 c!50154) b!316630))

(assert (= (and d!69091 (not c!50154)) b!316627))

(assert (= (and b!316627 res!171555) b!316631))

(assert (= (and b!316631 (not res!171554)) b!316628))

(assert (= (and b!316628 (not res!171553)) b!316625))

(declare-fun m!325665 () Bool)

(assert (=> b!316631 m!325665))

(assert (=> d!69091 m!325549))

(assert (=> d!69091 m!325553))

(assert (=> b!316628 m!325665))

(assert (=> b!316625 m!325665))

(declare-fun m!325667 () Bool)

(assert (=> b!316626 m!325667))

(assert (=> b!316626 m!325667))

(declare-fun m!325669 () Bool)

(assert (=> b!316626 m!325669))

(assert (=> b!316488 d!69091))

(declare-fun d!69103 () Bool)

(declare-fun lt!154695 () SeekEntryResult!2735)

(assert (=> d!69103 (and (or ((_ is Undefined!2735) lt!154695) (not ((_ is Found!2735) lt!154695)) (and (bvsge (index!13117 lt!154695) #b00000000000000000000000000000000) (bvslt (index!13117 lt!154695) (size!7982 a!3293)))) (or ((_ is Undefined!2735) lt!154695) ((_ is Found!2735) lt!154695) (not ((_ is MissingZero!2735) lt!154695)) (and (bvsge (index!13116 lt!154695) #b00000000000000000000000000000000) (bvslt (index!13116 lt!154695) (size!7982 a!3293)))) (or ((_ is Undefined!2735) lt!154695) ((_ is Found!2735) lt!154695) ((_ is MissingZero!2735) lt!154695) (not ((_ is MissingVacant!2735) lt!154695)) (and (bvsge (index!13119 lt!154695) #b00000000000000000000000000000000) (bvslt (index!13119 lt!154695) (size!7982 a!3293)))) (or ((_ is Undefined!2735) lt!154695) (ite ((_ is Found!2735) lt!154695) (= (select (arr!7630 a!3293) (index!13117 lt!154695)) k0!2441) (ite ((_ is MissingZero!2735) lt!154695) (= (select (arr!7630 a!3293) (index!13116 lt!154695)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2735) lt!154695) (= (select (arr!7630 a!3293) (index!13119 lt!154695)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196961 () SeekEntryResult!2735)

(assert (=> d!69103 (= lt!154695 e!196961)))

(declare-fun c!50182 () Bool)

(declare-fun lt!154694 () SeekEntryResult!2735)

(assert (=> d!69103 (= c!50182 (and ((_ is Intermediate!2735) lt!154694) (undefined!3547 lt!154694)))))

(assert (=> d!69103 (= lt!154694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!69103 (validMask!0 mask!3709)))

(assert (=> d!69103 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154695)))

(declare-fun b!316699 () Bool)

(declare-fun c!50183 () Bool)

(declare-fun lt!154693 () (_ BitVec 64))

(assert (=> b!316699 (= c!50183 (= lt!154693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196962 () SeekEntryResult!2735)

(declare-fun e!196960 () SeekEntryResult!2735)

(assert (=> b!316699 (= e!196962 e!196960)))

(declare-fun b!316700 () Bool)

(assert (=> b!316700 (= e!196960 (MissingZero!2735 (index!13118 lt!154694)))))

(declare-fun b!316701 () Bool)

(assert (=> b!316701 (= e!196961 e!196962)))

(assert (=> b!316701 (= lt!154693 (select (arr!7630 a!3293) (index!13118 lt!154694)))))

(declare-fun c!50181 () Bool)

(assert (=> b!316701 (= c!50181 (= lt!154693 k0!2441))))

(declare-fun b!316702 () Bool)

(assert (=> b!316702 (= e!196961 Undefined!2735)))

(declare-fun b!316703 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16124 (_ BitVec 32)) SeekEntryResult!2735)

(assert (=> b!316703 (= e!196960 (seekKeyOrZeroReturnVacant!0 (x!31475 lt!154694) (index!13118 lt!154694) (index!13118 lt!154694) k0!2441 a!3293 mask!3709))))

(declare-fun b!316704 () Bool)

(assert (=> b!316704 (= e!196962 (Found!2735 (index!13118 lt!154694)))))

(assert (= (and d!69103 c!50182) b!316702))

(assert (= (and d!69103 (not c!50182)) b!316701))

(assert (= (and b!316701 c!50181) b!316704))

(assert (= (and b!316701 (not c!50181)) b!316699))

(assert (= (and b!316699 c!50183) b!316700))

(assert (= (and b!316699 (not c!50183)) b!316703))

(declare-fun m!325687 () Bool)

(assert (=> d!69103 m!325687))

(declare-fun m!325689 () Bool)

(assert (=> d!69103 m!325689))

(assert (=> d!69103 m!325553))

(assert (=> d!69103 m!325559))

(assert (=> d!69103 m!325559))

(assert (=> d!69103 m!325561))

(declare-fun m!325691 () Bool)

(assert (=> d!69103 m!325691))

(declare-fun m!325693 () Bool)

(assert (=> b!316701 m!325693))

(declare-fun m!325695 () Bool)

(assert (=> b!316703 m!325695))

(assert (=> b!316486 d!69103))

(declare-fun e!196963 () SeekEntryResult!2735)

(declare-fun b!316705 () Bool)

(assert (=> b!316705 (= e!196963 (Intermediate!2735 true (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316706 () Bool)

(declare-fun lt!154696 () SeekEntryResult!2735)

(assert (=> b!316706 (and (bvsge (index!13118 lt!154696) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154696) (size!7982 a!3293)))))

(declare-fun e!196967 () Bool)

(assert (=> b!316706 (= e!196967 (= (select (arr!7630 a!3293) (index!13118 lt!154696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316707 () Bool)

(declare-fun e!196965 () SeekEntryResult!2735)

(assert (=> b!316707 (= e!196965 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316708 () Bool)

(declare-fun e!196964 () Bool)

(declare-fun e!196966 () Bool)

(assert (=> b!316708 (= e!196964 e!196966)))

(declare-fun res!171576 () Bool)

(assert (=> b!316708 (= res!171576 (and ((_ is Intermediate!2735) lt!154696) (not (undefined!3547 lt!154696)) (bvslt (x!31475 lt!154696) #b01111111111111111111111111111110) (bvsge (x!31475 lt!154696) #b00000000000000000000000000000000) (bvsge (x!31475 lt!154696) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316708 (=> (not res!171576) (not e!196966))))

(declare-fun b!316709 () Bool)

(assert (=> b!316709 (and (bvsge (index!13118 lt!154696) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154696) (size!7982 a!3293)))))

(declare-fun res!171574 () Bool)

(assert (=> b!316709 (= res!171574 (= (select (arr!7630 a!3293) (index!13118 lt!154696)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316709 (=> res!171574 e!196967)))

(declare-fun b!316710 () Bool)

(assert (=> b!316710 (= e!196965 (Intermediate!2735 false (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316711 () Bool)

(assert (=> b!316711 (= e!196964 (bvsge (x!31475 lt!154696) #b01111111111111111111111111111110))))

(declare-fun d!69115 () Bool)

(assert (=> d!69115 e!196964))

(declare-fun c!50184 () Bool)

(assert (=> d!69115 (= c!50184 (and ((_ is Intermediate!2735) lt!154696) (undefined!3547 lt!154696)))))

(assert (=> d!69115 (= lt!154696 e!196963)))

(declare-fun c!50186 () Bool)

(assert (=> d!69115 (= c!50186 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154697 () (_ BitVec 64))

(assert (=> d!69115 (= lt!154697 (select (arr!7630 a!3293) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709)))))

(assert (=> d!69115 (validMask!0 mask!3709)))

(assert (=> d!69115 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709) lt!154696)))

(declare-fun b!316712 () Bool)

(assert (=> b!316712 (and (bvsge (index!13118 lt!154696) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154696) (size!7982 a!3293)))))

(declare-fun res!171575 () Bool)

(assert (=> b!316712 (= res!171575 (= (select (arr!7630 a!3293) (index!13118 lt!154696)) k0!2441))))

(assert (=> b!316712 (=> res!171575 e!196967)))

(assert (=> b!316712 (= e!196966 e!196967)))

(declare-fun b!316713 () Bool)

(assert (=> b!316713 (= e!196963 e!196965)))

(declare-fun c!50185 () Bool)

(assert (=> b!316713 (= c!50185 (or (= lt!154697 k0!2441) (= (bvadd lt!154697 lt!154697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69115 c!50186) b!316705))

(assert (= (and d!69115 (not c!50186)) b!316713))

(assert (= (and b!316713 c!50185) b!316710))

(assert (= (and b!316713 (not c!50185)) b!316707))

(assert (= (and d!69115 c!50184) b!316711))

(assert (= (and d!69115 (not c!50184)) b!316708))

(assert (= (and b!316708 res!171576) b!316712))

(assert (= (and b!316712 (not res!171575)) b!316709))

(assert (= (and b!316709 (not res!171574)) b!316706))

(declare-fun m!325697 () Bool)

(assert (=> b!316712 m!325697))

(assert (=> d!69115 m!325567))

(declare-fun m!325699 () Bool)

(assert (=> d!69115 m!325699))

(assert (=> d!69115 m!325553))

(assert (=> b!316709 m!325697))

(assert (=> b!316706 m!325697))

(assert (=> b!316707 m!325567))

(declare-fun m!325703 () Bool)

(assert (=> b!316707 m!325703))

(assert (=> b!316707 m!325703))

(declare-fun m!325707 () Bool)

(assert (=> b!316707 m!325707))

(assert (=> b!316490 d!69115))

(declare-fun d!69117 () Bool)

(declare-fun lt!154704 () (_ BitVec 32))

(assert (=> d!69117 (and (bvsge lt!154704 #b00000000000000000000000000000000) (bvslt lt!154704 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69117 (= lt!154704 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!69117 (validMask!0 mask!3709)))

(assert (=> d!69117 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!154704)))

(declare-fun bs!11068 () Bool)

(assert (= bs!11068 d!69117))

(declare-fun m!325719 () Bool)

(assert (=> bs!11068 m!325719))

(assert (=> bs!11068 m!325553))

(assert (=> b!316490 d!69117))

(declare-fun b!316732 () Bool)

(declare-fun e!196978 () SeekEntryResult!2735)

(assert (=> b!316732 (= e!196978 (Intermediate!2735 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316733 () Bool)

(declare-fun lt!154705 () SeekEntryResult!2735)

(assert (=> b!316733 (and (bvsge (index!13118 lt!154705) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154705) (size!7982 a!3293)))))

(declare-fun e!196982 () Bool)

(assert (=> b!316733 (= e!196982 (= (select (arr!7630 a!3293) (index!13118 lt!154705)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196980 () SeekEntryResult!2735)

(declare-fun b!316734 () Bool)

(assert (=> b!316734 (= e!196980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316735 () Bool)

(declare-fun e!196979 () Bool)

(declare-fun e!196981 () Bool)

(assert (=> b!316735 (= e!196979 e!196981)))

(declare-fun res!171586 () Bool)

(assert (=> b!316735 (= res!171586 (and ((_ is Intermediate!2735) lt!154705) (not (undefined!3547 lt!154705)) (bvslt (x!31475 lt!154705) #b01111111111111111111111111111110) (bvsge (x!31475 lt!154705) #b00000000000000000000000000000000) (bvsge (x!31475 lt!154705) #b00000000000000000000000000000000)))))

(assert (=> b!316735 (=> (not res!171586) (not e!196981))))

(declare-fun b!316736 () Bool)

(assert (=> b!316736 (and (bvsge (index!13118 lt!154705) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154705) (size!7982 a!3293)))))

(declare-fun res!171584 () Bool)

(assert (=> b!316736 (= res!171584 (= (select (arr!7630 a!3293) (index!13118 lt!154705)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316736 (=> res!171584 e!196982)))

(declare-fun b!316737 () Bool)

(assert (=> b!316737 (= e!196980 (Intermediate!2735 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316738 () Bool)

(assert (=> b!316738 (= e!196979 (bvsge (x!31475 lt!154705) #b01111111111111111111111111111110))))

(declare-fun d!69127 () Bool)

(assert (=> d!69127 e!196979))

(declare-fun c!50193 () Bool)

(assert (=> d!69127 (= c!50193 (and ((_ is Intermediate!2735) lt!154705) (undefined!3547 lt!154705)))))

(assert (=> d!69127 (= lt!154705 e!196978)))

(declare-fun c!50195 () Bool)

(assert (=> d!69127 (= c!50195 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154706 () (_ BitVec 64))

(assert (=> d!69127 (= lt!154706 (select (arr!7630 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!69127 (validMask!0 mask!3709)))

(assert (=> d!69127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154705)))

(declare-fun b!316739 () Bool)

(assert (=> b!316739 (and (bvsge (index!13118 lt!154705) #b00000000000000000000000000000000) (bvslt (index!13118 lt!154705) (size!7982 a!3293)))))

(declare-fun res!171585 () Bool)

(assert (=> b!316739 (= res!171585 (= (select (arr!7630 a!3293) (index!13118 lt!154705)) k0!2441))))

(assert (=> b!316739 (=> res!171585 e!196982)))

(assert (=> b!316739 (= e!196981 e!196982)))

(declare-fun b!316740 () Bool)

(assert (=> b!316740 (= e!196978 e!196980)))

(declare-fun c!50194 () Bool)

(assert (=> b!316740 (= c!50194 (or (= lt!154706 k0!2441) (= (bvadd lt!154706 lt!154706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69127 c!50195) b!316732))

(assert (= (and d!69127 (not c!50195)) b!316740))

(assert (= (and b!316740 c!50194) b!316737))

(assert (= (and b!316740 (not c!50194)) b!316734))

(assert (= (and d!69127 c!50193) b!316738))

(assert (= (and d!69127 (not c!50193)) b!316735))

(assert (= (and b!316735 res!171586) b!316739))

(assert (= (and b!316739 (not res!171585)) b!316736))

(assert (= (and b!316736 (not res!171584)) b!316733))

(declare-fun m!325721 () Bool)

(assert (=> b!316739 m!325721))

(assert (=> d!69127 m!325559))

(declare-fun m!325723 () Bool)

(assert (=> d!69127 m!325723))

(assert (=> d!69127 m!325553))

(assert (=> b!316736 m!325721))

(assert (=> b!316733 m!325721))

(assert (=> b!316734 m!325559))

(declare-fun m!325725 () Bool)

(assert (=> b!316734 m!325725))

(assert (=> b!316734 m!325725))

(declare-fun m!325727 () Bool)

(assert (=> b!316734 m!325727))

(assert (=> b!316485 d!69127))

(declare-fun d!69129 () Bool)

(declare-fun lt!154724 () (_ BitVec 32))

(declare-fun lt!154723 () (_ BitVec 32))

(assert (=> d!69129 (= lt!154724 (bvmul (bvxor lt!154723 (bvlshr lt!154723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69129 (= lt!154723 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69129 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171587 (let ((h!5286 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31484 (bvmul (bvxor h!5286 (bvlshr h!5286 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31484 (bvlshr x!31484 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171587 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171587 #b00000000000000000000000000000000))))))

(assert (=> d!69129 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154724 (bvlshr lt!154724 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316485 d!69129))

(check-sat (not d!69127) (not b!316564) (not b!316562) (not d!69117) (not b!316703) (not bm!25994) (not d!69103) (not d!69115) (not b!316734) (not b!316551) (not b!316626) (not b!316707) (not d!69091))
(check-sat)
