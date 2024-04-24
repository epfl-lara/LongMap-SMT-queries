; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29014 () Bool)

(assert start!29014)

(declare-fun b!294989 () Bool)

(declare-fun res!155046 () Bool)

(declare-fun e!186458 () Bool)

(assert (=> b!294989 (=> (not res!155046) (not e!186458))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294989 (= res!155046 (validKeyInArray!0 k0!2524))))

(declare-fun b!294990 () Bool)

(declare-fun res!155042 () Bool)

(assert (=> b!294990 (=> (not res!155042) (not e!186458))))

(declare-datatypes ((array!14910 0))(
  ( (array!14911 (arr!7069 (Array (_ BitVec 32) (_ BitVec 64))) (size!7421 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14910)

(declare-fun arrayContainsKey!0 (array!14910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294990 (= res!155042 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294991 () Bool)

(declare-fun res!155044 () Bool)

(declare-fun e!186456 () Bool)

(assert (=> b!294991 (=> (not res!155044) (not e!186456))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14910 (_ BitVec 32)) Bool)

(assert (=> b!294991 (= res!155044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294992 () Bool)

(assert (=> b!294992 (= e!186458 e!186456)))

(declare-fun res!155041 () Bool)

(assert (=> b!294992 (=> (not res!155041) (not e!186456))))

(declare-fun lt!146277 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2183 0))(
  ( (MissingZero!2183 (index!10902 (_ BitVec 32))) (Found!2183 (index!10903 (_ BitVec 32))) (Intermediate!2183 (undefined!2995 Bool) (index!10904 (_ BitVec 32)) (x!29224 (_ BitVec 32))) (Undefined!2183) (MissingVacant!2183 (index!10905 (_ BitVec 32))) )
))
(declare-fun lt!146273 () SeekEntryResult!2183)

(assert (=> b!294992 (= res!155041 (or lt!146277 (= lt!146273 (MissingVacant!2183 i!1256))))))

(assert (=> b!294992 (= lt!146277 (= lt!146273 (MissingZero!2183 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14910 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!294992 (= lt!146273 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155045 () Bool)

(assert (=> start!29014 (=> (not res!155045) (not e!186458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29014 (= res!155045 (validMask!0 mask!3809))))

(assert (=> start!29014 e!186458))

(assert (=> start!29014 true))

(declare-fun array_inv!5019 (array!14910) Bool)

(assert (=> start!29014 (array_inv!5019 a!3312)))

(declare-fun b!294993 () Bool)

(declare-fun res!155043 () Bool)

(assert (=> b!294993 (=> (not res!155043) (not e!186458))))

(assert (=> b!294993 (= res!155043 (and (= (size!7421 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7421 a!3312))))))

(declare-fun b!294994 () Bool)

(declare-fun lt!146274 () SeekEntryResult!2183)

(get-info :version)

(assert (=> b!294994 (= e!186456 (and lt!146277 (let ((bdg!6247 (not ((_ is Intermediate!2183) lt!146274)))) (and (or bdg!6247 (not (undefined!2995 lt!146274))) (or bdg!6247 (not (= (select (arr!7069 a!3312) (index!10904 lt!146274)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6247 (not (= (select (arr!7069 a!3312) (index!10904 lt!146274)) k0!2524))) (not bdg!6247) (not (= (select (arr!7069 a!3312) (index!10904 lt!146274)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!146276 () (_ BitVec 32))

(declare-fun lt!146275 () SeekEntryResult!2183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14910 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!294994 (= lt!146275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146276 k0!2524 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809))))

(assert (=> b!294994 (= lt!146274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146276 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294994 (= lt!146276 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29014 res!155045) b!294993))

(assert (= (and b!294993 res!155043) b!294989))

(assert (= (and b!294989 res!155046) b!294990))

(assert (= (and b!294990 res!155042) b!294992))

(assert (= (and b!294992 res!155041) b!294991))

(assert (= (and b!294991 res!155044) b!294994))

(declare-fun m!308447 () Bool)

(assert (=> b!294990 m!308447))

(declare-fun m!308449 () Bool)

(assert (=> b!294991 m!308449))

(declare-fun m!308451 () Bool)

(assert (=> b!294989 m!308451))

(declare-fun m!308453 () Bool)

(assert (=> start!29014 m!308453))

(declare-fun m!308455 () Bool)

(assert (=> start!29014 m!308455))

(declare-fun m!308457 () Bool)

(assert (=> b!294994 m!308457))

(declare-fun m!308459 () Bool)

(assert (=> b!294994 m!308459))

(declare-fun m!308461 () Bool)

(assert (=> b!294994 m!308461))

(declare-fun m!308463 () Bool)

(assert (=> b!294994 m!308463))

(declare-fun m!308465 () Bool)

(assert (=> b!294994 m!308465))

(declare-fun m!308467 () Bool)

(assert (=> b!294992 m!308467))

(check-sat (not b!294990) (not b!294994) (not b!294992) (not b!294989) (not b!294991) (not start!29014))
(check-sat)
(get-model)

(declare-fun d!66975 () Bool)

(assert (=> d!66975 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294989 d!66975))

(declare-fun b!295049 () Bool)

(declare-fun e!186491 () Bool)

(declare-fun e!186490 () Bool)

(assert (=> b!295049 (= e!186491 e!186490)))

(declare-fun res!155090 () Bool)

(declare-fun lt!146312 () SeekEntryResult!2183)

(assert (=> b!295049 (= res!155090 (and ((_ is Intermediate!2183) lt!146312) (not (undefined!2995 lt!146312)) (bvslt (x!29224 lt!146312) #b01111111111111111111111111111110) (bvsge (x!29224 lt!146312) #b00000000000000000000000000000000) (bvsge (x!29224 lt!146312) #b00000000000000000000000000000000)))))

(assert (=> b!295049 (=> (not res!155090) (not e!186490))))

(declare-fun b!295050 () Bool)

(assert (=> b!295050 (and (bvsge (index!10904 lt!146312) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146312) (size!7421 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(declare-fun e!186488 () Bool)

(assert (=> b!295050 (= e!186488 (= (select (arr!7069 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!10904 lt!146312)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66977 () Bool)

(assert (=> d!66977 e!186491))

(declare-fun c!47557 () Bool)

(assert (=> d!66977 (= c!47557 (and ((_ is Intermediate!2183) lt!146312) (undefined!2995 lt!146312)))))

(declare-fun e!186489 () SeekEntryResult!2183)

(assert (=> d!66977 (= lt!146312 e!186489)))

(declare-fun c!47555 () Bool)

(assert (=> d!66977 (= c!47555 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146313 () (_ BitVec 64))

(assert (=> d!66977 (= lt!146313 (select (arr!7069 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312))) lt!146276))))

(assert (=> d!66977 (validMask!0 mask!3809)))

(assert (=> d!66977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146276 k0!2524 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809) lt!146312)))

(declare-fun b!295051 () Bool)

(assert (=> b!295051 (and (bvsge (index!10904 lt!146312) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146312) (size!7421 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(declare-fun res!155091 () Bool)

(assert (=> b!295051 (= res!155091 (= (select (arr!7069 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!10904 lt!146312)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295051 (=> res!155091 e!186488)))

(declare-fun b!295052 () Bool)

(assert (=> b!295052 (= e!186491 (bvsge (x!29224 lt!146312) #b01111111111111111111111111111110))))

(declare-fun b!295053 () Bool)

(declare-fun e!186487 () SeekEntryResult!2183)

(assert (=> b!295053 (= e!186489 e!186487)))

(declare-fun c!47556 () Bool)

(assert (=> b!295053 (= c!47556 (or (= lt!146313 k0!2524) (= (bvadd lt!146313 lt!146313) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295054 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295054 (= e!186487 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809))))

(declare-fun b!295055 () Bool)

(assert (=> b!295055 (= e!186487 (Intermediate!2183 false lt!146276 #b00000000000000000000000000000000))))

(declare-fun b!295056 () Bool)

(assert (=> b!295056 (= e!186489 (Intermediate!2183 true lt!146276 #b00000000000000000000000000000000))))

(declare-fun b!295057 () Bool)

(assert (=> b!295057 (and (bvsge (index!10904 lt!146312) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146312) (size!7421 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(declare-fun res!155089 () Bool)

(assert (=> b!295057 (= res!155089 (= (select (arr!7069 (array!14911 (store (arr!7069 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!10904 lt!146312)) k0!2524))))

(assert (=> b!295057 (=> res!155089 e!186488)))

(assert (=> b!295057 (= e!186490 e!186488)))

(assert (= (and d!66977 c!47555) b!295056))

(assert (= (and d!66977 (not c!47555)) b!295053))

(assert (= (and b!295053 c!47556) b!295055))

(assert (= (and b!295053 (not c!47556)) b!295054))

(assert (= (and d!66977 c!47557) b!295052))

(assert (= (and d!66977 (not c!47557)) b!295049))

(assert (= (and b!295049 res!155090) b!295057))

(assert (= (and b!295057 (not res!155089)) b!295051))

(assert (= (and b!295051 (not res!155091)) b!295050))

(declare-fun m!308513 () Bool)

(assert (=> b!295050 m!308513))

(declare-fun m!308515 () Bool)

(assert (=> b!295054 m!308515))

(assert (=> b!295054 m!308515))

(declare-fun m!308517 () Bool)

(assert (=> b!295054 m!308517))

(assert (=> b!295051 m!308513))

(assert (=> b!295057 m!308513))

(declare-fun m!308519 () Bool)

(assert (=> d!66977 m!308519))

(assert (=> d!66977 m!308453))

(assert (=> b!294994 d!66977))

(declare-fun b!295058 () Bool)

(declare-fun e!186496 () Bool)

(declare-fun e!186495 () Bool)

(assert (=> b!295058 (= e!186496 e!186495)))

(declare-fun res!155093 () Bool)

(declare-fun lt!146314 () SeekEntryResult!2183)

(assert (=> b!295058 (= res!155093 (and ((_ is Intermediate!2183) lt!146314) (not (undefined!2995 lt!146314)) (bvslt (x!29224 lt!146314) #b01111111111111111111111111111110) (bvsge (x!29224 lt!146314) #b00000000000000000000000000000000) (bvsge (x!29224 lt!146314) #b00000000000000000000000000000000)))))

(assert (=> b!295058 (=> (not res!155093) (not e!186495))))

(declare-fun b!295059 () Bool)

(assert (=> b!295059 (and (bvsge (index!10904 lt!146314) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146314) (size!7421 a!3312)))))

(declare-fun e!186493 () Bool)

(assert (=> b!295059 (= e!186493 (= (select (arr!7069 a!3312) (index!10904 lt!146314)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66979 () Bool)

(assert (=> d!66979 e!186496))

(declare-fun c!47560 () Bool)

(assert (=> d!66979 (= c!47560 (and ((_ is Intermediate!2183) lt!146314) (undefined!2995 lt!146314)))))

(declare-fun e!186494 () SeekEntryResult!2183)

(assert (=> d!66979 (= lt!146314 e!186494)))

(declare-fun c!47558 () Bool)

(assert (=> d!66979 (= c!47558 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146315 () (_ BitVec 64))

(assert (=> d!66979 (= lt!146315 (select (arr!7069 a!3312) lt!146276))))

(assert (=> d!66979 (validMask!0 mask!3809)))

(assert (=> d!66979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146276 k0!2524 a!3312 mask!3809) lt!146314)))

(declare-fun b!295060 () Bool)

(assert (=> b!295060 (and (bvsge (index!10904 lt!146314) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146314) (size!7421 a!3312)))))

(declare-fun res!155094 () Bool)

(assert (=> b!295060 (= res!155094 (= (select (arr!7069 a!3312) (index!10904 lt!146314)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295060 (=> res!155094 e!186493)))

(declare-fun b!295061 () Bool)

(assert (=> b!295061 (= e!186496 (bvsge (x!29224 lt!146314) #b01111111111111111111111111111110))))

(declare-fun b!295062 () Bool)

(declare-fun e!186492 () SeekEntryResult!2183)

(assert (=> b!295062 (= e!186494 e!186492)))

(declare-fun c!47559 () Bool)

(assert (=> b!295062 (= c!47559 (or (= lt!146315 k0!2524) (= (bvadd lt!146315 lt!146315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295063 () Bool)

(assert (=> b!295063 (= e!186492 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!295064 () Bool)

(assert (=> b!295064 (= e!186492 (Intermediate!2183 false lt!146276 #b00000000000000000000000000000000))))

(declare-fun b!295065 () Bool)

(assert (=> b!295065 (= e!186494 (Intermediate!2183 true lt!146276 #b00000000000000000000000000000000))))

(declare-fun b!295066 () Bool)

(assert (=> b!295066 (and (bvsge (index!10904 lt!146314) #b00000000000000000000000000000000) (bvslt (index!10904 lt!146314) (size!7421 a!3312)))))

(declare-fun res!155092 () Bool)

(assert (=> b!295066 (= res!155092 (= (select (arr!7069 a!3312) (index!10904 lt!146314)) k0!2524))))

(assert (=> b!295066 (=> res!155092 e!186493)))

(assert (=> b!295066 (= e!186495 e!186493)))

(assert (= (and d!66979 c!47558) b!295065))

(assert (= (and d!66979 (not c!47558)) b!295062))

(assert (= (and b!295062 c!47559) b!295064))

(assert (= (and b!295062 (not c!47559)) b!295063))

(assert (= (and d!66979 c!47560) b!295061))

(assert (= (and d!66979 (not c!47560)) b!295058))

(assert (= (and b!295058 res!155093) b!295066))

(assert (= (and b!295066 (not res!155092)) b!295060))

(assert (= (and b!295060 (not res!155094)) b!295059))

(declare-fun m!308521 () Bool)

(assert (=> b!295059 m!308521))

(assert (=> b!295063 m!308515))

(assert (=> b!295063 m!308515))

(declare-fun m!308523 () Bool)

(assert (=> b!295063 m!308523))

(assert (=> b!295060 m!308521))

(assert (=> b!295066 m!308521))

(declare-fun m!308525 () Bool)

(assert (=> d!66979 m!308525))

(assert (=> d!66979 m!308453))

(assert (=> b!294994 d!66979))

(declare-fun d!66981 () Bool)

(declare-fun lt!146321 () (_ BitVec 32))

(declare-fun lt!146320 () (_ BitVec 32))

(assert (=> d!66981 (= lt!146321 (bvmul (bvxor lt!146320 (bvlshr lt!146320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66981 (= lt!146320 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66981 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155095 (let ((h!5198 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29228 (bvmul (bvxor h!5198 (bvlshr h!5198 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29228 (bvlshr x!29228 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155095 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155095 #b00000000000000000000000000000000))))))

(assert (=> d!66981 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146321 (bvlshr lt!146321 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294994 d!66981))

(declare-fun d!66987 () Bool)

(assert (=> d!66987 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29014 d!66987))

(declare-fun d!66993 () Bool)

(assert (=> d!66993 (= (array_inv!5019 a!3312) (bvsge (size!7421 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29014 d!66993))

(declare-fun d!66995 () Bool)

(declare-fun lt!146350 () SeekEntryResult!2183)

(assert (=> d!66995 (and (or ((_ is Undefined!2183) lt!146350) (not ((_ is Found!2183) lt!146350)) (and (bvsge (index!10903 lt!146350) #b00000000000000000000000000000000) (bvslt (index!10903 lt!146350) (size!7421 a!3312)))) (or ((_ is Undefined!2183) lt!146350) ((_ is Found!2183) lt!146350) (not ((_ is MissingZero!2183) lt!146350)) (and (bvsge (index!10902 lt!146350) #b00000000000000000000000000000000) (bvslt (index!10902 lt!146350) (size!7421 a!3312)))) (or ((_ is Undefined!2183) lt!146350) ((_ is Found!2183) lt!146350) ((_ is MissingZero!2183) lt!146350) (not ((_ is MissingVacant!2183) lt!146350)) (and (bvsge (index!10905 lt!146350) #b00000000000000000000000000000000) (bvslt (index!10905 lt!146350) (size!7421 a!3312)))) (or ((_ is Undefined!2183) lt!146350) (ite ((_ is Found!2183) lt!146350) (= (select (arr!7069 a!3312) (index!10903 lt!146350)) k0!2524) (ite ((_ is MissingZero!2183) lt!146350) (= (select (arr!7069 a!3312) (index!10902 lt!146350)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2183) lt!146350) (= (select (arr!7069 a!3312) (index!10905 lt!146350)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!186541 () SeekEntryResult!2183)

(assert (=> d!66995 (= lt!146350 e!186541)))

(declare-fun c!47584 () Bool)

(declare-fun lt!146348 () SeekEntryResult!2183)

(assert (=> d!66995 (= c!47584 (and ((_ is Intermediate!2183) lt!146348) (undefined!2995 lt!146348)))))

(assert (=> d!66995 (= lt!146348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66995 (validMask!0 mask!3809)))

(assert (=> d!66995 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146350)))

(declare-fun e!186539 () SeekEntryResult!2183)

(declare-fun b!295135 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14910 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!295135 (= e!186539 (seekKeyOrZeroReturnVacant!0 (x!29224 lt!146348) (index!10904 lt!146348) (index!10904 lt!146348) k0!2524 a!3312 mask!3809))))

(declare-fun b!295136 () Bool)

(declare-fun c!47585 () Bool)

(declare-fun lt!146349 () (_ BitVec 64))

(assert (=> b!295136 (= c!47585 (= lt!146349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186540 () SeekEntryResult!2183)

(assert (=> b!295136 (= e!186540 e!186539)))

(declare-fun b!295137 () Bool)

(assert (=> b!295137 (= e!186541 Undefined!2183)))

(declare-fun b!295138 () Bool)

(assert (=> b!295138 (= e!186541 e!186540)))

(assert (=> b!295138 (= lt!146349 (select (arr!7069 a!3312) (index!10904 lt!146348)))))

(declare-fun c!47583 () Bool)

(assert (=> b!295138 (= c!47583 (= lt!146349 k0!2524))))

(declare-fun b!295139 () Bool)

(assert (=> b!295139 (= e!186539 (MissingZero!2183 (index!10904 lt!146348)))))

(declare-fun b!295140 () Bool)

(assert (=> b!295140 (= e!186540 (Found!2183 (index!10904 lt!146348)))))

(assert (= (and d!66995 c!47584) b!295137))

(assert (= (and d!66995 (not c!47584)) b!295138))

(assert (= (and b!295138 c!47583) b!295140))

(assert (= (and b!295138 (not c!47583)) b!295136))

(assert (= (and b!295136 c!47585) b!295139))

(assert (= (and b!295136 (not c!47585)) b!295135))

(assert (=> d!66995 m!308463))

(declare-fun m!308549 () Bool)

(assert (=> d!66995 m!308549))

(declare-fun m!308551 () Bool)

(assert (=> d!66995 m!308551))

(assert (=> d!66995 m!308463))

(declare-fun m!308553 () Bool)

(assert (=> d!66995 m!308553))

(declare-fun m!308555 () Bool)

(assert (=> d!66995 m!308555))

(assert (=> d!66995 m!308453))

(declare-fun m!308557 () Bool)

(assert (=> b!295135 m!308557))

(declare-fun m!308559 () Bool)

(assert (=> b!295138 m!308559))

(assert (=> b!294992 d!66995))

(declare-fun d!67005 () Bool)

(declare-fun res!155129 () Bool)

(declare-fun e!186554 () Bool)

(assert (=> d!67005 (=> res!155129 e!186554)))

(assert (=> d!67005 (= res!155129 (= (select (arr!7069 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67005 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186554)))

(declare-fun b!295157 () Bool)

(declare-fun e!186555 () Bool)

(assert (=> b!295157 (= e!186554 e!186555)))

(declare-fun res!155130 () Bool)

(assert (=> b!295157 (=> (not res!155130) (not e!186555))))

(assert (=> b!295157 (= res!155130 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7421 a!3312)))))

(declare-fun b!295158 () Bool)

(assert (=> b!295158 (= e!186555 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67005 (not res!155129)) b!295157))

(assert (= (and b!295157 res!155130) b!295158))

(declare-fun m!308561 () Bool)

(assert (=> d!67005 m!308561))

(declare-fun m!308563 () Bool)

(assert (=> b!295158 m!308563))

(assert (=> b!294990 d!67005))

(declare-fun d!67007 () Bool)

(declare-fun res!155137 () Bool)

(declare-fun e!186570 () Bool)

(assert (=> d!67007 (=> res!155137 e!186570)))

(assert (=> d!67007 (= res!155137 (bvsge #b00000000000000000000000000000000 (size!7421 a!3312)))))

(assert (=> d!67007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186570)))

(declare-fun b!295177 () Bool)

(declare-fun e!186569 () Bool)

(declare-fun call!25711 () Bool)

(assert (=> b!295177 (= e!186569 call!25711)))

(declare-fun b!295178 () Bool)

(declare-fun e!186568 () Bool)

(assert (=> b!295178 (= e!186569 e!186568)))

(declare-fun lt!146370 () (_ BitVec 64))

(assert (=> b!295178 (= lt!146370 (select (arr!7069 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9182 0))(
  ( (Unit!9183) )
))
(declare-fun lt!146369 () Unit!9182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14910 (_ BitVec 64) (_ BitVec 32)) Unit!9182)

(assert (=> b!295178 (= lt!146369 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146370 #b00000000000000000000000000000000))))

(assert (=> b!295178 (arrayContainsKey!0 a!3312 lt!146370 #b00000000000000000000000000000000)))

(declare-fun lt!146371 () Unit!9182)

(assert (=> b!295178 (= lt!146371 lt!146369)))

(declare-fun res!155138 () Bool)

(assert (=> b!295178 (= res!155138 (= (seekEntryOrOpen!0 (select (arr!7069 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2183 #b00000000000000000000000000000000)))))

(assert (=> b!295178 (=> (not res!155138) (not e!186568))))

(declare-fun b!295179 () Bool)

(assert (=> b!295179 (= e!186570 e!186569)))

(declare-fun c!47596 () Bool)

(assert (=> b!295179 (= c!47596 (validKeyInArray!0 (select (arr!7069 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25708 () Bool)

(assert (=> bm!25708 (= call!25711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!295180 () Bool)

(assert (=> b!295180 (= e!186568 call!25711)))

(assert (= (and d!67007 (not res!155137)) b!295179))

(assert (= (and b!295179 c!47596) b!295178))

(assert (= (and b!295179 (not c!47596)) b!295177))

(assert (= (and b!295178 res!155138) b!295180))

(assert (= (or b!295180 b!295177) bm!25708))

(assert (=> b!295178 m!308561))

(declare-fun m!308587 () Bool)

(assert (=> b!295178 m!308587))

(declare-fun m!308589 () Bool)

(assert (=> b!295178 m!308589))

(assert (=> b!295178 m!308561))

(declare-fun m!308591 () Bool)

(assert (=> b!295178 m!308591))

(assert (=> b!295179 m!308561))

(assert (=> b!295179 m!308561))

(declare-fun m!308593 () Bool)

(assert (=> b!295179 m!308593))

(declare-fun m!308595 () Bool)

(assert (=> bm!25708 m!308595))

(assert (=> b!294991 d!67007))

(check-sat (not b!295178) (not b!295054) (not d!66979) (not b!295063) (not b!295135) (not d!66977) (not bm!25708) (not b!295158) (not d!66995) (not b!295179))
(check-sat)
