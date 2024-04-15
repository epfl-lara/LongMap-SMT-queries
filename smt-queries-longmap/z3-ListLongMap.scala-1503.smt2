; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28448 () Bool)

(assert start!28448)

(declare-fun b!291238 () Bool)

(declare-fun res!152633 () Bool)

(declare-fun e!184277 () Bool)

(assert (=> b!291238 (=> (not res!152633) (not e!184277))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14710 0))(
  ( (array!14711 (arr!6981 (Array (_ BitVec 32) (_ BitVec 64))) (size!7334 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14710)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291238 (= res!152633 (and (= (size!7334 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7334 a!3312))))))

(declare-fun b!291239 () Bool)

(declare-fun res!152630 () Bool)

(assert (=> b!291239 (=> (not res!152630) (not e!184277))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291239 (= res!152630 (validKeyInArray!0 k0!2524))))

(declare-fun b!291240 () Bool)

(declare-fun e!184279 () Bool)

(declare-datatypes ((SeekEntryResult!2129 0))(
  ( (MissingZero!2129 (index!10686 (_ BitVec 32))) (Found!2129 (index!10687 (_ BitVec 32))) (Intermediate!2129 (undefined!2941 Bool) (index!10688 (_ BitVec 32)) (x!28891 (_ BitVec 32))) (Undefined!2129) (MissingVacant!2129 (index!10689 (_ BitVec 32))) )
))
(declare-fun lt!143975 () SeekEntryResult!2129)

(assert (=> b!291240 (= e!184279 (not (or (not (= lt!143975 (Intermediate!2129 false (index!10688 lt!143975) (x!28891 lt!143975)))) (bvsle #b00000000000000000000000000000000 (x!28891 lt!143975)))))))

(assert (=> b!291240 (= (index!10688 lt!143975) i!1256)))

(declare-fun b!291241 () Bool)

(declare-fun e!184281 () Bool)

(assert (=> b!291241 (= e!184281 e!184279)))

(declare-fun res!152632 () Bool)

(assert (=> b!291241 (=> (not res!152632) (not e!184279))))

(declare-fun lt!143972 () Bool)

(assert (=> b!291241 (= res!152632 (and (or lt!143972 (not (undefined!2941 lt!143975))) (not lt!143972) (= (select (arr!6981 a!3312) (index!10688 lt!143975)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291241 (= lt!143972 (not ((_ is Intermediate!2129) lt!143975)))))

(declare-fun b!291242 () Bool)

(declare-fun e!184278 () Bool)

(assert (=> b!291242 (= e!184277 e!184278)))

(declare-fun res!152635 () Bool)

(assert (=> b!291242 (=> (not res!152635) (not e!184278))))

(declare-fun lt!143974 () SeekEntryResult!2129)

(declare-fun lt!143973 () Bool)

(assert (=> b!291242 (= res!152635 (or lt!143973 (= lt!143974 (MissingVacant!2129 i!1256))))))

(assert (=> b!291242 (= lt!143973 (= lt!143974 (MissingZero!2129 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14710 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!291242 (= lt!143974 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291243 () Bool)

(assert (=> b!291243 (= e!184278 e!184281)))

(declare-fun res!152629 () Bool)

(assert (=> b!291243 (=> (not res!152629) (not e!184281))))

(assert (=> b!291243 (= res!152629 (and (not lt!143973) (= lt!143974 (MissingVacant!2129 i!1256))))))

(declare-fun lt!143971 () (_ BitVec 32))

(declare-fun lt!143976 () SeekEntryResult!2129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14710 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!291243 (= lt!143976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143971 k0!2524 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)) mask!3809))))

(assert (=> b!291243 (= lt!143975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143971 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291243 (= lt!143971 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291244 () Bool)

(declare-fun res!152634 () Bool)

(assert (=> b!291244 (=> (not res!152634) (not e!184277))))

(declare-fun arrayContainsKey!0 (array!14710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291244 (= res!152634 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152631 () Bool)

(assert (=> start!28448 (=> (not res!152631) (not e!184277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28448 (= res!152631 (validMask!0 mask!3809))))

(assert (=> start!28448 e!184277))

(assert (=> start!28448 true))

(declare-fun array_inv!4953 (array!14710) Bool)

(assert (=> start!28448 (array_inv!4953 a!3312)))

(declare-fun b!291245 () Bool)

(declare-fun res!152628 () Bool)

(assert (=> b!291245 (=> (not res!152628) (not e!184278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14710 (_ BitVec 32)) Bool)

(assert (=> b!291245 (= res!152628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28448 res!152631) b!291238))

(assert (= (and b!291238 res!152633) b!291239))

(assert (= (and b!291239 res!152630) b!291244))

(assert (= (and b!291244 res!152634) b!291242))

(assert (= (and b!291242 res!152635) b!291245))

(assert (= (and b!291245 res!152628) b!291243))

(assert (= (and b!291243 res!152629) b!291241))

(assert (= (and b!291241 res!152632) b!291240))

(declare-fun m!304733 () Bool)

(assert (=> b!291241 m!304733))

(declare-fun m!304735 () Bool)

(assert (=> b!291239 m!304735))

(declare-fun m!304737 () Bool)

(assert (=> b!291245 m!304737))

(declare-fun m!304739 () Bool)

(assert (=> b!291243 m!304739))

(declare-fun m!304741 () Bool)

(assert (=> b!291243 m!304741))

(declare-fun m!304743 () Bool)

(assert (=> b!291243 m!304743))

(declare-fun m!304745 () Bool)

(assert (=> b!291243 m!304745))

(declare-fun m!304747 () Bool)

(assert (=> b!291242 m!304747))

(declare-fun m!304749 () Bool)

(assert (=> b!291244 m!304749))

(declare-fun m!304751 () Bool)

(assert (=> start!28448 m!304751))

(declare-fun m!304753 () Bool)

(assert (=> start!28448 m!304753))

(check-sat (not b!291243) (not b!291242) (not start!28448) (not b!291239) (not b!291244) (not b!291245))
(check-sat)
(get-model)

(declare-fun d!66203 () Bool)

(assert (=> d!66203 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28448 d!66203))

(declare-fun d!66207 () Bool)

(assert (=> d!66207 (= (array_inv!4953 a!3312) (bvsge (size!7334 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28448 d!66207))

(declare-fun d!66209 () Bool)

(declare-fun e!184340 () Bool)

(assert (=> d!66209 e!184340))

(declare-fun c!46885 () Bool)

(declare-fun lt!144024 () SeekEntryResult!2129)

(assert (=> d!66209 (= c!46885 (and ((_ is Intermediate!2129) lt!144024) (undefined!2941 lt!144024)))))

(declare-fun e!184337 () SeekEntryResult!2129)

(assert (=> d!66209 (= lt!144024 e!184337)))

(declare-fun c!46883 () Bool)

(assert (=> d!66209 (= c!46883 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144023 () (_ BitVec 64))

(assert (=> d!66209 (= lt!144023 (select (arr!6981 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312))) lt!143971))))

(assert (=> d!66209 (validMask!0 mask!3809)))

(assert (=> d!66209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143971 k0!2524 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)) mask!3809) lt!144024)))

(declare-fun b!291339 () Bool)

(declare-fun e!184339 () SeekEntryResult!2129)

(assert (=> b!291339 (= e!184339 (Intermediate!2129 false lt!143971 #b00000000000000000000000000000000))))

(declare-fun b!291340 () Bool)

(declare-fun e!184338 () Bool)

(assert (=> b!291340 (= e!184340 e!184338)))

(declare-fun res!152699 () Bool)

(assert (=> b!291340 (= res!152699 (and ((_ is Intermediate!2129) lt!144024) (not (undefined!2941 lt!144024)) (bvslt (x!28891 lt!144024) #b01111111111111111111111111111110) (bvsge (x!28891 lt!144024) #b00000000000000000000000000000000) (bvsge (x!28891 lt!144024) #b00000000000000000000000000000000)))))

(assert (=> b!291340 (=> (not res!152699) (not e!184338))))

(declare-fun b!291341 () Bool)

(assert (=> b!291341 (and (bvsge (index!10688 lt!144024) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144024) (size!7334 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)))))))

(declare-fun res!152700 () Bool)

(assert (=> b!291341 (= res!152700 (= (select (arr!6981 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312))) (index!10688 lt!144024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184341 () Bool)

(assert (=> b!291341 (=> res!152700 e!184341)))

(declare-fun b!291342 () Bool)

(assert (=> b!291342 (and (bvsge (index!10688 lt!144024) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144024) (size!7334 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)))))))

(assert (=> b!291342 (= e!184341 (= (select (arr!6981 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312))) (index!10688 lt!144024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291343 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291343 (= e!184339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143971 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)) mask!3809))))

(declare-fun b!291344 () Bool)

(assert (=> b!291344 (= e!184340 (bvsge (x!28891 lt!144024) #b01111111111111111111111111111110))))

(declare-fun b!291345 () Bool)

(assert (=> b!291345 (= e!184337 e!184339)))

(declare-fun c!46884 () Bool)

(assert (=> b!291345 (= c!46884 (or (= lt!144023 k0!2524) (= (bvadd lt!144023 lt!144023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291346 () Bool)

(assert (=> b!291346 (= e!184337 (Intermediate!2129 true lt!143971 #b00000000000000000000000000000000))))

(declare-fun b!291347 () Bool)

(assert (=> b!291347 (and (bvsge (index!10688 lt!144024) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144024) (size!7334 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312)))))))

(declare-fun res!152701 () Bool)

(assert (=> b!291347 (= res!152701 (= (select (arr!6981 (array!14711 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7334 a!3312))) (index!10688 lt!144024)) k0!2524))))

(assert (=> b!291347 (=> res!152701 e!184341)))

(assert (=> b!291347 (= e!184338 e!184341)))

(assert (= (and d!66209 c!46883) b!291346))

(assert (= (and d!66209 (not c!46883)) b!291345))

(assert (= (and b!291345 c!46884) b!291339))

(assert (= (and b!291345 (not c!46884)) b!291343))

(assert (= (and d!66209 c!46885) b!291344))

(assert (= (and d!66209 (not c!46885)) b!291340))

(assert (= (and b!291340 res!152699) b!291347))

(assert (= (and b!291347 (not res!152701)) b!291341))

(assert (= (and b!291341 (not res!152700)) b!291342))

(declare-fun m!304805 () Bool)

(assert (=> b!291343 m!304805))

(assert (=> b!291343 m!304805))

(declare-fun m!304807 () Bool)

(assert (=> b!291343 m!304807))

(declare-fun m!304811 () Bool)

(assert (=> b!291342 m!304811))

(declare-fun m!304813 () Bool)

(assert (=> d!66209 m!304813))

(assert (=> d!66209 m!304751))

(assert (=> b!291341 m!304811))

(assert (=> b!291347 m!304811))

(assert (=> b!291243 d!66209))

(declare-fun d!66215 () Bool)

(declare-fun e!184350 () Bool)

(assert (=> d!66215 e!184350))

(declare-fun c!46891 () Bool)

(declare-fun lt!144028 () SeekEntryResult!2129)

(assert (=> d!66215 (= c!46891 (and ((_ is Intermediate!2129) lt!144028) (undefined!2941 lt!144028)))))

(declare-fun e!184347 () SeekEntryResult!2129)

(assert (=> d!66215 (= lt!144028 e!184347)))

(declare-fun c!46889 () Bool)

(assert (=> d!66215 (= c!46889 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144027 () (_ BitVec 64))

(assert (=> d!66215 (= lt!144027 (select (arr!6981 a!3312) lt!143971))))

(assert (=> d!66215 (validMask!0 mask!3809)))

(assert (=> d!66215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143971 k0!2524 a!3312 mask!3809) lt!144028)))

(declare-fun b!291357 () Bool)

(declare-fun e!184349 () SeekEntryResult!2129)

(assert (=> b!291357 (= e!184349 (Intermediate!2129 false lt!143971 #b00000000000000000000000000000000))))

(declare-fun b!291358 () Bool)

(declare-fun e!184348 () Bool)

(assert (=> b!291358 (= e!184350 e!184348)))

(declare-fun res!152705 () Bool)

(assert (=> b!291358 (= res!152705 (and ((_ is Intermediate!2129) lt!144028) (not (undefined!2941 lt!144028)) (bvslt (x!28891 lt!144028) #b01111111111111111111111111111110) (bvsge (x!28891 lt!144028) #b00000000000000000000000000000000) (bvsge (x!28891 lt!144028) #b00000000000000000000000000000000)))))

(assert (=> b!291358 (=> (not res!152705) (not e!184348))))

(declare-fun b!291359 () Bool)

(assert (=> b!291359 (and (bvsge (index!10688 lt!144028) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144028) (size!7334 a!3312)))))

(declare-fun res!152706 () Bool)

(assert (=> b!291359 (= res!152706 (= (select (arr!6981 a!3312) (index!10688 lt!144028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184351 () Bool)

(assert (=> b!291359 (=> res!152706 e!184351)))

(declare-fun b!291360 () Bool)

(assert (=> b!291360 (and (bvsge (index!10688 lt!144028) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144028) (size!7334 a!3312)))))

(assert (=> b!291360 (= e!184351 (= (select (arr!6981 a!3312) (index!10688 lt!144028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291361 () Bool)

(assert (=> b!291361 (= e!184349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143971 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291362 () Bool)

(assert (=> b!291362 (= e!184350 (bvsge (x!28891 lt!144028) #b01111111111111111111111111111110))))

(declare-fun b!291363 () Bool)

(assert (=> b!291363 (= e!184347 e!184349)))

(declare-fun c!46890 () Bool)

(assert (=> b!291363 (= c!46890 (or (= lt!144027 k0!2524) (= (bvadd lt!144027 lt!144027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291364 () Bool)

(assert (=> b!291364 (= e!184347 (Intermediate!2129 true lt!143971 #b00000000000000000000000000000000))))

(declare-fun b!291365 () Bool)

(assert (=> b!291365 (and (bvsge (index!10688 lt!144028) #b00000000000000000000000000000000) (bvslt (index!10688 lt!144028) (size!7334 a!3312)))))

(declare-fun res!152707 () Bool)

(assert (=> b!291365 (= res!152707 (= (select (arr!6981 a!3312) (index!10688 lt!144028)) k0!2524))))

(assert (=> b!291365 (=> res!152707 e!184351)))

(assert (=> b!291365 (= e!184348 e!184351)))

(assert (= (and d!66215 c!46889) b!291364))

(assert (= (and d!66215 (not c!46889)) b!291363))

(assert (= (and b!291363 c!46890) b!291357))

(assert (= (and b!291363 (not c!46890)) b!291361))

(assert (= (and d!66215 c!46891) b!291362))

(assert (= (and d!66215 (not c!46891)) b!291358))

(assert (= (and b!291358 res!152705) b!291365))

(assert (= (and b!291365 (not res!152707)) b!291359))

(assert (= (and b!291359 (not res!152706)) b!291360))

(assert (=> b!291361 m!304805))

(assert (=> b!291361 m!304805))

(declare-fun m!304821 () Bool)

(assert (=> b!291361 m!304821))

(declare-fun m!304823 () Bool)

(assert (=> b!291360 m!304823))

(declare-fun m!304825 () Bool)

(assert (=> d!66215 m!304825))

(assert (=> d!66215 m!304751))

(assert (=> b!291359 m!304823))

(assert (=> b!291365 m!304823))

(assert (=> b!291243 d!66215))

(declare-fun d!66219 () Bool)

(declare-fun lt!144044 () (_ BitVec 32))

(declare-fun lt!144043 () (_ BitVec 32))

(assert (=> d!66219 (= lt!144044 (bvmul (bvxor lt!144043 (bvlshr lt!144043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66219 (= lt!144043 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66219 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!152709 (let ((h!5231 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28897 (bvmul (bvxor h!5231 (bvlshr h!5231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28897 (bvlshr x!28897 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!152709 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!152709 #b00000000000000000000000000000000))))))

(assert (=> d!66219 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144044 (bvlshr lt!144044 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291243 d!66219))

(declare-fun d!66221 () Bool)

(declare-fun res!152714 () Bool)

(declare-fun e!184362 () Bool)

(assert (=> d!66221 (=> res!152714 e!184362)))

(assert (=> d!66221 (= res!152714 (= (select (arr!6981 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66221 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184362)))

(declare-fun b!291382 () Bool)

(declare-fun e!184363 () Bool)

(assert (=> b!291382 (= e!184362 e!184363)))

(declare-fun res!152715 () Bool)

(assert (=> b!291382 (=> (not res!152715) (not e!184363))))

(assert (=> b!291382 (= res!152715 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7334 a!3312)))))

(declare-fun b!291383 () Bool)

(assert (=> b!291383 (= e!184363 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66221 (not res!152714)) b!291382))

(assert (= (and b!291382 res!152715) b!291383))

(declare-fun m!304827 () Bool)

(assert (=> d!66221 m!304827))

(declare-fun m!304829 () Bool)

(assert (=> b!291383 m!304829))

(assert (=> b!291244 d!66221))

(declare-fun d!66225 () Bool)

(assert (=> d!66225 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291239 d!66225))

(declare-fun d!66229 () Bool)

(declare-fun res!152721 () Bool)

(declare-fun e!184375 () Bool)

(assert (=> d!66229 (=> res!152721 e!184375)))

(assert (=> d!66229 (= res!152721 (bvsge #b00000000000000000000000000000000 (size!7334 a!3312)))))

(assert (=> d!66229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184375)))

(declare-fun bm!25618 () Bool)

(declare-fun call!25621 () Bool)

(assert (=> bm!25618 (= call!25621 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291398 () Bool)

(declare-fun e!184374 () Bool)

(assert (=> b!291398 (= e!184374 call!25621)))

(declare-fun b!291399 () Bool)

(declare-fun e!184373 () Bool)

(assert (=> b!291399 (= e!184373 call!25621)))

(declare-fun b!291400 () Bool)

(assert (=> b!291400 (= e!184375 e!184373)))

(declare-fun c!46903 () Bool)

(assert (=> b!291400 (= c!46903 (validKeyInArray!0 (select (arr!6981 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!291401 () Bool)

(assert (=> b!291401 (= e!184373 e!184374)))

(declare-fun lt!144056 () (_ BitVec 64))

(assert (=> b!291401 (= lt!144056 (select (arr!6981 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9094 0))(
  ( (Unit!9095) )
))
(declare-fun lt!144057 () Unit!9094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14710 (_ BitVec 64) (_ BitVec 32)) Unit!9094)

(assert (=> b!291401 (= lt!144057 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144056 #b00000000000000000000000000000000))))

(assert (=> b!291401 (arrayContainsKey!0 a!3312 lt!144056 #b00000000000000000000000000000000)))

(declare-fun lt!144058 () Unit!9094)

(assert (=> b!291401 (= lt!144058 lt!144057)))

(declare-fun res!152720 () Bool)

(assert (=> b!291401 (= res!152720 (= (seekEntryOrOpen!0 (select (arr!6981 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2129 #b00000000000000000000000000000000)))))

(assert (=> b!291401 (=> (not res!152720) (not e!184374))))

(assert (= (and d!66229 (not res!152721)) b!291400))

(assert (= (and b!291400 c!46903) b!291401))

(assert (= (and b!291400 (not c!46903)) b!291399))

(assert (= (and b!291401 res!152720) b!291398))

(assert (= (or b!291398 b!291399) bm!25618))

(declare-fun m!304843 () Bool)

(assert (=> bm!25618 m!304843))

(assert (=> b!291400 m!304827))

(assert (=> b!291400 m!304827))

(declare-fun m!304845 () Bool)

(assert (=> b!291400 m!304845))

(assert (=> b!291401 m!304827))

(declare-fun m!304847 () Bool)

(assert (=> b!291401 m!304847))

(declare-fun m!304849 () Bool)

(assert (=> b!291401 m!304849))

(assert (=> b!291401 m!304827))

(declare-fun m!304851 () Bool)

(assert (=> b!291401 m!304851))

(assert (=> b!291245 d!66229))

(declare-fun d!66231 () Bool)

(declare-fun lt!144094 () SeekEntryResult!2129)

(assert (=> d!66231 (and (or ((_ is Undefined!2129) lt!144094) (not ((_ is Found!2129) lt!144094)) (and (bvsge (index!10687 lt!144094) #b00000000000000000000000000000000) (bvslt (index!10687 lt!144094) (size!7334 a!3312)))) (or ((_ is Undefined!2129) lt!144094) ((_ is Found!2129) lt!144094) (not ((_ is MissingZero!2129) lt!144094)) (and (bvsge (index!10686 lt!144094) #b00000000000000000000000000000000) (bvslt (index!10686 lt!144094) (size!7334 a!3312)))) (or ((_ is Undefined!2129) lt!144094) ((_ is Found!2129) lt!144094) ((_ is MissingZero!2129) lt!144094) (not ((_ is MissingVacant!2129) lt!144094)) (and (bvsge (index!10689 lt!144094) #b00000000000000000000000000000000) (bvslt (index!10689 lt!144094) (size!7334 a!3312)))) (or ((_ is Undefined!2129) lt!144094) (ite ((_ is Found!2129) lt!144094) (= (select (arr!6981 a!3312) (index!10687 lt!144094)) k0!2524) (ite ((_ is MissingZero!2129) lt!144094) (= (select (arr!6981 a!3312) (index!10686 lt!144094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2129) lt!144094) (= (select (arr!6981 a!3312) (index!10689 lt!144094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!184421 () SeekEntryResult!2129)

(assert (=> d!66231 (= lt!144094 e!184421)))

(declare-fun c!46927 () Bool)

(declare-fun lt!144093 () SeekEntryResult!2129)

(assert (=> d!66231 (= c!46927 (and ((_ is Intermediate!2129) lt!144093) (undefined!2941 lt!144093)))))

(assert (=> d!66231 (= lt!144093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66231 (validMask!0 mask!3809)))

(assert (=> d!66231 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144094)))

(declare-fun b!291466 () Bool)

(declare-fun c!46925 () Bool)

(declare-fun lt!144092 () (_ BitVec 64))

(assert (=> b!291466 (= c!46925 (= lt!144092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184419 () SeekEntryResult!2129)

(declare-fun e!184420 () SeekEntryResult!2129)

(assert (=> b!291466 (= e!184419 e!184420)))

(declare-fun b!291467 () Bool)

(assert (=> b!291467 (= e!184420 (MissingZero!2129 (index!10688 lt!144093)))))

(declare-fun b!291468 () Bool)

(assert (=> b!291468 (= e!184421 e!184419)))

(assert (=> b!291468 (= lt!144092 (select (arr!6981 a!3312) (index!10688 lt!144093)))))

(declare-fun c!46926 () Bool)

(assert (=> b!291468 (= c!46926 (= lt!144092 k0!2524))))

(declare-fun b!291469 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14710 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!291469 (= e!184420 (seekKeyOrZeroReturnVacant!0 (x!28891 lt!144093) (index!10688 lt!144093) (index!10688 lt!144093) k0!2524 a!3312 mask!3809))))

(declare-fun b!291470 () Bool)

(assert (=> b!291470 (= e!184419 (Found!2129 (index!10688 lt!144093)))))

(declare-fun b!291471 () Bool)

(assert (=> b!291471 (= e!184421 Undefined!2129)))

(assert (= (and d!66231 c!46927) b!291471))

(assert (= (and d!66231 (not c!46927)) b!291468))

(assert (= (and b!291468 c!46926) b!291470))

(assert (= (and b!291468 (not c!46926)) b!291466))

(assert (= (and b!291466 c!46925) b!291467))

(assert (= (and b!291466 (not c!46925)) b!291469))

(declare-fun m!304891 () Bool)

(assert (=> d!66231 m!304891))

(assert (=> d!66231 m!304751))

(assert (=> d!66231 m!304745))

(declare-fun m!304893 () Bool)

(assert (=> d!66231 m!304893))

(assert (=> d!66231 m!304745))

(declare-fun m!304895 () Bool)

(assert (=> d!66231 m!304895))

(declare-fun m!304897 () Bool)

(assert (=> d!66231 m!304897))

(declare-fun m!304899 () Bool)

(assert (=> b!291468 m!304899))

(declare-fun m!304901 () Bool)

(assert (=> b!291469 m!304901))

(assert (=> b!291242 d!66231))

(check-sat (not d!66209) (not d!66215) (not b!291361) (not b!291400) (not b!291383) (not b!291469) (not d!66231) (not b!291343) (not bm!25618) (not b!291401))
(check-sat)
