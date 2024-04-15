; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30444 () Bool)

(assert start!30444)

(declare-fun b!304723 () Bool)

(declare-fun e!191408 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150342 () (_ BitVec 32))

(assert (=> b!304723 (= e!191408 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!150342 #b00000000000000000000000000000000) (bvslt lt!150342 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(declare-datatypes ((array!15503 0))(
  ( (array!15504 (arr!7338 (Array (_ BitVec 32) (_ BitVec 64))) (size!7691 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15503)

(declare-datatypes ((SeekEntryResult!2477 0))(
  ( (MissingZero!2477 (index!12084 (_ BitVec 32))) (Found!2477 (index!12085 (_ BitVec 32))) (Intermediate!2477 (undefined!3289 Bool) (index!12086 (_ BitVec 32)) (x!30354 (_ BitVec 32))) (Undefined!2477) (MissingVacant!2477 (index!12087 (_ BitVec 32))) )
))
(declare-fun lt!150344 () SeekEntryResult!2477)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15503 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!304723 (= lt!150344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150342 k0!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304723 (= lt!150342 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304724 () Bool)

(declare-fun res!162220 () Bool)

(declare-fun e!191411 () Bool)

(assert (=> b!304724 (=> (not res!162220) (not e!191411))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15503 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!304724 (= res!162220 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2477 i!1240)))))

(declare-fun b!304725 () Bool)

(declare-fun res!162215 () Bool)

(assert (=> b!304725 (=> (not res!162215) (not e!191411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304725 (= res!162215 (validKeyInArray!0 k0!2441))))

(declare-fun b!304726 () Bool)

(declare-fun e!191410 () Bool)

(assert (=> b!304726 (= e!191410 e!191408)))

(declare-fun res!162218 () Bool)

(assert (=> b!304726 (=> (not res!162218) (not e!191408))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!150343 () SeekEntryResult!2477)

(assert (=> b!304726 (= res!162218 (and (= lt!150344 lt!150343) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7338 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7338 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7338 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304726 (= lt!150344 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304727 () Bool)

(declare-fun res!162217 () Bool)

(assert (=> b!304727 (=> (not res!162217) (not e!191411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15503 (_ BitVec 32)) Bool)

(assert (=> b!304727 (= res!162217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304728 () Bool)

(declare-fun res!162216 () Bool)

(assert (=> b!304728 (=> (not res!162216) (not e!191411))))

(declare-fun arrayContainsKey!0 (array!15503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304728 (= res!162216 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!162222 () Bool)

(assert (=> start!30444 (=> (not res!162222) (not e!191411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30444 (= res!162222 (validMask!0 mask!3709))))

(assert (=> start!30444 e!191411))

(declare-fun array_inv!5310 (array!15503) Bool)

(assert (=> start!30444 (array_inv!5310 a!3293)))

(assert (=> start!30444 true))

(declare-fun b!304729 () Bool)

(assert (=> b!304729 (= e!191411 e!191410)))

(declare-fun res!162219 () Bool)

(assert (=> b!304729 (=> (not res!162219) (not e!191410))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304729 (= res!162219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150343))))

(assert (=> b!304729 (= lt!150343 (Intermediate!2477 false resIndex!52 resX!52))))

(declare-fun b!304730 () Bool)

(declare-fun res!162214 () Bool)

(assert (=> b!304730 (=> (not res!162214) (not e!191410))))

(assert (=> b!304730 (= res!162214 (and (= (select (arr!7338 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7691 a!3293))))))

(declare-fun b!304731 () Bool)

(declare-fun res!162221 () Bool)

(assert (=> b!304731 (=> (not res!162221) (not e!191411))))

(assert (=> b!304731 (= res!162221 (and (= (size!7691 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7691 a!3293))))))

(assert (= (and start!30444 res!162222) b!304731))

(assert (= (and b!304731 res!162221) b!304725))

(assert (= (and b!304725 res!162215) b!304728))

(assert (= (and b!304728 res!162216) b!304724))

(assert (= (and b!304724 res!162220) b!304727))

(assert (= (and b!304727 res!162217) b!304729))

(assert (= (and b!304729 res!162219) b!304730))

(assert (= (and b!304730 res!162214) b!304726))

(assert (= (and b!304726 res!162218) b!304723))

(declare-fun m!315343 () Bool)

(assert (=> b!304728 m!315343))

(declare-fun m!315345 () Bool)

(assert (=> b!304729 m!315345))

(assert (=> b!304729 m!315345))

(declare-fun m!315347 () Bool)

(assert (=> b!304729 m!315347))

(declare-fun m!315349 () Bool)

(assert (=> b!304730 m!315349))

(declare-fun m!315351 () Bool)

(assert (=> b!304724 m!315351))

(declare-fun m!315353 () Bool)

(assert (=> b!304726 m!315353))

(declare-fun m!315355 () Bool)

(assert (=> b!304726 m!315355))

(declare-fun m!315357 () Bool)

(assert (=> start!30444 m!315357))

(declare-fun m!315359 () Bool)

(assert (=> start!30444 m!315359))

(declare-fun m!315361 () Bool)

(assert (=> b!304727 m!315361))

(declare-fun m!315363 () Bool)

(assert (=> b!304725 m!315363))

(declare-fun m!315365 () Bool)

(assert (=> b!304723 m!315365))

(declare-fun m!315367 () Bool)

(assert (=> b!304723 m!315367))

(check-sat (not start!30444) (not b!304726) (not b!304727) (not b!304729) (not b!304728) (not b!304725) (not b!304723) (not b!304724))
(check-sat)
(get-model)

(declare-fun d!67925 () Bool)

(assert (=> d!67925 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30444 d!67925))

(declare-fun d!67929 () Bool)

(assert (=> d!67929 (= (array_inv!5310 a!3293) (bvsge (size!7691 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30444 d!67929))

(declare-fun b!304840 () Bool)

(declare-fun e!191468 () Bool)

(declare-fun lt!150378 () SeekEntryResult!2477)

(assert (=> b!304840 (= e!191468 (bvsge (x!30354 lt!150378) #b01111111111111111111111111111110))))

(declare-fun b!304842 () Bool)

(declare-fun e!191467 () SeekEntryResult!2477)

(declare-fun e!191471 () SeekEntryResult!2477)

(assert (=> b!304842 (= e!191467 e!191471)))

(declare-fun c!48876 () Bool)

(declare-fun lt!150376 () (_ BitVec 64))

(assert (=> b!304842 (= c!48876 (or (= lt!150376 k0!2441) (= (bvadd lt!150376 lt!150376) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304844 () Bool)

(assert (=> b!304844 (= e!191471 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304846 () Bool)

(assert (=> b!304846 (and (bvsge (index!12086 lt!150378) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150378) (size!7691 a!3293)))))

(declare-fun res!162297 () Bool)

(assert (=> b!304846 (= res!162297 (= (select (arr!7338 a!3293) (index!12086 lt!150378)) k0!2441))))

(declare-fun e!191466 () Bool)

(assert (=> b!304846 (=> res!162297 e!191466)))

(declare-fun e!191470 () Bool)

(assert (=> b!304846 (= e!191470 e!191466)))

(declare-fun b!304848 () Bool)

(assert (=> b!304848 (= e!191471 (Intermediate!2477 false index!1781 x!1427))))

(declare-fun b!304850 () Bool)

(assert (=> b!304850 (and (bvsge (index!12086 lt!150378) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150378) (size!7691 a!3293)))))

(declare-fun res!162299 () Bool)

(assert (=> b!304850 (= res!162299 (= (select (arr!7338 a!3293) (index!12086 lt!150378)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304850 (=> res!162299 e!191466)))

(declare-fun b!304852 () Bool)

(assert (=> b!304852 (and (bvsge (index!12086 lt!150378) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150378) (size!7691 a!3293)))))

(assert (=> b!304852 (= e!191466 (= (select (arr!7338 a!3293) (index!12086 lt!150378)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304856 () Bool)

(assert (=> b!304856 (= e!191468 e!191470)))

(declare-fun res!162300 () Bool)

(get-info :version)

(assert (=> b!304856 (= res!162300 (and ((_ is Intermediate!2477) lt!150378) (not (undefined!3289 lt!150378)) (bvslt (x!30354 lt!150378) #b01111111111111111111111111111110) (bvsge (x!30354 lt!150378) #b00000000000000000000000000000000) (bvsge (x!30354 lt!150378) x!1427)))))

(assert (=> b!304856 (=> (not res!162300) (not e!191470))))

(declare-fun b!304854 () Bool)

(assert (=> b!304854 (= e!191467 (Intermediate!2477 true index!1781 x!1427))))

(declare-fun d!67933 () Bool)

(assert (=> d!67933 e!191468))

(declare-fun c!48878 () Bool)

(assert (=> d!67933 (= c!48878 (and ((_ is Intermediate!2477) lt!150378) (undefined!3289 lt!150378)))))

(assert (=> d!67933 (= lt!150378 e!191467)))

(declare-fun c!48875 () Bool)

(assert (=> d!67933 (= c!48875 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!67933 (= lt!150376 (select (arr!7338 a!3293) index!1781))))

(assert (=> d!67933 (validMask!0 mask!3709)))

(assert (=> d!67933 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150378)))

(assert (= (and d!67933 c!48875) b!304854))

(assert (= (and d!67933 (not c!48875)) b!304842))

(assert (= (and b!304842 c!48876) b!304848))

(assert (= (and b!304842 (not c!48876)) b!304844))

(assert (= (and d!67933 c!48878) b!304840))

(assert (= (and d!67933 (not c!48878)) b!304856))

(assert (= (and b!304856 res!162300) b!304846))

(assert (= (and b!304846 (not res!162297)) b!304850))

(assert (= (and b!304850 (not res!162299)) b!304852))

(declare-fun m!315423 () Bool)

(assert (=> b!304852 m!315423))

(assert (=> b!304846 m!315423))

(assert (=> d!67933 m!315353))

(assert (=> d!67933 m!315357))

(assert (=> b!304844 m!315367))

(assert (=> b!304844 m!315367))

(declare-fun m!315429 () Bool)

(assert (=> b!304844 m!315429))

(assert (=> b!304850 m!315423))

(assert (=> b!304726 d!67933))

(declare-fun b!304893 () Bool)

(declare-fun e!191498 () Bool)

(declare-fun call!25877 () Bool)

(assert (=> b!304893 (= e!191498 call!25877)))

(declare-fun b!304894 () Bool)

(declare-fun e!191499 () Bool)

(declare-fun e!191497 () Bool)

(assert (=> b!304894 (= e!191499 e!191497)))

(declare-fun c!48890 () Bool)

(assert (=> b!304894 (= c!48890 (validKeyInArray!0 (select (arr!7338 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!304895 () Bool)

(assert (=> b!304895 (= e!191497 e!191498)))

(declare-fun lt!150407 () (_ BitVec 64))

(assert (=> b!304895 (= lt!150407 (select (arr!7338 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9355 0))(
  ( (Unit!9356) )
))
(declare-fun lt!150408 () Unit!9355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15503 (_ BitVec 64) (_ BitVec 32)) Unit!9355)

(assert (=> b!304895 (= lt!150408 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150407 #b00000000000000000000000000000000))))

(assert (=> b!304895 (arrayContainsKey!0 a!3293 lt!150407 #b00000000000000000000000000000000)))

(declare-fun lt!150406 () Unit!9355)

(assert (=> b!304895 (= lt!150406 lt!150408)))

(declare-fun res!162316 () Bool)

(assert (=> b!304895 (= res!162316 (= (seekEntryOrOpen!0 (select (arr!7338 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2477 #b00000000000000000000000000000000)))))

(assert (=> b!304895 (=> (not res!162316) (not e!191498))))

(declare-fun b!304896 () Bool)

(assert (=> b!304896 (= e!191497 call!25877)))

(declare-fun d!67939 () Bool)

(declare-fun res!162317 () Bool)

(assert (=> d!67939 (=> res!162317 e!191499)))

(assert (=> d!67939 (= res!162317 (bvsge #b00000000000000000000000000000000 (size!7691 a!3293)))))

(assert (=> d!67939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191499)))

(declare-fun bm!25874 () Bool)

(assert (=> bm!25874 (= call!25877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!67939 (not res!162317)) b!304894))

(assert (= (and b!304894 c!48890) b!304895))

(assert (= (and b!304894 (not c!48890)) b!304896))

(assert (= (and b!304895 res!162316) b!304893))

(assert (= (or b!304893 b!304896) bm!25874))

(declare-fun m!315455 () Bool)

(assert (=> b!304894 m!315455))

(assert (=> b!304894 m!315455))

(declare-fun m!315457 () Bool)

(assert (=> b!304894 m!315457))

(assert (=> b!304895 m!315455))

(declare-fun m!315459 () Bool)

(assert (=> b!304895 m!315459))

(declare-fun m!315461 () Bool)

(assert (=> b!304895 m!315461))

(assert (=> b!304895 m!315455))

(declare-fun m!315463 () Bool)

(assert (=> b!304895 m!315463))

(declare-fun m!315465 () Bool)

(assert (=> bm!25874 m!315465))

(assert (=> b!304727 d!67939))

(declare-fun b!304897 () Bool)

(declare-fun e!191502 () Bool)

(declare-fun lt!150410 () SeekEntryResult!2477)

(assert (=> b!304897 (= e!191502 (bvsge (x!30354 lt!150410) #b01111111111111111111111111111110))))

(declare-fun b!304898 () Bool)

(declare-fun e!191501 () SeekEntryResult!2477)

(declare-fun e!191504 () SeekEntryResult!2477)

(assert (=> b!304898 (= e!191501 e!191504)))

(declare-fun c!48892 () Bool)

(declare-fun lt!150409 () (_ BitVec 64))

(assert (=> b!304898 (= c!48892 (or (= lt!150409 k0!2441) (= (bvadd lt!150409 lt!150409) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304899 () Bool)

(assert (=> b!304899 (= e!191504 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!150342 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304900 () Bool)

(assert (=> b!304900 (and (bvsge (index!12086 lt!150410) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150410) (size!7691 a!3293)))))

(declare-fun res!162318 () Bool)

(assert (=> b!304900 (= res!162318 (= (select (arr!7338 a!3293) (index!12086 lt!150410)) k0!2441))))

(declare-fun e!191500 () Bool)

(assert (=> b!304900 (=> res!162318 e!191500)))

(declare-fun e!191503 () Bool)

(assert (=> b!304900 (= e!191503 e!191500)))

(declare-fun b!304901 () Bool)

(assert (=> b!304901 (= e!191504 (Intermediate!2477 false lt!150342 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!304902 () Bool)

(assert (=> b!304902 (and (bvsge (index!12086 lt!150410) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150410) (size!7691 a!3293)))))

(declare-fun res!162319 () Bool)

(assert (=> b!304902 (= res!162319 (= (select (arr!7338 a!3293) (index!12086 lt!150410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304902 (=> res!162319 e!191500)))

(declare-fun b!304903 () Bool)

(assert (=> b!304903 (and (bvsge (index!12086 lt!150410) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150410) (size!7691 a!3293)))))

(assert (=> b!304903 (= e!191500 (= (select (arr!7338 a!3293) (index!12086 lt!150410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304905 () Bool)

(assert (=> b!304905 (= e!191502 e!191503)))

(declare-fun res!162320 () Bool)

(assert (=> b!304905 (= res!162320 (and ((_ is Intermediate!2477) lt!150410) (not (undefined!3289 lt!150410)) (bvslt (x!30354 lt!150410) #b01111111111111111111111111111110) (bvsge (x!30354 lt!150410) #b00000000000000000000000000000000) (bvsge (x!30354 lt!150410) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!304905 (=> (not res!162320) (not e!191503))))

(declare-fun b!304904 () Bool)

(assert (=> b!304904 (= e!191501 (Intermediate!2477 true lt!150342 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!67957 () Bool)

(assert (=> d!67957 e!191502))

(declare-fun c!48893 () Bool)

(assert (=> d!67957 (= c!48893 (and ((_ is Intermediate!2477) lt!150410) (undefined!3289 lt!150410)))))

(assert (=> d!67957 (= lt!150410 e!191501)))

(declare-fun c!48891 () Bool)

(assert (=> d!67957 (= c!48891 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!67957 (= lt!150409 (select (arr!7338 a!3293) lt!150342))))

(assert (=> d!67957 (validMask!0 mask!3709)))

(assert (=> d!67957 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150342 k0!2441 a!3293 mask!3709) lt!150410)))

(assert (= (and d!67957 c!48891) b!304904))

(assert (= (and d!67957 (not c!48891)) b!304898))

(assert (= (and b!304898 c!48892) b!304901))

(assert (= (and b!304898 (not c!48892)) b!304899))

(assert (= (and d!67957 c!48893) b!304897))

(assert (= (and d!67957 (not c!48893)) b!304905))

(assert (= (and b!304905 res!162320) b!304900))

(assert (= (and b!304900 (not res!162318)) b!304902))

(assert (= (and b!304902 (not res!162319)) b!304903))

(declare-fun m!315467 () Bool)

(assert (=> b!304903 m!315467))

(assert (=> b!304900 m!315467))

(declare-fun m!315469 () Bool)

(assert (=> d!67957 m!315469))

(assert (=> d!67957 m!315357))

(declare-fun m!315471 () Bool)

(assert (=> b!304899 m!315471))

(assert (=> b!304899 m!315471))

(declare-fun m!315473 () Bool)

(assert (=> b!304899 m!315473))

(assert (=> b!304902 m!315467))

(assert (=> b!304723 d!67957))

(declare-fun d!67959 () Bool)

(declare-fun lt!150413 () (_ BitVec 32))

(assert (=> d!67959 (and (bvsge lt!150413 #b00000000000000000000000000000000) (bvslt lt!150413 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67959 (= lt!150413 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!67959 (validMask!0 mask!3709)))

(assert (=> d!67959 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150413)))

(declare-fun bs!10713 () Bool)

(assert (= bs!10713 d!67959))

(declare-fun m!315475 () Bool)

(assert (=> bs!10713 m!315475))

(assert (=> bs!10713 m!315357))

(assert (=> b!304723 d!67959))

(declare-fun d!67961 () Bool)

(declare-fun res!162329 () Bool)

(declare-fun e!191515 () Bool)

(assert (=> d!67961 (=> res!162329 e!191515)))

(assert (=> d!67961 (= res!162329 (= (select (arr!7338 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67961 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191515)))

(declare-fun b!304918 () Bool)

(declare-fun e!191516 () Bool)

(assert (=> b!304918 (= e!191515 e!191516)))

(declare-fun res!162330 () Bool)

(assert (=> b!304918 (=> (not res!162330) (not e!191516))))

(assert (=> b!304918 (= res!162330 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7691 a!3293)))))

(declare-fun b!304919 () Bool)

(assert (=> b!304919 (= e!191516 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67961 (not res!162329)) b!304918))

(assert (= (and b!304918 res!162330) b!304919))

(assert (=> d!67961 m!315455))

(declare-fun m!315477 () Bool)

(assert (=> b!304919 m!315477))

(assert (=> b!304728 d!67961))

(declare-fun b!304920 () Bool)

(declare-fun e!191519 () Bool)

(declare-fun lt!150421 () SeekEntryResult!2477)

(assert (=> b!304920 (= e!191519 (bvsge (x!30354 lt!150421) #b01111111111111111111111111111110))))

(declare-fun b!304921 () Bool)

(declare-fun e!191518 () SeekEntryResult!2477)

(declare-fun e!191521 () SeekEntryResult!2477)

(assert (=> b!304921 (= e!191518 e!191521)))

(declare-fun c!48897 () Bool)

(declare-fun lt!150420 () (_ BitVec 64))

(assert (=> b!304921 (= c!48897 (or (= lt!150420 k0!2441) (= (bvadd lt!150420 lt!150420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304922 () Bool)

(assert (=> b!304922 (= e!191521 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304923 () Bool)

(assert (=> b!304923 (and (bvsge (index!12086 lt!150421) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150421) (size!7691 a!3293)))))

(declare-fun res!162331 () Bool)

(assert (=> b!304923 (= res!162331 (= (select (arr!7338 a!3293) (index!12086 lt!150421)) k0!2441))))

(declare-fun e!191517 () Bool)

(assert (=> b!304923 (=> res!162331 e!191517)))

(declare-fun e!191520 () Bool)

(assert (=> b!304923 (= e!191520 e!191517)))

(declare-fun b!304924 () Bool)

(assert (=> b!304924 (= e!191521 (Intermediate!2477 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304925 () Bool)

(assert (=> b!304925 (and (bvsge (index!12086 lt!150421) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150421) (size!7691 a!3293)))))

(declare-fun res!162332 () Bool)

(assert (=> b!304925 (= res!162332 (= (select (arr!7338 a!3293) (index!12086 lt!150421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304925 (=> res!162332 e!191517)))

(declare-fun b!304926 () Bool)

(assert (=> b!304926 (and (bvsge (index!12086 lt!150421) #b00000000000000000000000000000000) (bvslt (index!12086 lt!150421) (size!7691 a!3293)))))

(assert (=> b!304926 (= e!191517 (= (select (arr!7338 a!3293) (index!12086 lt!150421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304928 () Bool)

(assert (=> b!304928 (= e!191519 e!191520)))

(declare-fun res!162333 () Bool)

(assert (=> b!304928 (= res!162333 (and ((_ is Intermediate!2477) lt!150421) (not (undefined!3289 lt!150421)) (bvslt (x!30354 lt!150421) #b01111111111111111111111111111110) (bvsge (x!30354 lt!150421) #b00000000000000000000000000000000) (bvsge (x!30354 lt!150421) #b00000000000000000000000000000000)))))

(assert (=> b!304928 (=> (not res!162333) (not e!191520))))

(declare-fun b!304927 () Bool)

(assert (=> b!304927 (= e!191518 (Intermediate!2477 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!67963 () Bool)

(assert (=> d!67963 e!191519))

(declare-fun c!48898 () Bool)

(assert (=> d!67963 (= c!48898 (and ((_ is Intermediate!2477) lt!150421) (undefined!3289 lt!150421)))))

(assert (=> d!67963 (= lt!150421 e!191518)))

(declare-fun c!48896 () Bool)

(assert (=> d!67963 (= c!48896 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67963 (= lt!150420 (select (arr!7338 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!67963 (validMask!0 mask!3709)))

(assert (=> d!67963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150421)))

(assert (= (and d!67963 c!48896) b!304927))

(assert (= (and d!67963 (not c!48896)) b!304921))

(assert (= (and b!304921 c!48897) b!304924))

(assert (= (and b!304921 (not c!48897)) b!304922))

(assert (= (and d!67963 c!48898) b!304920))

(assert (= (and d!67963 (not c!48898)) b!304928))

(assert (= (and b!304928 res!162333) b!304923))

(assert (= (and b!304923 (not res!162331)) b!304925))

(assert (= (and b!304925 (not res!162332)) b!304926))

(declare-fun m!315479 () Bool)

(assert (=> b!304926 m!315479))

(assert (=> b!304923 m!315479))

(assert (=> d!67963 m!315345))

(declare-fun m!315481 () Bool)

(assert (=> d!67963 m!315481))

(assert (=> d!67963 m!315357))

(assert (=> b!304922 m!315345))

(declare-fun m!315483 () Bool)

(assert (=> b!304922 m!315483))

(assert (=> b!304922 m!315483))

(declare-fun m!315485 () Bool)

(assert (=> b!304922 m!315485))

(assert (=> b!304925 m!315479))

(assert (=> b!304729 d!67963))

(declare-fun d!67965 () Bool)

(declare-fun lt!150430 () (_ BitVec 32))

(declare-fun lt!150429 () (_ BitVec 32))

(assert (=> d!67965 (= lt!150430 (bvmul (bvxor lt!150429 (bvlshr lt!150429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67965 (= lt!150429 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67965 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!162334 (let ((h!5307 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30364 (bvmul (bvxor h!5307 (bvlshr h!5307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30364 (bvlshr x!30364 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!162334 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!162334 #b00000000000000000000000000000000))))))

(assert (=> d!67965 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150430 (bvlshr lt!150430 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!304729 d!67965))

(declare-fun b!304993 () Bool)

(declare-fun e!191562 () SeekEntryResult!2477)

(declare-fun e!191563 () SeekEntryResult!2477)

(assert (=> b!304993 (= e!191562 e!191563)))

(declare-fun lt!150457 () (_ BitVec 64))

(declare-fun lt!150456 () SeekEntryResult!2477)

(assert (=> b!304993 (= lt!150457 (select (arr!7338 a!3293) (index!12086 lt!150456)))))

(declare-fun c!48924 () Bool)

(assert (=> b!304993 (= c!48924 (= lt!150457 k0!2441))))

(declare-fun b!304994 () Bool)

(declare-fun e!191561 () SeekEntryResult!2477)

(assert (=> b!304994 (= e!191561 (MissingZero!2477 (index!12086 lt!150456)))))

(declare-fun b!304995 () Bool)

(assert (=> b!304995 (= e!191562 Undefined!2477)))

(declare-fun b!304996 () Bool)

(declare-fun c!48925 () Bool)

(assert (=> b!304996 (= c!48925 (= lt!150457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304996 (= e!191563 e!191561)))

(declare-fun d!67971 () Bool)

(declare-fun lt!150455 () SeekEntryResult!2477)

(assert (=> d!67971 (and (or ((_ is Undefined!2477) lt!150455) (not ((_ is Found!2477) lt!150455)) (and (bvsge (index!12085 lt!150455) #b00000000000000000000000000000000) (bvslt (index!12085 lt!150455) (size!7691 a!3293)))) (or ((_ is Undefined!2477) lt!150455) ((_ is Found!2477) lt!150455) (not ((_ is MissingZero!2477) lt!150455)) (and (bvsge (index!12084 lt!150455) #b00000000000000000000000000000000) (bvslt (index!12084 lt!150455) (size!7691 a!3293)))) (or ((_ is Undefined!2477) lt!150455) ((_ is Found!2477) lt!150455) ((_ is MissingZero!2477) lt!150455) (not ((_ is MissingVacant!2477) lt!150455)) (and (bvsge (index!12087 lt!150455) #b00000000000000000000000000000000) (bvslt (index!12087 lt!150455) (size!7691 a!3293)))) (or ((_ is Undefined!2477) lt!150455) (ite ((_ is Found!2477) lt!150455) (= (select (arr!7338 a!3293) (index!12085 lt!150455)) k0!2441) (ite ((_ is MissingZero!2477) lt!150455) (= (select (arr!7338 a!3293) (index!12084 lt!150455)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2477) lt!150455) (= (select (arr!7338 a!3293) (index!12087 lt!150455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67971 (= lt!150455 e!191562)))

(declare-fun c!48926 () Bool)

(assert (=> d!67971 (= c!48926 (and ((_ is Intermediate!2477) lt!150456) (undefined!3289 lt!150456)))))

(assert (=> d!67971 (= lt!150456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67971 (validMask!0 mask!3709)))

(assert (=> d!67971 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150455)))

(declare-fun b!304997 () Bool)

(assert (=> b!304997 (= e!191563 (Found!2477 (index!12086 lt!150456)))))

(declare-fun b!304998 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15503 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!304998 (= e!191561 (seekKeyOrZeroReturnVacant!0 (x!30354 lt!150456) (index!12086 lt!150456) (index!12086 lt!150456) k0!2441 a!3293 mask!3709))))

(assert (= (and d!67971 c!48926) b!304995))

(assert (= (and d!67971 (not c!48926)) b!304993))

(assert (= (and b!304993 c!48924) b!304997))

(assert (= (and b!304993 (not c!48924)) b!304996))

(assert (= (and b!304996 c!48925) b!304994))

(assert (= (and b!304996 (not c!48925)) b!304998))

(declare-fun m!315525 () Bool)

(assert (=> b!304993 m!315525))

(assert (=> d!67971 m!315345))

(assert (=> d!67971 m!315347))

(assert (=> d!67971 m!315357))

(declare-fun m!315527 () Bool)

(assert (=> d!67971 m!315527))

(declare-fun m!315529 () Bool)

(assert (=> d!67971 m!315529))

(assert (=> d!67971 m!315345))

(declare-fun m!315531 () Bool)

(assert (=> d!67971 m!315531))

(declare-fun m!315533 () Bool)

(assert (=> b!304998 m!315533))

(assert (=> b!304724 d!67971))

(declare-fun d!67985 () Bool)

(assert (=> d!67985 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304725 d!67985))

(check-sat (not b!304919) (not b!304922) (not d!67971) (not d!67957) (not b!304844) (not d!67963) (not d!67933) (not d!67959) (not bm!25874) (not b!304998) (not b!304894) (not b!304895) (not b!304899))
(check-sat)
