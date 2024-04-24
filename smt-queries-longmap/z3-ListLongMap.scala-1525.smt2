; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28672 () Bool)

(assert start!28672)

(declare-fun b!293192 () Bool)

(declare-fun e!185402 () Bool)

(declare-fun lt!145356 () Bool)

(declare-datatypes ((SeekEntryResult!2165 0))(
  ( (MissingZero!2165 (index!10830 (_ BitVec 32))) (Found!2165 (index!10831 (_ BitVec 32))) (Intermediate!2165 (undefined!2977 Bool) (index!10832 (_ BitVec 32)) (x!29116 (_ BitVec 32))) (Undefined!2165) (MissingVacant!2165 (index!10833 (_ BitVec 32))) )
))
(declare-fun lt!145359 () SeekEntryResult!2165)

(get-info :version)

(assert (=> b!293192 (= e!185402 (and lt!145356 ((_ is Intermediate!2165) lt!145359) (undefined!2977 lt!145359)))))

(declare-fun lt!145357 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145358 () SeekEntryResult!2165)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14856 0))(
  ( (array!14857 (arr!7051 (Array (_ BitVec 32) (_ BitVec 64))) (size!7403 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14856 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!293192 (= lt!145358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145357 k0!2524 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809))))

(assert (=> b!293192 (= lt!145359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145357 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293192 (= lt!145357 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!293193 () Bool)

(declare-fun res!154226 () Bool)

(assert (=> b!293193 (=> (not res!154226) (not e!185402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14856 (_ BitVec 32)) Bool)

(assert (=> b!293193 (= res!154226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293194 () Bool)

(declare-fun res!154227 () Bool)

(declare-fun e!185401 () Bool)

(assert (=> b!293194 (=> (not res!154227) (not e!185401))))

(assert (=> b!293194 (= res!154227 (and (= (size!7403 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7403 a!3312))))))

(declare-fun res!154225 () Bool)

(assert (=> start!28672 (=> (not res!154225) (not e!185401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28672 (= res!154225 (validMask!0 mask!3809))))

(assert (=> start!28672 e!185401))

(assert (=> start!28672 true))

(declare-fun array_inv!5001 (array!14856) Bool)

(assert (=> start!28672 (array_inv!5001 a!3312)))

(declare-fun b!293195 () Bool)

(declare-fun res!154223 () Bool)

(assert (=> b!293195 (=> (not res!154223) (not e!185401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293195 (= res!154223 (validKeyInArray!0 k0!2524))))

(declare-fun b!293196 () Bool)

(declare-fun res!154222 () Bool)

(assert (=> b!293196 (=> (not res!154222) (not e!185401))))

(declare-fun arrayContainsKey!0 (array!14856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293196 (= res!154222 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293197 () Bool)

(assert (=> b!293197 (= e!185401 e!185402)))

(declare-fun res!154224 () Bool)

(assert (=> b!293197 (=> (not res!154224) (not e!185402))))

(declare-fun lt!145355 () SeekEntryResult!2165)

(assert (=> b!293197 (= res!154224 (or lt!145356 (= lt!145355 (MissingVacant!2165 i!1256))))))

(assert (=> b!293197 (= lt!145356 (= lt!145355 (MissingZero!2165 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14856 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!293197 (= lt!145355 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28672 res!154225) b!293194))

(assert (= (and b!293194 res!154227) b!293195))

(assert (= (and b!293195 res!154223) b!293196))

(assert (= (and b!293196 res!154222) b!293197))

(assert (= (and b!293197 res!154224) b!293193))

(assert (= (and b!293193 res!154226) b!293192))

(declare-fun m!307151 () Bool)

(assert (=> start!28672 m!307151))

(declare-fun m!307153 () Bool)

(assert (=> start!28672 m!307153))

(declare-fun m!307155 () Bool)

(assert (=> b!293193 m!307155))

(declare-fun m!307157 () Bool)

(assert (=> b!293197 m!307157))

(declare-fun m!307159 () Bool)

(assert (=> b!293196 m!307159))

(declare-fun m!307161 () Bool)

(assert (=> b!293195 m!307161))

(declare-fun m!307163 () Bool)

(assert (=> b!293192 m!307163))

(declare-fun m!307165 () Bool)

(assert (=> b!293192 m!307165))

(declare-fun m!307167 () Bool)

(assert (=> b!293192 m!307167))

(declare-fun m!307169 () Bool)

(assert (=> b!293192 m!307169))

(check-sat (not b!293192) (not b!293197) (not b!293196) (not start!28672) (not b!293193) (not b!293195))
(check-sat)
(get-model)

(declare-fun b!293252 () Bool)

(declare-fun e!185434 () Bool)

(declare-fun lt!145395 () SeekEntryResult!2165)

(assert (=> b!293252 (= e!185434 (bvsge (x!29116 lt!145395) #b01111111111111111111111111111110))))

(declare-fun b!293253 () Bool)

(declare-fun e!185431 () SeekEntryResult!2165)

(assert (=> b!293253 (= e!185431 (Intermediate!2165 true lt!145357 #b00000000000000000000000000000000))))

(declare-fun b!293254 () Bool)

(declare-fun e!185432 () SeekEntryResult!2165)

(assert (=> b!293254 (= e!185431 e!185432)))

(declare-fun c!47058 () Bool)

(declare-fun lt!145394 () (_ BitVec 64))

(assert (=> b!293254 (= c!47058 (or (= lt!145394 k0!2524) (= (bvadd lt!145394 lt!145394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66573 () Bool)

(assert (=> d!66573 e!185434))

(declare-fun c!47057 () Bool)

(assert (=> d!66573 (= c!47057 (and ((_ is Intermediate!2165) lt!145395) (undefined!2977 lt!145395)))))

(assert (=> d!66573 (= lt!145395 e!185431)))

(declare-fun c!47059 () Bool)

(assert (=> d!66573 (= c!47059 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66573 (= lt!145394 (select (arr!7051 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312))) lt!145357))))

(assert (=> d!66573 (validMask!0 mask!3809)))

(assert (=> d!66573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145357 k0!2524 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809) lt!145395)))

(declare-fun b!293255 () Bool)

(declare-fun e!185435 () Bool)

(assert (=> b!293255 (= e!185434 e!185435)))

(declare-fun res!154270 () Bool)

(assert (=> b!293255 (= res!154270 (and ((_ is Intermediate!2165) lt!145395) (not (undefined!2977 lt!145395)) (bvslt (x!29116 lt!145395) #b01111111111111111111111111111110) (bvsge (x!29116 lt!145395) #b00000000000000000000000000000000) (bvsge (x!29116 lt!145395) #b00000000000000000000000000000000)))))

(assert (=> b!293255 (=> (not res!154270) (not e!185435))))

(declare-fun b!293256 () Bool)

(assert (=> b!293256 (= e!185432 (Intermediate!2165 false lt!145357 #b00000000000000000000000000000000))))

(declare-fun b!293257 () Bool)

(assert (=> b!293257 (and (bvsge (index!10832 lt!145395) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145395) (size!7403 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(declare-fun res!154271 () Bool)

(assert (=> b!293257 (= res!154271 (= (select (arr!7051 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10832 lt!145395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185433 () Bool)

(assert (=> b!293257 (=> res!154271 e!185433)))

(declare-fun b!293258 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293258 (= e!185432 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809))))

(declare-fun b!293259 () Bool)

(assert (=> b!293259 (and (bvsge (index!10832 lt!145395) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145395) (size!7403 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(assert (=> b!293259 (= e!185433 (= (select (arr!7051 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10832 lt!145395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293260 () Bool)

(assert (=> b!293260 (and (bvsge (index!10832 lt!145395) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145395) (size!7403 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(declare-fun res!154272 () Bool)

(assert (=> b!293260 (= res!154272 (= (select (arr!7051 (array!14857 (store (arr!7051 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10832 lt!145395)) k0!2524))))

(assert (=> b!293260 (=> res!154272 e!185433)))

(assert (=> b!293260 (= e!185435 e!185433)))

(assert (= (and d!66573 c!47059) b!293253))

(assert (= (and d!66573 (not c!47059)) b!293254))

(assert (= (and b!293254 c!47058) b!293256))

(assert (= (and b!293254 (not c!47058)) b!293258))

(assert (= (and d!66573 c!47057) b!293252))

(assert (= (and d!66573 (not c!47057)) b!293255))

(assert (= (and b!293255 res!154270) b!293260))

(assert (= (and b!293260 (not res!154272)) b!293257))

(assert (= (and b!293257 (not res!154271)) b!293259))

(declare-fun m!307211 () Bool)

(assert (=> b!293258 m!307211))

(assert (=> b!293258 m!307211))

(declare-fun m!307213 () Bool)

(assert (=> b!293258 m!307213))

(declare-fun m!307215 () Bool)

(assert (=> b!293257 m!307215))

(assert (=> b!293259 m!307215))

(assert (=> b!293260 m!307215))

(declare-fun m!307217 () Bool)

(assert (=> d!66573 m!307217))

(assert (=> d!66573 m!307151))

(assert (=> b!293192 d!66573))

(declare-fun b!293273 () Bool)

(declare-fun e!185445 () Bool)

(declare-fun lt!145403 () SeekEntryResult!2165)

(assert (=> b!293273 (= e!185445 (bvsge (x!29116 lt!145403) #b01111111111111111111111111111110))))

(declare-fun b!293274 () Bool)

(declare-fun e!185442 () SeekEntryResult!2165)

(assert (=> b!293274 (= e!185442 (Intermediate!2165 true lt!145357 #b00000000000000000000000000000000))))

(declare-fun b!293275 () Bool)

(declare-fun e!185443 () SeekEntryResult!2165)

(assert (=> b!293275 (= e!185442 e!185443)))

(declare-fun c!47067 () Bool)

(declare-fun lt!145402 () (_ BitVec 64))

(assert (=> b!293275 (= c!47067 (or (= lt!145402 k0!2524) (= (bvadd lt!145402 lt!145402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66583 () Bool)

(assert (=> d!66583 e!185445))

(declare-fun c!47066 () Bool)

(assert (=> d!66583 (= c!47066 (and ((_ is Intermediate!2165) lt!145403) (undefined!2977 lt!145403)))))

(assert (=> d!66583 (= lt!145403 e!185442)))

(declare-fun c!47068 () Bool)

(assert (=> d!66583 (= c!47068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66583 (= lt!145402 (select (arr!7051 a!3312) lt!145357))))

(assert (=> d!66583 (validMask!0 mask!3809)))

(assert (=> d!66583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145357 k0!2524 a!3312 mask!3809) lt!145403)))

(declare-fun b!293276 () Bool)

(declare-fun e!185446 () Bool)

(assert (=> b!293276 (= e!185445 e!185446)))

(declare-fun res!154273 () Bool)

(assert (=> b!293276 (= res!154273 (and ((_ is Intermediate!2165) lt!145403) (not (undefined!2977 lt!145403)) (bvslt (x!29116 lt!145403) #b01111111111111111111111111111110) (bvsge (x!29116 lt!145403) #b00000000000000000000000000000000) (bvsge (x!29116 lt!145403) #b00000000000000000000000000000000)))))

(assert (=> b!293276 (=> (not res!154273) (not e!185446))))

(declare-fun b!293277 () Bool)

(assert (=> b!293277 (= e!185443 (Intermediate!2165 false lt!145357 #b00000000000000000000000000000000))))

(declare-fun b!293278 () Bool)

(assert (=> b!293278 (and (bvsge (index!10832 lt!145403) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145403) (size!7403 a!3312)))))

(declare-fun res!154274 () Bool)

(assert (=> b!293278 (= res!154274 (= (select (arr!7051 a!3312) (index!10832 lt!145403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185444 () Bool)

(assert (=> b!293278 (=> res!154274 e!185444)))

(declare-fun b!293279 () Bool)

(assert (=> b!293279 (= e!185443 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293280 () Bool)

(assert (=> b!293280 (and (bvsge (index!10832 lt!145403) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145403) (size!7403 a!3312)))))

(assert (=> b!293280 (= e!185444 (= (select (arr!7051 a!3312) (index!10832 lt!145403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293281 () Bool)

(assert (=> b!293281 (and (bvsge (index!10832 lt!145403) #b00000000000000000000000000000000) (bvslt (index!10832 lt!145403) (size!7403 a!3312)))))

(declare-fun res!154275 () Bool)

(assert (=> b!293281 (= res!154275 (= (select (arr!7051 a!3312) (index!10832 lt!145403)) k0!2524))))

(assert (=> b!293281 (=> res!154275 e!185444)))

(assert (=> b!293281 (= e!185446 e!185444)))

(assert (= (and d!66583 c!47068) b!293274))

(assert (= (and d!66583 (not c!47068)) b!293275))

(assert (= (and b!293275 c!47067) b!293277))

(assert (= (and b!293275 (not c!47067)) b!293279))

(assert (= (and d!66583 c!47066) b!293273))

(assert (= (and d!66583 (not c!47066)) b!293276))

(assert (= (and b!293276 res!154273) b!293281))

(assert (= (and b!293281 (not res!154275)) b!293278))

(assert (= (and b!293278 (not res!154274)) b!293280))

(assert (=> b!293279 m!307211))

(assert (=> b!293279 m!307211))

(declare-fun m!307219 () Bool)

(assert (=> b!293279 m!307219))

(declare-fun m!307221 () Bool)

(assert (=> b!293278 m!307221))

(assert (=> b!293280 m!307221))

(assert (=> b!293281 m!307221))

(declare-fun m!307223 () Bool)

(assert (=> d!66583 m!307223))

(assert (=> d!66583 m!307151))

(assert (=> b!293192 d!66583))

(declare-fun d!66589 () Bool)

(declare-fun lt!145412 () (_ BitVec 32))

(declare-fun lt!145411 () (_ BitVec 32))

(assert (=> d!66589 (= lt!145412 (bvmul (bvxor lt!145411 (bvlshr lt!145411 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66589 (= lt!145411 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66589 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154280 (let ((h!5180 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29120 (bvmul (bvxor h!5180 (bvlshr h!5180 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29120 (bvlshr x!29120 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154280 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154280 #b00000000000000000000000000000000))))))

(assert (=> d!66589 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145412 (bvlshr lt!145412 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293192 d!66589))

(declare-fun b!293362 () Bool)

(declare-fun e!185497 () SeekEntryResult!2165)

(declare-fun e!185495 () SeekEntryResult!2165)

(assert (=> b!293362 (= e!185497 e!185495)))

(declare-fun lt!145441 () (_ BitVec 64))

(declare-fun lt!145440 () SeekEntryResult!2165)

(assert (=> b!293362 (= lt!145441 (select (arr!7051 a!3312) (index!10832 lt!145440)))))

(declare-fun c!47098 () Bool)

(assert (=> b!293362 (= c!47098 (= lt!145441 k0!2524))))

(declare-fun b!293363 () Bool)

(assert (=> b!293363 (= e!185495 (Found!2165 (index!10832 lt!145440)))))

(declare-fun e!185496 () SeekEntryResult!2165)

(declare-fun b!293364 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14856 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!293364 (= e!185496 (seekKeyOrZeroReturnVacant!0 (x!29116 lt!145440) (index!10832 lt!145440) (index!10832 lt!145440) k0!2524 a!3312 mask!3809))))

(declare-fun d!66595 () Bool)

(declare-fun lt!145442 () SeekEntryResult!2165)

(assert (=> d!66595 (and (or ((_ is Undefined!2165) lt!145442) (not ((_ is Found!2165) lt!145442)) (and (bvsge (index!10831 lt!145442) #b00000000000000000000000000000000) (bvslt (index!10831 lt!145442) (size!7403 a!3312)))) (or ((_ is Undefined!2165) lt!145442) ((_ is Found!2165) lt!145442) (not ((_ is MissingZero!2165) lt!145442)) (and (bvsge (index!10830 lt!145442) #b00000000000000000000000000000000) (bvslt (index!10830 lt!145442) (size!7403 a!3312)))) (or ((_ is Undefined!2165) lt!145442) ((_ is Found!2165) lt!145442) ((_ is MissingZero!2165) lt!145442) (not ((_ is MissingVacant!2165) lt!145442)) (and (bvsge (index!10833 lt!145442) #b00000000000000000000000000000000) (bvslt (index!10833 lt!145442) (size!7403 a!3312)))) (or ((_ is Undefined!2165) lt!145442) (ite ((_ is Found!2165) lt!145442) (= (select (arr!7051 a!3312) (index!10831 lt!145442)) k0!2524) (ite ((_ is MissingZero!2165) lt!145442) (= (select (arr!7051 a!3312) (index!10830 lt!145442)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2165) lt!145442) (= (select (arr!7051 a!3312) (index!10833 lt!145442)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66595 (= lt!145442 e!185497)))

(declare-fun c!47099 () Bool)

(assert (=> d!66595 (= c!47099 (and ((_ is Intermediate!2165) lt!145440) (undefined!2977 lt!145440)))))

(assert (=> d!66595 (= lt!145440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66595 (validMask!0 mask!3809)))

(assert (=> d!66595 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145442)))

(declare-fun b!293365 () Bool)

(declare-fun c!47097 () Bool)

(assert (=> b!293365 (= c!47097 (= lt!145441 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293365 (= e!185495 e!185496)))

(declare-fun b!293366 () Bool)

(assert (=> b!293366 (= e!185496 (MissingZero!2165 (index!10832 lt!145440)))))

(declare-fun b!293367 () Bool)

(assert (=> b!293367 (= e!185497 Undefined!2165)))

(assert (= (and d!66595 c!47099) b!293367))

(assert (= (and d!66595 (not c!47099)) b!293362))

(assert (= (and b!293362 c!47098) b!293363))

(assert (= (and b!293362 (not c!47098)) b!293365))

(assert (= (and b!293365 c!47097) b!293366))

(assert (= (and b!293365 (not c!47097)) b!293364))

(declare-fun m!307267 () Bool)

(assert (=> b!293362 m!307267))

(declare-fun m!307269 () Bool)

(assert (=> b!293364 m!307269))

(declare-fun m!307271 () Bool)

(assert (=> d!66595 m!307271))

(declare-fun m!307273 () Bool)

(assert (=> d!66595 m!307273))

(assert (=> d!66595 m!307169))

(assert (=> d!66595 m!307169))

(declare-fun m!307275 () Bool)

(assert (=> d!66595 m!307275))

(assert (=> d!66595 m!307151))

(declare-fun m!307277 () Bool)

(assert (=> d!66595 m!307277))

(assert (=> b!293197 d!66595))

(declare-fun d!66603 () Bool)

(assert (=> d!66603 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293195 d!66603))

(declare-fun d!66607 () Bool)

(declare-fun res!154312 () Bool)

(declare-fun e!185508 () Bool)

(assert (=> d!66607 (=> res!154312 e!185508)))

(assert (=> d!66607 (= res!154312 (= (select (arr!7051 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66607 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185508)))

(declare-fun b!293382 () Bool)

(declare-fun e!185509 () Bool)

(assert (=> b!293382 (= e!185508 e!185509)))

(declare-fun res!154313 () Bool)

(assert (=> b!293382 (=> (not res!154313) (not e!185509))))

(assert (=> b!293382 (= res!154313 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7403 a!3312)))))

(declare-fun b!293383 () Bool)

(assert (=> b!293383 (= e!185509 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66607 (not res!154312)) b!293382))

(assert (= (and b!293382 res!154313) b!293383))

(declare-fun m!307279 () Bool)

(assert (=> d!66607 m!307279))

(declare-fun m!307281 () Bool)

(assert (=> b!293383 m!307281))

(assert (=> b!293196 d!66607))

(declare-fun d!66609 () Bool)

(assert (=> d!66609 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28672 d!66609))

(declare-fun d!66621 () Bool)

(assert (=> d!66621 (= (array_inv!5001 a!3312) (bvsge (size!7403 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28672 d!66621))

(declare-fun b!293440 () Bool)

(declare-fun e!185549 () Bool)

(declare-fun e!185548 () Bool)

(assert (=> b!293440 (= e!185549 e!185548)))

(declare-fun c!47119 () Bool)

(assert (=> b!293440 (= c!47119 (validKeyInArray!0 (select (arr!7051 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66623 () Bool)

(declare-fun res!154338 () Bool)

(assert (=> d!66623 (=> res!154338 e!185549)))

(assert (=> d!66623 (= res!154338 (bvsge #b00000000000000000000000000000000 (size!7403 a!3312)))))

(assert (=> d!66623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185549)))

(declare-fun b!293441 () Bool)

(declare-fun e!185547 () Bool)

(assert (=> b!293441 (= e!185548 e!185547)))

(declare-fun lt!145481 () (_ BitVec 64))

(assert (=> b!293441 (= lt!145481 (select (arr!7051 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9152 0))(
  ( (Unit!9153) )
))
(declare-fun lt!145482 () Unit!9152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14856 (_ BitVec 64) (_ BitVec 32)) Unit!9152)

(assert (=> b!293441 (= lt!145482 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145481 #b00000000000000000000000000000000))))

(assert (=> b!293441 (arrayContainsKey!0 a!3312 lt!145481 #b00000000000000000000000000000000)))

(declare-fun lt!145480 () Unit!9152)

(assert (=> b!293441 (= lt!145480 lt!145482)))

(declare-fun res!154337 () Bool)

(assert (=> b!293441 (= res!154337 (= (seekEntryOrOpen!0 (select (arr!7051 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2165 #b00000000000000000000000000000000)))))

(assert (=> b!293441 (=> (not res!154337) (not e!185547))))

(declare-fun bm!25654 () Bool)

(declare-fun call!25657 () Bool)

(assert (=> bm!25654 (= call!25657 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293442 () Bool)

(assert (=> b!293442 (= e!185547 call!25657)))

(declare-fun b!293443 () Bool)

(assert (=> b!293443 (= e!185548 call!25657)))

(assert (= (and d!66623 (not res!154338)) b!293440))

(assert (= (and b!293440 c!47119) b!293441))

(assert (= (and b!293440 (not c!47119)) b!293443))

(assert (= (and b!293441 res!154337) b!293442))

(assert (= (or b!293442 b!293443) bm!25654))

(assert (=> b!293440 m!307279))

(assert (=> b!293440 m!307279))

(declare-fun m!307309 () Bool)

(assert (=> b!293440 m!307309))

(assert (=> b!293441 m!307279))

(declare-fun m!307311 () Bool)

(assert (=> b!293441 m!307311))

(declare-fun m!307313 () Bool)

(assert (=> b!293441 m!307313))

(assert (=> b!293441 m!307279))

(declare-fun m!307315 () Bool)

(assert (=> b!293441 m!307315))

(declare-fun m!307317 () Bool)

(assert (=> bm!25654 m!307317))

(assert (=> b!293193 d!66623))

(check-sat (not b!293441) (not d!66583) (not d!66573) (not b!293383) (not bm!25654) (not b!293440) (not b!293364) (not b!293258) (not d!66595) (not b!293279))
(check-sat)
