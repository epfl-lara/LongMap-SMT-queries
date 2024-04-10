; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29256 () Bool)

(assert start!29256)

(declare-fun b!296662 () Bool)

(declare-fun res!156331 () Bool)

(declare-fun e!187494 () Bool)

(assert (=> b!296662 (=> (not res!156331) (not e!187494))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15014 0))(
  ( (array!15015 (arr!7116 (Array (_ BitVec 32) (_ BitVec 64))) (size!7468 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15014)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296662 (= res!156331 (and (= (size!7468 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7468 a!3312))))))

(declare-fun b!296663 () Bool)

(declare-fun res!156335 () Bool)

(declare-fun e!187496 () Bool)

(assert (=> b!296663 (=> (not res!156335) (not e!187496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15014 (_ BitVec 32)) Bool)

(assert (=> b!296663 (= res!156335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296664 () Bool)

(declare-fun e!187495 () Bool)

(assert (=> b!296664 (= e!187496 e!187495)))

(declare-fun res!156329 () Bool)

(assert (=> b!296664 (=> (not res!156329) (not e!187495))))

(declare-fun lt!147319 () Bool)

(assert (=> b!296664 (= res!156329 lt!147319)))

(declare-datatypes ((SeekEntryResult!2265 0))(
  ( (MissingZero!2265 (index!11230 (_ BitVec 32))) (Found!2265 (index!11231 (_ BitVec 32))) (Intermediate!2265 (undefined!3077 Bool) (index!11232 (_ BitVec 32)) (x!29443 (_ BitVec 32))) (Undefined!2265) (MissingVacant!2265 (index!11233 (_ BitVec 32))) )
))
(declare-fun lt!147321 () SeekEntryResult!2265)

(declare-fun lt!147320 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15014 (_ BitVec 32)) SeekEntryResult!2265)

(assert (=> b!296664 (= lt!147321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147320 k0!2524 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)) mask!3809))))

(declare-fun lt!147317 () SeekEntryResult!2265)

(assert (=> b!296664 (= lt!147317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147320 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296664 (= lt!147320 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!156336 () Bool)

(assert (=> start!29256 (=> (not res!156336) (not e!187494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29256 (= res!156336 (validMask!0 mask!3809))))

(assert (=> start!29256 e!187494))

(assert (=> start!29256 true))

(declare-fun array_inv!5079 (array!15014) Bool)

(assert (=> start!29256 (array_inv!5079 a!3312)))

(declare-fun b!296665 () Bool)

(declare-fun e!187497 () Bool)

(assert (=> b!296665 (= e!187497 (not (or (not (= lt!147317 (Intermediate!2265 false (index!11232 lt!147317) (x!29443 lt!147317)))) (bvsgt #b00000000000000000000000000000000 (x!29443 lt!147317)) (and (bvsge lt!147320 #b00000000000000000000000000000000) (bvslt lt!147320 (size!7468 a!3312))))))))

(assert (=> b!296665 (and (= (select (arr!7116 a!3312) (index!11232 lt!147317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11232 lt!147317) i!1256))))

(declare-fun b!296666 () Bool)

(declare-fun res!156333 () Bool)

(assert (=> b!296666 (=> (not res!156333) (not e!187494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296666 (= res!156333 (validKeyInArray!0 k0!2524))))

(declare-fun b!296667 () Bool)

(declare-fun res!156334 () Bool)

(assert (=> b!296667 (=> (not res!156334) (not e!187494))))

(declare-fun arrayContainsKey!0 (array!15014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296667 (= res!156334 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296668 () Bool)

(assert (=> b!296668 (= e!187495 e!187497)))

(declare-fun res!156330 () Bool)

(assert (=> b!296668 (=> (not res!156330) (not e!187497))))

(declare-fun lt!147316 () Bool)

(assert (=> b!296668 (= res!156330 (and (or lt!147316 (not (undefined!3077 lt!147317))) (or lt!147316 (not (= (select (arr!7116 a!3312) (index!11232 lt!147317)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147316 (not (= (select (arr!7116 a!3312) (index!11232 lt!147317)) k0!2524))) (not lt!147316)))))

(get-info :version)

(assert (=> b!296668 (= lt!147316 (not ((_ is Intermediate!2265) lt!147317)))))

(declare-fun b!296669 () Bool)

(assert (=> b!296669 (= e!187494 e!187496)))

(declare-fun res!156332 () Bool)

(assert (=> b!296669 (=> (not res!156332) (not e!187496))))

(declare-fun lt!147318 () SeekEntryResult!2265)

(assert (=> b!296669 (= res!156332 (or lt!147319 (= lt!147318 (MissingVacant!2265 i!1256))))))

(assert (=> b!296669 (= lt!147319 (= lt!147318 (MissingZero!2265 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15014 (_ BitVec 32)) SeekEntryResult!2265)

(assert (=> b!296669 (= lt!147318 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29256 res!156336) b!296662))

(assert (= (and b!296662 res!156331) b!296666))

(assert (= (and b!296666 res!156333) b!296667))

(assert (= (and b!296667 res!156334) b!296669))

(assert (= (and b!296669 res!156332) b!296663))

(assert (= (and b!296663 res!156335) b!296664))

(assert (= (and b!296664 res!156329) b!296668))

(assert (= (and b!296668 res!156330) b!296665))

(declare-fun m!309589 () Bool)

(assert (=> b!296665 m!309589))

(declare-fun m!309591 () Bool)

(assert (=> b!296667 m!309591))

(declare-fun m!309593 () Bool)

(assert (=> b!296663 m!309593))

(declare-fun m!309595 () Bool)

(assert (=> b!296664 m!309595))

(declare-fun m!309597 () Bool)

(assert (=> b!296664 m!309597))

(declare-fun m!309599 () Bool)

(assert (=> b!296664 m!309599))

(declare-fun m!309601 () Bool)

(assert (=> b!296664 m!309601))

(declare-fun m!309603 () Bool)

(assert (=> start!29256 m!309603))

(declare-fun m!309605 () Bool)

(assert (=> start!29256 m!309605))

(assert (=> b!296668 m!309589))

(declare-fun m!309607 () Bool)

(assert (=> b!296666 m!309607))

(declare-fun m!309609 () Bool)

(assert (=> b!296669 m!309609))

(check-sat (not b!296667) (not b!296663) (not b!296664) (not start!29256) (not b!296666) (not b!296669))
(check-sat)
(get-model)

(declare-fun d!67099 () Bool)

(declare-fun e!187527 () Bool)

(assert (=> d!67099 e!187527))

(declare-fun c!47752 () Bool)

(declare-fun lt!147344 () SeekEntryResult!2265)

(assert (=> d!67099 (= c!47752 (and ((_ is Intermediate!2265) lt!147344) (undefined!3077 lt!147344)))))

(declare-fun e!187525 () SeekEntryResult!2265)

(assert (=> d!67099 (= lt!147344 e!187525)))

(declare-fun c!47754 () Bool)

(assert (=> d!67099 (= c!47754 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147345 () (_ BitVec 64))

(assert (=> d!67099 (= lt!147345 (select (arr!7116 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312))) lt!147320))))

(assert (=> d!67099 (validMask!0 mask!3809)))

(assert (=> d!67099 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147320 k0!2524 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)) mask!3809) lt!147344)))

(declare-fun b!296712 () Bool)

(declare-fun e!187524 () SeekEntryResult!2265)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296712 (= e!187524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147320 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)) mask!3809))))

(declare-fun b!296713 () Bool)

(assert (=> b!296713 (= e!187525 e!187524)))

(declare-fun c!47753 () Bool)

(assert (=> b!296713 (= c!47753 (or (= lt!147345 k0!2524) (= (bvadd lt!147345 lt!147345) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296714 () Bool)

(assert (=> b!296714 (= e!187525 (Intermediate!2265 true lt!147320 #b00000000000000000000000000000000))))

(declare-fun b!296715 () Bool)

(assert (=> b!296715 (and (bvsge (index!11232 lt!147344) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147344) (size!7468 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)))))))

(declare-fun res!156369 () Bool)

(assert (=> b!296715 (= res!156369 (= (select (arr!7116 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312))) (index!11232 lt!147344)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187528 () Bool)

(assert (=> b!296715 (=> res!156369 e!187528)))

(declare-fun b!296716 () Bool)

(declare-fun e!187526 () Bool)

(assert (=> b!296716 (= e!187527 e!187526)))

(declare-fun res!156367 () Bool)

(assert (=> b!296716 (= res!156367 (and ((_ is Intermediate!2265) lt!147344) (not (undefined!3077 lt!147344)) (bvslt (x!29443 lt!147344) #b01111111111111111111111111111110) (bvsge (x!29443 lt!147344) #b00000000000000000000000000000000) (bvsge (x!29443 lt!147344) #b00000000000000000000000000000000)))))

(assert (=> b!296716 (=> (not res!156367) (not e!187526))))

(declare-fun b!296717 () Bool)

(assert (=> b!296717 (and (bvsge (index!11232 lt!147344) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147344) (size!7468 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)))))))

(declare-fun res!156368 () Bool)

(assert (=> b!296717 (= res!156368 (= (select (arr!7116 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312))) (index!11232 lt!147344)) k0!2524))))

(assert (=> b!296717 (=> res!156368 e!187528)))

(assert (=> b!296717 (= e!187526 e!187528)))

(declare-fun b!296718 () Bool)

(assert (=> b!296718 (= e!187527 (bvsge (x!29443 lt!147344) #b01111111111111111111111111111110))))

(declare-fun b!296719 () Bool)

(assert (=> b!296719 (and (bvsge (index!11232 lt!147344) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147344) (size!7468 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312)))))))

(assert (=> b!296719 (= e!187528 (= (select (arr!7116 (array!15015 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7468 a!3312))) (index!11232 lt!147344)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296720 () Bool)

(assert (=> b!296720 (= e!187524 (Intermediate!2265 false lt!147320 #b00000000000000000000000000000000))))

(assert (= (and d!67099 c!47754) b!296714))

(assert (= (and d!67099 (not c!47754)) b!296713))

(assert (= (and b!296713 c!47753) b!296720))

(assert (= (and b!296713 (not c!47753)) b!296712))

(assert (= (and d!67099 c!47752) b!296718))

(assert (= (and d!67099 (not c!47752)) b!296716))

(assert (= (and b!296716 res!156367) b!296717))

(assert (= (and b!296717 (not res!156368)) b!296715))

(assert (= (and b!296715 (not res!156369)) b!296719))

(declare-fun m!309633 () Bool)

(assert (=> b!296717 m!309633))

(declare-fun m!309635 () Bool)

(assert (=> b!296712 m!309635))

(assert (=> b!296712 m!309635))

(declare-fun m!309637 () Bool)

(assert (=> b!296712 m!309637))

(assert (=> b!296715 m!309633))

(assert (=> b!296719 m!309633))

(declare-fun m!309639 () Bool)

(assert (=> d!67099 m!309639))

(assert (=> d!67099 m!309603))

(assert (=> b!296664 d!67099))

(declare-fun d!67107 () Bool)

(declare-fun e!187536 () Bool)

(assert (=> d!67107 e!187536))

(declare-fun c!47755 () Bool)

(declare-fun lt!147346 () SeekEntryResult!2265)

(assert (=> d!67107 (= c!47755 (and ((_ is Intermediate!2265) lt!147346) (undefined!3077 lt!147346)))))

(declare-fun e!187534 () SeekEntryResult!2265)

(assert (=> d!67107 (= lt!147346 e!187534)))

(declare-fun c!47757 () Bool)

(assert (=> d!67107 (= c!47757 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147347 () (_ BitVec 64))

(assert (=> d!67107 (= lt!147347 (select (arr!7116 a!3312) lt!147320))))

(assert (=> d!67107 (validMask!0 mask!3809)))

(assert (=> d!67107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147320 k0!2524 a!3312 mask!3809) lt!147346)))

(declare-fun b!296725 () Bool)

(declare-fun e!187533 () SeekEntryResult!2265)

(assert (=> b!296725 (= e!187533 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147320 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!296726 () Bool)

(assert (=> b!296726 (= e!187534 e!187533)))

(declare-fun c!47756 () Bool)

(assert (=> b!296726 (= c!47756 (or (= lt!147347 k0!2524) (= (bvadd lt!147347 lt!147347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296727 () Bool)

(assert (=> b!296727 (= e!187534 (Intermediate!2265 true lt!147320 #b00000000000000000000000000000000))))

(declare-fun b!296728 () Bool)

(assert (=> b!296728 (and (bvsge (index!11232 lt!147346) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147346) (size!7468 a!3312)))))

(declare-fun res!156376 () Bool)

(assert (=> b!296728 (= res!156376 (= (select (arr!7116 a!3312) (index!11232 lt!147346)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187537 () Bool)

(assert (=> b!296728 (=> res!156376 e!187537)))

(declare-fun b!296729 () Bool)

(declare-fun e!187535 () Bool)

(assert (=> b!296729 (= e!187536 e!187535)))

(declare-fun res!156374 () Bool)

(assert (=> b!296729 (= res!156374 (and ((_ is Intermediate!2265) lt!147346) (not (undefined!3077 lt!147346)) (bvslt (x!29443 lt!147346) #b01111111111111111111111111111110) (bvsge (x!29443 lt!147346) #b00000000000000000000000000000000) (bvsge (x!29443 lt!147346) #b00000000000000000000000000000000)))))

(assert (=> b!296729 (=> (not res!156374) (not e!187535))))

(declare-fun b!296730 () Bool)

(assert (=> b!296730 (and (bvsge (index!11232 lt!147346) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147346) (size!7468 a!3312)))))

(declare-fun res!156375 () Bool)

(assert (=> b!296730 (= res!156375 (= (select (arr!7116 a!3312) (index!11232 lt!147346)) k0!2524))))

(assert (=> b!296730 (=> res!156375 e!187537)))

(assert (=> b!296730 (= e!187535 e!187537)))

(declare-fun b!296731 () Bool)

(assert (=> b!296731 (= e!187536 (bvsge (x!29443 lt!147346) #b01111111111111111111111111111110))))

(declare-fun b!296732 () Bool)

(assert (=> b!296732 (and (bvsge (index!11232 lt!147346) #b00000000000000000000000000000000) (bvslt (index!11232 lt!147346) (size!7468 a!3312)))))

(assert (=> b!296732 (= e!187537 (= (select (arr!7116 a!3312) (index!11232 lt!147346)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296733 () Bool)

(assert (=> b!296733 (= e!187533 (Intermediate!2265 false lt!147320 #b00000000000000000000000000000000))))

(assert (= (and d!67107 c!47757) b!296727))

(assert (= (and d!67107 (not c!47757)) b!296726))

(assert (= (and b!296726 c!47756) b!296733))

(assert (= (and b!296726 (not c!47756)) b!296725))

(assert (= (and d!67107 c!47755) b!296731))

(assert (= (and d!67107 (not c!47755)) b!296729))

(assert (= (and b!296729 res!156374) b!296730))

(assert (= (and b!296730 (not res!156375)) b!296728))

(assert (= (and b!296728 (not res!156376)) b!296732))

(declare-fun m!309645 () Bool)

(assert (=> b!296730 m!309645))

(assert (=> b!296725 m!309635))

(assert (=> b!296725 m!309635))

(declare-fun m!309647 () Bool)

(assert (=> b!296725 m!309647))

(assert (=> b!296728 m!309645))

(assert (=> b!296732 m!309645))

(declare-fun m!309649 () Bool)

(assert (=> d!67107 m!309649))

(assert (=> d!67107 m!309603))

(assert (=> b!296664 d!67107))

(declare-fun d!67111 () Bool)

(declare-fun lt!147368 () (_ BitVec 32))

(declare-fun lt!147367 () (_ BitVec 32))

(assert (=> d!67111 (= lt!147368 (bvmul (bvxor lt!147367 (bvlshr lt!147367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67111 (= lt!147367 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67111 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156379 (let ((h!5295 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29446 (bvmul (bvxor h!5295 (bvlshr h!5295 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29446 (bvlshr x!29446 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156379 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156379 #b00000000000000000000000000000000))))))

(assert (=> d!67111 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147368 (bvlshr lt!147368 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296664 d!67111))

(declare-fun d!67113 () Bool)

(assert (=> d!67113 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296666 d!67113))

(declare-fun d!67117 () Bool)

(declare-fun res!156396 () Bool)

(declare-fun e!187562 () Bool)

(assert (=> d!67117 (=> res!156396 e!187562)))

(assert (=> d!67117 (= res!156396 (= (select (arr!7116 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67117 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187562)))

(declare-fun b!296764 () Bool)

(declare-fun e!187563 () Bool)

(assert (=> b!296764 (= e!187562 e!187563)))

(declare-fun res!156397 () Bool)

(assert (=> b!296764 (=> (not res!156397) (not e!187563))))

(assert (=> b!296764 (= res!156397 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7468 a!3312)))))

(declare-fun b!296765 () Bool)

(assert (=> b!296765 (= e!187563 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67117 (not res!156396)) b!296764))

(assert (= (and b!296764 res!156397) b!296765))

(declare-fun m!309673 () Bool)

(assert (=> d!67117 m!309673))

(declare-fun m!309675 () Bool)

(assert (=> b!296765 m!309675))

(assert (=> b!296667 d!67117))

(declare-fun b!296832 () Bool)

(declare-fun e!187599 () SeekEntryResult!2265)

(assert (=> b!296832 (= e!187599 Undefined!2265)))

(declare-fun b!296833 () Bool)

(declare-fun e!187600 () SeekEntryResult!2265)

(declare-fun lt!147401 () SeekEntryResult!2265)

(assert (=> b!296833 (= e!187600 (Found!2265 (index!11232 lt!147401)))))

(declare-fun b!296834 () Bool)

(assert (=> b!296834 (= e!187599 e!187600)))

(declare-fun lt!147402 () (_ BitVec 64))

(assert (=> b!296834 (= lt!147402 (select (arr!7116 a!3312) (index!11232 lt!147401)))))

(declare-fun c!47793 () Bool)

(assert (=> b!296834 (= c!47793 (= lt!147402 k0!2524))))

(declare-fun e!187601 () SeekEntryResult!2265)

(declare-fun b!296835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15014 (_ BitVec 32)) SeekEntryResult!2265)

(assert (=> b!296835 (= e!187601 (seekKeyOrZeroReturnVacant!0 (x!29443 lt!147401) (index!11232 lt!147401) (index!11232 lt!147401) k0!2524 a!3312 mask!3809))))

(declare-fun b!296836 () Bool)

(assert (=> b!296836 (= e!187601 (MissingZero!2265 (index!11232 lt!147401)))))

(declare-fun b!296837 () Bool)

(declare-fun c!47792 () Bool)

(assert (=> b!296837 (= c!47792 (= lt!147402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296837 (= e!187600 e!187601)))

(declare-fun d!67121 () Bool)

(declare-fun lt!147403 () SeekEntryResult!2265)

(assert (=> d!67121 (and (or ((_ is Undefined!2265) lt!147403) (not ((_ is Found!2265) lt!147403)) (and (bvsge (index!11231 lt!147403) #b00000000000000000000000000000000) (bvslt (index!11231 lt!147403) (size!7468 a!3312)))) (or ((_ is Undefined!2265) lt!147403) ((_ is Found!2265) lt!147403) (not ((_ is MissingZero!2265) lt!147403)) (and (bvsge (index!11230 lt!147403) #b00000000000000000000000000000000) (bvslt (index!11230 lt!147403) (size!7468 a!3312)))) (or ((_ is Undefined!2265) lt!147403) ((_ is Found!2265) lt!147403) ((_ is MissingZero!2265) lt!147403) (not ((_ is MissingVacant!2265) lt!147403)) (and (bvsge (index!11233 lt!147403) #b00000000000000000000000000000000) (bvslt (index!11233 lt!147403) (size!7468 a!3312)))) (or ((_ is Undefined!2265) lt!147403) (ite ((_ is Found!2265) lt!147403) (= (select (arr!7116 a!3312) (index!11231 lt!147403)) k0!2524) (ite ((_ is MissingZero!2265) lt!147403) (= (select (arr!7116 a!3312) (index!11230 lt!147403)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2265) lt!147403) (= (select (arr!7116 a!3312) (index!11233 lt!147403)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67121 (= lt!147403 e!187599)))

(declare-fun c!47791 () Bool)

(assert (=> d!67121 (= c!47791 (and ((_ is Intermediate!2265) lt!147401) (undefined!3077 lt!147401)))))

(assert (=> d!67121 (= lt!147401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67121 (validMask!0 mask!3809)))

(assert (=> d!67121 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147403)))

(assert (= (and d!67121 c!47791) b!296832))

(assert (= (and d!67121 (not c!47791)) b!296834))

(assert (= (and b!296834 c!47793) b!296833))

(assert (= (and b!296834 (not c!47793)) b!296837))

(assert (= (and b!296837 c!47792) b!296836))

(assert (= (and b!296837 (not c!47792)) b!296835))

(declare-fun m!309703 () Bool)

(assert (=> b!296834 m!309703))

(declare-fun m!309705 () Bool)

(assert (=> b!296835 m!309705))

(declare-fun m!309707 () Bool)

(assert (=> d!67121 m!309707))

(assert (=> d!67121 m!309601))

(assert (=> d!67121 m!309601))

(declare-fun m!309709 () Bool)

(assert (=> d!67121 m!309709))

(declare-fun m!309711 () Bool)

(assert (=> d!67121 m!309711))

(declare-fun m!309713 () Bool)

(assert (=> d!67121 m!309713))

(assert (=> d!67121 m!309603))

(assert (=> b!296669 d!67121))

(declare-fun d!67137 () Bool)

(assert (=> d!67137 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29256 d!67137))

(declare-fun d!67143 () Bool)

(assert (=> d!67143 (= (array_inv!5079 a!3312) (bvsge (size!7468 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29256 d!67143))

(declare-fun bm!25750 () Bool)

(declare-fun call!25753 () Bool)

(assert (=> bm!25750 (= call!25753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67145 () Bool)

(declare-fun res!156416 () Bool)

(declare-fun e!187617 () Bool)

(assert (=> d!67145 (=> res!156416 e!187617)))

(assert (=> d!67145 (= res!156416 (bvsge #b00000000000000000000000000000000 (size!7468 a!3312)))))

(assert (=> d!67145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187617)))

(declare-fun b!296864 () Bool)

(declare-fun e!187618 () Bool)

(declare-fun e!187619 () Bool)

(assert (=> b!296864 (= e!187618 e!187619)))

(declare-fun lt!147420 () (_ BitVec 64))

(assert (=> b!296864 (= lt!147420 (select (arr!7116 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9236 0))(
  ( (Unit!9237) )
))
(declare-fun lt!147419 () Unit!9236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15014 (_ BitVec 64) (_ BitVec 32)) Unit!9236)

(assert (=> b!296864 (= lt!147419 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147420 #b00000000000000000000000000000000))))

(assert (=> b!296864 (arrayContainsKey!0 a!3312 lt!147420 #b00000000000000000000000000000000)))

(declare-fun lt!147421 () Unit!9236)

(assert (=> b!296864 (= lt!147421 lt!147419)))

(declare-fun res!156415 () Bool)

(assert (=> b!296864 (= res!156415 (= (seekEntryOrOpen!0 (select (arr!7116 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2265 #b00000000000000000000000000000000)))))

(assert (=> b!296864 (=> (not res!156415) (not e!187619))))

(declare-fun b!296865 () Bool)

(assert (=> b!296865 (= e!187617 e!187618)))

(declare-fun c!47805 () Bool)

(assert (=> b!296865 (= c!47805 (validKeyInArray!0 (select (arr!7116 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296866 () Bool)

(assert (=> b!296866 (= e!187619 call!25753)))

(declare-fun b!296867 () Bool)

(assert (=> b!296867 (= e!187618 call!25753)))

(assert (= (and d!67145 (not res!156416)) b!296865))

(assert (= (and b!296865 c!47805) b!296864))

(assert (= (and b!296865 (not c!47805)) b!296867))

(assert (= (and b!296864 res!156415) b!296866))

(assert (= (or b!296866 b!296867) bm!25750))

(declare-fun m!309727 () Bool)

(assert (=> bm!25750 m!309727))

(assert (=> b!296864 m!309673))

(declare-fun m!309729 () Bool)

(assert (=> b!296864 m!309729))

(declare-fun m!309731 () Bool)

(assert (=> b!296864 m!309731))

(assert (=> b!296864 m!309673))

(declare-fun m!309733 () Bool)

(assert (=> b!296864 m!309733))

(assert (=> b!296865 m!309673))

(assert (=> b!296865 m!309673))

(declare-fun m!309735 () Bool)

(assert (=> b!296865 m!309735))

(assert (=> b!296663 d!67145))

(check-sat (not d!67107) (not b!296712) (not d!67121) (not b!296864) (not bm!25750) (not d!67099) (not b!296725) (not b!296865) (not b!296835) (not b!296765))
(check-sat)
