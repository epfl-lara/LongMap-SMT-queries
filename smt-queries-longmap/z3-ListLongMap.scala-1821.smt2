; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32784 () Bool)

(assert start!32784)

(declare-fun b!327543 () Bool)

(declare-fun res!180438 () Bool)

(declare-fun e!201430 () Bool)

(assert (=> b!327543 (=> (not res!180438) (not e!201430))))

(declare-datatypes ((array!16776 0))(
  ( (array!16777 (arr!7941 (Array (_ BitVec 32) (_ BitVec 64))) (size!8293 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16776)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3072 0))(
  ( (MissingZero!3072 (index!14464 (_ BitVec 32))) (Found!3072 (index!14465 (_ BitVec 32))) (Intermediate!3072 (undefined!3884 Bool) (index!14466 (_ BitVec 32)) (x!32708 (_ BitVec 32))) (Undefined!3072) (MissingVacant!3072 (index!14467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16776 (_ BitVec 32)) SeekEntryResult!3072)

(assert (=> b!327543 (= res!180438 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3072 i!1250)))))

(declare-fun b!327544 () Bool)

(declare-fun res!180437 () Bool)

(assert (=> b!327544 (=> (not res!180437) (not e!201430))))

(declare-fun arrayContainsKey!0 (array!16776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327544 (= res!180437 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!180439 () Bool)

(assert (=> start!32784 (=> (not res!180439) (not e!201430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32784 (= res!180439 (validMask!0 mask!3777))))

(assert (=> start!32784 e!201430))

(declare-fun array_inv!5904 (array!16776) Bool)

(assert (=> start!32784 (array_inv!5904 a!3305)))

(assert (=> start!32784 true))

(declare-fun b!327545 () Bool)

(declare-fun res!180440 () Bool)

(declare-fun e!201428 () Bool)

(assert (=> b!327545 (=> (not res!180440) (not e!201428))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327545 (= res!180440 (and (= (select (arr!7941 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8293 a!3305))))))

(declare-fun b!327546 () Bool)

(declare-fun res!180436 () Bool)

(assert (=> b!327546 (=> (not res!180436) (not e!201430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16776 (_ BitVec 32)) Bool)

(assert (=> b!327546 (= res!180436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327547 () Bool)

(declare-fun res!180435 () Bool)

(assert (=> b!327547 (=> (not res!180435) (not e!201430))))

(assert (=> b!327547 (= res!180435 (and (= (size!8293 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8293 a!3305))))))

(declare-fun b!327548 () Bool)

(declare-fun res!180441 () Bool)

(assert (=> b!327548 (=> (not res!180441) (not e!201430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327548 (= res!180441 (validKeyInArray!0 k0!2497))))

(declare-fun b!327549 () Bool)

(declare-fun res!180434 () Bool)

(assert (=> b!327549 (=> (not res!180434) (not e!201428))))

(declare-fun lt!157587 () SeekEntryResult!3072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16776 (_ BitVec 32)) SeekEntryResult!3072)

(assert (=> b!327549 (= res!180434 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157587))))

(declare-fun b!327550 () Bool)

(assert (=> b!327550 (= e!201428 (and (bvslt resX!58 #b01111111111111111111111111111110) (= (select (arr!7941 a!3305) index!1840) k0!2497)))))

(declare-fun b!327551 () Bool)

(assert (=> b!327551 (= e!201430 e!201428)))

(declare-fun res!180433 () Bool)

(assert (=> b!327551 (=> (not res!180433) (not e!201428))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327551 (= res!180433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157587))))

(assert (=> b!327551 (= lt!157587 (Intermediate!3072 false resIndex!58 resX!58))))

(assert (= (and start!32784 res!180439) b!327547))

(assert (= (and b!327547 res!180435) b!327548))

(assert (= (and b!327548 res!180441) b!327544))

(assert (= (and b!327544 res!180437) b!327543))

(assert (= (and b!327543 res!180438) b!327546))

(assert (= (and b!327546 res!180436) b!327551))

(assert (= (and b!327551 res!180433) b!327545))

(assert (= (and b!327545 res!180440) b!327549))

(assert (= (and b!327549 res!180434) b!327550))

(declare-fun m!333867 () Bool)

(assert (=> b!327544 m!333867))

(declare-fun m!333869 () Bool)

(assert (=> b!327545 m!333869))

(declare-fun m!333871 () Bool)

(assert (=> start!32784 m!333871))

(declare-fun m!333873 () Bool)

(assert (=> start!32784 m!333873))

(declare-fun m!333875 () Bool)

(assert (=> b!327546 m!333875))

(declare-fun m!333877 () Bool)

(assert (=> b!327550 m!333877))

(declare-fun m!333879 () Bool)

(assert (=> b!327549 m!333879))

(declare-fun m!333881 () Bool)

(assert (=> b!327548 m!333881))

(declare-fun m!333883 () Bool)

(assert (=> b!327551 m!333883))

(assert (=> b!327551 m!333883))

(declare-fun m!333885 () Bool)

(assert (=> b!327551 m!333885))

(declare-fun m!333887 () Bool)

(assert (=> b!327543 m!333887))

(check-sat (not b!327544) (not b!327551) (not start!32784) (not b!327543) (not b!327548) (not b!327549) (not b!327546))
(check-sat)
(get-model)

(declare-fun d!69857 () Bool)

(assert (=> d!69857 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327548 d!69857))

(declare-fun b!327621 () Bool)

(declare-fun e!201469 () SeekEntryResult!3072)

(assert (=> b!327621 (= e!201469 (Intermediate!3072 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327622 () Bool)

(declare-fun lt!157613 () SeekEntryResult!3072)

(assert (=> b!327622 (and (bvsge (index!14466 lt!157613) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157613) (size!8293 a!3305)))))

(declare-fun res!180487 () Bool)

(assert (=> b!327622 (= res!180487 (= (select (arr!7941 a!3305) (index!14466 lt!157613)) k0!2497))))

(declare-fun e!201468 () Bool)

(assert (=> b!327622 (=> res!180487 e!201468)))

(declare-fun e!201470 () Bool)

(assert (=> b!327622 (= e!201470 e!201468)))

(declare-fun b!327623 () Bool)

(assert (=> b!327623 (and (bvsge (index!14466 lt!157613) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157613) (size!8293 a!3305)))))

(assert (=> b!327623 (= e!201468 (= (select (arr!7941 a!3305) (index!14466 lt!157613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327624 () Bool)

(declare-fun e!201472 () Bool)

(assert (=> b!327624 (= e!201472 e!201470)))

(declare-fun res!180488 () Bool)

(get-info :version)

(assert (=> b!327624 (= res!180488 (and ((_ is Intermediate!3072) lt!157613) (not (undefined!3884 lt!157613)) (bvslt (x!32708 lt!157613) #b01111111111111111111111111111110) (bvsge (x!32708 lt!157613) #b00000000000000000000000000000000) (bvsge (x!32708 lt!157613) #b00000000000000000000000000000000)))))

(assert (=> b!327624 (=> (not res!180488) (not e!201470))))

(declare-fun b!327625 () Bool)

(assert (=> b!327625 (and (bvsge (index!14466 lt!157613) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157613) (size!8293 a!3305)))))

(declare-fun res!180489 () Bool)

(assert (=> b!327625 (= res!180489 (= (select (arr!7941 a!3305) (index!14466 lt!157613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327625 (=> res!180489 e!201468)))

(declare-fun b!327626 () Bool)

(assert (=> b!327626 (= e!201472 (bvsge (x!32708 lt!157613) #b01111111111111111111111111111110))))

(declare-fun d!69859 () Bool)

(assert (=> d!69859 e!201472))

(declare-fun c!51199 () Bool)

(assert (=> d!69859 (= c!51199 (and ((_ is Intermediate!3072) lt!157613) (undefined!3884 lt!157613)))))

(assert (=> d!69859 (= lt!157613 e!201469)))

(declare-fun c!51201 () Bool)

(assert (=> d!69859 (= c!51201 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157614 () (_ BitVec 64))

(assert (=> d!69859 (= lt!157614 (select (arr!7941 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69859 (validMask!0 mask!3777)))

(assert (=> d!69859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157613)))

(declare-fun b!327627 () Bool)

(declare-fun e!201471 () SeekEntryResult!3072)

(assert (=> b!327627 (= e!201469 e!201471)))

(declare-fun c!51200 () Bool)

(assert (=> b!327627 (= c!51200 (or (= lt!157614 k0!2497) (= (bvadd lt!157614 lt!157614) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327628 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327628 (= e!201471 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327629 () Bool)

(assert (=> b!327629 (= e!201471 (Intermediate!3072 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69859 c!51201) b!327621))

(assert (= (and d!69859 (not c!51201)) b!327627))

(assert (= (and b!327627 c!51200) b!327629))

(assert (= (and b!327627 (not c!51200)) b!327628))

(assert (= (and d!69859 c!51199) b!327626))

(assert (= (and d!69859 (not c!51199)) b!327624))

(assert (= (and b!327624 res!180488) b!327622))

(assert (= (and b!327622 (not res!180487)) b!327625))

(assert (= (and b!327625 (not res!180489)) b!327623))

(assert (=> d!69859 m!333883))

(declare-fun m!333935 () Bool)

(assert (=> d!69859 m!333935))

(assert (=> d!69859 m!333871))

(assert (=> b!327628 m!333883))

(declare-fun m!333937 () Bool)

(assert (=> b!327628 m!333937))

(assert (=> b!327628 m!333937))

(declare-fun m!333939 () Bool)

(assert (=> b!327628 m!333939))

(declare-fun m!333941 () Bool)

(assert (=> b!327622 m!333941))

(assert (=> b!327625 m!333941))

(assert (=> b!327623 m!333941))

(assert (=> b!327551 d!69859))

(declare-fun d!69871 () Bool)

(declare-fun lt!157624 () (_ BitVec 32))

(declare-fun lt!157623 () (_ BitVec 32))

(assert (=> d!69871 (= lt!157624 (bvmul (bvxor lt!157623 (bvlshr lt!157623 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69871 (= lt!157623 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69871 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180490 (let ((h!5400 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32711 (bvmul (bvxor h!5400 (bvlshr h!5400 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32711 (bvlshr x!32711 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180490 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180490 #b00000000000000000000000000000000))))))

(assert (=> d!69871 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157624 (bvlshr lt!157624 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327551 d!69871))

(declare-fun b!327673 () Bool)

(declare-fun e!201502 () Bool)

(declare-fun call!26107 () Bool)

(assert (=> b!327673 (= e!201502 call!26107)))

(declare-fun b!327674 () Bool)

(declare-fun e!201501 () Bool)

(assert (=> b!327674 (= e!201501 e!201502)))

(declare-fun c!51215 () Bool)

(assert (=> b!327674 (= c!51215 (validKeyInArray!0 (select (arr!7941 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69873 () Bool)

(declare-fun res!180509 () Bool)

(assert (=> d!69873 (=> res!180509 e!201501)))

(assert (=> d!69873 (= res!180509 (bvsge #b00000000000000000000000000000000 (size!8293 a!3305)))))

(assert (=> d!69873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201501)))

(declare-fun bm!26104 () Bool)

(assert (=> bm!26104 (= call!26107 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327675 () Bool)

(declare-fun e!201500 () Bool)

(assert (=> b!327675 (= e!201502 e!201500)))

(declare-fun lt!157644 () (_ BitVec 64))

(assert (=> b!327675 (= lt!157644 (select (arr!7941 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10180 0))(
  ( (Unit!10181) )
))
(declare-fun lt!157643 () Unit!10180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16776 (_ BitVec 64) (_ BitVec 32)) Unit!10180)

(assert (=> b!327675 (= lt!157643 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157644 #b00000000000000000000000000000000))))

(assert (=> b!327675 (arrayContainsKey!0 a!3305 lt!157644 #b00000000000000000000000000000000)))

(declare-fun lt!157645 () Unit!10180)

(assert (=> b!327675 (= lt!157645 lt!157643)))

(declare-fun res!180510 () Bool)

(assert (=> b!327675 (= res!180510 (= (seekEntryOrOpen!0 (select (arr!7941 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3072 #b00000000000000000000000000000000)))))

(assert (=> b!327675 (=> (not res!180510) (not e!201500))))

(declare-fun b!327676 () Bool)

(assert (=> b!327676 (= e!201500 call!26107)))

(assert (= (and d!69873 (not res!180509)) b!327674))

(assert (= (and b!327674 c!51215) b!327675))

(assert (= (and b!327674 (not c!51215)) b!327673))

(assert (= (and b!327675 res!180510) b!327676))

(assert (= (or b!327676 b!327673) bm!26104))

(declare-fun m!333951 () Bool)

(assert (=> b!327674 m!333951))

(assert (=> b!327674 m!333951))

(declare-fun m!333953 () Bool)

(assert (=> b!327674 m!333953))

(declare-fun m!333955 () Bool)

(assert (=> bm!26104 m!333955))

(assert (=> b!327675 m!333951))

(declare-fun m!333957 () Bool)

(assert (=> b!327675 m!333957))

(declare-fun m!333959 () Bool)

(assert (=> b!327675 m!333959))

(assert (=> b!327675 m!333951))

(declare-fun m!333961 () Bool)

(assert (=> b!327675 m!333961))

(assert (=> b!327546 d!69873))

(declare-fun b!327729 () Bool)

(declare-fun e!201535 () SeekEntryResult!3072)

(declare-fun e!201537 () SeekEntryResult!3072)

(assert (=> b!327729 (= e!201535 e!201537)))

(declare-fun lt!157662 () (_ BitVec 64))

(declare-fun lt!157664 () SeekEntryResult!3072)

(assert (=> b!327729 (= lt!157662 (select (arr!7941 a!3305) (index!14466 lt!157664)))))

(declare-fun c!51234 () Bool)

(assert (=> b!327729 (= c!51234 (= lt!157662 k0!2497))))

(declare-fun e!201536 () SeekEntryResult!3072)

(declare-fun b!327730 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16776 (_ BitVec 32)) SeekEntryResult!3072)

(assert (=> b!327730 (= e!201536 (seekKeyOrZeroReturnVacant!0 (x!32708 lt!157664) (index!14466 lt!157664) (index!14466 lt!157664) k0!2497 a!3305 mask!3777))))

(declare-fun b!327731 () Bool)

(declare-fun c!51232 () Bool)

(assert (=> b!327731 (= c!51232 (= lt!157662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327731 (= e!201537 e!201536)))

(declare-fun b!327732 () Bool)

(assert (=> b!327732 (= e!201537 (Found!3072 (index!14466 lt!157664)))))

(declare-fun b!327733 () Bool)

(assert (=> b!327733 (= e!201536 (MissingZero!3072 (index!14466 lt!157664)))))

(declare-fun b!327734 () Bool)

(assert (=> b!327734 (= e!201535 Undefined!3072)))

(declare-fun d!69879 () Bool)

(declare-fun lt!157663 () SeekEntryResult!3072)

(assert (=> d!69879 (and (or ((_ is Undefined!3072) lt!157663) (not ((_ is Found!3072) lt!157663)) (and (bvsge (index!14465 lt!157663) #b00000000000000000000000000000000) (bvslt (index!14465 lt!157663) (size!8293 a!3305)))) (or ((_ is Undefined!3072) lt!157663) ((_ is Found!3072) lt!157663) (not ((_ is MissingZero!3072) lt!157663)) (and (bvsge (index!14464 lt!157663) #b00000000000000000000000000000000) (bvslt (index!14464 lt!157663) (size!8293 a!3305)))) (or ((_ is Undefined!3072) lt!157663) ((_ is Found!3072) lt!157663) ((_ is MissingZero!3072) lt!157663) (not ((_ is MissingVacant!3072) lt!157663)) (and (bvsge (index!14467 lt!157663) #b00000000000000000000000000000000) (bvslt (index!14467 lt!157663) (size!8293 a!3305)))) (or ((_ is Undefined!3072) lt!157663) (ite ((_ is Found!3072) lt!157663) (= (select (arr!7941 a!3305) (index!14465 lt!157663)) k0!2497) (ite ((_ is MissingZero!3072) lt!157663) (= (select (arr!7941 a!3305) (index!14464 lt!157663)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3072) lt!157663) (= (select (arr!7941 a!3305) (index!14467 lt!157663)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69879 (= lt!157663 e!201535)))

(declare-fun c!51233 () Bool)

(assert (=> d!69879 (= c!51233 (and ((_ is Intermediate!3072) lt!157664) (undefined!3884 lt!157664)))))

(assert (=> d!69879 (= lt!157664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69879 (validMask!0 mask!3777)))

(assert (=> d!69879 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157663)))

(assert (= (and d!69879 c!51233) b!327734))

(assert (= (and d!69879 (not c!51233)) b!327729))

(assert (= (and b!327729 c!51234) b!327732))

(assert (= (and b!327729 (not c!51234)) b!327731))

(assert (= (and b!327731 c!51232) b!327733))

(assert (= (and b!327731 (not c!51232)) b!327730))

(declare-fun m!333981 () Bool)

(assert (=> b!327729 m!333981))

(declare-fun m!333983 () Bool)

(assert (=> b!327730 m!333983))

(declare-fun m!333985 () Bool)

(assert (=> d!69879 m!333985))

(assert (=> d!69879 m!333883))

(declare-fun m!333987 () Bool)

(assert (=> d!69879 m!333987))

(assert (=> d!69879 m!333883))

(assert (=> d!69879 m!333885))

(declare-fun m!333989 () Bool)

(assert (=> d!69879 m!333989))

(assert (=> d!69879 m!333871))

(assert (=> b!327543 d!69879))

(declare-fun d!69897 () Bool)

(assert (=> d!69897 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32784 d!69897))

(declare-fun d!69899 () Bool)

(assert (=> d!69899 (= (array_inv!5904 a!3305) (bvsge (size!8293 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32784 d!69899))

(declare-fun b!327765 () Bool)

(declare-fun e!201554 () SeekEntryResult!3072)

(assert (=> b!327765 (= e!201554 (Intermediate!3072 true index!1840 x!1490))))

(declare-fun b!327766 () Bool)

(declare-fun lt!157680 () SeekEntryResult!3072)

(assert (=> b!327766 (and (bvsge (index!14466 lt!157680) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157680) (size!8293 a!3305)))))

(declare-fun res!180532 () Bool)

(assert (=> b!327766 (= res!180532 (= (select (arr!7941 a!3305) (index!14466 lt!157680)) k0!2497))))

(declare-fun e!201553 () Bool)

(assert (=> b!327766 (=> res!180532 e!201553)))

(declare-fun e!201555 () Bool)

(assert (=> b!327766 (= e!201555 e!201553)))

(declare-fun b!327767 () Bool)

(assert (=> b!327767 (and (bvsge (index!14466 lt!157680) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157680) (size!8293 a!3305)))))

(assert (=> b!327767 (= e!201553 (= (select (arr!7941 a!3305) (index!14466 lt!157680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327768 () Bool)

(declare-fun e!201557 () Bool)

(assert (=> b!327768 (= e!201557 e!201555)))

(declare-fun res!180533 () Bool)

(assert (=> b!327768 (= res!180533 (and ((_ is Intermediate!3072) lt!157680) (not (undefined!3884 lt!157680)) (bvslt (x!32708 lt!157680) #b01111111111111111111111111111110) (bvsge (x!32708 lt!157680) #b00000000000000000000000000000000) (bvsge (x!32708 lt!157680) x!1490)))))

(assert (=> b!327768 (=> (not res!180533) (not e!201555))))

(declare-fun b!327769 () Bool)

(assert (=> b!327769 (and (bvsge (index!14466 lt!157680) #b00000000000000000000000000000000) (bvslt (index!14466 lt!157680) (size!8293 a!3305)))))

(declare-fun res!180534 () Bool)

(assert (=> b!327769 (= res!180534 (= (select (arr!7941 a!3305) (index!14466 lt!157680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327769 (=> res!180534 e!201553)))

(declare-fun b!327770 () Bool)

(assert (=> b!327770 (= e!201557 (bvsge (x!32708 lt!157680) #b01111111111111111111111111111110))))

(declare-fun d!69901 () Bool)

(assert (=> d!69901 e!201557))

(declare-fun c!51250 () Bool)

(assert (=> d!69901 (= c!51250 (and ((_ is Intermediate!3072) lt!157680) (undefined!3884 lt!157680)))))

(assert (=> d!69901 (= lt!157680 e!201554)))

(declare-fun c!51252 () Bool)

(assert (=> d!69901 (= c!51252 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157681 () (_ BitVec 64))

(assert (=> d!69901 (= lt!157681 (select (arr!7941 a!3305) index!1840))))

(assert (=> d!69901 (validMask!0 mask!3777)))

(assert (=> d!69901 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157680)))

(declare-fun b!327771 () Bool)

(declare-fun e!201556 () SeekEntryResult!3072)

(assert (=> b!327771 (= e!201554 e!201556)))

(declare-fun c!51251 () Bool)

(assert (=> b!327771 (= c!51251 (or (= lt!157681 k0!2497) (= (bvadd lt!157681 lt!157681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327772 () Bool)

(assert (=> b!327772 (= e!201556 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327773 () Bool)

(assert (=> b!327773 (= e!201556 (Intermediate!3072 false index!1840 x!1490))))

(assert (= (and d!69901 c!51252) b!327765))

(assert (= (and d!69901 (not c!51252)) b!327771))

(assert (= (and b!327771 c!51251) b!327773))

(assert (= (and b!327771 (not c!51251)) b!327772))

(assert (= (and d!69901 c!51250) b!327770))

(assert (= (and d!69901 (not c!51250)) b!327768))

(assert (= (and b!327768 res!180533) b!327766))

(assert (= (and b!327766 (not res!180532)) b!327769))

(assert (= (and b!327769 (not res!180534)) b!327767))

(assert (=> d!69901 m!333877))

(assert (=> d!69901 m!333871))

(declare-fun m!334001 () Bool)

(assert (=> b!327772 m!334001))

(assert (=> b!327772 m!334001))

(declare-fun m!334003 () Bool)

(assert (=> b!327772 m!334003))

(declare-fun m!334005 () Bool)

(assert (=> b!327766 m!334005))

(assert (=> b!327769 m!334005))

(assert (=> b!327767 m!334005))

(assert (=> b!327549 d!69901))

(declare-fun d!69903 () Bool)

(declare-fun res!180542 () Bool)

(declare-fun e!201570 () Bool)

(assert (=> d!69903 (=> res!180542 e!201570)))

(assert (=> d!69903 (= res!180542 (= (select (arr!7941 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69903 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201570)))

(declare-fun b!327793 () Bool)

(declare-fun e!201571 () Bool)

(assert (=> b!327793 (= e!201570 e!201571)))

(declare-fun res!180543 () Bool)

(assert (=> b!327793 (=> (not res!180543) (not e!201571))))

(assert (=> b!327793 (= res!180543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8293 a!3305)))))

(declare-fun b!327794 () Bool)

(assert (=> b!327794 (= e!201571 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69903 (not res!180542)) b!327793))

(assert (= (and b!327793 res!180543) b!327794))

(assert (=> d!69903 m!333951))

(declare-fun m!334017 () Bool)

(assert (=> b!327794 m!334017))

(assert (=> b!327544 d!69903))

(check-sat (not d!69901) (not b!327674) (not d!69859) (not b!327794) (not b!327675) (not bm!26104) (not b!327730) (not b!327628) (not d!69879) (not b!327772))
