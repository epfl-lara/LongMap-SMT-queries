; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28514 () Bool)

(assert start!28514)

(declare-fun b!291769 () Bool)

(declare-fun e!184618 () Bool)

(declare-fun e!184617 () Bool)

(assert (=> b!291769 (= e!184618 e!184617)))

(declare-fun res!152966 () Bool)

(assert (=> b!291769 (=> (not res!152966) (not e!184617))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2142 0))(
  ( (MissingZero!2142 (index!10738 (_ BitVec 32))) (Found!2142 (index!10739 (_ BitVec 32))) (Intermediate!2142 (undefined!2954 Bool) (index!10740 (_ BitVec 32)) (x!28927 (_ BitVec 32))) (Undefined!2142) (MissingVacant!2142 (index!10741 (_ BitVec 32))) )
))
(declare-fun lt!144379 () SeekEntryResult!2142)

(declare-fun lt!144377 () Bool)

(assert (=> b!291769 (= res!152966 (or lt!144377 (= lt!144379 (MissingVacant!2142 i!1256))))))

(assert (=> b!291769 (= lt!144377 (= lt!144379 (MissingZero!2142 i!1256)))))

(declare-datatypes ((array!14738 0))(
  ( (array!14739 (arr!6993 (Array (_ BitVec 32) (_ BitVec 64))) (size!7345 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14738)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14738 (_ BitVec 32)) SeekEntryResult!2142)

(assert (=> b!291769 (= lt!144379 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291770 () Bool)

(declare-fun e!184616 () Bool)

(declare-fun e!184619 () Bool)

(assert (=> b!291770 (= e!184616 e!184619)))

(declare-fun res!152970 () Bool)

(assert (=> b!291770 (=> (not res!152970) (not e!184619))))

(declare-fun lt!144375 () SeekEntryResult!2142)

(declare-fun lt!144378 () Bool)

(assert (=> b!291770 (= res!152970 (and (or lt!144378 (not (undefined!2954 lt!144375))) (not lt!144378) (= (select (arr!6993 a!3312) (index!10740 lt!144375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291770 (= lt!144378 (not ((_ is Intermediate!2142) lt!144375)))))

(declare-fun res!152973 () Bool)

(assert (=> start!28514 (=> (not res!152973) (not e!184618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28514 (= res!152973 (validMask!0 mask!3809))))

(assert (=> start!28514 e!184618))

(assert (=> start!28514 true))

(declare-fun array_inv!4956 (array!14738) Bool)

(assert (=> start!28514 (array_inv!4956 a!3312)))

(declare-fun b!291771 () Bool)

(assert (=> b!291771 (= e!184617 e!184616)))

(declare-fun res!152971 () Bool)

(assert (=> b!291771 (=> (not res!152971) (not e!184616))))

(assert (=> b!291771 (= res!152971 (and (not lt!144377) (= lt!144379 (MissingVacant!2142 i!1256))))))

(declare-fun lt!144376 () SeekEntryResult!2142)

(declare-fun lt!144374 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14738 (_ BitVec 32)) SeekEntryResult!2142)

(assert (=> b!291771 (= lt!144376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144374 k0!2524 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)) mask!3809))))

(assert (=> b!291771 (= lt!144375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144374 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291771 (= lt!144374 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291772 () Bool)

(assert (=> b!291772 (= e!184619 (not (or (not (= lt!144375 (Intermediate!2142 false (index!10740 lt!144375) (x!28927 lt!144375)))) (bvsgt #b00000000000000000000000000000000 (x!28927 lt!144375)) (and (bvsge lt!144374 #b00000000000000000000000000000000) (bvslt lt!144374 (size!7345 a!3312))))))))

(assert (=> b!291772 (= (index!10740 lt!144375) i!1256)))

(declare-fun b!291773 () Bool)

(declare-fun res!152967 () Bool)

(assert (=> b!291773 (=> (not res!152967) (not e!184618))))

(declare-fun arrayContainsKey!0 (array!14738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291773 (= res!152967 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291774 () Bool)

(declare-fun res!152972 () Bool)

(assert (=> b!291774 (=> (not res!152972) (not e!184617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14738 (_ BitVec 32)) Bool)

(assert (=> b!291774 (= res!152972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291775 () Bool)

(declare-fun res!152968 () Bool)

(assert (=> b!291775 (=> (not res!152968) (not e!184618))))

(assert (=> b!291775 (= res!152968 (and (= (size!7345 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7345 a!3312))))))

(declare-fun b!291776 () Bool)

(declare-fun res!152969 () Bool)

(assert (=> b!291776 (=> (not res!152969) (not e!184618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291776 (= res!152969 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28514 res!152973) b!291775))

(assert (= (and b!291775 res!152968) b!291776))

(assert (= (and b!291776 res!152969) b!291773))

(assert (= (and b!291773 res!152967) b!291769))

(assert (= (and b!291769 res!152966) b!291774))

(assert (= (and b!291774 res!152972) b!291771))

(assert (= (and b!291771 res!152971) b!291770))

(assert (= (and b!291770 res!152970) b!291772))

(declare-fun m!305599 () Bool)

(assert (=> b!291774 m!305599))

(declare-fun m!305601 () Bool)

(assert (=> b!291769 m!305601))

(declare-fun m!305603 () Bool)

(assert (=> b!291773 m!305603))

(declare-fun m!305605 () Bool)

(assert (=> b!291770 m!305605))

(declare-fun m!305607 () Bool)

(assert (=> b!291771 m!305607))

(declare-fun m!305609 () Bool)

(assert (=> b!291771 m!305609))

(declare-fun m!305611 () Bool)

(assert (=> b!291771 m!305611))

(declare-fun m!305613 () Bool)

(assert (=> b!291771 m!305613))

(declare-fun m!305615 () Bool)

(assert (=> b!291776 m!305615))

(declare-fun m!305617 () Bool)

(assert (=> start!28514 m!305617))

(declare-fun m!305619 () Bool)

(assert (=> start!28514 m!305619))

(check-sat (not start!28514) (not b!291773) (not b!291769) (not b!291776) (not b!291774) (not b!291771))
(check-sat)
(get-model)

(declare-fun d!66417 () Bool)

(declare-fun res!153002 () Bool)

(declare-fun e!184639 () Bool)

(assert (=> d!66417 (=> res!153002 e!184639)))

(assert (=> d!66417 (= res!153002 (= (select (arr!6993 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66417 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184639)))

(declare-fun b!291805 () Bool)

(declare-fun e!184640 () Bool)

(assert (=> b!291805 (= e!184639 e!184640)))

(declare-fun res!153003 () Bool)

(assert (=> b!291805 (=> (not res!153003) (not e!184640))))

(assert (=> b!291805 (= res!153003 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7345 a!3312)))))

(declare-fun b!291806 () Bool)

(assert (=> b!291806 (= e!184640 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66417 (not res!153002)) b!291805))

(assert (= (and b!291805 res!153003) b!291806))

(declare-fun m!305643 () Bool)

(assert (=> d!66417 m!305643))

(declare-fun m!305645 () Bool)

(assert (=> b!291806 m!305645))

(assert (=> b!291773 d!66417))

(declare-fun b!291825 () Bool)

(declare-fun e!184655 () SeekEntryResult!2142)

(declare-fun e!184652 () SeekEntryResult!2142)

(assert (=> b!291825 (= e!184655 e!184652)))

(declare-fun c!46974 () Bool)

(declare-fun lt!144403 () (_ BitVec 64))

(assert (=> b!291825 (= c!46974 (or (= lt!144403 k0!2524) (= (bvadd lt!144403 lt!144403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291826 () Bool)

(assert (=> b!291826 (= e!184655 (Intermediate!2142 true lt!144374 #b00000000000000000000000000000000))))

(declare-fun b!291828 () Bool)

(assert (=> b!291828 (= e!184652 (Intermediate!2142 false lt!144374 #b00000000000000000000000000000000))))

(declare-fun b!291829 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291829 (= e!184652 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144374 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)) mask!3809))))

(declare-fun b!291830 () Bool)

(declare-fun e!184654 () Bool)

(declare-fun e!184651 () Bool)

(assert (=> b!291830 (= e!184654 e!184651)))

(declare-fun res!153010 () Bool)

(declare-fun lt!144402 () SeekEntryResult!2142)

(assert (=> b!291830 (= res!153010 (and ((_ is Intermediate!2142) lt!144402) (not (undefined!2954 lt!144402)) (bvslt (x!28927 lt!144402) #b01111111111111111111111111111110) (bvsge (x!28927 lt!144402) #b00000000000000000000000000000000) (bvsge (x!28927 lt!144402) #b00000000000000000000000000000000)))))

(assert (=> b!291830 (=> (not res!153010) (not e!184651))))

(declare-fun b!291827 () Bool)

(assert (=> b!291827 (and (bvsge (index!10740 lt!144402) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144402) (size!7345 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)))))))

(declare-fun res!153011 () Bool)

(assert (=> b!291827 (= res!153011 (= (select (arr!6993 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312))) (index!10740 lt!144402)) k0!2524))))

(declare-fun e!184653 () Bool)

(assert (=> b!291827 (=> res!153011 e!184653)))

(assert (=> b!291827 (= e!184651 e!184653)))

(declare-fun d!66419 () Bool)

(assert (=> d!66419 e!184654))

(declare-fun c!46973 () Bool)

(assert (=> d!66419 (= c!46973 (and ((_ is Intermediate!2142) lt!144402) (undefined!2954 lt!144402)))))

(assert (=> d!66419 (= lt!144402 e!184655)))

(declare-fun c!46972 () Bool)

(assert (=> d!66419 (= c!46972 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66419 (= lt!144403 (select (arr!6993 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312))) lt!144374))))

(assert (=> d!66419 (validMask!0 mask!3809)))

(assert (=> d!66419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144374 k0!2524 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)) mask!3809) lt!144402)))

(declare-fun b!291831 () Bool)

(assert (=> b!291831 (and (bvsge (index!10740 lt!144402) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144402) (size!7345 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)))))))

(assert (=> b!291831 (= e!184653 (= (select (arr!6993 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312))) (index!10740 lt!144402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291832 () Bool)

(assert (=> b!291832 (= e!184654 (bvsge (x!28927 lt!144402) #b01111111111111111111111111111110))))

(declare-fun b!291833 () Bool)

(assert (=> b!291833 (and (bvsge (index!10740 lt!144402) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144402) (size!7345 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312)))))))

(declare-fun res!153012 () Bool)

(assert (=> b!291833 (= res!153012 (= (select (arr!6993 (array!14739 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7345 a!3312))) (index!10740 lt!144402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291833 (=> res!153012 e!184653)))

(assert (= (and d!66419 c!46972) b!291826))

(assert (= (and d!66419 (not c!46972)) b!291825))

(assert (= (and b!291825 c!46974) b!291828))

(assert (= (and b!291825 (not c!46974)) b!291829))

(assert (= (and d!66419 c!46973) b!291832))

(assert (= (and d!66419 (not c!46973)) b!291830))

(assert (= (and b!291830 res!153010) b!291827))

(assert (= (and b!291827 (not res!153011)) b!291833))

(assert (= (and b!291833 (not res!153012)) b!291831))

(declare-fun m!305647 () Bool)

(assert (=> b!291833 m!305647))

(assert (=> b!291827 m!305647))

(assert (=> b!291831 m!305647))

(declare-fun m!305649 () Bool)

(assert (=> d!66419 m!305649))

(assert (=> d!66419 m!305617))

(declare-fun m!305651 () Bool)

(assert (=> b!291829 m!305651))

(assert (=> b!291829 m!305651))

(declare-fun m!305653 () Bool)

(assert (=> b!291829 m!305653))

(assert (=> b!291771 d!66419))

(declare-fun b!291834 () Bool)

(declare-fun e!184660 () SeekEntryResult!2142)

(declare-fun e!184657 () SeekEntryResult!2142)

(assert (=> b!291834 (= e!184660 e!184657)))

(declare-fun c!46977 () Bool)

(declare-fun lt!144405 () (_ BitVec 64))

(assert (=> b!291834 (= c!46977 (or (= lt!144405 k0!2524) (= (bvadd lt!144405 lt!144405) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291835 () Bool)

(assert (=> b!291835 (= e!184660 (Intermediate!2142 true lt!144374 #b00000000000000000000000000000000))))

(declare-fun b!291837 () Bool)

(assert (=> b!291837 (= e!184657 (Intermediate!2142 false lt!144374 #b00000000000000000000000000000000))))

(declare-fun b!291838 () Bool)

(assert (=> b!291838 (= e!184657 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144374 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291839 () Bool)

(declare-fun e!184659 () Bool)

(declare-fun e!184656 () Bool)

(assert (=> b!291839 (= e!184659 e!184656)))

(declare-fun res!153013 () Bool)

(declare-fun lt!144404 () SeekEntryResult!2142)

(assert (=> b!291839 (= res!153013 (and ((_ is Intermediate!2142) lt!144404) (not (undefined!2954 lt!144404)) (bvslt (x!28927 lt!144404) #b01111111111111111111111111111110) (bvsge (x!28927 lt!144404) #b00000000000000000000000000000000) (bvsge (x!28927 lt!144404) #b00000000000000000000000000000000)))))

(assert (=> b!291839 (=> (not res!153013) (not e!184656))))

(declare-fun b!291836 () Bool)

(assert (=> b!291836 (and (bvsge (index!10740 lt!144404) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144404) (size!7345 a!3312)))))

(declare-fun res!153014 () Bool)

(assert (=> b!291836 (= res!153014 (= (select (arr!6993 a!3312) (index!10740 lt!144404)) k0!2524))))

(declare-fun e!184658 () Bool)

(assert (=> b!291836 (=> res!153014 e!184658)))

(assert (=> b!291836 (= e!184656 e!184658)))

(declare-fun d!66425 () Bool)

(assert (=> d!66425 e!184659))

(declare-fun c!46976 () Bool)

(assert (=> d!66425 (= c!46976 (and ((_ is Intermediate!2142) lt!144404) (undefined!2954 lt!144404)))))

(assert (=> d!66425 (= lt!144404 e!184660)))

(declare-fun c!46975 () Bool)

(assert (=> d!66425 (= c!46975 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66425 (= lt!144405 (select (arr!6993 a!3312) lt!144374))))

(assert (=> d!66425 (validMask!0 mask!3809)))

(assert (=> d!66425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144374 k0!2524 a!3312 mask!3809) lt!144404)))

(declare-fun b!291840 () Bool)

(assert (=> b!291840 (and (bvsge (index!10740 lt!144404) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144404) (size!7345 a!3312)))))

(assert (=> b!291840 (= e!184658 (= (select (arr!6993 a!3312) (index!10740 lt!144404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291841 () Bool)

(assert (=> b!291841 (= e!184659 (bvsge (x!28927 lt!144404) #b01111111111111111111111111111110))))

(declare-fun b!291842 () Bool)

(assert (=> b!291842 (and (bvsge (index!10740 lt!144404) #b00000000000000000000000000000000) (bvslt (index!10740 lt!144404) (size!7345 a!3312)))))

(declare-fun res!153015 () Bool)

(assert (=> b!291842 (= res!153015 (= (select (arr!6993 a!3312) (index!10740 lt!144404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291842 (=> res!153015 e!184658)))

(assert (= (and d!66425 c!46975) b!291835))

(assert (= (and d!66425 (not c!46975)) b!291834))

(assert (= (and b!291834 c!46977) b!291837))

(assert (= (and b!291834 (not c!46977)) b!291838))

(assert (= (and d!66425 c!46976) b!291841))

(assert (= (and d!66425 (not c!46976)) b!291839))

(assert (= (and b!291839 res!153013) b!291836))

(assert (= (and b!291836 (not res!153014)) b!291842))

(assert (= (and b!291842 (not res!153015)) b!291840))

(declare-fun m!305655 () Bool)

(assert (=> b!291842 m!305655))

(assert (=> b!291836 m!305655))

(assert (=> b!291840 m!305655))

(declare-fun m!305657 () Bool)

(assert (=> d!66425 m!305657))

(assert (=> d!66425 m!305617))

(assert (=> b!291838 m!305651))

(assert (=> b!291838 m!305651))

(declare-fun m!305659 () Bool)

(assert (=> b!291838 m!305659))

(assert (=> b!291771 d!66425))

(declare-fun d!66427 () Bool)

(declare-fun lt!144411 () (_ BitVec 32))

(declare-fun lt!144410 () (_ BitVec 32))

(assert (=> d!66427 (= lt!144411 (bvmul (bvxor lt!144410 (bvlshr lt!144410 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66427 (= lt!144410 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66427 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!153016 (let ((h!5265 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28930 (bvmul (bvxor h!5265 (bvlshr h!5265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28930 (bvlshr x!28930 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!153016 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!153016 #b00000000000000000000000000000000))))))

(assert (=> d!66427 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144411 (bvlshr lt!144411 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291771 d!66427))

(declare-fun d!66429 () Bool)

(assert (=> d!66429 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291776 d!66429))

(declare-fun d!66431 () Bool)

(assert (=> d!66431 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28514 d!66431))

(declare-fun d!66437 () Bool)

(assert (=> d!66437 (= (array_inv!4956 a!3312) (bvsge (size!7345 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28514 d!66437))

(declare-fun b!291933 () Bool)

(declare-fun c!47008 () Bool)

(declare-fun lt!144444 () (_ BitVec 64))

(assert (=> b!291933 (= c!47008 (= lt!144444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184717 () SeekEntryResult!2142)

(declare-fun e!184718 () SeekEntryResult!2142)

(assert (=> b!291933 (= e!184717 e!184718)))

(declare-fun b!291934 () Bool)

(declare-fun e!184719 () SeekEntryResult!2142)

(assert (=> b!291934 (= e!184719 Undefined!2142)))

(declare-fun b!291935 () Bool)

(assert (=> b!291935 (= e!184719 e!184717)))

(declare-fun lt!144446 () SeekEntryResult!2142)

(assert (=> b!291935 (= lt!144444 (select (arr!6993 a!3312) (index!10740 lt!144446)))))

(declare-fun c!47009 () Bool)

(assert (=> b!291935 (= c!47009 (= lt!144444 k0!2524))))

(declare-fun b!291936 () Bool)

(assert (=> b!291936 (= e!184717 (Found!2142 (index!10740 lt!144446)))))

(declare-fun b!291937 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14738 (_ BitVec 32)) SeekEntryResult!2142)

(assert (=> b!291937 (= e!184718 (seekKeyOrZeroReturnVacant!0 (x!28927 lt!144446) (index!10740 lt!144446) (index!10740 lt!144446) k0!2524 a!3312 mask!3809))))

(declare-fun b!291938 () Bool)

(assert (=> b!291938 (= e!184718 (MissingZero!2142 (index!10740 lt!144446)))))

(declare-fun d!66441 () Bool)

(declare-fun lt!144445 () SeekEntryResult!2142)

(assert (=> d!66441 (and (or ((_ is Undefined!2142) lt!144445) (not ((_ is Found!2142) lt!144445)) (and (bvsge (index!10739 lt!144445) #b00000000000000000000000000000000) (bvslt (index!10739 lt!144445) (size!7345 a!3312)))) (or ((_ is Undefined!2142) lt!144445) ((_ is Found!2142) lt!144445) (not ((_ is MissingZero!2142) lt!144445)) (and (bvsge (index!10738 lt!144445) #b00000000000000000000000000000000) (bvslt (index!10738 lt!144445) (size!7345 a!3312)))) (or ((_ is Undefined!2142) lt!144445) ((_ is Found!2142) lt!144445) ((_ is MissingZero!2142) lt!144445) (not ((_ is MissingVacant!2142) lt!144445)) (and (bvsge (index!10741 lt!144445) #b00000000000000000000000000000000) (bvslt (index!10741 lt!144445) (size!7345 a!3312)))) (or ((_ is Undefined!2142) lt!144445) (ite ((_ is Found!2142) lt!144445) (= (select (arr!6993 a!3312) (index!10739 lt!144445)) k0!2524) (ite ((_ is MissingZero!2142) lt!144445) (= (select (arr!6993 a!3312) (index!10738 lt!144445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2142) lt!144445) (= (select (arr!6993 a!3312) (index!10741 lt!144445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66441 (= lt!144445 e!184719)))

(declare-fun c!47010 () Bool)

(assert (=> d!66441 (= c!47010 (and ((_ is Intermediate!2142) lt!144446) (undefined!2954 lt!144446)))))

(assert (=> d!66441 (= lt!144446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66441 (validMask!0 mask!3809)))

(assert (=> d!66441 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144445)))

(assert (= (and d!66441 c!47010) b!291934))

(assert (= (and d!66441 (not c!47010)) b!291935))

(assert (= (and b!291935 c!47009) b!291936))

(assert (= (and b!291935 (not c!47009)) b!291933))

(assert (= (and b!291933 c!47008) b!291938))

(assert (= (and b!291933 (not c!47008)) b!291937))

(declare-fun m!305705 () Bool)

(assert (=> b!291935 m!305705))

(declare-fun m!305707 () Bool)

(assert (=> b!291937 m!305707))

(declare-fun m!305709 () Bool)

(assert (=> d!66441 m!305709))

(assert (=> d!66441 m!305613))

(declare-fun m!305711 () Bool)

(assert (=> d!66441 m!305711))

(assert (=> d!66441 m!305617))

(declare-fun m!305713 () Bool)

(assert (=> d!66441 m!305713))

(assert (=> d!66441 m!305613))

(declare-fun m!305715 () Bool)

(assert (=> d!66441 m!305715))

(assert (=> b!291769 d!66441))

(declare-fun b!291957 () Bool)

(declare-fun e!184732 () Bool)

(declare-fun call!25657 () Bool)

(assert (=> b!291957 (= e!184732 call!25657)))

(declare-fun d!66455 () Bool)

(declare-fun res!153053 () Bool)

(declare-fun e!184731 () Bool)

(assert (=> d!66455 (=> res!153053 e!184731)))

(assert (=> d!66455 (= res!153053 (bvsge #b00000000000000000000000000000000 (size!7345 a!3312)))))

(assert (=> d!66455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184731)))

(declare-fun bm!25654 () Bool)

(assert (=> bm!25654 (= call!25657 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291958 () Bool)

(declare-fun e!184730 () Bool)

(assert (=> b!291958 (= e!184731 e!184730)))

(declare-fun c!47017 () Bool)

(assert (=> b!291958 (= c!47017 (validKeyInArray!0 (select (arr!6993 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!291959 () Bool)

(assert (=> b!291959 (= e!184730 e!184732)))

(declare-fun lt!144463 () (_ BitVec 64))

(assert (=> b!291959 (= lt!144463 (select (arr!6993 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9152 0))(
  ( (Unit!9153) )
))
(declare-fun lt!144464 () Unit!9152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14738 (_ BitVec 64) (_ BitVec 32)) Unit!9152)

(assert (=> b!291959 (= lt!144464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144463 #b00000000000000000000000000000000))))

(assert (=> b!291959 (arrayContainsKey!0 a!3312 lt!144463 #b00000000000000000000000000000000)))

(declare-fun lt!144465 () Unit!9152)

(assert (=> b!291959 (= lt!144465 lt!144464)))

(declare-fun res!153052 () Bool)

(assert (=> b!291959 (= res!153052 (= (seekEntryOrOpen!0 (select (arr!6993 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2142 #b00000000000000000000000000000000)))))

(assert (=> b!291959 (=> (not res!153052) (not e!184732))))

(declare-fun b!291960 () Bool)

(assert (=> b!291960 (= e!184730 call!25657)))

(assert (= (and d!66455 (not res!153053)) b!291958))

(assert (= (and b!291958 c!47017) b!291959))

(assert (= (and b!291958 (not c!47017)) b!291960))

(assert (= (and b!291959 res!153052) b!291957))

(assert (= (or b!291957 b!291960) bm!25654))

(declare-fun m!305717 () Bool)

(assert (=> bm!25654 m!305717))

(assert (=> b!291958 m!305643))

(assert (=> b!291958 m!305643))

(declare-fun m!305719 () Bool)

(assert (=> b!291958 m!305719))

(assert (=> b!291959 m!305643))

(declare-fun m!305721 () Bool)

(assert (=> b!291959 m!305721))

(declare-fun m!305723 () Bool)

(assert (=> b!291959 m!305723))

(assert (=> b!291959 m!305643))

(declare-fun m!305725 () Bool)

(assert (=> b!291959 m!305725))

(assert (=> b!291774 d!66455))

(check-sat (not b!291806) (not b!291958) (not d!66425) (not d!66419) (not b!291937) (not bm!25654) (not d!66441) (not b!291838) (not b!291959) (not b!291829))
(check-sat)
