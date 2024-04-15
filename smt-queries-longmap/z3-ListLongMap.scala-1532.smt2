; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29060 () Bool)

(assert start!29060)

(declare-fun b!294951 () Bool)

(declare-fun e!186427 () Bool)

(declare-fun e!186428 () Bool)

(assert (=> b!294951 (= e!186427 e!186428)))

(declare-fun res!155029 () Bool)

(assert (=> b!294951 (=> (not res!155029) (not e!186428))))

(declare-fun lt!146128 () Bool)

(declare-datatypes ((SeekEntryResult!2216 0))(
  ( (MissingZero!2216 (index!11034 (_ BitVec 32))) (Found!2216 (index!11035 (_ BitVec 32))) (Intermediate!2216 (undefined!3028 Bool) (index!11036 (_ BitVec 32)) (x!29266 (_ BitVec 32))) (Undefined!2216) (MissingVacant!2216 (index!11037 (_ BitVec 32))) )
))
(declare-fun lt!146130 () SeekEntryResult!2216)

(declare-datatypes ((array!14911 0))(
  ( (array!14912 (arr!7068 (Array (_ BitVec 32) (_ BitVec 64))) (size!7421 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14911)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!294951 (= res!155029 (and (or lt!146128 (not (undefined!3028 lt!146130))) (or lt!146128 (not (= (select (arr!7068 a!3312) (index!11036 lt!146130)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146128 (not (= (select (arr!7068 a!3312) (index!11036 lt!146130)) k0!2524))) (not lt!146128)))))

(get-info :version)

(assert (=> b!294951 (= lt!146128 (not ((_ is Intermediate!2216) lt!146130)))))

(declare-fun b!294952 () Bool)

(declare-fun res!155028 () Bool)

(declare-fun e!186429 () Bool)

(assert (=> b!294952 (=> (not res!155028) (not e!186429))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14911 (_ BitVec 32)) Bool)

(assert (=> b!294952 (= res!155028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294953 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!294953 (= e!186428 (not (= (index!11036 lt!146130) i!1256)))))

(assert (=> b!294953 (= (select (arr!7068 a!3312) (index!11036 lt!146130)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!155035 () Bool)

(declare-fun e!186426 () Bool)

(assert (=> start!29060 (=> (not res!155035) (not e!186426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29060 (= res!155035 (validMask!0 mask!3809))))

(assert (=> start!29060 e!186426))

(assert (=> start!29060 true))

(declare-fun array_inv!5040 (array!14911) Bool)

(assert (=> start!29060 (array_inv!5040 a!3312)))

(declare-fun b!294954 () Bool)

(declare-fun res!155033 () Bool)

(assert (=> b!294954 (=> (not res!155033) (not e!186426))))

(assert (=> b!294954 (= res!155033 (and (= (size!7421 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7421 a!3312))))))

(declare-fun b!294955 () Bool)

(assert (=> b!294955 (= e!186429 e!186427)))

(declare-fun res!155031 () Bool)

(assert (=> b!294955 (=> (not res!155031) (not e!186427))))

(declare-fun lt!146132 () Bool)

(assert (=> b!294955 (= res!155031 lt!146132)))

(declare-fun lt!146129 () (_ BitVec 32))

(declare-fun lt!146131 () SeekEntryResult!2216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14911 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!294955 (= lt!146131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146129 k0!2524 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809))))

(assert (=> b!294955 (= lt!146130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146129 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294955 (= lt!146129 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294956 () Bool)

(declare-fun res!155032 () Bool)

(assert (=> b!294956 (=> (not res!155032) (not e!186426))))

(declare-fun arrayContainsKey!0 (array!14911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294956 (= res!155032 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294957 () Bool)

(assert (=> b!294957 (= e!186426 e!186429)))

(declare-fun res!155030 () Bool)

(assert (=> b!294957 (=> (not res!155030) (not e!186429))))

(declare-fun lt!146133 () SeekEntryResult!2216)

(assert (=> b!294957 (= res!155030 (or lt!146132 (= lt!146133 (MissingVacant!2216 i!1256))))))

(assert (=> b!294957 (= lt!146132 (= lt!146133 (MissingZero!2216 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14911 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!294957 (= lt!146133 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294958 () Bool)

(declare-fun res!155034 () Bool)

(assert (=> b!294958 (=> (not res!155034) (not e!186426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294958 (= res!155034 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29060 res!155035) b!294954))

(assert (= (and b!294954 res!155033) b!294958))

(assert (= (and b!294958 res!155034) b!294956))

(assert (= (and b!294956 res!155032) b!294957))

(assert (= (and b!294957 res!155030) b!294952))

(assert (= (and b!294952 res!155028) b!294955))

(assert (= (and b!294955 res!155031) b!294951))

(assert (= (and b!294951 res!155029) b!294953))

(declare-fun m!307707 () Bool)

(assert (=> b!294951 m!307707))

(declare-fun m!307709 () Bool)

(assert (=> b!294957 m!307709))

(assert (=> b!294953 m!307707))

(declare-fun m!307711 () Bool)

(assert (=> b!294955 m!307711))

(declare-fun m!307713 () Bool)

(assert (=> b!294955 m!307713))

(declare-fun m!307715 () Bool)

(assert (=> b!294955 m!307715))

(declare-fun m!307717 () Bool)

(assert (=> b!294955 m!307717))

(declare-fun m!307719 () Bool)

(assert (=> b!294958 m!307719))

(declare-fun m!307721 () Bool)

(assert (=> b!294952 m!307721))

(declare-fun m!307723 () Bool)

(assert (=> start!29060 m!307723))

(declare-fun m!307725 () Bool)

(assert (=> start!29060 m!307725))

(declare-fun m!307727 () Bool)

(assert (=> b!294956 m!307727))

(check-sat (not b!294952) (not b!294957) (not start!29060) (not b!294956) (not b!294955) (not b!294958))
(check-sat)
(get-model)

(declare-fun b!295025 () Bool)

(declare-fun e!186475 () Bool)

(declare-fun lt!146175 () SeekEntryResult!2216)

(assert (=> b!295025 (= e!186475 (bvsge (x!29266 lt!146175) #b01111111111111111111111111111110))))

(declare-fun b!295026 () Bool)

(assert (=> b!295026 (and (bvsge (index!11036 lt!146175) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146175) (size!7421 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(declare-fun res!155090 () Bool)

(assert (=> b!295026 (= res!155090 (= (select (arr!7068 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!11036 lt!146175)) k0!2524))))

(declare-fun e!186474 () Bool)

(assert (=> b!295026 (=> res!155090 e!186474)))

(declare-fun e!186473 () Bool)

(assert (=> b!295026 (= e!186473 e!186474)))

(declare-fun b!295027 () Bool)

(declare-fun e!186471 () SeekEntryResult!2216)

(assert (=> b!295027 (= e!186471 (Intermediate!2216 true lt!146129 #b00000000000000000000000000000000))))

(declare-fun b!295028 () Bool)

(assert (=> b!295028 (and (bvsge (index!11036 lt!146175) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146175) (size!7421 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(declare-fun res!155092 () Bool)

(assert (=> b!295028 (= res!155092 (= (select (arr!7068 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!11036 lt!146175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295028 (=> res!155092 e!186474)))

(declare-fun b!295029 () Bool)

(declare-fun e!186472 () SeekEntryResult!2216)

(assert (=> b!295029 (= e!186472 (Intermediate!2216 false lt!146129 #b00000000000000000000000000000000))))

(declare-fun b!295031 () Bool)

(assert (=> b!295031 (and (bvsge (index!11036 lt!146175) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146175) (size!7421 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)))))))

(assert (=> b!295031 (= e!186474 (= (select (arr!7068 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312))) (index!11036 lt!146175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295032 () Bool)

(assert (=> b!295032 (= e!186475 e!186473)))

(declare-fun res!155091 () Bool)

(assert (=> b!295032 (= res!155091 (and ((_ is Intermediate!2216) lt!146175) (not (undefined!3028 lt!146175)) (bvslt (x!29266 lt!146175) #b01111111111111111111111111111110) (bvsge (x!29266 lt!146175) #b00000000000000000000000000000000) (bvsge (x!29266 lt!146175) #b00000000000000000000000000000000)))))

(assert (=> b!295032 (=> (not res!155091) (not e!186473))))

(declare-fun b!295033 () Bool)

(assert (=> b!295033 (= e!186471 e!186472)))

(declare-fun c!47546 () Bool)

(declare-fun lt!146174 () (_ BitVec 64))

(assert (=> b!295033 (= c!47546 (or (= lt!146174 k0!2524) (= (bvadd lt!146174 lt!146174) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66769 () Bool)

(assert (=> d!66769 e!186475))

(declare-fun c!47545 () Bool)

(assert (=> d!66769 (= c!47545 (and ((_ is Intermediate!2216) lt!146175) (undefined!3028 lt!146175)))))

(assert (=> d!66769 (= lt!146175 e!186471)))

(declare-fun c!47544 () Bool)

(assert (=> d!66769 (= c!47544 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66769 (= lt!146174 (select (arr!7068 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312))) lt!146129))))

(assert (=> d!66769 (validMask!0 mask!3809)))

(assert (=> d!66769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146129 k0!2524 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809) lt!146175)))

(declare-fun b!295030 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295030 (= e!186472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146129 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14912 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7421 a!3312)) mask!3809))))

(assert (= (and d!66769 c!47544) b!295027))

(assert (= (and d!66769 (not c!47544)) b!295033))

(assert (= (and b!295033 c!47546) b!295029))

(assert (= (and b!295033 (not c!47546)) b!295030))

(assert (= (and d!66769 c!47545) b!295025))

(assert (= (and d!66769 (not c!47545)) b!295032))

(assert (= (and b!295032 res!155091) b!295026))

(assert (= (and b!295026 (not res!155090)) b!295028))

(assert (= (and b!295028 (not res!155092)) b!295031))

(declare-fun m!307773 () Bool)

(assert (=> b!295026 m!307773))

(declare-fun m!307775 () Bool)

(assert (=> b!295030 m!307775))

(assert (=> b!295030 m!307775))

(declare-fun m!307777 () Bool)

(assert (=> b!295030 m!307777))

(assert (=> b!295028 m!307773))

(declare-fun m!307779 () Bool)

(assert (=> d!66769 m!307779))

(assert (=> d!66769 m!307723))

(assert (=> b!295031 m!307773))

(assert (=> b!294955 d!66769))

(declare-fun b!295034 () Bool)

(declare-fun e!186480 () Bool)

(declare-fun lt!146177 () SeekEntryResult!2216)

(assert (=> b!295034 (= e!186480 (bvsge (x!29266 lt!146177) #b01111111111111111111111111111110))))

(declare-fun b!295035 () Bool)

(assert (=> b!295035 (and (bvsge (index!11036 lt!146177) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146177) (size!7421 a!3312)))))

(declare-fun res!155093 () Bool)

(assert (=> b!295035 (= res!155093 (= (select (arr!7068 a!3312) (index!11036 lt!146177)) k0!2524))))

(declare-fun e!186479 () Bool)

(assert (=> b!295035 (=> res!155093 e!186479)))

(declare-fun e!186478 () Bool)

(assert (=> b!295035 (= e!186478 e!186479)))

(declare-fun b!295036 () Bool)

(declare-fun e!186476 () SeekEntryResult!2216)

(assert (=> b!295036 (= e!186476 (Intermediate!2216 true lt!146129 #b00000000000000000000000000000000))))

(declare-fun b!295037 () Bool)

(assert (=> b!295037 (and (bvsge (index!11036 lt!146177) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146177) (size!7421 a!3312)))))

(declare-fun res!155095 () Bool)

(assert (=> b!295037 (= res!155095 (= (select (arr!7068 a!3312) (index!11036 lt!146177)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295037 (=> res!155095 e!186479)))

(declare-fun b!295038 () Bool)

(declare-fun e!186477 () SeekEntryResult!2216)

(assert (=> b!295038 (= e!186477 (Intermediate!2216 false lt!146129 #b00000000000000000000000000000000))))

(declare-fun b!295040 () Bool)

(assert (=> b!295040 (and (bvsge (index!11036 lt!146177) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146177) (size!7421 a!3312)))))

(assert (=> b!295040 (= e!186479 (= (select (arr!7068 a!3312) (index!11036 lt!146177)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295041 () Bool)

(assert (=> b!295041 (= e!186480 e!186478)))

(declare-fun res!155094 () Bool)

(assert (=> b!295041 (= res!155094 (and ((_ is Intermediate!2216) lt!146177) (not (undefined!3028 lt!146177)) (bvslt (x!29266 lt!146177) #b01111111111111111111111111111110) (bvsge (x!29266 lt!146177) #b00000000000000000000000000000000) (bvsge (x!29266 lt!146177) #b00000000000000000000000000000000)))))

(assert (=> b!295041 (=> (not res!155094) (not e!186478))))

(declare-fun b!295042 () Bool)

(assert (=> b!295042 (= e!186476 e!186477)))

(declare-fun c!47549 () Bool)

(declare-fun lt!146176 () (_ BitVec 64))

(assert (=> b!295042 (= c!47549 (or (= lt!146176 k0!2524) (= (bvadd lt!146176 lt!146176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66775 () Bool)

(assert (=> d!66775 e!186480))

(declare-fun c!47548 () Bool)

(assert (=> d!66775 (= c!47548 (and ((_ is Intermediate!2216) lt!146177) (undefined!3028 lt!146177)))))

(assert (=> d!66775 (= lt!146177 e!186476)))

(declare-fun c!47547 () Bool)

(assert (=> d!66775 (= c!47547 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66775 (= lt!146176 (select (arr!7068 a!3312) lt!146129))))

(assert (=> d!66775 (validMask!0 mask!3809)))

(assert (=> d!66775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146129 k0!2524 a!3312 mask!3809) lt!146177)))

(declare-fun b!295039 () Bool)

(assert (=> b!295039 (= e!186477 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146129 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66775 c!47547) b!295036))

(assert (= (and d!66775 (not c!47547)) b!295042))

(assert (= (and b!295042 c!47549) b!295038))

(assert (= (and b!295042 (not c!47549)) b!295039))

(assert (= (and d!66775 c!47548) b!295034))

(assert (= (and d!66775 (not c!47548)) b!295041))

(assert (= (and b!295041 res!155094) b!295035))

(assert (= (and b!295035 (not res!155093)) b!295037))

(assert (= (and b!295037 (not res!155095)) b!295040))

(declare-fun m!307781 () Bool)

(assert (=> b!295035 m!307781))

(assert (=> b!295039 m!307775))

(assert (=> b!295039 m!307775))

(declare-fun m!307783 () Bool)

(assert (=> b!295039 m!307783))

(assert (=> b!295037 m!307781))

(declare-fun m!307785 () Bool)

(assert (=> d!66775 m!307785))

(assert (=> d!66775 m!307723))

(assert (=> b!295040 m!307781))

(assert (=> b!294955 d!66775))

(declare-fun d!66777 () Bool)

(declare-fun lt!146189 () (_ BitVec 32))

(declare-fun lt!146188 () (_ BitVec 32))

(assert (=> d!66777 (= lt!146189 (bvmul (bvxor lt!146188 (bvlshr lt!146188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66777 (= lt!146188 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66777 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155096 (let ((h!5257 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29270 (bvmul (bvxor h!5257 (bvlshr h!5257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29270 (bvlshr x!29270 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155096 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155096 #b00000000000000000000000000000000))))))

(assert (=> d!66777 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146189 (bvlshr lt!146189 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294955 d!66777))

(declare-fun d!66779 () Bool)

(assert (=> d!66779 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294958 d!66779))

(declare-fun b!295121 () Bool)

(declare-fun c!47582 () Bool)

(declare-fun lt!146223 () (_ BitVec 64))

(assert (=> b!295121 (= c!47582 (= lt!146223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186526 () SeekEntryResult!2216)

(declare-fun e!186527 () SeekEntryResult!2216)

(assert (=> b!295121 (= e!186526 e!186527)))

(declare-fun b!295122 () Bool)

(declare-fun e!186525 () SeekEntryResult!2216)

(assert (=> b!295122 (= e!186525 e!186526)))

(declare-fun lt!146222 () SeekEntryResult!2216)

(assert (=> b!295122 (= lt!146223 (select (arr!7068 a!3312) (index!11036 lt!146222)))))

(declare-fun c!47581 () Bool)

(assert (=> b!295122 (= c!47581 (= lt!146223 k0!2524))))

(declare-fun b!295123 () Bool)

(assert (=> b!295123 (= e!186526 (Found!2216 (index!11036 lt!146222)))))

(declare-fun d!66781 () Bool)

(declare-fun lt!146224 () SeekEntryResult!2216)

(assert (=> d!66781 (and (or ((_ is Undefined!2216) lt!146224) (not ((_ is Found!2216) lt!146224)) (and (bvsge (index!11035 lt!146224) #b00000000000000000000000000000000) (bvslt (index!11035 lt!146224) (size!7421 a!3312)))) (or ((_ is Undefined!2216) lt!146224) ((_ is Found!2216) lt!146224) (not ((_ is MissingZero!2216) lt!146224)) (and (bvsge (index!11034 lt!146224) #b00000000000000000000000000000000) (bvslt (index!11034 lt!146224) (size!7421 a!3312)))) (or ((_ is Undefined!2216) lt!146224) ((_ is Found!2216) lt!146224) ((_ is MissingZero!2216) lt!146224) (not ((_ is MissingVacant!2216) lt!146224)) (and (bvsge (index!11037 lt!146224) #b00000000000000000000000000000000) (bvslt (index!11037 lt!146224) (size!7421 a!3312)))) (or ((_ is Undefined!2216) lt!146224) (ite ((_ is Found!2216) lt!146224) (= (select (arr!7068 a!3312) (index!11035 lt!146224)) k0!2524) (ite ((_ is MissingZero!2216) lt!146224) (= (select (arr!7068 a!3312) (index!11034 lt!146224)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2216) lt!146224) (= (select (arr!7068 a!3312) (index!11037 lt!146224)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66781 (= lt!146224 e!186525)))

(declare-fun c!47580 () Bool)

(assert (=> d!66781 (= c!47580 (and ((_ is Intermediate!2216) lt!146222) (undefined!3028 lt!146222)))))

(assert (=> d!66781 (= lt!146222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66781 (validMask!0 mask!3809)))

(assert (=> d!66781 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146224)))

(declare-fun b!295124 () Bool)

(assert (=> b!295124 (= e!186525 Undefined!2216)))

(declare-fun b!295125 () Bool)

(assert (=> b!295125 (= e!186527 (MissingZero!2216 (index!11036 lt!146222)))))

(declare-fun b!295126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14911 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!295126 (= e!186527 (seekKeyOrZeroReturnVacant!0 (x!29266 lt!146222) (index!11036 lt!146222) (index!11036 lt!146222) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66781 c!47580) b!295124))

(assert (= (and d!66781 (not c!47580)) b!295122))

(assert (= (and b!295122 c!47581) b!295123))

(assert (= (and b!295122 (not c!47581)) b!295121))

(assert (= (and b!295121 c!47582) b!295125))

(assert (= (and b!295121 (not c!47582)) b!295126))

(declare-fun m!307825 () Bool)

(assert (=> b!295122 m!307825))

(declare-fun m!307827 () Bool)

(assert (=> d!66781 m!307827))

(declare-fun m!307829 () Bool)

(assert (=> d!66781 m!307829))

(assert (=> d!66781 m!307717))

(assert (=> d!66781 m!307717))

(declare-fun m!307831 () Bool)

(assert (=> d!66781 m!307831))

(declare-fun m!307833 () Bool)

(assert (=> d!66781 m!307833))

(assert (=> d!66781 m!307723))

(declare-fun m!307835 () Bool)

(assert (=> b!295126 m!307835))

(assert (=> b!294957 d!66781))

(declare-fun d!66793 () Bool)

(assert (=> d!66793 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29060 d!66793))

(declare-fun d!66797 () Bool)

(assert (=> d!66797 (= (array_inv!5040 a!3312) (bvsge (size!7421 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29060 d!66797))

(declare-fun d!66799 () Bool)

(declare-fun res!155145 () Bool)

(declare-fun e!186571 () Bool)

(assert (=> d!66799 (=> res!155145 e!186571)))

(assert (=> d!66799 (= res!155145 (bvsge #b00000000000000000000000000000000 (size!7421 a!3312)))))

(assert (=> d!66799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186571)))

(declare-fun b!295189 () Bool)

(declare-fun e!186570 () Bool)

(declare-fun call!25709 () Bool)

(assert (=> b!295189 (= e!186570 call!25709)))

(declare-fun b!295190 () Bool)

(declare-fun e!186569 () Bool)

(assert (=> b!295190 (= e!186570 e!186569)))

(declare-fun lt!146253 () (_ BitVec 64))

(assert (=> b!295190 (= lt!146253 (select (arr!7068 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9174 0))(
  ( (Unit!9175) )
))
(declare-fun lt!146252 () Unit!9174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14911 (_ BitVec 64) (_ BitVec 32)) Unit!9174)

(assert (=> b!295190 (= lt!146252 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146253 #b00000000000000000000000000000000))))

(assert (=> b!295190 (arrayContainsKey!0 a!3312 lt!146253 #b00000000000000000000000000000000)))

(declare-fun lt!146254 () Unit!9174)

(assert (=> b!295190 (= lt!146254 lt!146252)))

(declare-fun res!155146 () Bool)

(assert (=> b!295190 (= res!155146 (= (seekEntryOrOpen!0 (select (arr!7068 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2216 #b00000000000000000000000000000000)))))

(assert (=> b!295190 (=> (not res!155146) (not e!186569))))

(declare-fun b!295191 () Bool)

(assert (=> b!295191 (= e!186571 e!186570)))

(declare-fun c!47600 () Bool)

(assert (=> b!295191 (= c!47600 (validKeyInArray!0 (select (arr!7068 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25706 () Bool)

(assert (=> bm!25706 (= call!25709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!295192 () Bool)

(assert (=> b!295192 (= e!186569 call!25709)))

(assert (= (and d!66799 (not res!155145)) b!295191))

(assert (= (and b!295191 c!47600) b!295190))

(assert (= (and b!295191 (not c!47600)) b!295189))

(assert (= (and b!295190 res!155146) b!295192))

(assert (= (or b!295192 b!295189) bm!25706))

(declare-fun m!307865 () Bool)

(assert (=> b!295190 m!307865))

(declare-fun m!307867 () Bool)

(assert (=> b!295190 m!307867))

(declare-fun m!307869 () Bool)

(assert (=> b!295190 m!307869))

(assert (=> b!295190 m!307865))

(declare-fun m!307871 () Bool)

(assert (=> b!295190 m!307871))

(assert (=> b!295191 m!307865))

(assert (=> b!295191 m!307865))

(declare-fun m!307873 () Bool)

(assert (=> b!295191 m!307873))

(declare-fun m!307875 () Bool)

(assert (=> bm!25706 m!307875))

(assert (=> b!294952 d!66799))

(declare-fun d!66811 () Bool)

(declare-fun res!155151 () Bool)

(declare-fun e!186576 () Bool)

(assert (=> d!66811 (=> res!155151 e!186576)))

(assert (=> d!66811 (= res!155151 (= (select (arr!7068 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66811 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186576)))

(declare-fun b!295197 () Bool)

(declare-fun e!186577 () Bool)

(assert (=> b!295197 (= e!186576 e!186577)))

(declare-fun res!155152 () Bool)

(assert (=> b!295197 (=> (not res!155152) (not e!186577))))

(assert (=> b!295197 (= res!155152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7421 a!3312)))))

(declare-fun b!295198 () Bool)

(assert (=> b!295198 (= e!186577 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66811 (not res!155151)) b!295197))

(assert (= (and b!295197 res!155152) b!295198))

(assert (=> d!66811 m!307865))

(declare-fun m!307877 () Bool)

(assert (=> b!295198 m!307877))

(assert (=> b!294956 d!66811))

(check-sat (not b!295126) (not b!295039) (not d!66781) (not d!66775) (not b!295198) (not b!295190) (not d!66769) (not bm!25706) (not b!295030) (not b!295191))
(check-sat)
