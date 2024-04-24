; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33128 () Bool)

(assert start!33128)

(declare-fun b!329566 () Bool)

(declare-fun res!181641 () Bool)

(declare-fun e!202438 () Bool)

(assert (=> b!329566 (=> (not res!181641) (not e!202438))))

(declare-datatypes ((array!16851 0))(
  ( (array!16852 (arr!7969 (Array (_ BitVec 32) (_ BitVec 64))) (size!8321 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16851)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3065 0))(
  ( (MissingZero!3065 (index!14436 (_ BitVec 32))) (Found!3065 (index!14437 (_ BitVec 32))) (Intermediate!3065 (undefined!3877 Bool) (index!14438 (_ BitVec 32)) (x!32820 (_ BitVec 32))) (Undefined!3065) (MissingVacant!3065 (index!14439 (_ BitVec 32))) )
))
(declare-fun lt!158313 () SeekEntryResult!3065)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16851 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!329566 (= res!181641 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158313))))

(declare-fun b!329567 () Bool)

(declare-datatypes ((Unit!10174 0))(
  ( (Unit!10175) )
))
(declare-fun e!202437 () Unit!10174)

(declare-fun Unit!10176 () Unit!10174)

(assert (=> b!329567 (= e!202437 Unit!10176)))

(assert (=> b!329567 false))

(declare-fun res!181645 () Bool)

(declare-fun e!202439 () Bool)

(assert (=> start!33128 (=> (not res!181645) (not e!202439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33128 (= res!181645 (validMask!0 mask!3777))))

(assert (=> start!33128 e!202439))

(declare-fun array_inv!5919 (array!16851) Bool)

(assert (=> start!33128 (array_inv!5919 a!3305)))

(assert (=> start!33128 true))

(declare-fun b!329568 () Bool)

(declare-fun Unit!10177 () Unit!10174)

(assert (=> b!329568 (= e!202437 Unit!10177)))

(declare-fun b!329569 () Bool)

(declare-fun res!181646 () Bool)

(assert (=> b!329569 (=> (not res!181646) (not e!202439))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329569 (= res!181646 (and (= (size!8321 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8321 a!3305))))))

(declare-fun b!329570 () Bool)

(declare-fun res!181638 () Bool)

(assert (=> b!329570 (=> (not res!181638) (not e!202439))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16851 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!329570 (= res!181638 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3065 i!1250)))))

(declare-fun b!329571 () Bool)

(assert (=> b!329571 (= e!202438 true)))

(declare-fun lt!158312 () Unit!10174)

(assert (=> b!329571 (= lt!158312 e!202437)))

(declare-fun c!51605 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329571 (= c!51605 ((_ is Intermediate!3065) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun b!329572 () Bool)

(declare-fun res!181644 () Bool)

(assert (=> b!329572 (=> (not res!181644) (not e!202438))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!329572 (= res!181644 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7969 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7969 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7969 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329573 () Bool)

(assert (=> b!329573 (= e!202439 e!202438)))

(declare-fun res!181642 () Bool)

(assert (=> b!329573 (=> (not res!181642) (not e!202438))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329573 (= res!181642 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158313))))

(assert (=> b!329573 (= lt!158313 (Intermediate!3065 false resIndex!58 resX!58))))

(declare-fun b!329574 () Bool)

(declare-fun res!181643 () Bool)

(assert (=> b!329574 (=> (not res!181643) (not e!202439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329574 (= res!181643 (validKeyInArray!0 k0!2497))))

(declare-fun b!329575 () Bool)

(declare-fun res!181639 () Bool)

(assert (=> b!329575 (=> (not res!181639) (not e!202439))))

(declare-fun arrayContainsKey!0 (array!16851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329575 (= res!181639 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329576 () Bool)

(declare-fun res!181640 () Bool)

(assert (=> b!329576 (=> (not res!181640) (not e!202439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16851 (_ BitVec 32)) Bool)

(assert (=> b!329576 (= res!181640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329577 () Bool)

(declare-fun res!181647 () Bool)

(assert (=> b!329577 (=> (not res!181647) (not e!202438))))

(assert (=> b!329577 (= res!181647 (and (= (select (arr!7969 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8321 a!3305))))))

(assert (= (and start!33128 res!181645) b!329569))

(assert (= (and b!329569 res!181646) b!329574))

(assert (= (and b!329574 res!181643) b!329575))

(assert (= (and b!329575 res!181639) b!329570))

(assert (= (and b!329570 res!181638) b!329576))

(assert (= (and b!329576 res!181640) b!329573))

(assert (= (and b!329573 res!181642) b!329577))

(assert (= (and b!329577 res!181647) b!329566))

(assert (= (and b!329566 res!181641) b!329572))

(assert (= (and b!329572 res!181644) b!329571))

(assert (= (and b!329571 c!51605) b!329568))

(assert (= (and b!329571 (not c!51605)) b!329567))

(declare-fun m!335413 () Bool)

(assert (=> b!329576 m!335413))

(declare-fun m!335415 () Bool)

(assert (=> b!329571 m!335415))

(assert (=> b!329571 m!335415))

(declare-fun m!335417 () Bool)

(assert (=> b!329571 m!335417))

(declare-fun m!335419 () Bool)

(assert (=> b!329570 m!335419))

(declare-fun m!335421 () Bool)

(assert (=> b!329574 m!335421))

(declare-fun m!335423 () Bool)

(assert (=> b!329577 m!335423))

(declare-fun m!335425 () Bool)

(assert (=> start!33128 m!335425))

(declare-fun m!335427 () Bool)

(assert (=> start!33128 m!335427))

(declare-fun m!335429 () Bool)

(assert (=> b!329566 m!335429))

(declare-fun m!335431 () Bool)

(assert (=> b!329573 m!335431))

(assert (=> b!329573 m!335431))

(declare-fun m!335433 () Bool)

(assert (=> b!329573 m!335433))

(declare-fun m!335435 () Bool)

(assert (=> b!329575 m!335435))

(declare-fun m!335437 () Bool)

(assert (=> b!329572 m!335437))

(check-sat (not start!33128) (not b!329570) (not b!329576) (not b!329574) (not b!329566) (not b!329575) (not b!329573) (not b!329571))
(check-sat)
(get-model)

(declare-fun b!329658 () Bool)

(declare-fun e!202471 () Bool)

(declare-fun call!26141 () Bool)

(assert (=> b!329658 (= e!202471 call!26141)))

(declare-fun b!329659 () Bool)

(declare-fun e!202473 () Bool)

(declare-fun e!202472 () Bool)

(assert (=> b!329659 (= e!202473 e!202472)))

(declare-fun c!51614 () Bool)

(assert (=> b!329659 (= c!51614 (validKeyInArray!0 (select (arr!7969 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329660 () Bool)

(assert (=> b!329660 (= e!202472 e!202471)))

(declare-fun lt!158332 () (_ BitVec 64))

(assert (=> b!329660 (= lt!158332 (select (arr!7969 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158333 () Unit!10174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16851 (_ BitVec 64) (_ BitVec 32)) Unit!10174)

(assert (=> b!329660 (= lt!158333 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158332 #b00000000000000000000000000000000))))

(assert (=> b!329660 (arrayContainsKey!0 a!3305 lt!158332 #b00000000000000000000000000000000)))

(declare-fun lt!158334 () Unit!10174)

(assert (=> b!329660 (= lt!158334 lt!158333)))

(declare-fun res!181712 () Bool)

(assert (=> b!329660 (= res!181712 (= (seekEntryOrOpen!0 (select (arr!7969 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3065 #b00000000000000000000000000000000)))))

(assert (=> b!329660 (=> (not res!181712) (not e!202471))))

(declare-fun d!70249 () Bool)

(declare-fun res!181713 () Bool)

(assert (=> d!70249 (=> res!181713 e!202473)))

(assert (=> d!70249 (= res!181713 (bvsge #b00000000000000000000000000000000 (size!8321 a!3305)))))

(assert (=> d!70249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202473)))

(declare-fun b!329661 () Bool)

(assert (=> b!329661 (= e!202472 call!26141)))

(declare-fun bm!26138 () Bool)

(assert (=> bm!26138 (= call!26141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!70249 (not res!181713)) b!329659))

(assert (= (and b!329659 c!51614) b!329660))

(assert (= (and b!329659 (not c!51614)) b!329661))

(assert (= (and b!329660 res!181712) b!329658))

(assert (= (or b!329658 b!329661) bm!26138))

(declare-fun m!335491 () Bool)

(assert (=> b!329659 m!335491))

(assert (=> b!329659 m!335491))

(declare-fun m!335493 () Bool)

(assert (=> b!329659 m!335493))

(assert (=> b!329660 m!335491))

(declare-fun m!335495 () Bool)

(assert (=> b!329660 m!335495))

(declare-fun m!335497 () Bool)

(assert (=> b!329660 m!335497))

(assert (=> b!329660 m!335491))

(declare-fun m!335499 () Bool)

(assert (=> b!329660 m!335499))

(declare-fun m!335501 () Bool)

(assert (=> bm!26138 m!335501))

(assert (=> b!329576 d!70249))

(declare-fun b!329773 () Bool)

(declare-fun e!202540 () SeekEntryResult!3065)

(declare-fun e!202539 () SeekEntryResult!3065)

(assert (=> b!329773 (= e!202540 e!202539)))

(declare-fun c!51652 () Bool)

(declare-fun lt!158378 () (_ BitVec 64))

(assert (=> b!329773 (= c!51652 (or (= lt!158378 k0!2497) (= (bvadd lt!158378 lt!158378) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329774 () Bool)

(declare-fun lt!158379 () SeekEntryResult!3065)

(assert (=> b!329774 (and (bvsge (index!14438 lt!158379) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158379) (size!8321 a!3305)))))

(declare-fun res!181756 () Bool)

(assert (=> b!329774 (= res!181756 (= (select (arr!7969 a!3305) (index!14438 lt!158379)) k0!2497))))

(declare-fun e!202542 () Bool)

(assert (=> b!329774 (=> res!181756 e!202542)))

(declare-fun e!202541 () Bool)

(assert (=> b!329774 (= e!202541 e!202542)))

(declare-fun b!329775 () Bool)

(declare-fun e!202538 () Bool)

(assert (=> b!329775 (= e!202538 (bvsge (x!32820 lt!158379) #b01111111111111111111111111111110))))

(declare-fun b!329776 () Bool)

(assert (=> b!329776 (= e!202539 (Intermediate!3065 false (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329777 () Bool)

(assert (=> b!329777 (and (bvsge (index!14438 lt!158379) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158379) (size!8321 a!3305)))))

(declare-fun res!181755 () Bool)

(assert (=> b!329777 (= res!181755 (= (select (arr!7969 a!3305) (index!14438 lt!158379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329777 (=> res!181755 e!202542)))

(declare-fun b!329778 () Bool)

(assert (=> b!329778 (and (bvsge (index!14438 lt!158379) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158379) (size!8321 a!3305)))))

(assert (=> b!329778 (= e!202542 (= (select (arr!7969 a!3305) (index!14438 lt!158379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329779 () Bool)

(assert (=> b!329779 (= e!202539 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70253 () Bool)

(assert (=> d!70253 e!202538))

(declare-fun c!51653 () Bool)

(assert (=> d!70253 (= c!51653 (and ((_ is Intermediate!3065) lt!158379) (undefined!3877 lt!158379)))))

(assert (=> d!70253 (= lt!158379 e!202540)))

(declare-fun c!51651 () Bool)

(assert (=> d!70253 (= c!51651 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70253 (= lt!158378 (select (arr!7969 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)))))

(assert (=> d!70253 (validMask!0 mask!3777)))

(assert (=> d!70253 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777) lt!158379)))

(declare-fun b!329780 () Bool)

(assert (=> b!329780 (= e!202540 (Intermediate!3065 true (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329781 () Bool)

(assert (=> b!329781 (= e!202538 e!202541)))

(declare-fun res!181754 () Bool)

(assert (=> b!329781 (= res!181754 (and ((_ is Intermediate!3065) lt!158379) (not (undefined!3877 lt!158379)) (bvslt (x!32820 lt!158379) #b01111111111111111111111111111110) (bvsge (x!32820 lt!158379) #b00000000000000000000000000000000) (bvsge (x!32820 lt!158379) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329781 (=> (not res!181754) (not e!202541))))

(assert (= (and d!70253 c!51651) b!329780))

(assert (= (and d!70253 (not c!51651)) b!329773))

(assert (= (and b!329773 c!51652) b!329776))

(assert (= (and b!329773 (not c!51652)) b!329779))

(assert (= (and d!70253 c!51653) b!329775))

(assert (= (and d!70253 (not c!51653)) b!329781))

(assert (= (and b!329781 res!181754) b!329774))

(assert (= (and b!329774 (not res!181756)) b!329777))

(assert (= (and b!329777 (not res!181755)) b!329778))

(declare-fun m!335557 () Bool)

(assert (=> b!329778 m!335557))

(assert (=> b!329777 m!335557))

(assert (=> d!70253 m!335415))

(declare-fun m!335559 () Bool)

(assert (=> d!70253 m!335559))

(assert (=> d!70253 m!335425))

(assert (=> b!329779 m!335415))

(declare-fun m!335561 () Bool)

(assert (=> b!329779 m!335561))

(assert (=> b!329779 m!335561))

(declare-fun m!335563 () Bool)

(assert (=> b!329779 m!335563))

(assert (=> b!329774 m!335557))

(assert (=> b!329571 d!70253))

(declare-fun d!70273 () Bool)

(declare-fun lt!158382 () (_ BitVec 32))

(assert (=> d!70273 (and (bvsge lt!158382 #b00000000000000000000000000000000) (bvslt lt!158382 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70273 (= lt!158382 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!70273 (validMask!0 mask!3777)))

(assert (=> d!70273 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!158382)))

(declare-fun bs!11432 () Bool)

(assert (= bs!11432 d!70273))

(declare-fun m!335565 () Bool)

(assert (=> bs!11432 m!335565))

(assert (=> bs!11432 m!335425))

(assert (=> b!329571 d!70273))

(declare-fun b!329782 () Bool)

(declare-fun e!202545 () SeekEntryResult!3065)

(declare-fun e!202544 () SeekEntryResult!3065)

(assert (=> b!329782 (= e!202545 e!202544)))

(declare-fun c!51655 () Bool)

(declare-fun lt!158383 () (_ BitVec 64))

(assert (=> b!329782 (= c!51655 (or (= lt!158383 k0!2497) (= (bvadd lt!158383 lt!158383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329783 () Bool)

(declare-fun lt!158384 () SeekEntryResult!3065)

(assert (=> b!329783 (and (bvsge (index!14438 lt!158384) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158384) (size!8321 a!3305)))))

(declare-fun res!181760 () Bool)

(assert (=> b!329783 (= res!181760 (= (select (arr!7969 a!3305) (index!14438 lt!158384)) k0!2497))))

(declare-fun e!202547 () Bool)

(assert (=> b!329783 (=> res!181760 e!202547)))

(declare-fun e!202546 () Bool)

(assert (=> b!329783 (= e!202546 e!202547)))

(declare-fun b!329784 () Bool)

(declare-fun e!202543 () Bool)

(assert (=> b!329784 (= e!202543 (bvsge (x!32820 lt!158384) #b01111111111111111111111111111110))))

(declare-fun b!329785 () Bool)

(assert (=> b!329785 (= e!202544 (Intermediate!3065 false index!1840 x!1490))))

(declare-fun b!329786 () Bool)

(assert (=> b!329786 (and (bvsge (index!14438 lt!158384) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158384) (size!8321 a!3305)))))

(declare-fun res!181759 () Bool)

(assert (=> b!329786 (= res!181759 (= (select (arr!7969 a!3305) (index!14438 lt!158384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329786 (=> res!181759 e!202547)))

(declare-fun b!329787 () Bool)

(assert (=> b!329787 (and (bvsge (index!14438 lt!158384) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158384) (size!8321 a!3305)))))

(assert (=> b!329787 (= e!202547 (= (select (arr!7969 a!3305) (index!14438 lt!158384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329788 () Bool)

(assert (=> b!329788 (= e!202544 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70275 () Bool)

(assert (=> d!70275 e!202543))

(declare-fun c!51656 () Bool)

(assert (=> d!70275 (= c!51656 (and ((_ is Intermediate!3065) lt!158384) (undefined!3877 lt!158384)))))

(assert (=> d!70275 (= lt!158384 e!202545)))

(declare-fun c!51654 () Bool)

(assert (=> d!70275 (= c!51654 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70275 (= lt!158383 (select (arr!7969 a!3305) index!1840))))

(assert (=> d!70275 (validMask!0 mask!3777)))

(assert (=> d!70275 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158384)))

(declare-fun b!329789 () Bool)

(assert (=> b!329789 (= e!202545 (Intermediate!3065 true index!1840 x!1490))))

(declare-fun b!329790 () Bool)

(assert (=> b!329790 (= e!202543 e!202546)))

(declare-fun res!181758 () Bool)

(assert (=> b!329790 (= res!181758 (and ((_ is Intermediate!3065) lt!158384) (not (undefined!3877 lt!158384)) (bvslt (x!32820 lt!158384) #b01111111111111111111111111111110) (bvsge (x!32820 lt!158384) #b00000000000000000000000000000000) (bvsge (x!32820 lt!158384) x!1490)))))

(assert (=> b!329790 (=> (not res!181758) (not e!202546))))

(assert (= (and d!70275 c!51654) b!329789))

(assert (= (and d!70275 (not c!51654)) b!329782))

(assert (= (and b!329782 c!51655) b!329785))

(assert (= (and b!329782 (not c!51655)) b!329788))

(assert (= (and d!70275 c!51656) b!329784))

(assert (= (and d!70275 (not c!51656)) b!329790))

(assert (= (and b!329790 res!181758) b!329783))

(assert (= (and b!329783 (not res!181760)) b!329786))

(assert (= (and b!329786 (not res!181759)) b!329787))

(declare-fun m!335567 () Bool)

(assert (=> b!329787 m!335567))

(assert (=> b!329786 m!335567))

(assert (=> d!70275 m!335437))

(assert (=> d!70275 m!335425))

(declare-fun m!335569 () Bool)

(assert (=> b!329788 m!335569))

(assert (=> b!329788 m!335569))

(declare-fun m!335571 () Bool)

(assert (=> b!329788 m!335571))

(assert (=> b!329783 m!335567))

(assert (=> b!329566 d!70275))

(declare-fun d!70277 () Bool)

(declare-fun res!181765 () Bool)

(declare-fun e!202552 () Bool)

(assert (=> d!70277 (=> res!181765 e!202552)))

(assert (=> d!70277 (= res!181765 (= (select (arr!7969 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70277 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202552)))

(declare-fun b!329795 () Bool)

(declare-fun e!202553 () Bool)

(assert (=> b!329795 (= e!202552 e!202553)))

(declare-fun res!181766 () Bool)

(assert (=> b!329795 (=> (not res!181766) (not e!202553))))

(assert (=> b!329795 (= res!181766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8321 a!3305)))))

(declare-fun b!329796 () Bool)

(assert (=> b!329796 (= e!202553 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70277 (not res!181765)) b!329795))

(assert (= (and b!329795 res!181766) b!329796))

(assert (=> d!70277 m!335491))

(declare-fun m!335573 () Bool)

(assert (=> b!329796 m!335573))

(assert (=> b!329575 d!70277))

(declare-fun d!70281 () Bool)

(assert (=> d!70281 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33128 d!70281))

(declare-fun d!70285 () Bool)

(assert (=> d!70285 (= (array_inv!5919 a!3305) (bvsge (size!8321 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33128 d!70285))

(declare-fun b!329869 () Bool)

(declare-fun e!202600 () SeekEntryResult!3065)

(declare-fun lt!158425 () SeekEntryResult!3065)

(assert (=> b!329869 (= e!202600 (MissingZero!3065 (index!14438 lt!158425)))))

(declare-fun b!329870 () Bool)

(declare-fun c!51686 () Bool)

(declare-fun lt!158426 () (_ BitVec 64))

(assert (=> b!329870 (= c!51686 (= lt!158426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202601 () SeekEntryResult!3065)

(assert (=> b!329870 (= e!202601 e!202600)))

(declare-fun d!70287 () Bool)

(declare-fun lt!158424 () SeekEntryResult!3065)

(assert (=> d!70287 (and (or ((_ is Undefined!3065) lt!158424) (not ((_ is Found!3065) lt!158424)) (and (bvsge (index!14437 lt!158424) #b00000000000000000000000000000000) (bvslt (index!14437 lt!158424) (size!8321 a!3305)))) (or ((_ is Undefined!3065) lt!158424) ((_ is Found!3065) lt!158424) (not ((_ is MissingZero!3065) lt!158424)) (and (bvsge (index!14436 lt!158424) #b00000000000000000000000000000000) (bvslt (index!14436 lt!158424) (size!8321 a!3305)))) (or ((_ is Undefined!3065) lt!158424) ((_ is Found!3065) lt!158424) ((_ is MissingZero!3065) lt!158424) (not ((_ is MissingVacant!3065) lt!158424)) (and (bvsge (index!14439 lt!158424) #b00000000000000000000000000000000) (bvslt (index!14439 lt!158424) (size!8321 a!3305)))) (or ((_ is Undefined!3065) lt!158424) (ite ((_ is Found!3065) lt!158424) (= (select (arr!7969 a!3305) (index!14437 lt!158424)) k0!2497) (ite ((_ is MissingZero!3065) lt!158424) (= (select (arr!7969 a!3305) (index!14436 lt!158424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3065) lt!158424) (= (select (arr!7969 a!3305) (index!14439 lt!158424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!202599 () SeekEntryResult!3065)

(assert (=> d!70287 (= lt!158424 e!202599)))

(declare-fun c!51684 () Bool)

(assert (=> d!70287 (= c!51684 (and ((_ is Intermediate!3065) lt!158425) (undefined!3877 lt!158425)))))

(assert (=> d!70287 (= lt!158425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70287 (validMask!0 mask!3777)))

(assert (=> d!70287 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158424)))

(declare-fun b!329871 () Bool)

(assert (=> b!329871 (= e!202599 e!202601)))

(assert (=> b!329871 (= lt!158426 (select (arr!7969 a!3305) (index!14438 lt!158425)))))

(declare-fun c!51685 () Bool)

(assert (=> b!329871 (= c!51685 (= lt!158426 k0!2497))))

(declare-fun b!329872 () Bool)

(assert (=> b!329872 (= e!202601 (Found!3065 (index!14438 lt!158425)))))

(declare-fun b!329873 () Bool)

(assert (=> b!329873 (= e!202599 Undefined!3065)))

(declare-fun b!329874 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16851 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!329874 (= e!202600 (seekKeyOrZeroReturnVacant!0 (x!32820 lt!158425) (index!14438 lt!158425) (index!14438 lt!158425) k0!2497 a!3305 mask!3777))))

(assert (= (and d!70287 c!51684) b!329873))

(assert (= (and d!70287 (not c!51684)) b!329871))

(assert (= (and b!329871 c!51685) b!329872))

(assert (= (and b!329871 (not c!51685)) b!329870))

(assert (= (and b!329870 c!51686) b!329869))

(assert (= (and b!329870 (not c!51686)) b!329874))

(assert (=> d!70287 m!335431))

(declare-fun m!335611 () Bool)

(assert (=> d!70287 m!335611))

(declare-fun m!335613 () Bool)

(assert (=> d!70287 m!335613))

(assert (=> d!70287 m!335431))

(assert (=> d!70287 m!335433))

(declare-fun m!335615 () Bool)

(assert (=> d!70287 m!335615))

(assert (=> d!70287 m!335425))

(declare-fun m!335617 () Bool)

(assert (=> b!329871 m!335617))

(declare-fun m!335619 () Bool)

(assert (=> b!329874 m!335619))

(assert (=> b!329570 d!70287))

(declare-fun d!70303 () Bool)

(assert (=> d!70303 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329574 d!70303))

(declare-fun b!329875 () Bool)

(declare-fun e!202604 () SeekEntryResult!3065)

(declare-fun e!202603 () SeekEntryResult!3065)

(assert (=> b!329875 (= e!202604 e!202603)))

(declare-fun c!51688 () Bool)

(declare-fun lt!158427 () (_ BitVec 64))

(assert (=> b!329875 (= c!51688 (or (= lt!158427 k0!2497) (= (bvadd lt!158427 lt!158427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329876 () Bool)

(declare-fun lt!158428 () SeekEntryResult!3065)

(assert (=> b!329876 (and (bvsge (index!14438 lt!158428) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158428) (size!8321 a!3305)))))

(declare-fun res!181787 () Bool)

(assert (=> b!329876 (= res!181787 (= (select (arr!7969 a!3305) (index!14438 lt!158428)) k0!2497))))

(declare-fun e!202606 () Bool)

(assert (=> b!329876 (=> res!181787 e!202606)))

(declare-fun e!202605 () Bool)

(assert (=> b!329876 (= e!202605 e!202606)))

(declare-fun b!329877 () Bool)

(declare-fun e!202602 () Bool)

(assert (=> b!329877 (= e!202602 (bvsge (x!32820 lt!158428) #b01111111111111111111111111111110))))

(declare-fun b!329878 () Bool)

(assert (=> b!329878 (= e!202603 (Intermediate!3065 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329879 () Bool)

(assert (=> b!329879 (and (bvsge (index!14438 lt!158428) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158428) (size!8321 a!3305)))))

(declare-fun res!181786 () Bool)

(assert (=> b!329879 (= res!181786 (= (select (arr!7969 a!3305) (index!14438 lt!158428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329879 (=> res!181786 e!202606)))

(declare-fun b!329880 () Bool)

(assert (=> b!329880 (and (bvsge (index!14438 lt!158428) #b00000000000000000000000000000000) (bvslt (index!14438 lt!158428) (size!8321 a!3305)))))

(assert (=> b!329880 (= e!202606 (= (select (arr!7969 a!3305) (index!14438 lt!158428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329881 () Bool)

(assert (=> b!329881 (= e!202603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70307 () Bool)

(assert (=> d!70307 e!202602))

(declare-fun c!51689 () Bool)

(assert (=> d!70307 (= c!51689 (and ((_ is Intermediate!3065) lt!158428) (undefined!3877 lt!158428)))))

(assert (=> d!70307 (= lt!158428 e!202604)))

(declare-fun c!51687 () Bool)

(assert (=> d!70307 (= c!51687 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70307 (= lt!158427 (select (arr!7969 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70307 (validMask!0 mask!3777)))

(assert (=> d!70307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158428)))

(declare-fun b!329882 () Bool)

(assert (=> b!329882 (= e!202604 (Intermediate!3065 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329883 () Bool)

(assert (=> b!329883 (= e!202602 e!202605)))

(declare-fun res!181785 () Bool)

(assert (=> b!329883 (= res!181785 (and ((_ is Intermediate!3065) lt!158428) (not (undefined!3877 lt!158428)) (bvslt (x!32820 lt!158428) #b01111111111111111111111111111110) (bvsge (x!32820 lt!158428) #b00000000000000000000000000000000) (bvsge (x!32820 lt!158428) #b00000000000000000000000000000000)))))

(assert (=> b!329883 (=> (not res!181785) (not e!202605))))

(assert (= (and d!70307 c!51687) b!329882))

(assert (= (and d!70307 (not c!51687)) b!329875))

(assert (= (and b!329875 c!51688) b!329878))

(assert (= (and b!329875 (not c!51688)) b!329881))

(assert (= (and d!70307 c!51689) b!329877))

(assert (= (and d!70307 (not c!51689)) b!329883))

(assert (= (and b!329883 res!181785) b!329876))

(assert (= (and b!329876 (not res!181787)) b!329879))

(assert (= (and b!329879 (not res!181786)) b!329880))

(declare-fun m!335621 () Bool)

(assert (=> b!329880 m!335621))

(assert (=> b!329879 m!335621))

(assert (=> d!70307 m!335431))

(declare-fun m!335623 () Bool)

(assert (=> d!70307 m!335623))

(assert (=> d!70307 m!335425))

(assert (=> b!329881 m!335431))

(declare-fun m!335625 () Bool)

(assert (=> b!329881 m!335625))

(assert (=> b!329881 m!335625))

(declare-fun m!335627 () Bool)

(assert (=> b!329881 m!335627))

(assert (=> b!329876 m!335621))

(assert (=> b!329573 d!70307))

(declare-fun d!70311 () Bool)

(declare-fun lt!158436 () (_ BitVec 32))

(declare-fun lt!158435 () (_ BitVec 32))

(assert (=> d!70311 (= lt!158436 (bvmul (bvxor lt!158435 (bvlshr lt!158435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70311 (= lt!158435 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70311 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181791 (let ((h!5332 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32831 (bvmul (bvxor h!5332 (bvlshr h!5332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32831 (bvlshr x!32831 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181791 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181791 #b00000000000000000000000000000000))))))

(assert (=> d!70311 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158436 (bvlshr lt!158436 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329573 d!70311))

(check-sat (not b!329796) (not b!329874) (not b!329881) (not b!329659) (not d!70273) (not b!329788) (not d!70253) (not d!70287) (not b!329660) (not d!70307) (not bm!26138) (not d!70275) (not b!329779))
(check-sat)
