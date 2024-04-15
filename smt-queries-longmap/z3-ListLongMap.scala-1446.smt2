; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27872 () Bool)

(assert start!27872)

(declare-fun b!286518 () Bool)

(declare-fun res!148654 () Bool)

(declare-fun e!181517 () Bool)

(assert (=> b!286518 (=> (not res!148654) (not e!181517))))

(declare-datatypes ((array!14353 0))(
  ( (array!14354 (arr!6810 (Array (_ BitVec 32) (_ BitVec 64))) (size!7163 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14353)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14353 (_ BitVec 32)) Bool)

(assert (=> b!286518 (= res!148654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286519 () Bool)

(declare-fun res!148651 () Bool)

(declare-fun e!181518 () Bool)

(assert (=> b!286519 (=> (not res!148651) (not e!181518))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286519 (= res!148651 (validKeyInArray!0 k0!2524))))

(declare-fun b!286520 () Bool)

(declare-fun lt!140999 () (_ BitVec 32))

(assert (=> b!286520 (= e!181517 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!140999 #b00000000000000000000000000000000) (bvsge lt!140999 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286520 (= lt!140999 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286521 () Bool)

(declare-fun res!148649 () Bool)

(assert (=> b!286521 (=> (not res!148649) (not e!181518))))

(declare-fun arrayContainsKey!0 (array!14353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286521 (= res!148649 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286522 () Bool)

(assert (=> b!286522 (= e!181518 e!181517)))

(declare-fun res!148652 () Bool)

(assert (=> b!286522 (=> (not res!148652) (not e!181517))))

(declare-datatypes ((SeekEntryResult!1958 0))(
  ( (MissingZero!1958 (index!10002 (_ BitVec 32))) (Found!1958 (index!10003 (_ BitVec 32))) (Intermediate!1958 (undefined!2770 Bool) (index!10004 (_ BitVec 32)) (x!28237 (_ BitVec 32))) (Undefined!1958) (MissingVacant!1958 (index!10005 (_ BitVec 32))) )
))
(declare-fun lt!141000 () SeekEntryResult!1958)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286522 (= res!148652 (or (= lt!141000 (MissingZero!1958 i!1256)) (= lt!141000 (MissingVacant!1958 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14353 (_ BitVec 32)) SeekEntryResult!1958)

(assert (=> b!286522 (= lt!141000 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286523 () Bool)

(declare-fun res!148653 () Bool)

(assert (=> b!286523 (=> (not res!148653) (not e!181518))))

(assert (=> b!286523 (= res!148653 (and (= (size!7163 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7163 a!3312))))))

(declare-fun res!148650 () Bool)

(assert (=> start!27872 (=> (not res!148650) (not e!181518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27872 (= res!148650 (validMask!0 mask!3809))))

(assert (=> start!27872 e!181518))

(assert (=> start!27872 true))

(declare-fun array_inv!4782 (array!14353) Bool)

(assert (=> start!27872 (array_inv!4782 a!3312)))

(assert (= (and start!27872 res!148650) b!286523))

(assert (= (and b!286523 res!148653) b!286519))

(assert (= (and b!286519 res!148651) b!286521))

(assert (= (and b!286521 res!148649) b!286522))

(assert (= (and b!286522 res!148652) b!286518))

(assert (= (and b!286518 res!148654) b!286520))

(declare-fun m!300695 () Bool)

(assert (=> b!286521 m!300695))

(declare-fun m!300697 () Bool)

(assert (=> b!286519 m!300697))

(declare-fun m!300699 () Bool)

(assert (=> start!27872 m!300699))

(declare-fun m!300701 () Bool)

(assert (=> start!27872 m!300701))

(declare-fun m!300703 () Bool)

(assert (=> b!286520 m!300703))

(declare-fun m!300705 () Bool)

(assert (=> b!286522 m!300705))

(declare-fun m!300707 () Bool)

(assert (=> b!286518 m!300707))

(check-sat (not b!286519) (not b!286522) (not b!286518) (not start!27872) (not b!286520) (not b!286521))
(check-sat)
(get-model)

(declare-fun b!286568 () Bool)

(declare-fun e!181543 () Bool)

(declare-fun call!25576 () Bool)

(assert (=> b!286568 (= e!181543 call!25576)))

(declare-fun b!286569 () Bool)

(declare-fun e!181545 () Bool)

(assert (=> b!286569 (= e!181545 e!181543)))

(declare-fun lt!141019 () (_ BitVec 64))

(assert (=> b!286569 (= lt!141019 (select (arr!6810 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9006 0))(
  ( (Unit!9007) )
))
(declare-fun lt!141021 () Unit!9006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14353 (_ BitVec 64) (_ BitVec 32)) Unit!9006)

(assert (=> b!286569 (= lt!141021 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141019 #b00000000000000000000000000000000))))

(assert (=> b!286569 (arrayContainsKey!0 a!3312 lt!141019 #b00000000000000000000000000000000)))

(declare-fun lt!141020 () Unit!9006)

(assert (=> b!286569 (= lt!141020 lt!141021)))

(declare-fun res!148695 () Bool)

(assert (=> b!286569 (= res!148695 (= (seekEntryOrOpen!0 (select (arr!6810 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1958 #b00000000000000000000000000000000)))))

(assert (=> b!286569 (=> (not res!148695) (not e!181543))))

(declare-fun bm!25573 () Bool)

(assert (=> bm!25573 (= call!25576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!65843 () Bool)

(declare-fun res!148696 () Bool)

(declare-fun e!181544 () Bool)

(assert (=> d!65843 (=> res!148696 e!181544)))

(assert (=> d!65843 (= res!148696 (bvsge #b00000000000000000000000000000000 (size!7163 a!3312)))))

(assert (=> d!65843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181544)))

(declare-fun b!286570 () Bool)

(assert (=> b!286570 (= e!181544 e!181545)))

(declare-fun c!46492 () Bool)

(assert (=> b!286570 (= c!46492 (validKeyInArray!0 (select (arr!6810 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!286571 () Bool)

(assert (=> b!286571 (= e!181545 call!25576)))

(assert (= (and d!65843 (not res!148696)) b!286570))

(assert (= (and b!286570 c!46492) b!286569))

(assert (= (and b!286570 (not c!46492)) b!286571))

(assert (= (and b!286569 res!148695) b!286568))

(assert (= (or b!286568 b!286571) bm!25573))

(declare-fun m!300737 () Bool)

(assert (=> b!286569 m!300737))

(declare-fun m!300739 () Bool)

(assert (=> b!286569 m!300739))

(declare-fun m!300741 () Bool)

(assert (=> b!286569 m!300741))

(assert (=> b!286569 m!300737))

(declare-fun m!300743 () Bool)

(assert (=> b!286569 m!300743))

(declare-fun m!300745 () Bool)

(assert (=> bm!25573 m!300745))

(assert (=> b!286570 m!300737))

(assert (=> b!286570 m!300737))

(declare-fun m!300747 () Bool)

(assert (=> b!286570 m!300747))

(assert (=> b!286518 d!65843))

(declare-fun b!286602 () Bool)

(declare-fun c!46509 () Bool)

(declare-fun lt!141038 () (_ BitVec 64))

(assert (=> b!286602 (= c!46509 (= lt!141038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181563 () SeekEntryResult!1958)

(declare-fun e!181562 () SeekEntryResult!1958)

(assert (=> b!286602 (= e!181563 e!181562)))

(declare-fun d!65847 () Bool)

(declare-fun lt!141039 () SeekEntryResult!1958)

(get-info :version)

(assert (=> d!65847 (and (or ((_ is Undefined!1958) lt!141039) (not ((_ is Found!1958) lt!141039)) (and (bvsge (index!10003 lt!141039) #b00000000000000000000000000000000) (bvslt (index!10003 lt!141039) (size!7163 a!3312)))) (or ((_ is Undefined!1958) lt!141039) ((_ is Found!1958) lt!141039) (not ((_ is MissingZero!1958) lt!141039)) (and (bvsge (index!10002 lt!141039) #b00000000000000000000000000000000) (bvslt (index!10002 lt!141039) (size!7163 a!3312)))) (or ((_ is Undefined!1958) lt!141039) ((_ is Found!1958) lt!141039) ((_ is MissingZero!1958) lt!141039) (not ((_ is MissingVacant!1958) lt!141039)) (and (bvsge (index!10005 lt!141039) #b00000000000000000000000000000000) (bvslt (index!10005 lt!141039) (size!7163 a!3312)))) (or ((_ is Undefined!1958) lt!141039) (ite ((_ is Found!1958) lt!141039) (= (select (arr!6810 a!3312) (index!10003 lt!141039)) k0!2524) (ite ((_ is MissingZero!1958) lt!141039) (= (select (arr!6810 a!3312) (index!10002 lt!141039)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1958) lt!141039) (= (select (arr!6810 a!3312) (index!10005 lt!141039)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181561 () SeekEntryResult!1958)

(assert (=> d!65847 (= lt!141039 e!181561)))

(declare-fun c!46510 () Bool)

(declare-fun lt!141037 () SeekEntryResult!1958)

(assert (=> d!65847 (= c!46510 (and ((_ is Intermediate!1958) lt!141037) (undefined!2770 lt!141037)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14353 (_ BitVec 32)) SeekEntryResult!1958)

(assert (=> d!65847 (= lt!141037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!65847 (validMask!0 mask!3809)))

(assert (=> d!65847 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141039)))

(declare-fun b!286603 () Bool)

(assert (=> b!286603 (= e!181561 Undefined!1958)))

(declare-fun b!286604 () Bool)

(assert (=> b!286604 (= e!181563 (Found!1958 (index!10004 lt!141037)))))

(declare-fun b!286605 () Bool)

(assert (=> b!286605 (= e!181561 e!181563)))

(assert (=> b!286605 (= lt!141038 (select (arr!6810 a!3312) (index!10004 lt!141037)))))

(declare-fun c!46508 () Bool)

(assert (=> b!286605 (= c!46508 (= lt!141038 k0!2524))))

(declare-fun b!286606 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14353 (_ BitVec 32)) SeekEntryResult!1958)

(assert (=> b!286606 (= e!181562 (seekKeyOrZeroReturnVacant!0 (x!28237 lt!141037) (index!10004 lt!141037) (index!10004 lt!141037) k0!2524 a!3312 mask!3809))))

(declare-fun b!286607 () Bool)

(assert (=> b!286607 (= e!181562 (MissingZero!1958 (index!10004 lt!141037)))))

(assert (= (and d!65847 c!46510) b!286603))

(assert (= (and d!65847 (not c!46510)) b!286605))

(assert (= (and b!286605 c!46508) b!286604))

(assert (= (and b!286605 (not c!46508)) b!286602))

(assert (= (and b!286602 c!46509) b!286607))

(assert (= (and b!286602 (not c!46509)) b!286606))

(assert (=> d!65847 m!300703))

(declare-fun m!300761 () Bool)

(assert (=> d!65847 m!300761))

(assert (=> d!65847 m!300703))

(declare-fun m!300763 () Bool)

(assert (=> d!65847 m!300763))

(declare-fun m!300765 () Bool)

(assert (=> d!65847 m!300765))

(declare-fun m!300767 () Bool)

(assert (=> d!65847 m!300767))

(assert (=> d!65847 m!300699))

(declare-fun m!300769 () Bool)

(assert (=> b!286605 m!300769))

(declare-fun m!300771 () Bool)

(assert (=> b!286606 m!300771))

(assert (=> b!286522 d!65847))

(declare-fun d!65857 () Bool)

(declare-fun res!148701 () Bool)

(declare-fun e!181568 () Bool)

(assert (=> d!65857 (=> res!148701 e!181568)))

(assert (=> d!65857 (= res!148701 (= (select (arr!6810 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!65857 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181568)))

(declare-fun b!286612 () Bool)

(declare-fun e!181569 () Bool)

(assert (=> b!286612 (= e!181568 e!181569)))

(declare-fun res!148702 () Bool)

(assert (=> b!286612 (=> (not res!148702) (not e!181569))))

(assert (=> b!286612 (= res!148702 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7163 a!3312)))))

(declare-fun b!286613 () Bool)

(assert (=> b!286613 (= e!181569 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65857 (not res!148701)) b!286612))

(assert (= (and b!286612 res!148702) b!286613))

(assert (=> d!65857 m!300737))

(declare-fun m!300773 () Bool)

(assert (=> b!286613 m!300773))

(assert (=> b!286521 d!65857))

(declare-fun d!65859 () Bool)

(declare-fun lt!141051 () (_ BitVec 32))

(declare-fun lt!141050 () (_ BitVec 32))

(assert (=> d!65859 (= lt!141051 (bvmul (bvxor lt!141050 (bvlshr lt!141050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65859 (= lt!141050 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65859 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148703 (let ((h!5215 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28240 (bvmul (bvxor h!5215 (bvlshr h!5215 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28240 (bvlshr x!28240 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148703 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148703 #b00000000000000000000000000000000))))))

(assert (=> d!65859 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141051 (bvlshr lt!141051 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286520 d!65859))

(declare-fun d!65865 () Bool)

(assert (=> d!65865 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27872 d!65865))

(declare-fun d!65877 () Bool)

(assert (=> d!65877 (= (array_inv!4782 a!3312) (bvsge (size!7163 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27872 d!65877))

(declare-fun d!65879 () Bool)

(assert (=> d!65879 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286519 d!65879))

(check-sat (not b!286569) (not d!65847) (not bm!25573) (not b!286606) (not b!286613) (not b!286570))
(check-sat)
