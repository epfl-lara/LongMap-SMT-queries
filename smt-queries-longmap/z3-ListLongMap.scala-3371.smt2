; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46268 () Bool)

(assert start!46268)

(declare-fun b!512590 () Bool)

(declare-fun e!299319 () Bool)

(declare-fun e!299318 () Bool)

(assert (=> b!512590 (= e!299319 e!299318)))

(declare-fun res!313308 () Bool)

(assert (=> b!512590 (=> (not res!313308) (not e!299318))))

(declare-datatypes ((SeekEntryResult!4261 0))(
  ( (MissingZero!4261 (index!19232 (_ BitVec 32))) (Found!4261 (index!19233 (_ BitVec 32))) (Intermediate!4261 (undefined!5073 Bool) (index!19234 (_ BitVec 32)) (x!48321 (_ BitVec 32))) (Undefined!4261) (MissingVacant!4261 (index!19235 (_ BitVec 32))) )
))
(declare-fun lt!234725 () SeekEntryResult!4261)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512590 (= res!313308 (or (= lt!234725 (MissingZero!4261 i!1204)) (= lt!234725 (MissingVacant!4261 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32923 0))(
  ( (array!32924 (arr!15838 (Array (_ BitVec 32) (_ BitVec 64))) (size!16202 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32923)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32923 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!512590 (= lt!234725 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512591 () Bool)

(declare-fun res!313314 () Bool)

(assert (=> b!512591 (=> (not res!313314) (not e!299319))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512591 (= res!313314 (validKeyInArray!0 (select (arr!15838 a!3235) j!176)))))

(declare-fun b!512592 () Bool)

(declare-fun e!299315 () Bool)

(declare-fun lt!234727 () SeekEntryResult!4261)

(get-info :version)

(assert (=> b!512592 (= e!299315 (or (not ((_ is Intermediate!4261) lt!234727)) (undefined!5073 lt!234727) (bvslt (x!48321 lt!234727) #b01111111111111111111111111111110)))))

(declare-fun res!313315 () Bool)

(assert (=> start!46268 (=> (not res!313315) (not e!299319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46268 (= res!313315 (validMask!0 mask!3524))))

(assert (=> start!46268 e!299319))

(assert (=> start!46268 true))

(declare-fun array_inv!11697 (array!32923) Bool)

(assert (=> start!46268 (array_inv!11697 a!3235)))

(declare-fun b!512593 () Bool)

(declare-fun res!313311 () Bool)

(assert (=> b!512593 (=> (not res!313311) (not e!299319))))

(assert (=> b!512593 (= res!313311 (and (= (size!16202 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16202 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16202 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512594 () Bool)

(declare-fun res!313306 () Bool)

(assert (=> b!512594 (=> (not res!313306) (not e!299319))))

(declare-fun arrayContainsKey!0 (array!32923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512594 (= res!313306 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512595 () Bool)

(declare-fun res!313312 () Bool)

(assert (=> b!512595 (=> (not res!313312) (not e!299318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32923 (_ BitVec 32)) Bool)

(assert (=> b!512595 (= res!313312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!299316 () Bool)

(declare-fun b!512596 () Bool)

(assert (=> b!512596 (= e!299316 (= (seekEntryOrOpen!0 (select (arr!15838 a!3235) j!176) a!3235 mask!3524) (Found!4261 j!176)))))

(declare-fun b!512597 () Bool)

(declare-fun res!313310 () Bool)

(assert (=> b!512597 (=> (not res!313310) (not e!299318))))

(declare-datatypes ((List!9903 0))(
  ( (Nil!9900) (Cons!9899 (h!10779 (_ BitVec 64)) (t!16123 List!9903)) )
))
(declare-fun arrayNoDuplicates!0 (array!32923 (_ BitVec 32) List!9903) Bool)

(assert (=> b!512597 (= res!313310 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9900))))

(declare-fun b!512598 () Bool)

(declare-fun res!313313 () Bool)

(assert (=> b!512598 (=> (not res!313313) (not e!299319))))

(assert (=> b!512598 (= res!313313 (validKeyInArray!0 k0!2280))))

(declare-fun b!512599 () Bool)

(assert (=> b!512599 (= e!299318 (not e!299315))))

(declare-fun res!313307 () Bool)

(assert (=> b!512599 (=> res!313307 e!299315)))

(declare-fun lt!234723 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32923 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!512599 (= res!313307 (= lt!234727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234723 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)) mask!3524)))))

(declare-fun lt!234724 () (_ BitVec 32))

(assert (=> b!512599 (= lt!234727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234724 (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512599 (= lt!234723 (toIndex!0 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512599 (= lt!234724 (toIndex!0 (select (arr!15838 a!3235) j!176) mask!3524))))

(assert (=> b!512599 e!299316))

(declare-fun res!313309 () Bool)

(assert (=> b!512599 (=> (not res!313309) (not e!299316))))

(assert (=> b!512599 (= res!313309 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15841 0))(
  ( (Unit!15842) )
))
(declare-fun lt!234726 () Unit!15841)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15841)

(assert (=> b!512599 (= lt!234726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46268 res!313315) b!512593))

(assert (= (and b!512593 res!313311) b!512591))

(assert (= (and b!512591 res!313314) b!512598))

(assert (= (and b!512598 res!313313) b!512594))

(assert (= (and b!512594 res!313306) b!512590))

(assert (= (and b!512590 res!313308) b!512595))

(assert (= (and b!512595 res!313312) b!512597))

(assert (= (and b!512597 res!313310) b!512599))

(assert (= (and b!512599 res!313309) b!512596))

(assert (= (and b!512599 (not res!313307)) b!512592))

(declare-fun m!494545 () Bool)

(assert (=> b!512590 m!494545))

(declare-fun m!494547 () Bool)

(assert (=> start!46268 m!494547))

(declare-fun m!494549 () Bool)

(assert (=> start!46268 m!494549))

(declare-fun m!494551 () Bool)

(assert (=> b!512595 m!494551))

(declare-fun m!494553 () Bool)

(assert (=> b!512597 m!494553))

(declare-fun m!494555 () Bool)

(assert (=> b!512594 m!494555))

(declare-fun m!494557 () Bool)

(assert (=> b!512598 m!494557))

(declare-fun m!494559 () Bool)

(assert (=> b!512591 m!494559))

(assert (=> b!512591 m!494559))

(declare-fun m!494561 () Bool)

(assert (=> b!512591 m!494561))

(assert (=> b!512596 m!494559))

(assert (=> b!512596 m!494559))

(declare-fun m!494563 () Bool)

(assert (=> b!512596 m!494563))

(declare-fun m!494565 () Bool)

(assert (=> b!512599 m!494565))

(declare-fun m!494567 () Bool)

(assert (=> b!512599 m!494567))

(declare-fun m!494569 () Bool)

(assert (=> b!512599 m!494569))

(assert (=> b!512599 m!494559))

(declare-fun m!494571 () Bool)

(assert (=> b!512599 m!494571))

(assert (=> b!512599 m!494559))

(declare-fun m!494573 () Bool)

(assert (=> b!512599 m!494573))

(assert (=> b!512599 m!494569))

(declare-fun m!494575 () Bool)

(assert (=> b!512599 m!494575))

(assert (=> b!512599 m!494559))

(declare-fun m!494577 () Bool)

(assert (=> b!512599 m!494577))

(assert (=> b!512599 m!494569))

(declare-fun m!494579 () Bool)

(assert (=> b!512599 m!494579))

(check-sat (not b!512596) (not b!512590) (not b!512594) (not b!512595) (not b!512591) (not b!512597) (not start!46268) (not b!512598) (not b!512599))
(check-sat)
(get-model)

(declare-fun b!512670 () Bool)

(declare-fun e!299361 () Bool)

(declare-fun e!299359 () Bool)

(assert (=> b!512670 (= e!299361 e!299359)))

(declare-fun c!59924 () Bool)

(assert (=> b!512670 (= c!59924 (validKeyInArray!0 (select (arr!15838 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512671 () Bool)

(declare-fun e!299360 () Bool)

(assert (=> b!512671 (= e!299360 e!299361)))

(declare-fun res!313384 () Bool)

(assert (=> b!512671 (=> (not res!313384) (not e!299361))))

(declare-fun e!299358 () Bool)

(assert (=> b!512671 (= res!313384 (not e!299358))))

(declare-fun res!313382 () Bool)

(assert (=> b!512671 (=> (not res!313382) (not e!299358))))

(assert (=> b!512671 (= res!313382 (validKeyInArray!0 (select (arr!15838 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512672 () Bool)

(declare-fun call!31503 () Bool)

(assert (=> b!512672 (= e!299359 call!31503)))

(declare-fun d!79023 () Bool)

(declare-fun res!313383 () Bool)

(assert (=> d!79023 (=> res!313383 e!299360)))

(assert (=> d!79023 (= res!313383 (bvsge #b00000000000000000000000000000000 (size!16202 a!3235)))))

(assert (=> d!79023 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9900) e!299360)))

(declare-fun bm!31500 () Bool)

(assert (=> bm!31500 (= call!31503 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59924 (Cons!9899 (select (arr!15838 a!3235) #b00000000000000000000000000000000) Nil!9900) Nil!9900)))))

(declare-fun b!512673 () Bool)

(declare-fun contains!2703 (List!9903 (_ BitVec 64)) Bool)

(assert (=> b!512673 (= e!299358 (contains!2703 Nil!9900 (select (arr!15838 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512674 () Bool)

(assert (=> b!512674 (= e!299359 call!31503)))

(assert (= (and d!79023 (not res!313383)) b!512671))

(assert (= (and b!512671 res!313382) b!512673))

(assert (= (and b!512671 res!313384) b!512670))

(assert (= (and b!512670 c!59924) b!512672))

(assert (= (and b!512670 (not c!59924)) b!512674))

(assert (= (or b!512672 b!512674) bm!31500))

(declare-fun m!494653 () Bool)

(assert (=> b!512670 m!494653))

(assert (=> b!512670 m!494653))

(declare-fun m!494655 () Bool)

(assert (=> b!512670 m!494655))

(assert (=> b!512671 m!494653))

(assert (=> b!512671 m!494653))

(assert (=> b!512671 m!494655))

(assert (=> bm!31500 m!494653))

(declare-fun m!494657 () Bool)

(assert (=> bm!31500 m!494657))

(assert (=> b!512673 m!494653))

(assert (=> b!512673 m!494653))

(declare-fun m!494659 () Bool)

(assert (=> b!512673 m!494659))

(assert (=> b!512597 d!79023))

(declare-fun d!79025 () Bool)

(assert (=> d!79025 (= (validKeyInArray!0 (select (arr!15838 a!3235) j!176)) (and (not (= (select (arr!15838 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15838 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512591 d!79025))

(declare-fun d!79027 () Bool)

(assert (=> d!79027 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512598 d!79027))

(declare-fun d!79029 () Bool)

(assert (=> d!79029 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46268 d!79029))

(declare-fun d!79031 () Bool)

(assert (=> d!79031 (= (array_inv!11697 a!3235) (bvsge (size!16202 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46268 d!79031))

(declare-fun d!79033 () Bool)

(declare-fun lt!234763 () (_ BitVec 32))

(declare-fun lt!234762 () (_ BitVec 32))

(assert (=> d!79033 (= lt!234763 (bvmul (bvxor lt!234762 (bvlshr lt!234762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79033 (= lt!234762 ((_ extract 31 0) (bvand (bvxor (select (arr!15838 a!3235) j!176) (bvlshr (select (arr!15838 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79033 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313385 (let ((h!10782 ((_ extract 31 0) (bvand (bvxor (select (arr!15838 a!3235) j!176) (bvlshr (select (arr!15838 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48324 (bvmul (bvxor h!10782 (bvlshr h!10782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48324 (bvlshr x!48324 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313385 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313385 #b00000000000000000000000000000000))))))

(assert (=> d!79033 (= (toIndex!0 (select (arr!15838 a!3235) j!176) mask!3524) (bvand (bvxor lt!234763 (bvlshr lt!234763 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512599 d!79033))

(declare-fun b!512683 () Bool)

(declare-fun e!299368 () Bool)

(declare-fun call!31506 () Bool)

(assert (=> b!512683 (= e!299368 call!31506)))

(declare-fun bm!31503 () Bool)

(assert (=> bm!31503 (= call!31506 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512684 () Bool)

(declare-fun e!299370 () Bool)

(declare-fun e!299369 () Bool)

(assert (=> b!512684 (= e!299370 e!299369)))

(declare-fun c!59927 () Bool)

(assert (=> b!512684 (= c!59927 (validKeyInArray!0 (select (arr!15838 a!3235) j!176)))))

(declare-fun d!79039 () Bool)

(declare-fun res!313390 () Bool)

(assert (=> d!79039 (=> res!313390 e!299370)))

(assert (=> d!79039 (= res!313390 (bvsge j!176 (size!16202 a!3235)))))

(assert (=> d!79039 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299370)))

(declare-fun b!512685 () Bool)

(assert (=> b!512685 (= e!299369 e!299368)))

(declare-fun lt!234770 () (_ BitVec 64))

(assert (=> b!512685 (= lt!234770 (select (arr!15838 a!3235) j!176))))

(declare-fun lt!234772 () Unit!15841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32923 (_ BitVec 64) (_ BitVec 32)) Unit!15841)

(assert (=> b!512685 (= lt!234772 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234770 j!176))))

(assert (=> b!512685 (arrayContainsKey!0 a!3235 lt!234770 #b00000000000000000000000000000000)))

(declare-fun lt!234771 () Unit!15841)

(assert (=> b!512685 (= lt!234771 lt!234772)))

(declare-fun res!313391 () Bool)

(assert (=> b!512685 (= res!313391 (= (seekEntryOrOpen!0 (select (arr!15838 a!3235) j!176) a!3235 mask!3524) (Found!4261 j!176)))))

(assert (=> b!512685 (=> (not res!313391) (not e!299368))))

(declare-fun b!512686 () Bool)

(assert (=> b!512686 (= e!299369 call!31506)))

(assert (= (and d!79039 (not res!313390)) b!512684))

(assert (= (and b!512684 c!59927) b!512685))

(assert (= (and b!512684 (not c!59927)) b!512686))

(assert (= (and b!512685 res!313391) b!512683))

(assert (= (or b!512683 b!512686) bm!31503))

(declare-fun m!494661 () Bool)

(assert (=> bm!31503 m!494661))

(assert (=> b!512684 m!494559))

(assert (=> b!512684 m!494559))

(assert (=> b!512684 m!494561))

(assert (=> b!512685 m!494559))

(declare-fun m!494663 () Bool)

(assert (=> b!512685 m!494663))

(declare-fun m!494665 () Bool)

(assert (=> b!512685 m!494665))

(assert (=> b!512685 m!494559))

(assert (=> b!512685 m!494563))

(assert (=> b!512599 d!79039))

(declare-fun b!512753 () Bool)

(declare-fun e!299410 () SeekEntryResult!4261)

(assert (=> b!512753 (= e!299410 (Intermediate!4261 false lt!234724 #b00000000000000000000000000000000))))

(declare-fun b!512754 () Bool)

(declare-fun e!299409 () SeekEntryResult!4261)

(assert (=> b!512754 (= e!299409 e!299410)))

(declare-fun c!59955 () Bool)

(declare-fun lt!234796 () (_ BitVec 64))

(assert (=> b!512754 (= c!59955 (or (= lt!234796 (select (arr!15838 a!3235) j!176)) (= (bvadd lt!234796 lt!234796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!512755 () Bool)

(assert (=> b!512755 (= e!299409 (Intermediate!4261 true lt!234724 #b00000000000000000000000000000000))))

(declare-fun b!512756 () Bool)

(declare-fun lt!234795 () SeekEntryResult!4261)

(assert (=> b!512756 (and (bvsge (index!19234 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234795) (size!16202 a!3235)))))

(declare-fun e!299411 () Bool)

(assert (=> b!512756 (= e!299411 (= (select (arr!15838 a!3235) (index!19234 lt!234795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512757 () Bool)

(declare-fun e!299412 () Bool)

(assert (=> b!512757 (= e!299412 (bvsge (x!48321 lt!234795) #b01111111111111111111111111111110))))

(declare-fun b!512758 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512758 (= e!299410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512759 () Bool)

(assert (=> b!512759 (and (bvsge (index!19234 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234795) (size!16202 a!3235)))))

(declare-fun res!313407 () Bool)

(assert (=> b!512759 (= res!313407 (= (select (arr!15838 a!3235) (index!19234 lt!234795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512759 (=> res!313407 e!299411)))

(declare-fun b!512760 () Bool)

(assert (=> b!512760 (and (bvsge (index!19234 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234795) (size!16202 a!3235)))))

(declare-fun res!313406 () Bool)

(assert (=> b!512760 (= res!313406 (= (select (arr!15838 a!3235) (index!19234 lt!234795)) (select (arr!15838 a!3235) j!176)))))

(assert (=> b!512760 (=> res!313406 e!299411)))

(declare-fun e!299413 () Bool)

(assert (=> b!512760 (= e!299413 e!299411)))

(declare-fun b!512761 () Bool)

(assert (=> b!512761 (= e!299412 e!299413)))

(declare-fun res!313408 () Bool)

(assert (=> b!512761 (= res!313408 (and ((_ is Intermediate!4261) lt!234795) (not (undefined!5073 lt!234795)) (bvslt (x!48321 lt!234795) #b01111111111111111111111111111110) (bvsge (x!48321 lt!234795) #b00000000000000000000000000000000) (bvsge (x!48321 lt!234795) #b00000000000000000000000000000000)))))

(assert (=> b!512761 (=> (not res!313408) (not e!299413))))

(declare-fun d!79047 () Bool)

(assert (=> d!79047 e!299412))

(declare-fun c!59956 () Bool)

(assert (=> d!79047 (= c!59956 (and ((_ is Intermediate!4261) lt!234795) (undefined!5073 lt!234795)))))

(assert (=> d!79047 (= lt!234795 e!299409)))

(declare-fun c!59954 () Bool)

(assert (=> d!79047 (= c!59954 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79047 (= lt!234796 (select (arr!15838 a!3235) lt!234724))))

(assert (=> d!79047 (validMask!0 mask!3524)))

(assert (=> d!79047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234724 (select (arr!15838 a!3235) j!176) a!3235 mask!3524) lt!234795)))

(assert (= (and d!79047 c!59954) b!512755))

(assert (= (and d!79047 (not c!59954)) b!512754))

(assert (= (and b!512754 c!59955) b!512753))

(assert (= (and b!512754 (not c!59955)) b!512758))

(assert (= (and d!79047 c!59956) b!512757))

(assert (= (and d!79047 (not c!59956)) b!512761))

(assert (= (and b!512761 res!313408) b!512760))

(assert (= (and b!512760 (not res!313406)) b!512759))

(assert (= (and b!512759 (not res!313407)) b!512756))

(declare-fun m!494697 () Bool)

(assert (=> b!512758 m!494697))

(assert (=> b!512758 m!494697))

(assert (=> b!512758 m!494559))

(declare-fun m!494699 () Bool)

(assert (=> b!512758 m!494699))

(declare-fun m!494701 () Bool)

(assert (=> d!79047 m!494701))

(assert (=> d!79047 m!494547))

(declare-fun m!494703 () Bool)

(assert (=> b!512759 m!494703))

(assert (=> b!512756 m!494703))

(assert (=> b!512760 m!494703))

(assert (=> b!512599 d!79047))

(declare-fun b!512768 () Bool)

(declare-fun e!299421 () SeekEntryResult!4261)

(assert (=> b!512768 (= e!299421 (Intermediate!4261 false lt!234723 #b00000000000000000000000000000000))))

(declare-fun b!512769 () Bool)

(declare-fun e!299420 () SeekEntryResult!4261)

(assert (=> b!512769 (= e!299420 e!299421)))

(declare-fun lt!234804 () (_ BitVec 64))

(declare-fun c!59958 () Bool)

(assert (=> b!512769 (= c!59958 (or (= lt!234804 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234804 lt!234804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!512770 () Bool)

(assert (=> b!512770 (= e!299420 (Intermediate!4261 true lt!234723 #b00000000000000000000000000000000))))

(declare-fun b!512771 () Bool)

(declare-fun lt!234803 () SeekEntryResult!4261)

(assert (=> b!512771 (and (bvsge (index!19234 lt!234803) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234803) (size!16202 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)))))))

(declare-fun e!299422 () Bool)

(assert (=> b!512771 (= e!299422 (= (select (arr!15838 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235))) (index!19234 lt!234803)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512772 () Bool)

(declare-fun e!299423 () Bool)

(assert (=> b!512772 (= e!299423 (bvsge (x!48321 lt!234803) #b01111111111111111111111111111110))))

(declare-fun b!512773 () Bool)

(assert (=> b!512773 (= e!299421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234723 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)) mask!3524))))

(declare-fun b!512774 () Bool)

(assert (=> b!512774 (and (bvsge (index!19234 lt!234803) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234803) (size!16202 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)))))))

(declare-fun res!313416 () Bool)

(assert (=> b!512774 (= res!313416 (= (select (arr!15838 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235))) (index!19234 lt!234803)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512774 (=> res!313416 e!299422)))

(declare-fun b!512775 () Bool)

(assert (=> b!512775 (and (bvsge (index!19234 lt!234803) #b00000000000000000000000000000000) (bvslt (index!19234 lt!234803) (size!16202 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)))))))

(declare-fun res!313415 () Bool)

(assert (=> b!512775 (= res!313415 (= (select (arr!15838 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235))) (index!19234 lt!234803)) (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!512775 (=> res!313415 e!299422)))

(declare-fun e!299424 () Bool)

(assert (=> b!512775 (= e!299424 e!299422)))

(declare-fun b!512776 () Bool)

(assert (=> b!512776 (= e!299423 e!299424)))

(declare-fun res!313417 () Bool)

(assert (=> b!512776 (= res!313417 (and ((_ is Intermediate!4261) lt!234803) (not (undefined!5073 lt!234803)) (bvslt (x!48321 lt!234803) #b01111111111111111111111111111110) (bvsge (x!48321 lt!234803) #b00000000000000000000000000000000) (bvsge (x!48321 lt!234803) #b00000000000000000000000000000000)))))

(assert (=> b!512776 (=> (not res!313417) (not e!299424))))

(declare-fun d!79057 () Bool)

(assert (=> d!79057 e!299423))

(declare-fun c!59959 () Bool)

(assert (=> d!79057 (= c!59959 (and ((_ is Intermediate!4261) lt!234803) (undefined!5073 lt!234803)))))

(assert (=> d!79057 (= lt!234803 e!299420)))

(declare-fun c!59957 () Bool)

(assert (=> d!79057 (= c!59957 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79057 (= lt!234804 (select (arr!15838 (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235))) lt!234723))))

(assert (=> d!79057 (validMask!0 mask!3524)))

(assert (=> d!79057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234723 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (array!32924 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)) mask!3524) lt!234803)))

(assert (= (and d!79057 c!59957) b!512770))

(assert (= (and d!79057 (not c!59957)) b!512769))

(assert (= (and b!512769 c!59958) b!512768))

(assert (= (and b!512769 (not c!59958)) b!512773))

(assert (= (and d!79057 c!59959) b!512772))

(assert (= (and d!79057 (not c!59959)) b!512776))

(assert (= (and b!512776 res!313417) b!512775))

(assert (= (and b!512775 (not res!313415)) b!512774))

(assert (= (and b!512774 (not res!313416)) b!512771))

(declare-fun m!494705 () Bool)

(assert (=> b!512773 m!494705))

(assert (=> b!512773 m!494705))

(assert (=> b!512773 m!494569))

(declare-fun m!494711 () Bool)

(assert (=> b!512773 m!494711))

(declare-fun m!494713 () Bool)

(assert (=> d!79057 m!494713))

(assert (=> d!79057 m!494547))

(declare-fun m!494715 () Bool)

(assert (=> b!512774 m!494715))

(assert (=> b!512771 m!494715))

(assert (=> b!512775 m!494715))

(assert (=> b!512599 d!79057))

(declare-fun d!79061 () Bool)

(assert (=> d!79061 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234810 () Unit!15841)

(declare-fun choose!38 (array!32923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15841)

(assert (=> d!79061 (= lt!234810 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79061 (validMask!0 mask!3524)))

(assert (=> d!79061 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234810)))

(declare-fun bs!16256 () Bool)

(assert (= bs!16256 d!79061))

(assert (=> bs!16256 m!494573))

(declare-fun m!494727 () Bool)

(assert (=> bs!16256 m!494727))

(assert (=> bs!16256 m!494547))

(assert (=> b!512599 d!79061))

(declare-fun d!79065 () Bool)

(declare-fun lt!234812 () (_ BitVec 32))

(declare-fun lt!234811 () (_ BitVec 32))

(assert (=> d!79065 (= lt!234812 (bvmul (bvxor lt!234811 (bvlshr lt!234811 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79065 (= lt!234811 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79065 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313385 (let ((h!10782 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48324 (bvmul (bvxor h!10782 (bvlshr h!10782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48324 (bvlshr x!48324 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313385 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313385 #b00000000000000000000000000000000))))))

(assert (=> d!79065 (= (toIndex!0 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234812 (bvlshr lt!234812 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512599 d!79065))

(declare-fun d!79067 () Bool)

(declare-fun res!313438 () Bool)

(declare-fun e!299449 () Bool)

(assert (=> d!79067 (=> res!313438 e!299449)))

(assert (=> d!79067 (= res!313438 (= (select (arr!15838 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79067 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299449)))

(declare-fun b!512806 () Bool)

(declare-fun e!299450 () Bool)

(assert (=> b!512806 (= e!299449 e!299450)))

(declare-fun res!313439 () Bool)

(assert (=> b!512806 (=> (not res!313439) (not e!299450))))

(assert (=> b!512806 (= res!313439 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16202 a!3235)))))

(declare-fun b!512807 () Bool)

(assert (=> b!512807 (= e!299450 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79067 (not res!313438)) b!512806))

(assert (= (and b!512806 res!313439) b!512807))

(assert (=> d!79067 m!494653))

(declare-fun m!494741 () Bool)

(assert (=> b!512807 m!494741))

(assert (=> b!512594 d!79067))

(declare-fun b!512850 () Bool)

(declare-fun e!299476 () SeekEntryResult!4261)

(declare-fun lt!234849 () SeekEntryResult!4261)

(assert (=> b!512850 (= e!299476 (Found!4261 (index!19234 lt!234849)))))

(declare-fun d!79075 () Bool)

(declare-fun lt!234847 () SeekEntryResult!4261)

(assert (=> d!79075 (and (or ((_ is Undefined!4261) lt!234847) (not ((_ is Found!4261) lt!234847)) (and (bvsge (index!19233 lt!234847) #b00000000000000000000000000000000) (bvslt (index!19233 lt!234847) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234847) ((_ is Found!4261) lt!234847) (not ((_ is MissingZero!4261) lt!234847)) (and (bvsge (index!19232 lt!234847) #b00000000000000000000000000000000) (bvslt (index!19232 lt!234847) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234847) ((_ is Found!4261) lt!234847) ((_ is MissingZero!4261) lt!234847) (not ((_ is MissingVacant!4261) lt!234847)) (and (bvsge (index!19235 lt!234847) #b00000000000000000000000000000000) (bvslt (index!19235 lt!234847) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234847) (ite ((_ is Found!4261) lt!234847) (= (select (arr!15838 a!3235) (index!19233 lt!234847)) (select (arr!15838 a!3235) j!176)) (ite ((_ is MissingZero!4261) lt!234847) (= (select (arr!15838 a!3235) (index!19232 lt!234847)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4261) lt!234847) (= (select (arr!15838 a!3235) (index!19235 lt!234847)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299478 () SeekEntryResult!4261)

(assert (=> d!79075 (= lt!234847 e!299478)))

(declare-fun c!59980 () Bool)

(assert (=> d!79075 (= c!59980 (and ((_ is Intermediate!4261) lt!234849) (undefined!5073 lt!234849)))))

(assert (=> d!79075 (= lt!234849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15838 a!3235) j!176) mask!3524) (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79075 (validMask!0 mask!3524)))

(assert (=> d!79075 (= (seekEntryOrOpen!0 (select (arr!15838 a!3235) j!176) a!3235 mask!3524) lt!234847)))

(declare-fun b!512851 () Bool)

(assert (=> b!512851 (= e!299478 e!299476)))

(declare-fun lt!234848 () (_ BitVec 64))

(assert (=> b!512851 (= lt!234848 (select (arr!15838 a!3235) (index!19234 lt!234849)))))

(declare-fun c!59981 () Bool)

(assert (=> b!512851 (= c!59981 (= lt!234848 (select (arr!15838 a!3235) j!176)))))

(declare-fun b!512852 () Bool)

(assert (=> b!512852 (= e!299478 Undefined!4261)))

(declare-fun b!512853 () Bool)

(declare-fun e!299477 () SeekEntryResult!4261)

(assert (=> b!512853 (= e!299477 (MissingZero!4261 (index!19234 lt!234849)))))

(declare-fun b!512854 () Bool)

(declare-fun c!59982 () Bool)

(assert (=> b!512854 (= c!59982 (= lt!234848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512854 (= e!299476 e!299477)))

(declare-fun b!512855 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32923 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!512855 (= e!299477 (seekKeyOrZeroReturnVacant!0 (x!48321 lt!234849) (index!19234 lt!234849) (index!19234 lt!234849) (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79075 c!59980) b!512852))

(assert (= (and d!79075 (not c!59980)) b!512851))

(assert (= (and b!512851 c!59981) b!512850))

(assert (= (and b!512851 (not c!59981)) b!512854))

(assert (= (and b!512854 c!59982) b!512853))

(assert (= (and b!512854 (not c!59982)) b!512855))

(assert (=> d!79075 m!494559))

(assert (=> d!79075 m!494571))

(declare-fun m!494751 () Bool)

(assert (=> d!79075 m!494751))

(declare-fun m!494753 () Bool)

(assert (=> d!79075 m!494753))

(assert (=> d!79075 m!494571))

(assert (=> d!79075 m!494559))

(declare-fun m!494755 () Bool)

(assert (=> d!79075 m!494755))

(declare-fun m!494757 () Bool)

(assert (=> d!79075 m!494757))

(assert (=> d!79075 m!494547))

(declare-fun m!494759 () Bool)

(assert (=> b!512851 m!494759))

(assert (=> b!512855 m!494559))

(declare-fun m!494761 () Bool)

(assert (=> b!512855 m!494761))

(assert (=> b!512596 d!79075))

(declare-fun b!512865 () Bool)

(declare-fun e!299484 () Bool)

(declare-fun call!31517 () Bool)

(assert (=> b!512865 (= e!299484 call!31517)))

(declare-fun bm!31514 () Bool)

(assert (=> bm!31514 (= call!31517 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512866 () Bool)

(declare-fun e!299486 () Bool)

(declare-fun e!299485 () Bool)

(assert (=> b!512866 (= e!299486 e!299485)))

(declare-fun c!59986 () Bool)

(assert (=> b!512866 (= c!59986 (validKeyInArray!0 (select (arr!15838 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79083 () Bool)

(declare-fun res!313456 () Bool)

(assert (=> d!79083 (=> res!313456 e!299486)))

(assert (=> d!79083 (= res!313456 (bvsge #b00000000000000000000000000000000 (size!16202 a!3235)))))

(assert (=> d!79083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299486)))

(declare-fun b!512867 () Bool)

(assert (=> b!512867 (= e!299485 e!299484)))

(declare-fun lt!234852 () (_ BitVec 64))

(assert (=> b!512867 (= lt!234852 (select (arr!15838 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234854 () Unit!15841)

(assert (=> b!512867 (= lt!234854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234852 #b00000000000000000000000000000000))))

(assert (=> b!512867 (arrayContainsKey!0 a!3235 lt!234852 #b00000000000000000000000000000000)))

(declare-fun lt!234853 () Unit!15841)

(assert (=> b!512867 (= lt!234853 lt!234854)))

(declare-fun res!313457 () Bool)

(assert (=> b!512867 (= res!313457 (= (seekEntryOrOpen!0 (select (arr!15838 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4261 #b00000000000000000000000000000000)))))

(assert (=> b!512867 (=> (not res!313457) (not e!299484))))

(declare-fun b!512868 () Bool)

(assert (=> b!512868 (= e!299485 call!31517)))

(assert (= (and d!79083 (not res!313456)) b!512866))

(assert (= (and b!512866 c!59986) b!512867))

(assert (= (and b!512866 (not c!59986)) b!512868))

(assert (= (and b!512867 res!313457) b!512865))

(assert (= (or b!512865 b!512868) bm!31514))

(declare-fun m!494763 () Bool)

(assert (=> bm!31514 m!494763))

(assert (=> b!512866 m!494653))

(assert (=> b!512866 m!494653))

(assert (=> b!512866 m!494655))

(assert (=> b!512867 m!494653))

(declare-fun m!494765 () Bool)

(assert (=> b!512867 m!494765))

(declare-fun m!494767 () Bool)

(assert (=> b!512867 m!494767))

(assert (=> b!512867 m!494653))

(declare-fun m!494771 () Bool)

(assert (=> b!512867 m!494771))

(assert (=> b!512595 d!79083))

(declare-fun b!512869 () Bool)

(declare-fun e!299487 () SeekEntryResult!4261)

(declare-fun lt!234857 () SeekEntryResult!4261)

(assert (=> b!512869 (= e!299487 (Found!4261 (index!19234 lt!234857)))))

(declare-fun d!79085 () Bool)

(declare-fun lt!234855 () SeekEntryResult!4261)

(assert (=> d!79085 (and (or ((_ is Undefined!4261) lt!234855) (not ((_ is Found!4261) lt!234855)) (and (bvsge (index!19233 lt!234855) #b00000000000000000000000000000000) (bvslt (index!19233 lt!234855) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234855) ((_ is Found!4261) lt!234855) (not ((_ is MissingZero!4261) lt!234855)) (and (bvsge (index!19232 lt!234855) #b00000000000000000000000000000000) (bvslt (index!19232 lt!234855) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234855) ((_ is Found!4261) lt!234855) ((_ is MissingZero!4261) lt!234855) (not ((_ is MissingVacant!4261) lt!234855)) (and (bvsge (index!19235 lt!234855) #b00000000000000000000000000000000) (bvslt (index!19235 lt!234855) (size!16202 a!3235)))) (or ((_ is Undefined!4261) lt!234855) (ite ((_ is Found!4261) lt!234855) (= (select (arr!15838 a!3235) (index!19233 lt!234855)) k0!2280) (ite ((_ is MissingZero!4261) lt!234855) (= (select (arr!15838 a!3235) (index!19232 lt!234855)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4261) lt!234855) (= (select (arr!15838 a!3235) (index!19235 lt!234855)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299489 () SeekEntryResult!4261)

(assert (=> d!79085 (= lt!234855 e!299489)))

(declare-fun c!59987 () Bool)

(assert (=> d!79085 (= c!59987 (and ((_ is Intermediate!4261) lt!234857) (undefined!5073 lt!234857)))))

(assert (=> d!79085 (= lt!234857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79085 (validMask!0 mask!3524)))

(assert (=> d!79085 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234855)))

(declare-fun b!512870 () Bool)

(assert (=> b!512870 (= e!299489 e!299487)))

(declare-fun lt!234856 () (_ BitVec 64))

(assert (=> b!512870 (= lt!234856 (select (arr!15838 a!3235) (index!19234 lt!234857)))))

(declare-fun c!59988 () Bool)

(assert (=> b!512870 (= c!59988 (= lt!234856 k0!2280))))

(declare-fun b!512871 () Bool)

(assert (=> b!512871 (= e!299489 Undefined!4261)))

(declare-fun b!512872 () Bool)

(declare-fun e!299488 () SeekEntryResult!4261)

(assert (=> b!512872 (= e!299488 (MissingZero!4261 (index!19234 lt!234857)))))

(declare-fun b!512873 () Bool)

(declare-fun c!59989 () Bool)

(assert (=> b!512873 (= c!59989 (= lt!234856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512873 (= e!299487 e!299488)))

(declare-fun b!512874 () Bool)

(assert (=> b!512874 (= e!299488 (seekKeyOrZeroReturnVacant!0 (x!48321 lt!234857) (index!19234 lt!234857) (index!19234 lt!234857) k0!2280 a!3235 mask!3524))))

(assert (= (and d!79085 c!59987) b!512871))

(assert (= (and d!79085 (not c!59987)) b!512870))

(assert (= (and b!512870 c!59988) b!512869))

(assert (= (and b!512870 (not c!59988)) b!512873))

(assert (= (and b!512873 c!59989) b!512872))

(assert (= (and b!512873 (not c!59989)) b!512874))

(declare-fun m!494779 () Bool)

(assert (=> d!79085 m!494779))

(declare-fun m!494781 () Bool)

(assert (=> d!79085 m!494781))

(declare-fun m!494783 () Bool)

(assert (=> d!79085 m!494783))

(assert (=> d!79085 m!494779))

(declare-fun m!494785 () Bool)

(assert (=> d!79085 m!494785))

(declare-fun m!494787 () Bool)

(assert (=> d!79085 m!494787))

(assert (=> d!79085 m!494547))

(declare-fun m!494789 () Bool)

(assert (=> b!512870 m!494789))

(declare-fun m!494791 () Bool)

(assert (=> b!512874 m!494791))

(assert (=> b!512590 d!79085))

(check-sat (not b!512758) (not b!512684) (not b!512867) (not b!512855) (not b!512807) (not bm!31514) (not bm!31503) (not d!79057) (not b!512874) (not d!79047) (not d!79085) (not b!512773) (not b!512673) (not b!512866) (not b!512685) (not d!79075) (not d!79061) (not bm!31500) (not b!512670) (not b!512671))
(check-sat)
