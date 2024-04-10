; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30088 () Bool)

(assert start!30088)

(declare-fun res!159327 () Bool)

(declare-fun e!190320 () Bool)

(assert (=> start!30088 (=> (not res!159327) (not e!190320))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30088 (= res!159327 (validMask!0 mask!3709))))

(assert (=> start!30088 e!190320))

(assert (=> start!30088 true))

(declare-datatypes ((array!15278 0))(
  ( (array!15279 (arr!7230 (Array (_ BitVec 32) (_ BitVec 64))) (size!7582 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15278)

(declare-fun array_inv!5193 (array!15278) Bool)

(assert (=> start!30088 (array_inv!5193 a!3293)))

(declare-fun b!301644 () Bool)

(declare-fun res!159326 () Bool)

(assert (=> b!301644 (=> (not res!159326) (not e!190320))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301644 (= res!159326 (validKeyInArray!0 k0!2441))))

(declare-fun b!301645 () Bool)

(declare-fun res!159323 () Bool)

(assert (=> b!301645 (=> (not res!159323) (not e!190320))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301645 (= res!159323 (and (= (size!7582 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7582 a!3293))))))

(declare-fun b!301646 () Bool)

(declare-fun lt!149877 () (_ BitVec 32))

(assert (=> b!301646 (= e!190320 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!149877 #b00000000000000000000000000000000) (bvsge lt!149877 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301646 (= lt!149877 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301647 () Bool)

(declare-fun res!159325 () Bool)

(assert (=> b!301647 (=> (not res!159325) (not e!190320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15278 (_ BitVec 32)) Bool)

(assert (=> b!301647 (= res!159325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301648 () Bool)

(declare-fun res!159322 () Bool)

(assert (=> b!301648 (=> (not res!159322) (not e!190320))))

(declare-fun arrayContainsKey!0 (array!15278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301648 (= res!159322 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301649 () Bool)

(declare-fun res!159324 () Bool)

(assert (=> b!301649 (=> (not res!159324) (not e!190320))))

(declare-datatypes ((SeekEntryResult!2370 0))(
  ( (MissingZero!2370 (index!11656 (_ BitVec 32))) (Found!2370 (index!11657 (_ BitVec 32))) (Intermediate!2370 (undefined!3182 Bool) (index!11658 (_ BitVec 32)) (x!29930 (_ BitVec 32))) (Undefined!2370) (MissingVacant!2370 (index!11659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15278 (_ BitVec 32)) SeekEntryResult!2370)

(assert (=> b!301649 (= res!159324 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2370 i!1240)))))

(assert (= (and start!30088 res!159327) b!301645))

(assert (= (and b!301645 res!159323) b!301644))

(assert (= (and b!301644 res!159326) b!301648))

(assert (= (and b!301648 res!159322) b!301649))

(assert (= (and b!301649 res!159324) b!301647))

(assert (= (and b!301647 res!159325) b!301646))

(declare-fun m!313375 () Bool)

(assert (=> b!301648 m!313375))

(declare-fun m!313377 () Bool)

(assert (=> b!301649 m!313377))

(declare-fun m!313379 () Bool)

(assert (=> b!301644 m!313379))

(declare-fun m!313381 () Bool)

(assert (=> b!301646 m!313381))

(declare-fun m!313383 () Bool)

(assert (=> b!301647 m!313383))

(declare-fun m!313385 () Bool)

(assert (=> start!30088 m!313385))

(declare-fun m!313387 () Bool)

(assert (=> start!30088 m!313387))

(check-sat (not b!301646) (not b!301649) (not b!301648) (not b!301644) (not b!301647) (not start!30088))
(check-sat)
(get-model)

(declare-fun b!301686 () Bool)

(declare-fun c!48765 () Bool)

(declare-fun lt!149889 () (_ BitVec 64))

(assert (=> b!301686 (= c!48765 (= lt!149889 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190342 () SeekEntryResult!2370)

(declare-fun e!190340 () SeekEntryResult!2370)

(assert (=> b!301686 (= e!190342 e!190340)))

(declare-fun b!301687 () Bool)

(declare-fun lt!149887 () SeekEntryResult!2370)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15278 (_ BitVec 32)) SeekEntryResult!2370)

(assert (=> b!301687 (= e!190340 (seekKeyOrZeroReturnVacant!0 (x!29930 lt!149887) (index!11658 lt!149887) (index!11658 lt!149887) k0!2441 a!3293 mask!3709))))

(declare-fun d!67905 () Bool)

(declare-fun lt!149888 () SeekEntryResult!2370)

(get-info :version)

(assert (=> d!67905 (and (or ((_ is Undefined!2370) lt!149888) (not ((_ is Found!2370) lt!149888)) (and (bvsge (index!11657 lt!149888) #b00000000000000000000000000000000) (bvslt (index!11657 lt!149888) (size!7582 a!3293)))) (or ((_ is Undefined!2370) lt!149888) ((_ is Found!2370) lt!149888) (not ((_ is MissingZero!2370) lt!149888)) (and (bvsge (index!11656 lt!149888) #b00000000000000000000000000000000) (bvslt (index!11656 lt!149888) (size!7582 a!3293)))) (or ((_ is Undefined!2370) lt!149888) ((_ is Found!2370) lt!149888) ((_ is MissingZero!2370) lt!149888) (not ((_ is MissingVacant!2370) lt!149888)) (and (bvsge (index!11659 lt!149888) #b00000000000000000000000000000000) (bvslt (index!11659 lt!149888) (size!7582 a!3293)))) (or ((_ is Undefined!2370) lt!149888) (ite ((_ is Found!2370) lt!149888) (= (select (arr!7230 a!3293) (index!11657 lt!149888)) k0!2441) (ite ((_ is MissingZero!2370) lt!149888) (= (select (arr!7230 a!3293) (index!11656 lt!149888)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2370) lt!149888) (= (select (arr!7230 a!3293) (index!11659 lt!149888)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!190341 () SeekEntryResult!2370)

(assert (=> d!67905 (= lt!149888 e!190341)))

(declare-fun c!48764 () Bool)

(assert (=> d!67905 (= c!48764 (and ((_ is Intermediate!2370) lt!149887) (undefined!3182 lt!149887)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15278 (_ BitVec 32)) SeekEntryResult!2370)

(assert (=> d!67905 (= lt!149887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67905 (validMask!0 mask!3709)))

(assert (=> d!67905 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149888)))

(declare-fun b!301688 () Bool)

(assert (=> b!301688 (= e!190340 (MissingZero!2370 (index!11658 lt!149887)))))

(declare-fun b!301689 () Bool)

(assert (=> b!301689 (= e!190341 e!190342)))

(assert (=> b!301689 (= lt!149889 (select (arr!7230 a!3293) (index!11658 lt!149887)))))

(declare-fun c!48763 () Bool)

(assert (=> b!301689 (= c!48763 (= lt!149889 k0!2441))))

(declare-fun b!301690 () Bool)

(assert (=> b!301690 (= e!190341 Undefined!2370)))

(declare-fun b!301691 () Bool)

(assert (=> b!301691 (= e!190342 (Found!2370 (index!11658 lt!149887)))))

(assert (= (and d!67905 c!48764) b!301690))

(assert (= (and d!67905 (not c!48764)) b!301689))

(assert (= (and b!301689 c!48763) b!301691))

(assert (= (and b!301689 (not c!48763)) b!301686))

(assert (= (and b!301686 c!48765) b!301688))

(assert (= (and b!301686 (not c!48765)) b!301687))

(declare-fun m!313407 () Bool)

(assert (=> b!301687 m!313407))

(assert (=> d!67905 m!313381))

(declare-fun m!313409 () Bool)

(assert (=> d!67905 m!313409))

(declare-fun m!313411 () Bool)

(assert (=> d!67905 m!313411))

(assert (=> d!67905 m!313381))

(declare-fun m!313413 () Bool)

(assert (=> d!67905 m!313413))

(assert (=> d!67905 m!313385))

(declare-fun m!313415 () Bool)

(assert (=> d!67905 m!313415))

(declare-fun m!313417 () Bool)

(assert (=> b!301689 m!313417))

(assert (=> b!301649 d!67905))

(declare-fun d!67913 () Bool)

(assert (=> d!67913 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301644 d!67913))

(declare-fun d!67915 () Bool)

(declare-fun lt!149901 () (_ BitVec 32))

(declare-fun lt!149900 () (_ BitVec 32))

(assert (=> d!67915 (= lt!149901 (bvmul (bvxor lt!149900 (bvlshr lt!149900 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67915 (= lt!149900 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67915 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159352 (let ((h!5328 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29932 (bvmul (bvxor h!5328 (bvlshr h!5328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29932 (bvlshr x!29932 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159352 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159352 #b00000000000000000000000000000000))))))

(assert (=> d!67915 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!149901 (bvlshr lt!149901 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301646 d!67915))

(declare-fun d!67921 () Bool)

(assert (=> d!67921 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30088 d!67921))

(declare-fun d!67931 () Bool)

(assert (=> d!67931 (= (array_inv!5193 a!3293) (bvsge (size!7582 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30088 d!67931))

(declare-fun d!67933 () Bool)

(declare-fun res!159369 () Bool)

(declare-fun e!190377 () Bool)

(assert (=> d!67933 (=> res!159369 e!190377)))

(assert (=> d!67933 (= res!159369 (bvsge #b00000000000000000000000000000000 (size!7582 a!3293)))))

(assert (=> d!67933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190377)))

(declare-fun b!301744 () Bool)

(declare-fun e!190378 () Bool)

(declare-fun call!25879 () Bool)

(assert (=> b!301744 (= e!190378 call!25879)))

(declare-fun b!301745 () Bool)

(declare-fun e!190379 () Bool)

(assert (=> b!301745 (= e!190379 e!190378)))

(declare-fun lt!149939 () (_ BitVec 64))

(assert (=> b!301745 (= lt!149939 (select (arr!7230 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9377 0))(
  ( (Unit!9378) )
))
(declare-fun lt!149940 () Unit!9377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15278 (_ BitVec 64) (_ BitVec 32)) Unit!9377)

(assert (=> b!301745 (= lt!149940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149939 #b00000000000000000000000000000000))))

(assert (=> b!301745 (arrayContainsKey!0 a!3293 lt!149939 #b00000000000000000000000000000000)))

(declare-fun lt!149938 () Unit!9377)

(assert (=> b!301745 (= lt!149938 lt!149940)))

(declare-fun res!159370 () Bool)

(assert (=> b!301745 (= res!159370 (= (seekEntryOrOpen!0 (select (arr!7230 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2370 #b00000000000000000000000000000000)))))

(assert (=> b!301745 (=> (not res!159370) (not e!190378))))

(declare-fun bm!25876 () Bool)

(assert (=> bm!25876 (= call!25879 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301746 () Bool)

(assert (=> b!301746 (= e!190377 e!190379)))

(declare-fun c!48786 () Bool)

(assert (=> b!301746 (= c!48786 (validKeyInArray!0 (select (arr!7230 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301747 () Bool)

(assert (=> b!301747 (= e!190379 call!25879)))

(assert (= (and d!67933 (not res!159369)) b!301746))

(assert (= (and b!301746 c!48786) b!301745))

(assert (= (and b!301746 (not c!48786)) b!301747))

(assert (= (and b!301745 res!159370) b!301744))

(assert (= (or b!301744 b!301747) bm!25876))

(declare-fun m!313443 () Bool)

(assert (=> b!301745 m!313443))

(declare-fun m!313445 () Bool)

(assert (=> b!301745 m!313445))

(declare-fun m!313447 () Bool)

(assert (=> b!301745 m!313447))

(assert (=> b!301745 m!313443))

(declare-fun m!313449 () Bool)

(assert (=> b!301745 m!313449))

(declare-fun m!313451 () Bool)

(assert (=> bm!25876 m!313451))

(assert (=> b!301746 m!313443))

(assert (=> b!301746 m!313443))

(declare-fun m!313453 () Bool)

(assert (=> b!301746 m!313453))

(assert (=> b!301647 d!67933))

(declare-fun d!67937 () Bool)

(declare-fun res!159377 () Bool)

(declare-fun e!190389 () Bool)

(assert (=> d!67937 (=> res!159377 e!190389)))

(assert (=> d!67937 (= res!159377 (= (select (arr!7230 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67937 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190389)))

(declare-fun b!301762 () Bool)

(declare-fun e!190390 () Bool)

(assert (=> b!301762 (= e!190389 e!190390)))

(declare-fun res!159378 () Bool)

(assert (=> b!301762 (=> (not res!159378) (not e!190390))))

(assert (=> b!301762 (= res!159378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7582 a!3293)))))

(declare-fun b!301763 () Bool)

(assert (=> b!301763 (= e!190390 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67937 (not res!159377)) b!301762))

(assert (= (and b!301762 res!159378) b!301763))

(assert (=> d!67937 m!313443))

(declare-fun m!313461 () Bool)

(assert (=> b!301763 m!313461))

(assert (=> b!301648 d!67937))

(check-sat (not bm!25876) (not d!67905) (not b!301745) (not b!301746) (not b!301687) (not b!301763))
(check-sat)
