; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32768 () Bool)

(assert start!32768)

(declare-fun b!327242 () Bool)

(declare-fun res!180282 () Bool)

(declare-fun e!201245 () Bool)

(assert (=> b!327242 (=> (not res!180282) (not e!201245))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327242 (= res!180282 (validKeyInArray!0 k0!2497))))

(declare-fun e!201243 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun b!327243 () Bool)

(declare-datatypes ((array!16764 0))(
  ( (array!16765 (arr!7935 (Array (_ BitVec 32) (_ BitVec 64))) (size!8288 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16764)

(assert (=> b!327243 (= e!201243 (and (bvslt resX!58 #b01111111111111111111111111111110) (= (select (arr!7935 a!3305) index!1840) k0!2497)))))

(declare-fun b!327244 () Bool)

(declare-fun res!180283 () Bool)

(assert (=> b!327244 (=> (not res!180283) (not e!201245))))

(declare-fun arrayContainsKey!0 (array!16764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327244 (= res!180283 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327245 () Bool)

(declare-fun res!180281 () Bool)

(assert (=> b!327245 (=> (not res!180281) (not e!201245))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3065 0))(
  ( (MissingZero!3065 (index!14436 (_ BitVec 32))) (Found!3065 (index!14437 (_ BitVec 32))) (Intermediate!3065 (undefined!3877 Bool) (index!14438 (_ BitVec 32)) (x!32696 (_ BitVec 32))) (Undefined!3065) (MissingVacant!3065 (index!14439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!327245 (= res!180281 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3065 i!1250)))))

(declare-fun b!327246 () Bool)

(declare-fun res!180284 () Bool)

(assert (=> b!327246 (=> (not res!180284) (not e!201245))))

(assert (=> b!327246 (= res!180284 (and (= (size!8288 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8288 a!3305))))))

(declare-fun b!327247 () Bool)

(declare-fun res!180280 () Bool)

(assert (=> b!327247 (=> (not res!180280) (not e!201245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16764 (_ BitVec 32)) Bool)

(assert (=> b!327247 (= res!180280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327248 () Bool)

(declare-fun res!180277 () Bool)

(assert (=> b!327248 (=> (not res!180277) (not e!201243))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327248 (= res!180277 (and (= (select (arr!7935 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8288 a!3305))))))

(declare-fun b!327249 () Bool)

(assert (=> b!327249 (= e!201245 e!201243)))

(declare-fun res!180278 () Bool)

(assert (=> b!327249 (=> (not res!180278) (not e!201243))))

(declare-fun lt!157349 () SeekEntryResult!3065)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327249 (= res!180278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157349))))

(assert (=> b!327249 (= lt!157349 (Intermediate!3065 false resIndex!58 resX!58))))

(declare-fun b!327241 () Bool)

(declare-fun res!180279 () Bool)

(assert (=> b!327241 (=> (not res!180279) (not e!201243))))

(assert (=> b!327241 (= res!180279 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157349))))

(declare-fun res!180285 () Bool)

(assert (=> start!32768 (=> (not res!180285) (not e!201245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32768 (= res!180285 (validMask!0 mask!3777))))

(assert (=> start!32768 e!201245))

(declare-fun array_inv!5907 (array!16764) Bool)

(assert (=> start!32768 (array_inv!5907 a!3305)))

(assert (=> start!32768 true))

(assert (= (and start!32768 res!180285) b!327246))

(assert (= (and b!327246 res!180284) b!327242))

(assert (= (and b!327242 res!180282) b!327244))

(assert (= (and b!327244 res!180283) b!327245))

(assert (= (and b!327245 res!180281) b!327247))

(assert (= (and b!327247 res!180280) b!327249))

(assert (= (and b!327249 res!180278) b!327248))

(assert (= (and b!327248 res!180277) b!327241))

(assert (= (and b!327241 res!180279) b!327243))

(declare-fun m!333115 () Bool)

(assert (=> b!327243 m!333115))

(declare-fun m!333117 () Bool)

(assert (=> b!327241 m!333117))

(declare-fun m!333119 () Bool)

(assert (=> b!327244 m!333119))

(declare-fun m!333121 () Bool)

(assert (=> b!327245 m!333121))

(declare-fun m!333123 () Bool)

(assert (=> b!327248 m!333123))

(declare-fun m!333125 () Bool)

(assert (=> b!327242 m!333125))

(declare-fun m!333127 () Bool)

(assert (=> b!327249 m!333127))

(assert (=> b!327249 m!333127))

(declare-fun m!333129 () Bool)

(assert (=> b!327249 m!333129))

(declare-fun m!333131 () Bool)

(assert (=> start!32768 m!333131))

(declare-fun m!333133 () Bool)

(assert (=> start!32768 m!333133))

(declare-fun m!333135 () Bool)

(assert (=> b!327247 m!333135))

(check-sat (not b!327249) (not b!327244) (not b!327245) (not start!32768) (not b!327247) (not b!327241) (not b!327242))
(check-sat)
(get-model)

(declare-fun b!327316 () Bool)

(declare-fun e!201270 () SeekEntryResult!3065)

(declare-fun lt!157363 () SeekEntryResult!3065)

(assert (=> b!327316 (= e!201270 (Found!3065 (index!14438 lt!157363)))))

(declare-fun b!327317 () Bool)

(declare-fun e!201272 () SeekEntryResult!3065)

(assert (=> b!327317 (= e!201272 e!201270)))

(declare-fun lt!157364 () (_ BitVec 64))

(assert (=> b!327317 (= lt!157364 (select (arr!7935 a!3305) (index!14438 lt!157363)))))

(declare-fun c!51121 () Bool)

(assert (=> b!327317 (= c!51121 (= lt!157364 k0!2497))))

(declare-fun b!327318 () Bool)

(declare-fun c!51120 () Bool)

(assert (=> b!327318 (= c!51120 (= lt!157364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201271 () SeekEntryResult!3065)

(assert (=> b!327318 (= e!201270 e!201271)))

(declare-fun d!69651 () Bool)

(declare-fun lt!157362 () SeekEntryResult!3065)

(get-info :version)

(assert (=> d!69651 (and (or ((_ is Undefined!3065) lt!157362) (not ((_ is Found!3065) lt!157362)) (and (bvsge (index!14437 lt!157362) #b00000000000000000000000000000000) (bvslt (index!14437 lt!157362) (size!8288 a!3305)))) (or ((_ is Undefined!3065) lt!157362) ((_ is Found!3065) lt!157362) (not ((_ is MissingZero!3065) lt!157362)) (and (bvsge (index!14436 lt!157362) #b00000000000000000000000000000000) (bvslt (index!14436 lt!157362) (size!8288 a!3305)))) (or ((_ is Undefined!3065) lt!157362) ((_ is Found!3065) lt!157362) ((_ is MissingZero!3065) lt!157362) (not ((_ is MissingVacant!3065) lt!157362)) (and (bvsge (index!14439 lt!157362) #b00000000000000000000000000000000) (bvslt (index!14439 lt!157362) (size!8288 a!3305)))) (or ((_ is Undefined!3065) lt!157362) (ite ((_ is Found!3065) lt!157362) (= (select (arr!7935 a!3305) (index!14437 lt!157362)) k0!2497) (ite ((_ is MissingZero!3065) lt!157362) (= (select (arr!7935 a!3305) (index!14436 lt!157362)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3065) lt!157362) (= (select (arr!7935 a!3305) (index!14439 lt!157362)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69651 (= lt!157362 e!201272)))

(declare-fun c!51122 () Bool)

(assert (=> d!69651 (= c!51122 (and ((_ is Intermediate!3065) lt!157363) (undefined!3877 lt!157363)))))

(assert (=> d!69651 (= lt!157363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69651 (validMask!0 mask!3777)))

(assert (=> d!69651 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157362)))

(declare-fun b!327319 () Bool)

(assert (=> b!327319 (= e!201272 Undefined!3065)))

(declare-fun b!327320 () Bool)

(assert (=> b!327320 (= e!201271 (MissingZero!3065 (index!14438 lt!157363)))))

(declare-fun b!327321 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!327321 (= e!201271 (seekKeyOrZeroReturnVacant!0 (x!32696 lt!157363) (index!14438 lt!157363) (index!14438 lt!157363) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69651 c!51122) b!327319))

(assert (= (and d!69651 (not c!51122)) b!327317))

(assert (= (and b!327317 c!51121) b!327316))

(assert (= (and b!327317 (not c!51121)) b!327318))

(assert (= (and b!327318 c!51120) b!327320))

(assert (= (and b!327318 (not c!51120)) b!327321))

(declare-fun m!333181 () Bool)

(assert (=> b!327317 m!333181))

(declare-fun m!333183 () Bool)

(assert (=> d!69651 m!333183))

(assert (=> d!69651 m!333127))

(assert (=> d!69651 m!333131))

(declare-fun m!333185 () Bool)

(assert (=> d!69651 m!333185))

(assert (=> d!69651 m!333127))

(assert (=> d!69651 m!333129))

(declare-fun m!333187 () Bool)

(assert (=> d!69651 m!333187))

(declare-fun m!333189 () Bool)

(assert (=> b!327321 m!333189))

(assert (=> b!327245 d!69651))

(declare-fun d!69657 () Bool)

(declare-fun res!180344 () Bool)

(declare-fun e!201277 () Bool)

(assert (=> d!69657 (=> res!180344 e!201277)))

(assert (=> d!69657 (= res!180344 (= (select (arr!7935 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69657 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201277)))

(declare-fun b!327326 () Bool)

(declare-fun e!201278 () Bool)

(assert (=> b!327326 (= e!201277 e!201278)))

(declare-fun res!180345 () Bool)

(assert (=> b!327326 (=> (not res!180345) (not e!201278))))

(assert (=> b!327326 (= res!180345 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8288 a!3305)))))

(declare-fun b!327327 () Bool)

(assert (=> b!327327 (= e!201278 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69657 (not res!180344)) b!327326))

(assert (= (and b!327326 res!180345) b!327327))

(declare-fun m!333191 () Bool)

(assert (=> d!69657 m!333191))

(declare-fun m!333193 () Bool)

(assert (=> b!327327 m!333193))

(assert (=> b!327244 d!69657))

(declare-fun b!327423 () Bool)

(declare-fun e!201337 () SeekEntryResult!3065)

(assert (=> b!327423 (= e!201337 (Intermediate!3065 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327424 () Bool)

(declare-fun lt!157396 () SeekEntryResult!3065)

(assert (=> b!327424 (and (bvsge (index!14438 lt!157396) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157396) (size!8288 a!3305)))))

(declare-fun e!201336 () Bool)

(assert (=> b!327424 (= e!201336 (= (select (arr!7935 a!3305) (index!14438 lt!157396)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327425 () Bool)

(assert (=> b!327425 (and (bvsge (index!14438 lt!157396) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157396) (size!8288 a!3305)))))

(declare-fun res!180385 () Bool)

(assert (=> b!327425 (= res!180385 (= (select (arr!7935 a!3305) (index!14438 lt!157396)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327425 (=> res!180385 e!201336)))

(declare-fun b!327426 () Bool)

(declare-fun e!201339 () SeekEntryResult!3065)

(assert (=> b!327426 (= e!201339 (Intermediate!3065 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327427 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327427 (= e!201339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327429 () Bool)

(assert (=> b!327429 (= e!201337 e!201339)))

(declare-fun c!51154 () Bool)

(declare-fun lt!157395 () (_ BitVec 64))

(assert (=> b!327429 (= c!51154 (or (= lt!157395 k0!2497) (= (bvadd lt!157395 lt!157395) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327430 () Bool)

(declare-fun e!201340 () Bool)

(declare-fun e!201338 () Bool)

(assert (=> b!327430 (= e!201340 e!201338)))

(declare-fun res!180384 () Bool)

(assert (=> b!327430 (= res!180384 (and ((_ is Intermediate!3065) lt!157396) (not (undefined!3877 lt!157396)) (bvslt (x!32696 lt!157396) #b01111111111111111111111111111110) (bvsge (x!32696 lt!157396) #b00000000000000000000000000000000) (bvsge (x!32696 lt!157396) #b00000000000000000000000000000000)))))

(assert (=> b!327430 (=> (not res!180384) (not e!201338))))

(declare-fun b!327431 () Bool)

(assert (=> b!327431 (and (bvsge (index!14438 lt!157396) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157396) (size!8288 a!3305)))))

(declare-fun res!180386 () Bool)

(assert (=> b!327431 (= res!180386 (= (select (arr!7935 a!3305) (index!14438 lt!157396)) k0!2497))))

(assert (=> b!327431 (=> res!180386 e!201336)))

(assert (=> b!327431 (= e!201338 e!201336)))

(declare-fun b!327428 () Bool)

(assert (=> b!327428 (= e!201340 (bvsge (x!32696 lt!157396) #b01111111111111111111111111111110))))

(declare-fun d!69659 () Bool)

(assert (=> d!69659 e!201340))

(declare-fun c!51153 () Bool)

(assert (=> d!69659 (= c!51153 (and ((_ is Intermediate!3065) lt!157396) (undefined!3877 lt!157396)))))

(assert (=> d!69659 (= lt!157396 e!201337)))

(declare-fun c!51152 () Bool)

(assert (=> d!69659 (= c!51152 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69659 (= lt!157395 (select (arr!7935 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69659 (validMask!0 mask!3777)))

(assert (=> d!69659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157396)))

(assert (= (and d!69659 c!51152) b!327423))

(assert (= (and d!69659 (not c!51152)) b!327429))

(assert (= (and b!327429 c!51154) b!327426))

(assert (= (and b!327429 (not c!51154)) b!327427))

(assert (= (and d!69659 c!51153) b!327428))

(assert (= (and d!69659 (not c!51153)) b!327430))

(assert (= (and b!327430 res!180384) b!327431))

(assert (= (and b!327431 (not res!180386)) b!327425))

(assert (= (and b!327425 (not res!180385)) b!327424))

(assert (=> b!327427 m!333127))

(declare-fun m!333219 () Bool)

(assert (=> b!327427 m!333219))

(assert (=> b!327427 m!333219))

(declare-fun m!333221 () Bool)

(assert (=> b!327427 m!333221))

(declare-fun m!333223 () Bool)

(assert (=> b!327424 m!333223))

(assert (=> b!327431 m!333223))

(assert (=> b!327425 m!333223))

(assert (=> d!69659 m!333127))

(declare-fun m!333225 () Bool)

(assert (=> d!69659 m!333225))

(assert (=> d!69659 m!333131))

(assert (=> b!327249 d!69659))

(declare-fun d!69673 () Bool)

(declare-fun lt!157405 () (_ BitVec 32))

(declare-fun lt!157404 () (_ BitVec 32))

(assert (=> d!69673 (= lt!157405 (bvmul (bvxor lt!157404 (bvlshr lt!157404 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69673 (= lt!157404 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69673 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180387 (let ((h!5369 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32703 (bvmul (bvxor h!5369 (bvlshr h!5369 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32703 (bvlshr x!32703 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180387 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180387 #b00000000000000000000000000000000))))))

(assert (=> d!69673 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157405 (bvlshr lt!157405 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327249 d!69673))

(declare-fun d!69679 () Bool)

(assert (=> d!69679 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327242 d!69679))

(declare-fun b!327462 () Bool)

(declare-fun e!201362 () Bool)

(declare-fun call!26078 () Bool)

(assert (=> b!327462 (= e!201362 call!26078)))

(declare-fun bm!26075 () Bool)

(assert (=> bm!26075 (= call!26078 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327463 () Bool)

(declare-fun e!201363 () Bool)

(declare-fun e!201364 () Bool)

(assert (=> b!327463 (= e!201363 e!201364)))

(declare-fun c!51164 () Bool)

(assert (=> b!327463 (= c!51164 (validKeyInArray!0 (select (arr!7935 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69681 () Bool)

(declare-fun res!180400 () Bool)

(assert (=> d!69681 (=> res!180400 e!201363)))

(assert (=> d!69681 (= res!180400 (bvsge #b00000000000000000000000000000000 (size!8288 a!3305)))))

(assert (=> d!69681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201363)))

(declare-fun b!327464 () Bool)

(assert (=> b!327464 (= e!201364 call!26078)))

(declare-fun b!327465 () Bool)

(assert (=> b!327465 (= e!201364 e!201362)))

(declare-fun lt!157418 () (_ BitVec 64))

(assert (=> b!327465 (= lt!157418 (select (arr!7935 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10142 0))(
  ( (Unit!10143) )
))
(declare-fun lt!157419 () Unit!10142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16764 (_ BitVec 64) (_ BitVec 32)) Unit!10142)

(assert (=> b!327465 (= lt!157419 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157418 #b00000000000000000000000000000000))))

(assert (=> b!327465 (arrayContainsKey!0 a!3305 lt!157418 #b00000000000000000000000000000000)))

(declare-fun lt!157420 () Unit!10142)

(assert (=> b!327465 (= lt!157420 lt!157419)))

(declare-fun res!180401 () Bool)

(assert (=> b!327465 (= res!180401 (= (seekEntryOrOpen!0 (select (arr!7935 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3065 #b00000000000000000000000000000000)))))

(assert (=> b!327465 (=> (not res!180401) (not e!201362))))

(assert (= (and d!69681 (not res!180400)) b!327463))

(assert (= (and b!327463 c!51164) b!327465))

(assert (= (and b!327463 (not c!51164)) b!327464))

(assert (= (and b!327465 res!180401) b!327462))

(assert (= (or b!327462 b!327464) bm!26075))

(declare-fun m!333241 () Bool)

(assert (=> bm!26075 m!333241))

(assert (=> b!327463 m!333191))

(assert (=> b!327463 m!333191))

(declare-fun m!333243 () Bool)

(assert (=> b!327463 m!333243))

(assert (=> b!327465 m!333191))

(declare-fun m!333245 () Bool)

(assert (=> b!327465 m!333245))

(declare-fun m!333247 () Bool)

(assert (=> b!327465 m!333247))

(assert (=> b!327465 m!333191))

(declare-fun m!333249 () Bool)

(assert (=> b!327465 m!333249))

(assert (=> b!327247 d!69681))

(declare-fun d!69687 () Bool)

(assert (=> d!69687 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32768 d!69687))

(declare-fun d!69691 () Bool)

(assert (=> d!69691 (= (array_inv!5907 a!3305) (bvsge (size!8288 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32768 d!69691))

(declare-fun b!327472 () Bool)

(declare-fun e!201369 () SeekEntryResult!3065)

(assert (=> b!327472 (= e!201369 (Intermediate!3065 true index!1840 x!1490))))

(declare-fun b!327473 () Bool)

(declare-fun lt!157425 () SeekEntryResult!3065)

(assert (=> b!327473 (and (bvsge (index!14438 lt!157425) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157425) (size!8288 a!3305)))))

(declare-fun e!201368 () Bool)

(assert (=> b!327473 (= e!201368 (= (select (arr!7935 a!3305) (index!14438 lt!157425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327474 () Bool)

(assert (=> b!327474 (and (bvsge (index!14438 lt!157425) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157425) (size!8288 a!3305)))))

(declare-fun res!180403 () Bool)

(assert (=> b!327474 (= res!180403 (= (select (arr!7935 a!3305) (index!14438 lt!157425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327474 (=> res!180403 e!201368)))

(declare-fun b!327475 () Bool)

(declare-fun e!201371 () SeekEntryResult!3065)

(assert (=> b!327475 (= e!201371 (Intermediate!3065 false index!1840 x!1490))))

(declare-fun b!327476 () Bool)

(assert (=> b!327476 (= e!201371 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327478 () Bool)

(assert (=> b!327478 (= e!201369 e!201371)))

(declare-fun c!51170 () Bool)

(declare-fun lt!157424 () (_ BitVec 64))

(assert (=> b!327478 (= c!51170 (or (= lt!157424 k0!2497) (= (bvadd lt!157424 lt!157424) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327479 () Bool)

(declare-fun e!201372 () Bool)

(declare-fun e!201370 () Bool)

(assert (=> b!327479 (= e!201372 e!201370)))

(declare-fun res!180402 () Bool)

(assert (=> b!327479 (= res!180402 (and ((_ is Intermediate!3065) lt!157425) (not (undefined!3877 lt!157425)) (bvslt (x!32696 lt!157425) #b01111111111111111111111111111110) (bvsge (x!32696 lt!157425) #b00000000000000000000000000000000) (bvsge (x!32696 lt!157425) x!1490)))))

(assert (=> b!327479 (=> (not res!180402) (not e!201370))))

(declare-fun b!327480 () Bool)

(assert (=> b!327480 (and (bvsge (index!14438 lt!157425) #b00000000000000000000000000000000) (bvslt (index!14438 lt!157425) (size!8288 a!3305)))))

(declare-fun res!180404 () Bool)

(assert (=> b!327480 (= res!180404 (= (select (arr!7935 a!3305) (index!14438 lt!157425)) k0!2497))))

(assert (=> b!327480 (=> res!180404 e!201368)))

(assert (=> b!327480 (= e!201370 e!201368)))

(declare-fun b!327477 () Bool)

(assert (=> b!327477 (= e!201372 (bvsge (x!32696 lt!157425) #b01111111111111111111111111111110))))

(declare-fun d!69693 () Bool)

(assert (=> d!69693 e!201372))

(declare-fun c!51169 () Bool)

(assert (=> d!69693 (= c!51169 (and ((_ is Intermediate!3065) lt!157425) (undefined!3877 lt!157425)))))

(assert (=> d!69693 (= lt!157425 e!201369)))

(declare-fun c!51168 () Bool)

(assert (=> d!69693 (= c!51168 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69693 (= lt!157424 (select (arr!7935 a!3305) index!1840))))

(assert (=> d!69693 (validMask!0 mask!3777)))

(assert (=> d!69693 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157425)))

(assert (= (and d!69693 c!51168) b!327472))

(assert (= (and d!69693 (not c!51168)) b!327478))

(assert (= (and b!327478 c!51170) b!327475))

(assert (= (and b!327478 (not c!51170)) b!327476))

(assert (= (and d!69693 c!51169) b!327477))

(assert (= (and d!69693 (not c!51169)) b!327479))

(assert (= (and b!327479 res!180402) b!327480))

(assert (= (and b!327480 (not res!180404)) b!327474))

(assert (= (and b!327474 (not res!180403)) b!327473))

(declare-fun m!333261 () Bool)

(assert (=> b!327476 m!333261))

(assert (=> b!327476 m!333261))

(declare-fun m!333263 () Bool)

(assert (=> b!327476 m!333263))

(declare-fun m!333265 () Bool)

(assert (=> b!327473 m!333265))

(assert (=> b!327480 m!333265))

(assert (=> b!327474 m!333265))

(assert (=> d!69693 m!333115))

(assert (=> d!69693 m!333131))

(assert (=> b!327241 d!69693))

(check-sat (not b!327427) (not b!327463) (not b!327465) (not d!69659) (not bm!26075) (not b!327321) (not d!69651) (not b!327476) (not d!69693) (not b!327327))
(check-sat)
