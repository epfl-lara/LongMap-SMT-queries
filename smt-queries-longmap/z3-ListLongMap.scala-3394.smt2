; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46764 () Bool)

(assert start!46764)

(declare-fun b!516396 () Bool)

(declare-fun res!316108 () Bool)

(declare-fun e!301334 () Bool)

(assert (=> b!516396 (=> (not res!316108) (not e!301334))))

(declare-datatypes ((array!33086 0))(
  ( (array!33087 (arr!15911 (Array (_ BitVec 32) (_ BitVec 64))) (size!16276 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33086)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33086 (_ BitVec 32)) Bool)

(assert (=> b!516396 (= res!316108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516397 () Bool)

(declare-fun res!316104 () Bool)

(declare-fun e!301335 () Bool)

(assert (=> b!516397 (=> (not res!316104) (not e!301335))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516397 (= res!316104 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516398 () Bool)

(declare-fun res!316111 () Bool)

(assert (=> b!516398 (=> (not res!316111) (not e!301335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516398 (= res!316111 (validKeyInArray!0 k0!2280))))

(declare-fun b!516399 () Bool)

(declare-fun e!301332 () Bool)

(assert (=> b!516399 (= e!301334 (not e!301332))))

(declare-fun res!316103 () Bool)

(assert (=> b!516399 (=> res!316103 e!301332)))

(declare-fun lt!236287 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4375 0))(
  ( (MissingZero!4375 (index!19688 (_ BitVec 32))) (Found!4375 (index!19689 (_ BitVec 32))) (Intermediate!4375 (undefined!5187 Bool) (index!19690 (_ BitVec 32)) (x!48653 (_ BitVec 32))) (Undefined!4375) (MissingVacant!4375 (index!19691 (_ BitVec 32))) )
))
(declare-fun lt!236286 () SeekEntryResult!4375)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33086 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!516399 (= res!316103 (= lt!236286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236287 (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)) mask!3524)))))

(declare-fun lt!236290 () (_ BitVec 32))

(assert (=> b!516399 (= lt!236286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236290 (select (arr!15911 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516399 (= lt!236287 (toIndex!0 (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516399 (= lt!236290 (toIndex!0 (select (arr!15911 a!3235) j!176) mask!3524))))

(declare-fun e!301333 () Bool)

(assert (=> b!516399 e!301333))

(declare-fun res!316106 () Bool)

(assert (=> b!516399 (=> (not res!316106) (not e!301333))))

(assert (=> b!516399 (= res!316106 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15994 0))(
  ( (Unit!15995) )
))
(declare-fun lt!236288 () Unit!15994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15994)

(assert (=> b!516399 (= lt!236288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516400 () Bool)

(assert (=> b!516400 (= e!301332 (or (not (= (select (arr!15911 a!3235) (index!19690 lt!236286)) (select (arr!15911 a!3235) j!176))) (bvsgt (x!48653 lt!236286) #b01111111111111111111111111111110) (bvsle #b00000000000000000000000000000000 (x!48653 lt!236286))))))

(assert (=> b!516400 (and (bvslt (x!48653 lt!236286) #b01111111111111111111111111111110) (or (= (select (arr!15911 a!3235) (index!19690 lt!236286)) (select (arr!15911 a!3235) j!176)) (= (select (arr!15911 a!3235) (index!19690 lt!236286)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15911 a!3235) (index!19690 lt!236286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516401 () Bool)

(declare-fun res!316107 () Bool)

(assert (=> b!516401 (=> (not res!316107) (not e!301335))))

(assert (=> b!516401 (= res!316107 (and (= (size!16276 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16276 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16276 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516402 () Bool)

(declare-fun res!316102 () Bool)

(assert (=> b!516402 (=> (not res!316102) (not e!301335))))

(assert (=> b!516402 (= res!316102 (validKeyInArray!0 (select (arr!15911 a!3235) j!176)))))

(declare-fun b!516403 () Bool)

(assert (=> b!516403 (= e!301335 e!301334)))

(declare-fun res!316110 () Bool)

(assert (=> b!516403 (=> (not res!316110) (not e!301334))))

(declare-fun lt!236289 () SeekEntryResult!4375)

(assert (=> b!516403 (= res!316110 (or (= lt!236289 (MissingZero!4375 i!1204)) (= lt!236289 (MissingVacant!4375 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33086 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!516403 (= lt!236289 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516405 () Bool)

(assert (=> b!516405 (= e!301333 (= (seekEntryOrOpen!0 (select (arr!15911 a!3235) j!176) a!3235 mask!3524) (Found!4375 j!176)))))

(declare-fun b!516406 () Bool)

(declare-fun res!316112 () Bool)

(assert (=> b!516406 (=> res!316112 e!301332)))

(get-info :version)

(assert (=> b!516406 (= res!316112 (or (undefined!5187 lt!236286) (not ((_ is Intermediate!4375) lt!236286))))))

(declare-fun res!316105 () Bool)

(assert (=> start!46764 (=> (not res!316105) (not e!301335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46764 (= res!316105 (validMask!0 mask!3524))))

(assert (=> start!46764 e!301335))

(assert (=> start!46764 true))

(declare-fun array_inv!11794 (array!33086) Bool)

(assert (=> start!46764 (array_inv!11794 a!3235)))

(declare-fun b!516404 () Bool)

(declare-fun res!316109 () Bool)

(assert (=> b!516404 (=> (not res!316109) (not e!301334))))

(declare-datatypes ((List!10108 0))(
  ( (Nil!10105) (Cons!10104 (h!11002 (_ BitVec 64)) (t!16327 List!10108)) )
))
(declare-fun arrayNoDuplicates!0 (array!33086 (_ BitVec 32) List!10108) Bool)

(assert (=> b!516404 (= res!316109 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10105))))

(assert (= (and start!46764 res!316105) b!516401))

(assert (= (and b!516401 res!316107) b!516402))

(assert (= (and b!516402 res!316102) b!516398))

(assert (= (and b!516398 res!316111) b!516397))

(assert (= (and b!516397 res!316104) b!516403))

(assert (= (and b!516403 res!316110) b!516396))

(assert (= (and b!516396 res!316108) b!516404))

(assert (= (and b!516404 res!316109) b!516399))

(assert (= (and b!516399 res!316106) b!516405))

(assert (= (and b!516399 (not res!316103)) b!516406))

(assert (= (and b!516406 (not res!316112)) b!516400))

(declare-fun m!497437 () Bool)

(assert (=> b!516405 m!497437))

(assert (=> b!516405 m!497437))

(declare-fun m!497439 () Bool)

(assert (=> b!516405 m!497439))

(declare-fun m!497441 () Bool)

(assert (=> start!46764 m!497441))

(declare-fun m!497443 () Bool)

(assert (=> start!46764 m!497443))

(declare-fun m!497445 () Bool)

(assert (=> b!516397 m!497445))

(declare-fun m!497447 () Bool)

(assert (=> b!516398 m!497447))

(declare-fun m!497449 () Bool)

(assert (=> b!516403 m!497449))

(declare-fun m!497451 () Bool)

(assert (=> b!516404 m!497451))

(assert (=> b!516402 m!497437))

(assert (=> b!516402 m!497437))

(declare-fun m!497453 () Bool)

(assert (=> b!516402 m!497453))

(declare-fun m!497455 () Bool)

(assert (=> b!516396 m!497455))

(declare-fun m!497457 () Bool)

(assert (=> b!516400 m!497457))

(assert (=> b!516400 m!497437))

(declare-fun m!497459 () Bool)

(assert (=> b!516399 m!497459))

(declare-fun m!497461 () Bool)

(assert (=> b!516399 m!497461))

(declare-fun m!497463 () Bool)

(assert (=> b!516399 m!497463))

(assert (=> b!516399 m!497463))

(declare-fun m!497465 () Bool)

(assert (=> b!516399 m!497465))

(assert (=> b!516399 m!497437))

(declare-fun m!497467 () Bool)

(assert (=> b!516399 m!497467))

(assert (=> b!516399 m!497437))

(declare-fun m!497469 () Bool)

(assert (=> b!516399 m!497469))

(assert (=> b!516399 m!497463))

(declare-fun m!497471 () Bool)

(assert (=> b!516399 m!497471))

(assert (=> b!516399 m!497437))

(declare-fun m!497473 () Bool)

(assert (=> b!516399 m!497473))

(check-sat (not b!516399) (not b!516403) (not b!516404) (not b!516396) (not start!46764) (not b!516397) (not b!516398) (not b!516402) (not b!516405))
(check-sat)
(get-model)

(declare-fun d!79371 () Bool)

(assert (=> d!79371 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516398 d!79371))

(declare-fun b!516485 () Bool)

(declare-fun lt!236328 () SeekEntryResult!4375)

(declare-fun e!301372 () SeekEntryResult!4375)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33086 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!516485 (= e!301372 (seekKeyOrZeroReturnVacant!0 (x!48653 lt!236328) (index!19690 lt!236328) (index!19690 lt!236328) k0!2280 a!3235 mask!3524))))

(declare-fun b!516486 () Bool)

(declare-fun e!301373 () SeekEntryResult!4375)

(assert (=> b!516486 (= e!301373 Undefined!4375)))

(declare-fun b!516487 () Bool)

(declare-fun e!301374 () SeekEntryResult!4375)

(assert (=> b!516487 (= e!301374 (Found!4375 (index!19690 lt!236328)))))

(declare-fun d!79373 () Bool)

(declare-fun lt!236329 () SeekEntryResult!4375)

(assert (=> d!79373 (and (or ((_ is Undefined!4375) lt!236329) (not ((_ is Found!4375) lt!236329)) (and (bvsge (index!19689 lt!236329) #b00000000000000000000000000000000) (bvslt (index!19689 lt!236329) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236329) ((_ is Found!4375) lt!236329) (not ((_ is MissingZero!4375) lt!236329)) (and (bvsge (index!19688 lt!236329) #b00000000000000000000000000000000) (bvslt (index!19688 lt!236329) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236329) ((_ is Found!4375) lt!236329) ((_ is MissingZero!4375) lt!236329) (not ((_ is MissingVacant!4375) lt!236329)) (and (bvsge (index!19691 lt!236329) #b00000000000000000000000000000000) (bvslt (index!19691 lt!236329) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236329) (ite ((_ is Found!4375) lt!236329) (= (select (arr!15911 a!3235) (index!19689 lt!236329)) k0!2280) (ite ((_ is MissingZero!4375) lt!236329) (= (select (arr!15911 a!3235) (index!19688 lt!236329)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4375) lt!236329) (= (select (arr!15911 a!3235) (index!19691 lt!236329)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79373 (= lt!236329 e!301373)))

(declare-fun c!60443 () Bool)

(assert (=> d!79373 (= c!60443 (and ((_ is Intermediate!4375) lt!236328) (undefined!5187 lt!236328)))))

(assert (=> d!79373 (= lt!236328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79373 (validMask!0 mask!3524)))

(assert (=> d!79373 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236329)))

(declare-fun b!516488 () Bool)

(assert (=> b!516488 (= e!301372 (MissingZero!4375 (index!19690 lt!236328)))))

(declare-fun b!516489 () Bool)

(declare-fun c!60444 () Bool)

(declare-fun lt!236327 () (_ BitVec 64))

(assert (=> b!516489 (= c!60444 (= lt!236327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516489 (= e!301374 e!301372)))

(declare-fun b!516490 () Bool)

(assert (=> b!516490 (= e!301373 e!301374)))

(assert (=> b!516490 (= lt!236327 (select (arr!15911 a!3235) (index!19690 lt!236328)))))

(declare-fun c!60442 () Bool)

(assert (=> b!516490 (= c!60442 (= lt!236327 k0!2280))))

(assert (= (and d!79373 c!60443) b!516486))

(assert (= (and d!79373 (not c!60443)) b!516490))

(assert (= (and b!516490 c!60442) b!516487))

(assert (= (and b!516490 (not c!60442)) b!516489))

(assert (= (and b!516489 c!60444) b!516488))

(assert (= (and b!516489 (not c!60444)) b!516485))

(declare-fun m!497551 () Bool)

(assert (=> b!516485 m!497551))

(declare-fun m!497553 () Bool)

(assert (=> d!79373 m!497553))

(declare-fun m!497555 () Bool)

(assert (=> d!79373 m!497555))

(assert (=> d!79373 m!497441))

(declare-fun m!497557 () Bool)

(assert (=> d!79373 m!497557))

(assert (=> d!79373 m!497557))

(declare-fun m!497559 () Bool)

(assert (=> d!79373 m!497559))

(declare-fun m!497561 () Bool)

(assert (=> d!79373 m!497561))

(declare-fun m!497563 () Bool)

(assert (=> b!516490 m!497563))

(assert (=> b!516403 d!79373))

(declare-fun d!79375 () Bool)

(assert (=> d!79375 (= (validKeyInArray!0 (select (arr!15911 a!3235) j!176)) (and (not (= (select (arr!15911 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15911 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516402 d!79375))

(declare-fun d!79377 () Bool)

(declare-fun res!316183 () Bool)

(declare-fun e!301379 () Bool)

(assert (=> d!79377 (=> res!316183 e!301379)))

(assert (=> d!79377 (= res!316183 (= (select (arr!15911 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79377 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301379)))

(declare-fun b!516495 () Bool)

(declare-fun e!301380 () Bool)

(assert (=> b!516495 (= e!301379 e!301380)))

(declare-fun res!316184 () Bool)

(assert (=> b!516495 (=> (not res!316184) (not e!301380))))

(assert (=> b!516495 (= res!316184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16276 a!3235)))))

(declare-fun b!516496 () Bool)

(assert (=> b!516496 (= e!301380 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79377 (not res!316183)) b!516495))

(assert (= (and b!516495 res!316184) b!516496))

(declare-fun m!497565 () Bool)

(assert (=> d!79377 m!497565))

(declare-fun m!497567 () Bool)

(assert (=> b!516496 m!497567))

(assert (=> b!516397 d!79377))

(declare-fun b!516505 () Bool)

(declare-fun e!301387 () Bool)

(declare-fun e!301388 () Bool)

(assert (=> b!516505 (= e!301387 e!301388)))

(declare-fun c!60447 () Bool)

(assert (=> b!516505 (= c!60447 (validKeyInArray!0 (select (arr!15911 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516506 () Bool)

(declare-fun e!301389 () Bool)

(declare-fun call!31618 () Bool)

(assert (=> b!516506 (= e!301389 call!31618)))

(declare-fun d!79379 () Bool)

(declare-fun res!316189 () Bool)

(assert (=> d!79379 (=> res!316189 e!301387)))

(assert (=> d!79379 (= res!316189 (bvsge #b00000000000000000000000000000000 (size!16276 a!3235)))))

(assert (=> d!79379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301387)))

(declare-fun b!516507 () Bool)

(assert (=> b!516507 (= e!301388 e!301389)))

(declare-fun lt!236336 () (_ BitVec 64))

(assert (=> b!516507 (= lt!236336 (select (arr!15911 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236338 () Unit!15994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33086 (_ BitVec 64) (_ BitVec 32)) Unit!15994)

(assert (=> b!516507 (= lt!236338 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236336 #b00000000000000000000000000000000))))

(assert (=> b!516507 (arrayContainsKey!0 a!3235 lt!236336 #b00000000000000000000000000000000)))

(declare-fun lt!236337 () Unit!15994)

(assert (=> b!516507 (= lt!236337 lt!236338)))

(declare-fun res!316190 () Bool)

(assert (=> b!516507 (= res!316190 (= (seekEntryOrOpen!0 (select (arr!15911 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4375 #b00000000000000000000000000000000)))))

(assert (=> b!516507 (=> (not res!316190) (not e!301389))))

(declare-fun bm!31615 () Bool)

(assert (=> bm!31615 (= call!31618 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516508 () Bool)

(assert (=> b!516508 (= e!301388 call!31618)))

(assert (= (and d!79379 (not res!316189)) b!516505))

(assert (= (and b!516505 c!60447) b!516507))

(assert (= (and b!516505 (not c!60447)) b!516508))

(assert (= (and b!516507 res!316190) b!516506))

(assert (= (or b!516506 b!516508) bm!31615))

(assert (=> b!516505 m!497565))

(assert (=> b!516505 m!497565))

(declare-fun m!497569 () Bool)

(assert (=> b!516505 m!497569))

(assert (=> b!516507 m!497565))

(declare-fun m!497571 () Bool)

(assert (=> b!516507 m!497571))

(declare-fun m!497573 () Bool)

(assert (=> b!516507 m!497573))

(assert (=> b!516507 m!497565))

(declare-fun m!497575 () Bool)

(assert (=> b!516507 m!497575))

(declare-fun m!497577 () Bool)

(assert (=> bm!31615 m!497577))

(assert (=> b!516396 d!79379))

(declare-fun d!79383 () Bool)

(assert (=> d!79383 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46764 d!79383))

(declare-fun d!79389 () Bool)

(assert (=> d!79389 (= (array_inv!11794 a!3235) (bvsge (size!16276 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46764 d!79389))

(declare-fun lt!236344 () SeekEntryResult!4375)

(declare-fun b!516509 () Bool)

(declare-fun e!301390 () SeekEntryResult!4375)

(assert (=> b!516509 (= e!301390 (seekKeyOrZeroReturnVacant!0 (x!48653 lt!236344) (index!19690 lt!236344) (index!19690 lt!236344) (select (arr!15911 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516510 () Bool)

(declare-fun e!301391 () SeekEntryResult!4375)

(assert (=> b!516510 (= e!301391 Undefined!4375)))

(declare-fun b!516511 () Bool)

(declare-fun e!301392 () SeekEntryResult!4375)

(assert (=> b!516511 (= e!301392 (Found!4375 (index!19690 lt!236344)))))

(declare-fun d!79391 () Bool)

(declare-fun lt!236345 () SeekEntryResult!4375)

(assert (=> d!79391 (and (or ((_ is Undefined!4375) lt!236345) (not ((_ is Found!4375) lt!236345)) (and (bvsge (index!19689 lt!236345) #b00000000000000000000000000000000) (bvslt (index!19689 lt!236345) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236345) ((_ is Found!4375) lt!236345) (not ((_ is MissingZero!4375) lt!236345)) (and (bvsge (index!19688 lt!236345) #b00000000000000000000000000000000) (bvslt (index!19688 lt!236345) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236345) ((_ is Found!4375) lt!236345) ((_ is MissingZero!4375) lt!236345) (not ((_ is MissingVacant!4375) lt!236345)) (and (bvsge (index!19691 lt!236345) #b00000000000000000000000000000000) (bvslt (index!19691 lt!236345) (size!16276 a!3235)))) (or ((_ is Undefined!4375) lt!236345) (ite ((_ is Found!4375) lt!236345) (= (select (arr!15911 a!3235) (index!19689 lt!236345)) (select (arr!15911 a!3235) j!176)) (ite ((_ is MissingZero!4375) lt!236345) (= (select (arr!15911 a!3235) (index!19688 lt!236345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4375) lt!236345) (= (select (arr!15911 a!3235) (index!19691 lt!236345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79391 (= lt!236345 e!301391)))

(declare-fun c!60449 () Bool)

(assert (=> d!79391 (= c!60449 (and ((_ is Intermediate!4375) lt!236344) (undefined!5187 lt!236344)))))

(assert (=> d!79391 (= lt!236344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15911 a!3235) j!176) mask!3524) (select (arr!15911 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79391 (validMask!0 mask!3524)))

(assert (=> d!79391 (= (seekEntryOrOpen!0 (select (arr!15911 a!3235) j!176) a!3235 mask!3524) lt!236345)))

(declare-fun b!516512 () Bool)

(assert (=> b!516512 (= e!301390 (MissingZero!4375 (index!19690 lt!236344)))))

(declare-fun b!516513 () Bool)

(declare-fun c!60450 () Bool)

(declare-fun lt!236343 () (_ BitVec 64))

(assert (=> b!516513 (= c!60450 (= lt!236343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516513 (= e!301392 e!301390)))

(declare-fun b!516514 () Bool)

(assert (=> b!516514 (= e!301391 e!301392)))

(assert (=> b!516514 (= lt!236343 (select (arr!15911 a!3235) (index!19690 lt!236344)))))

(declare-fun c!60448 () Bool)

(assert (=> b!516514 (= c!60448 (= lt!236343 (select (arr!15911 a!3235) j!176)))))

(assert (= (and d!79391 c!60449) b!516510))

(assert (= (and d!79391 (not c!60449)) b!516514))

(assert (= (and b!516514 c!60448) b!516511))

(assert (= (and b!516514 (not c!60448)) b!516513))

(assert (= (and b!516513 c!60450) b!516512))

(assert (= (and b!516513 (not c!60450)) b!516509))

(assert (=> b!516509 m!497437))

(declare-fun m!497579 () Bool)

(assert (=> b!516509 m!497579))

(declare-fun m!497581 () Bool)

(assert (=> d!79391 m!497581))

(declare-fun m!497583 () Bool)

(assert (=> d!79391 m!497583))

(assert (=> d!79391 m!497441))

(assert (=> d!79391 m!497437))

(assert (=> d!79391 m!497467))

(assert (=> d!79391 m!497467))

(assert (=> d!79391 m!497437))

(declare-fun m!497585 () Bool)

(assert (=> d!79391 m!497585))

(declare-fun m!497587 () Bool)

(assert (=> d!79391 m!497587))

(declare-fun m!497589 () Bool)

(assert (=> b!516514 m!497589))

(assert (=> b!516405 d!79391))

(declare-fun b!516543 () Bool)

(declare-fun e!301410 () Bool)

(declare-fun e!301412 () Bool)

(assert (=> b!516543 (= e!301410 e!301412)))

(declare-fun res!316198 () Bool)

(assert (=> b!516543 (=> (not res!316198) (not e!301412))))

(declare-fun e!301413 () Bool)

(assert (=> b!516543 (= res!316198 (not e!301413))))

(declare-fun res!316197 () Bool)

(assert (=> b!516543 (=> (not res!316197) (not e!301413))))

(assert (=> b!516543 (= res!316197 (validKeyInArray!0 (select (arr!15911 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79393 () Bool)

(declare-fun res!316199 () Bool)

(assert (=> d!79393 (=> res!316199 e!301410)))

(assert (=> d!79393 (= res!316199 (bvsge #b00000000000000000000000000000000 (size!16276 a!3235)))))

(assert (=> d!79393 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10105) e!301410)))

(declare-fun b!516544 () Bool)

(declare-fun contains!2726 (List!10108 (_ BitVec 64)) Bool)

(assert (=> b!516544 (= e!301413 (contains!2726 Nil!10105 (select (arr!15911 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31618 () Bool)

(declare-fun call!31621 () Bool)

(declare-fun c!60462 () Bool)

(assert (=> bm!31618 (= call!31621 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60462 (Cons!10104 (select (arr!15911 a!3235) #b00000000000000000000000000000000) Nil!10105) Nil!10105)))))

(declare-fun b!516545 () Bool)

(declare-fun e!301411 () Bool)

(assert (=> b!516545 (= e!301411 call!31621)))

(declare-fun b!516546 () Bool)

(assert (=> b!516546 (= e!301412 e!301411)))

(assert (=> b!516546 (= c!60462 (validKeyInArray!0 (select (arr!15911 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516547 () Bool)

(assert (=> b!516547 (= e!301411 call!31621)))

(assert (= (and d!79393 (not res!316199)) b!516543))

(assert (= (and b!516543 res!316197) b!516544))

(assert (= (and b!516543 res!316198) b!516546))

(assert (= (and b!516546 c!60462) b!516545))

(assert (= (and b!516546 (not c!60462)) b!516547))

(assert (= (or b!516545 b!516547) bm!31618))

(assert (=> b!516543 m!497565))

(assert (=> b!516543 m!497565))

(assert (=> b!516543 m!497569))

(assert (=> b!516544 m!497565))

(assert (=> b!516544 m!497565))

(declare-fun m!497603 () Bool)

(assert (=> b!516544 m!497603))

(assert (=> bm!31618 m!497565))

(declare-fun m!497605 () Bool)

(assert (=> bm!31618 m!497605))

(assert (=> b!516546 m!497565))

(assert (=> b!516546 m!497565))

(assert (=> b!516546 m!497569))

(assert (=> b!516404 d!79393))

(declare-fun d!79397 () Bool)

(declare-fun lt!236365 () (_ BitVec 32))

(declare-fun lt!236364 () (_ BitVec 32))

(assert (=> d!79397 (= lt!236365 (bvmul (bvxor lt!236364 (bvlshr lt!236364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79397 (= lt!236364 ((_ extract 31 0) (bvand (bvxor (select (arr!15911 a!3235) j!176) (bvlshr (select (arr!15911 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79397 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316200 (let ((h!11005 ((_ extract 31 0) (bvand (bvxor (select (arr!15911 a!3235) j!176) (bvlshr (select (arr!15911 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48656 (bvmul (bvxor h!11005 (bvlshr h!11005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48656 (bvlshr x!48656 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316200 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316200 #b00000000000000000000000000000000))))))

(assert (=> d!79397 (= (toIndex!0 (select (arr!15911 a!3235) j!176) mask!3524) (bvand (bvxor lt!236365 (bvlshr lt!236365 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516399 d!79397))

(declare-fun b!516581 () Bool)

(declare-fun e!301435 () Bool)

(declare-fun e!301436 () Bool)

(assert (=> b!516581 (= e!301435 e!301436)))

(declare-fun c!60475 () Bool)

(assert (=> b!516581 (= c!60475 (validKeyInArray!0 (select (arr!15911 a!3235) j!176)))))

(declare-fun b!516582 () Bool)

(declare-fun e!301437 () Bool)

(declare-fun call!31625 () Bool)

(assert (=> b!516582 (= e!301437 call!31625)))

(declare-fun d!79401 () Bool)

(declare-fun res!316210 () Bool)

(assert (=> d!79401 (=> res!316210 e!301435)))

(assert (=> d!79401 (= res!316210 (bvsge j!176 (size!16276 a!3235)))))

(assert (=> d!79401 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301435)))

(declare-fun b!516583 () Bool)

(assert (=> b!516583 (= e!301436 e!301437)))

(declare-fun lt!236366 () (_ BitVec 64))

(assert (=> b!516583 (= lt!236366 (select (arr!15911 a!3235) j!176))))

(declare-fun lt!236368 () Unit!15994)

(assert (=> b!516583 (= lt!236368 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236366 j!176))))

(assert (=> b!516583 (arrayContainsKey!0 a!3235 lt!236366 #b00000000000000000000000000000000)))

(declare-fun lt!236367 () Unit!15994)

(assert (=> b!516583 (= lt!236367 lt!236368)))

(declare-fun res!316211 () Bool)

(assert (=> b!516583 (= res!316211 (= (seekEntryOrOpen!0 (select (arr!15911 a!3235) j!176) a!3235 mask!3524) (Found!4375 j!176)))))

(assert (=> b!516583 (=> (not res!316211) (not e!301437))))

(declare-fun bm!31622 () Bool)

(assert (=> bm!31622 (= call!31625 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516584 () Bool)

(assert (=> b!516584 (= e!301436 call!31625)))

(assert (= (and d!79401 (not res!316210)) b!516581))

(assert (= (and b!516581 c!60475) b!516583))

(assert (= (and b!516581 (not c!60475)) b!516584))

(assert (= (and b!516583 res!316211) b!516582))

(assert (= (or b!516582 b!516584) bm!31622))

(assert (=> b!516581 m!497437))

(assert (=> b!516581 m!497437))

(assert (=> b!516581 m!497453))

(assert (=> b!516583 m!497437))

(declare-fun m!497629 () Bool)

(assert (=> b!516583 m!497629))

(declare-fun m!497631 () Bool)

(assert (=> b!516583 m!497631))

(assert (=> b!516583 m!497437))

(assert (=> b!516583 m!497439))

(declare-fun m!497633 () Bool)

(assert (=> bm!31622 m!497633))

(assert (=> b!516399 d!79401))

(declare-fun b!516646 () Bool)

(declare-fun e!301483 () Bool)

(declare-fun e!301485 () Bool)

(assert (=> b!516646 (= e!301483 e!301485)))

(declare-fun res!316243 () Bool)

(declare-fun lt!236386 () SeekEntryResult!4375)

(assert (=> b!516646 (= res!316243 (and ((_ is Intermediate!4375) lt!236386) (not (undefined!5187 lt!236386)) (bvslt (x!48653 lt!236386) #b01111111111111111111111111111110) (bvsge (x!48653 lt!236386) #b00000000000000000000000000000000) (bvsge (x!48653 lt!236386) #b00000000000000000000000000000000)))))

(assert (=> b!516646 (=> (not res!316243) (not e!301485))))

(declare-fun b!516647 () Bool)

(assert (=> b!516647 (= e!301483 (bvsge (x!48653 lt!236386) #b01111111111111111111111111111110))))

(declare-fun b!516648 () Bool)

(assert (=> b!516648 (and (bvsge (index!19690 lt!236386) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236386) (size!16276 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)))))))

(declare-fun res!316244 () Bool)

(assert (=> b!516648 (= res!316244 (= (select (arr!15911 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235))) (index!19690 lt!236386)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301482 () Bool)

(assert (=> b!516648 (=> res!316244 e!301482)))

(declare-fun b!516649 () Bool)

(assert (=> b!516649 (and (bvsge (index!19690 lt!236386) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236386) (size!16276 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)))))))

(declare-fun res!316245 () Bool)

(assert (=> b!516649 (= res!316245 (= (select (arr!15911 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235))) (index!19690 lt!236386)) (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!516649 (=> res!316245 e!301482)))

(assert (=> b!516649 (= e!301485 e!301482)))

(declare-fun b!516650 () Bool)

(declare-fun e!301486 () SeekEntryResult!4375)

(assert (=> b!516650 (= e!301486 (Intermediate!4375 true lt!236287 #b00000000000000000000000000000000))))

(declare-fun b!516651 () Bool)

(declare-fun e!301484 () SeekEntryResult!4375)

(assert (=> b!516651 (= e!301486 e!301484)))

(declare-fun c!60491 () Bool)

(declare-fun lt!236385 () (_ BitVec 64))

(assert (=> b!516651 (= c!60491 (or (= lt!236385 (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236385 lt!236385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516652 () Bool)

(assert (=> b!516652 (and (bvsge (index!19690 lt!236386) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236386) (size!16276 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)))))))

(assert (=> b!516652 (= e!301482 (= (select (arr!15911 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235))) (index!19690 lt!236386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79405 () Bool)

(assert (=> d!79405 e!301483))

(declare-fun c!60493 () Bool)

(assert (=> d!79405 (= c!60493 (and ((_ is Intermediate!4375) lt!236386) (undefined!5187 lt!236386)))))

(assert (=> d!79405 (= lt!236386 e!301486)))

(declare-fun c!60492 () Bool)

(assert (=> d!79405 (= c!60492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79405 (= lt!236385 (select (arr!15911 (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235))) lt!236287))))

(assert (=> d!79405 (validMask!0 mask!3524)))

(assert (=> d!79405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236287 (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)) mask!3524) lt!236386)))

(declare-fun b!516653 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516653 (= e!301484 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236287 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) (array!33087 (store (arr!15911 a!3235) i!1204 k0!2280) (size!16276 a!3235)) mask!3524))))

(declare-fun b!516654 () Bool)

(assert (=> b!516654 (= e!301484 (Intermediate!4375 false lt!236287 #b00000000000000000000000000000000))))

(assert (= (and d!79405 c!60492) b!516650))

(assert (= (and d!79405 (not c!60492)) b!516651))

(assert (= (and b!516651 c!60491) b!516654))

(assert (= (and b!516651 (not c!60491)) b!516653))

(assert (= (and d!79405 c!60493) b!516647))

(assert (= (and d!79405 (not c!60493)) b!516646))

(assert (= (and b!516646 res!316243) b!516649))

(assert (= (and b!516649 (not res!316245)) b!516648))

(assert (= (and b!516648 (not res!316244)) b!516652))

(declare-fun m!497665 () Bool)

(assert (=> b!516652 m!497665))

(assert (=> b!516649 m!497665))

(declare-fun m!497667 () Bool)

(assert (=> d!79405 m!497667))

(assert (=> d!79405 m!497441))

(declare-fun m!497669 () Bool)

(assert (=> b!516653 m!497669))

(assert (=> b!516653 m!497669))

(assert (=> b!516653 m!497463))

(declare-fun m!497671 () Bool)

(assert (=> b!516653 m!497671))

(assert (=> b!516648 m!497665))

(assert (=> b!516399 d!79405))

(declare-fun d!79427 () Bool)

(declare-fun lt!236391 () (_ BitVec 32))

(declare-fun lt!236390 () (_ BitVec 32))

(assert (=> d!79427 (= lt!236391 (bvmul (bvxor lt!236390 (bvlshr lt!236390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79427 (= lt!236390 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79427 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316200 (let ((h!11005 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48656 (bvmul (bvxor h!11005 (bvlshr h!11005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48656 (bvlshr x!48656 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316200 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316200 #b00000000000000000000000000000000))))))

(assert (=> d!79427 (= (toIndex!0 (select (store (arr!15911 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236391 (bvlshr lt!236391 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516399 d!79427))

(declare-fun b!516663 () Bool)

(declare-fun e!301493 () Bool)

(declare-fun e!301495 () Bool)

(assert (=> b!516663 (= e!301493 e!301495)))

(declare-fun res!316248 () Bool)

(declare-fun lt!236393 () SeekEntryResult!4375)

(assert (=> b!516663 (= res!316248 (and ((_ is Intermediate!4375) lt!236393) (not (undefined!5187 lt!236393)) (bvslt (x!48653 lt!236393) #b01111111111111111111111111111110) (bvsge (x!48653 lt!236393) #b00000000000000000000000000000000) (bvsge (x!48653 lt!236393) #b00000000000000000000000000000000)))))

(assert (=> b!516663 (=> (not res!316248) (not e!301495))))

(declare-fun b!516664 () Bool)

(assert (=> b!516664 (= e!301493 (bvsge (x!48653 lt!236393) #b01111111111111111111111111111110))))

(declare-fun b!516665 () Bool)

(assert (=> b!516665 (and (bvsge (index!19690 lt!236393) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236393) (size!16276 a!3235)))))

(declare-fun res!316249 () Bool)

(assert (=> b!516665 (= res!316249 (= (select (arr!15911 a!3235) (index!19690 lt!236393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301492 () Bool)

(assert (=> b!516665 (=> res!316249 e!301492)))

(declare-fun b!516666 () Bool)

(assert (=> b!516666 (and (bvsge (index!19690 lt!236393) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236393) (size!16276 a!3235)))))

(declare-fun res!316250 () Bool)

(assert (=> b!516666 (= res!316250 (= (select (arr!15911 a!3235) (index!19690 lt!236393)) (select (arr!15911 a!3235) j!176)))))

(assert (=> b!516666 (=> res!316250 e!301492)))

(assert (=> b!516666 (= e!301495 e!301492)))

(declare-fun b!516667 () Bool)

(declare-fun e!301496 () SeekEntryResult!4375)

(assert (=> b!516667 (= e!301496 (Intermediate!4375 true lt!236290 #b00000000000000000000000000000000))))

(declare-fun b!516668 () Bool)

(declare-fun e!301494 () SeekEntryResult!4375)

(assert (=> b!516668 (= e!301496 e!301494)))

(declare-fun c!60497 () Bool)

(declare-fun lt!236392 () (_ BitVec 64))

(assert (=> b!516668 (= c!60497 (or (= lt!236392 (select (arr!15911 a!3235) j!176)) (= (bvadd lt!236392 lt!236392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516669 () Bool)

(assert (=> b!516669 (and (bvsge (index!19690 lt!236393) #b00000000000000000000000000000000) (bvslt (index!19690 lt!236393) (size!16276 a!3235)))))

(assert (=> b!516669 (= e!301492 (= (select (arr!15911 a!3235) (index!19690 lt!236393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79429 () Bool)

(assert (=> d!79429 e!301493))

(declare-fun c!60499 () Bool)

(assert (=> d!79429 (= c!60499 (and ((_ is Intermediate!4375) lt!236393) (undefined!5187 lt!236393)))))

(assert (=> d!79429 (= lt!236393 e!301496)))

(declare-fun c!60498 () Bool)

(assert (=> d!79429 (= c!60498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79429 (= lt!236392 (select (arr!15911 a!3235) lt!236290))))

(assert (=> d!79429 (validMask!0 mask!3524)))

(assert (=> d!79429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236290 (select (arr!15911 a!3235) j!176) a!3235 mask!3524) lt!236393)))

(declare-fun b!516670 () Bool)

(assert (=> b!516670 (= e!301494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236290 #b00000000000000000000000000000000 mask!3524) (select (arr!15911 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516671 () Bool)

(assert (=> b!516671 (= e!301494 (Intermediate!4375 false lt!236290 #b00000000000000000000000000000000))))

(assert (= (and d!79429 c!60498) b!516667))

(assert (= (and d!79429 (not c!60498)) b!516668))

(assert (= (and b!516668 c!60497) b!516671))

(assert (= (and b!516668 (not c!60497)) b!516670))

(assert (= (and d!79429 c!60499) b!516664))

(assert (= (and d!79429 (not c!60499)) b!516663))

(assert (= (and b!516663 res!316248) b!516666))

(assert (= (and b!516666 (not res!316250)) b!516665))

(assert (= (and b!516665 (not res!316249)) b!516669))

(declare-fun m!497689 () Bool)

(assert (=> b!516669 m!497689))

(assert (=> b!516666 m!497689))

(declare-fun m!497691 () Bool)

(assert (=> d!79429 m!497691))

(assert (=> d!79429 m!497441))

(declare-fun m!497693 () Bool)

(assert (=> b!516670 m!497693))

(assert (=> b!516670 m!497693))

(assert (=> b!516670 m!497437))

(declare-fun m!497695 () Bool)

(assert (=> b!516670 m!497695))

(assert (=> b!516665 m!497689))

(assert (=> b!516399 d!79429))

(declare-fun d!79433 () Bool)

(assert (=> d!79433 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236396 () Unit!15994)

(declare-fun choose!38 (array!33086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15994)

(assert (=> d!79433 (= lt!236396 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79433 (validMask!0 mask!3524)))

(assert (=> d!79433 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236396)))

(declare-fun bs!16297 () Bool)

(assert (= bs!16297 d!79433))

(assert (=> bs!16297 m!497469))

(declare-fun m!497697 () Bool)

(assert (=> bs!16297 m!497697))

(assert (=> bs!16297 m!497441))

(assert (=> b!516399 d!79433))

(check-sat (not b!516653) (not bm!31622) (not b!516546) (not d!79433) (not b!516583) (not b!516485) (not b!516507) (not d!79405) (not d!79429) (not b!516509) (not d!79391) (not bm!31618) (not b!516581) (not b!516543) (not d!79373) (not b!516544) (not b!516670) (not b!516505) (not bm!31615) (not b!516496))
(check-sat)
