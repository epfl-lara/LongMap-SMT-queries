; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27878 () Bool)

(assert start!27878)

(declare-fun b!286683 () Bool)

(declare-fun res!148765 () Bool)

(declare-fun e!181627 () Bool)

(assert (=> b!286683 (=> (not res!148765) (not e!181627))))

(declare-datatypes ((array!14366 0))(
  ( (array!14367 (arr!6816 (Array (_ BitVec 32) (_ BitVec 64))) (size!7168 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14366)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286683 (= res!148765 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286684 () Bool)

(declare-fun e!181626 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!141186 () (_ BitVec 32))

(assert (=> b!286684 (= e!181626 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141186 #b00000000000000000000000000000000) (bvsge lt!141186 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286684 (= lt!141186 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286685 () Bool)

(declare-fun res!148762 () Bool)

(assert (=> b!286685 (=> (not res!148762) (not e!181627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286685 (= res!148762 (validKeyInArray!0 k0!2524))))

(declare-fun b!286686 () Bool)

(declare-fun res!148767 () Bool)

(assert (=> b!286686 (=> (not res!148767) (not e!181626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14366 (_ BitVec 32)) Bool)

(assert (=> b!286686 (= res!148767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286687 () Bool)

(assert (=> b!286687 (= e!181627 e!181626)))

(declare-fun res!148763 () Bool)

(assert (=> b!286687 (=> (not res!148763) (not e!181626))))

(declare-datatypes ((SeekEntryResult!1965 0))(
  ( (MissingZero!1965 (index!10030 (_ BitVec 32))) (Found!1965 (index!10031 (_ BitVec 32))) (Intermediate!1965 (undefined!2777 Bool) (index!10032 (_ BitVec 32)) (x!28245 (_ BitVec 32))) (Undefined!1965) (MissingVacant!1965 (index!10033 (_ BitVec 32))) )
))
(declare-fun lt!141187 () SeekEntryResult!1965)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286687 (= res!148763 (or (= lt!141187 (MissingZero!1965 i!1256)) (= lt!141187 (MissingVacant!1965 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14366 (_ BitVec 32)) SeekEntryResult!1965)

(assert (=> b!286687 (= lt!141187 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148766 () Bool)

(assert (=> start!27878 (=> (not res!148766) (not e!181627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27878 (= res!148766 (validMask!0 mask!3809))))

(assert (=> start!27878 e!181627))

(assert (=> start!27878 true))

(declare-fun array_inv!4779 (array!14366) Bool)

(assert (=> start!27878 (array_inv!4779 a!3312)))

(declare-fun b!286688 () Bool)

(declare-fun res!148764 () Bool)

(assert (=> b!286688 (=> (not res!148764) (not e!181627))))

(assert (=> b!286688 (= res!148764 (and (= (size!7168 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7168 a!3312))))))

(assert (= (and start!27878 res!148766) b!286688))

(assert (= (and b!286688 res!148764) b!286685))

(assert (= (and b!286685 res!148762) b!286683))

(assert (= (and b!286683 res!148765) b!286687))

(assert (= (and b!286687 res!148763) b!286686))

(assert (= (and b!286686 res!148767) b!286684))

(declare-fun m!301301 () Bool)

(assert (=> start!27878 m!301301))

(declare-fun m!301303 () Bool)

(assert (=> start!27878 m!301303))

(declare-fun m!301305 () Bool)

(assert (=> b!286686 m!301305))

(declare-fun m!301307 () Bool)

(assert (=> b!286685 m!301307))

(declare-fun m!301309 () Bool)

(assert (=> b!286683 m!301309))

(declare-fun m!301311 () Bool)

(assert (=> b!286684 m!301311))

(declare-fun m!301313 () Bool)

(assert (=> b!286687 m!301313))

(check-sat (not b!286687) (not start!27878) (not b!286683) (not b!286685) (not b!286686) (not b!286684))
(check-sat)
(get-model)

(declare-fun d!65999 () Bool)

(declare-fun res!148790 () Bool)

(declare-fun e!181642 () Bool)

(assert (=> d!65999 (=> res!148790 e!181642)))

(assert (=> d!65999 (= res!148790 (= (select (arr!6816 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!65999 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181642)))

(declare-fun b!286711 () Bool)

(declare-fun e!181643 () Bool)

(assert (=> b!286711 (= e!181642 e!181643)))

(declare-fun res!148791 () Bool)

(assert (=> b!286711 (=> (not res!148791) (not e!181643))))

(assert (=> b!286711 (= res!148791 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7168 a!3312)))))

(declare-fun b!286712 () Bool)

(assert (=> b!286712 (= e!181643 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65999 (not res!148790)) b!286711))

(assert (= (and b!286711 res!148791) b!286712))

(declare-fun m!301329 () Bool)

(assert (=> d!65999 m!301329))

(declare-fun m!301331 () Bool)

(assert (=> b!286712 m!301331))

(assert (=> b!286683 d!65999))

(declare-fun b!286731 () Bool)

(declare-fun c!46522 () Bool)

(declare-fun lt!141201 () (_ BitVec 64))

(assert (=> b!286731 (= c!46522 (= lt!141201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181656 () SeekEntryResult!1965)

(declare-fun e!181658 () SeekEntryResult!1965)

(assert (=> b!286731 (= e!181656 e!181658)))

(declare-fun b!286732 () Bool)

(declare-fun lt!141202 () SeekEntryResult!1965)

(assert (=> b!286732 (= e!181656 (Found!1965 (index!10032 lt!141202)))))

(declare-fun b!286733 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14366 (_ BitVec 32)) SeekEntryResult!1965)

(assert (=> b!286733 (= e!181658 (seekKeyOrZeroReturnVacant!0 (x!28245 lt!141202) (index!10032 lt!141202) (index!10032 lt!141202) k0!2524 a!3312 mask!3809))))

(declare-fun d!66001 () Bool)

(declare-fun lt!141200 () SeekEntryResult!1965)

(get-info :version)

(assert (=> d!66001 (and (or ((_ is Undefined!1965) lt!141200) (not ((_ is Found!1965) lt!141200)) (and (bvsge (index!10031 lt!141200) #b00000000000000000000000000000000) (bvslt (index!10031 lt!141200) (size!7168 a!3312)))) (or ((_ is Undefined!1965) lt!141200) ((_ is Found!1965) lt!141200) (not ((_ is MissingZero!1965) lt!141200)) (and (bvsge (index!10030 lt!141200) #b00000000000000000000000000000000) (bvslt (index!10030 lt!141200) (size!7168 a!3312)))) (or ((_ is Undefined!1965) lt!141200) ((_ is Found!1965) lt!141200) ((_ is MissingZero!1965) lt!141200) (not ((_ is MissingVacant!1965) lt!141200)) (and (bvsge (index!10033 lt!141200) #b00000000000000000000000000000000) (bvslt (index!10033 lt!141200) (size!7168 a!3312)))) (or ((_ is Undefined!1965) lt!141200) (ite ((_ is Found!1965) lt!141200) (= (select (arr!6816 a!3312) (index!10031 lt!141200)) k0!2524) (ite ((_ is MissingZero!1965) lt!141200) (= (select (arr!6816 a!3312) (index!10030 lt!141200)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1965) lt!141200) (= (select (arr!6816 a!3312) (index!10033 lt!141200)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181657 () SeekEntryResult!1965)

(assert (=> d!66001 (= lt!141200 e!181657)))

(declare-fun c!46523 () Bool)

(assert (=> d!66001 (= c!46523 (and ((_ is Intermediate!1965) lt!141202) (undefined!2777 lt!141202)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14366 (_ BitVec 32)) SeekEntryResult!1965)

(assert (=> d!66001 (= lt!141202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66001 (validMask!0 mask!3809)))

(assert (=> d!66001 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141200)))

(declare-fun b!286734 () Bool)

(assert (=> b!286734 (= e!181657 Undefined!1965)))

(declare-fun b!286735 () Bool)

(assert (=> b!286735 (= e!181657 e!181656)))

(assert (=> b!286735 (= lt!141201 (select (arr!6816 a!3312) (index!10032 lt!141202)))))

(declare-fun c!46524 () Bool)

(assert (=> b!286735 (= c!46524 (= lt!141201 k0!2524))))

(declare-fun b!286736 () Bool)

(assert (=> b!286736 (= e!181658 (MissingZero!1965 (index!10032 lt!141202)))))

(assert (= (and d!66001 c!46523) b!286734))

(assert (= (and d!66001 (not c!46523)) b!286735))

(assert (= (and b!286735 c!46524) b!286732))

(assert (= (and b!286735 (not c!46524)) b!286731))

(assert (= (and b!286731 c!46522) b!286736))

(assert (= (and b!286731 (not c!46522)) b!286733))

(declare-fun m!301337 () Bool)

(assert (=> b!286733 m!301337))

(declare-fun m!301339 () Bool)

(assert (=> d!66001 m!301339))

(assert (=> d!66001 m!301301))

(declare-fun m!301341 () Bool)

(assert (=> d!66001 m!301341))

(declare-fun m!301343 () Bool)

(assert (=> d!66001 m!301343))

(assert (=> d!66001 m!301311))

(declare-fun m!301345 () Bool)

(assert (=> d!66001 m!301345))

(assert (=> d!66001 m!301311))

(declare-fun m!301347 () Bool)

(assert (=> b!286735 m!301347))

(assert (=> b!286687 d!66001))

(declare-fun d!66015 () Bool)

(assert (=> d!66015 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286685 d!66015))

(declare-fun d!66017 () Bool)

(assert (=> d!66017 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27878 d!66017))

(declare-fun d!66021 () Bool)

(assert (=> d!66021 (= (array_inv!4779 a!3312) (bvsge (size!7168 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27878 d!66021))

(declare-fun b!286775 () Bool)

(declare-fun e!181685 () Bool)

(declare-fun call!25603 () Bool)

(assert (=> b!286775 (= e!181685 call!25603)))

(declare-fun b!286776 () Bool)

(declare-fun e!181683 () Bool)

(assert (=> b!286776 (= e!181683 e!181685)))

(declare-fun c!46539 () Bool)

(assert (=> b!286776 (= c!46539 (validKeyInArray!0 (select (arr!6816 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!286777 () Bool)

(declare-fun e!181684 () Bool)

(assert (=> b!286777 (= e!181685 e!181684)))

(declare-fun lt!141233 () (_ BitVec 64))

(assert (=> b!286777 (= lt!141233 (select (arr!6816 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9056 0))(
  ( (Unit!9057) )
))
(declare-fun lt!141234 () Unit!9056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14366 (_ BitVec 64) (_ BitVec 32)) Unit!9056)

(assert (=> b!286777 (= lt!141234 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141233 #b00000000000000000000000000000000))))

(assert (=> b!286777 (arrayContainsKey!0 a!3312 lt!141233 #b00000000000000000000000000000000)))

(declare-fun lt!141235 () Unit!9056)

(assert (=> b!286777 (= lt!141235 lt!141234)))

(declare-fun res!148810 () Bool)

(assert (=> b!286777 (= res!148810 (= (seekEntryOrOpen!0 (select (arr!6816 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1965 #b00000000000000000000000000000000)))))

(assert (=> b!286777 (=> (not res!148810) (not e!181684))))

(declare-fun d!66023 () Bool)

(declare-fun res!148809 () Bool)

(assert (=> d!66023 (=> res!148809 e!181683)))

(assert (=> d!66023 (= res!148809 (bvsge #b00000000000000000000000000000000 (size!7168 a!3312)))))

(assert (=> d!66023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181683)))

(declare-fun bm!25600 () Bool)

(assert (=> bm!25600 (= call!25603 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!286778 () Bool)

(assert (=> b!286778 (= e!181684 call!25603)))

(assert (= (and d!66023 (not res!148809)) b!286776))

(assert (= (and b!286776 c!46539) b!286777))

(assert (= (and b!286776 (not c!46539)) b!286775))

(assert (= (and b!286777 res!148810) b!286778))

(assert (= (or b!286778 b!286775) bm!25600))

(assert (=> b!286776 m!301329))

(assert (=> b!286776 m!301329))

(declare-fun m!301371 () Bool)

(assert (=> b!286776 m!301371))

(assert (=> b!286777 m!301329))

(declare-fun m!301373 () Bool)

(assert (=> b!286777 m!301373))

(declare-fun m!301375 () Bool)

(assert (=> b!286777 m!301375))

(assert (=> b!286777 m!301329))

(declare-fun m!301377 () Bool)

(assert (=> b!286777 m!301377))

(declare-fun m!301379 () Bool)

(assert (=> bm!25600 m!301379))

(assert (=> b!286686 d!66023))

(declare-fun d!66029 () Bool)

(declare-fun lt!141241 () (_ BitVec 32))

(declare-fun lt!141240 () (_ BitVec 32))

(assert (=> d!66029 (= lt!141241 (bvmul (bvxor lt!141240 (bvlshr lt!141240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66029 (= lt!141240 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66029 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148811 (let ((h!5248 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28248 (bvmul (bvxor h!5248 (bvlshr h!5248 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28248 (bvlshr x!28248 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148811 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148811 #b00000000000000000000000000000000))))))

(assert (=> d!66029 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141241 (bvlshr lt!141241 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286684 d!66029))

(check-sat (not d!66001) (not b!286733) (not b!286712) (not bm!25600) (not b!286777) (not b!286776))
(check-sat)
