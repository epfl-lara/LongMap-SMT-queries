; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46602 () Bool)

(assert start!46602)

(declare-fun b!514422 () Bool)

(declare-fun res!314319 () Bool)

(declare-fun e!300383 () Bool)

(assert (=> b!514422 (=> (not res!314319) (not e!300383))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514422 (= res!314319 (validKeyInArray!0 k0!2280))))

(declare-fun b!514423 () Bool)

(declare-fun res!314318 () Bool)

(assert (=> b!514423 (=> (not res!314318) (not e!300383))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32981 0))(
  ( (array!32982 (arr!15860 (Array (_ BitVec 32) (_ BitVec 64))) (size!16225 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32981)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!514423 (= res!314318 (and (= (size!16225 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16225 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16225 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514425 () Bool)

(declare-fun e!300380 () Bool)

(assert (=> b!514425 (= e!300383 e!300380)))

(declare-fun res!314321 () Bool)

(assert (=> b!514425 (=> (not res!314321) (not e!300380))))

(declare-datatypes ((SeekEntryResult!4324 0))(
  ( (MissingZero!4324 (index!19484 (_ BitVec 32))) (Found!4324 (index!19485 (_ BitVec 32))) (Intermediate!4324 (undefined!5136 Bool) (index!19486 (_ BitVec 32)) (x!48460 (_ BitVec 32))) (Undefined!4324) (MissingVacant!4324 (index!19487 (_ BitVec 32))) )
))
(declare-fun lt!235396 () SeekEntryResult!4324)

(assert (=> b!514425 (= res!314321 (or (= lt!235396 (MissingZero!4324 i!1204)) (= lt!235396 (MissingVacant!4324 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32981 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!514425 (= lt!235396 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!300381 () Bool)

(declare-fun b!514426 () Bool)

(assert (=> b!514426 (= e!300381 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) (Found!4324 j!176)))))

(declare-fun b!514427 () Bool)

(declare-fun res!314316 () Bool)

(declare-fun e!300384 () Bool)

(assert (=> b!514427 (=> res!314316 e!300384)))

(declare-fun lt!235392 () SeekEntryResult!4324)

(get-info :version)

(assert (=> b!514427 (= res!314316 (or (undefined!5136 lt!235392) (not ((_ is Intermediate!4324) lt!235392))))))

(declare-fun b!514428 () Bool)

(assert (=> b!514428 (= e!300384 (and (bvsge (index!19486 lt!235392) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235392) (size!16225 a!3235))))))

(assert (=> b!514428 (and (bvslt (x!48460 lt!235392) #b01111111111111111111111111111110) (or (= (select (arr!15860 a!3235) (index!19486 lt!235392)) (select (arr!15860 a!3235) j!176)) (= (select (arr!15860 a!3235) (index!19486 lt!235392)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15860 a!3235) (index!19486 lt!235392)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514429 () Bool)

(assert (=> b!514429 (= e!300380 (not e!300384))))

(declare-fun res!314314 () Bool)

(assert (=> b!514429 (=> res!314314 e!300384)))

(declare-fun lt!235395 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32981 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!514429 (= res!314314 (= lt!235392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235395 (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)) mask!3524)))))

(declare-fun lt!235394 () (_ BitVec 32))

(assert (=> b!514429 (= lt!235392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235394 (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514429 (= lt!235395 (toIndex!0 (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514429 (= lt!235394 (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524))))

(assert (=> b!514429 e!300381))

(declare-fun res!314312 () Bool)

(assert (=> b!514429 (=> (not res!314312) (not e!300381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32981 (_ BitVec 32)) Bool)

(assert (=> b!514429 (= res!314312 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15892 0))(
  ( (Unit!15893) )
))
(declare-fun lt!235393 () Unit!15892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15892)

(assert (=> b!514429 (= lt!235393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514430 () Bool)

(declare-fun res!314315 () Bool)

(assert (=> b!514430 (=> (not res!314315) (not e!300383))))

(declare-fun arrayContainsKey!0 (array!32981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514430 (= res!314315 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514424 () Bool)

(declare-fun res!314313 () Bool)

(assert (=> b!514424 (=> (not res!314313) (not e!300380))))

(declare-datatypes ((List!10057 0))(
  ( (Nil!10054) (Cons!10053 (h!10948 (_ BitVec 64)) (t!16276 List!10057)) )
))
(declare-fun arrayNoDuplicates!0 (array!32981 (_ BitVec 32) List!10057) Bool)

(assert (=> b!514424 (= res!314313 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10054))))

(declare-fun res!314317 () Bool)

(assert (=> start!46602 (=> (not res!314317) (not e!300383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46602 (= res!314317 (validMask!0 mask!3524))))

(assert (=> start!46602 e!300383))

(assert (=> start!46602 true))

(declare-fun array_inv!11743 (array!32981) Bool)

(assert (=> start!46602 (array_inv!11743 a!3235)))

(declare-fun b!514431 () Bool)

(declare-fun res!314320 () Bool)

(assert (=> b!514431 (=> (not res!314320) (not e!300380))))

(assert (=> b!514431 (= res!314320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514432 () Bool)

(declare-fun res!314311 () Bool)

(assert (=> b!514432 (=> (not res!314311) (not e!300383))))

(assert (=> b!514432 (= res!314311 (validKeyInArray!0 (select (arr!15860 a!3235) j!176)))))

(assert (= (and start!46602 res!314317) b!514423))

(assert (= (and b!514423 res!314318) b!514432))

(assert (= (and b!514432 res!314311) b!514422))

(assert (= (and b!514422 res!314319) b!514430))

(assert (= (and b!514430 res!314315) b!514425))

(assert (= (and b!514425 res!314321) b!514431))

(assert (= (and b!514431 res!314320) b!514424))

(assert (= (and b!514424 res!314313) b!514429))

(assert (= (and b!514429 res!314312) b!514426))

(assert (= (and b!514429 (not res!314314)) b!514427))

(assert (= (and b!514427 (not res!314316)) b!514428))

(declare-fun m!495295 () Bool)

(assert (=> b!514430 m!495295))

(declare-fun m!495297 () Bool)

(assert (=> b!514424 m!495297))

(declare-fun m!495299 () Bool)

(assert (=> b!514425 m!495299))

(declare-fun m!495301 () Bool)

(assert (=> b!514432 m!495301))

(assert (=> b!514432 m!495301))

(declare-fun m!495303 () Bool)

(assert (=> b!514432 m!495303))

(declare-fun m!495305 () Bool)

(assert (=> b!514429 m!495305))

(declare-fun m!495307 () Bool)

(assert (=> b!514429 m!495307))

(assert (=> b!514429 m!495301))

(declare-fun m!495309 () Bool)

(assert (=> b!514429 m!495309))

(assert (=> b!514429 m!495301))

(declare-fun m!495311 () Bool)

(assert (=> b!514429 m!495311))

(assert (=> b!514429 m!495307))

(declare-fun m!495313 () Bool)

(assert (=> b!514429 m!495313))

(assert (=> b!514429 m!495301))

(declare-fun m!495315 () Bool)

(assert (=> b!514429 m!495315))

(assert (=> b!514429 m!495307))

(declare-fun m!495317 () Bool)

(assert (=> b!514429 m!495317))

(declare-fun m!495319 () Bool)

(assert (=> b!514429 m!495319))

(declare-fun m!495321 () Bool)

(assert (=> b!514428 m!495321))

(assert (=> b!514428 m!495301))

(assert (=> b!514426 m!495301))

(assert (=> b!514426 m!495301))

(declare-fun m!495323 () Bool)

(assert (=> b!514426 m!495323))

(declare-fun m!495325 () Bool)

(assert (=> b!514431 m!495325))

(declare-fun m!495327 () Bool)

(assert (=> start!46602 m!495327))

(declare-fun m!495329 () Bool)

(assert (=> start!46602 m!495329))

(declare-fun m!495331 () Bool)

(assert (=> b!514422 m!495331))

(check-sat (not b!514429) (not b!514425) (not b!514426) (not b!514432) (not start!46602) (not b!514424) (not b!514430) (not b!514431) (not b!514422))
(check-sat)
(get-model)

(declare-fun d!79247 () Bool)

(declare-fun lt!235433 () SeekEntryResult!4324)

(assert (=> d!79247 (and (or ((_ is Undefined!4324) lt!235433) (not ((_ is Found!4324) lt!235433)) (and (bvsge (index!19485 lt!235433) #b00000000000000000000000000000000) (bvslt (index!19485 lt!235433) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235433) ((_ is Found!4324) lt!235433) (not ((_ is MissingZero!4324) lt!235433)) (and (bvsge (index!19484 lt!235433) #b00000000000000000000000000000000) (bvslt (index!19484 lt!235433) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235433) ((_ is Found!4324) lt!235433) ((_ is MissingZero!4324) lt!235433) (not ((_ is MissingVacant!4324) lt!235433)) (and (bvsge (index!19487 lt!235433) #b00000000000000000000000000000000) (bvslt (index!19487 lt!235433) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235433) (ite ((_ is Found!4324) lt!235433) (= (select (arr!15860 a!3235) (index!19485 lt!235433)) k0!2280) (ite ((_ is MissingZero!4324) lt!235433) (= (select (arr!15860 a!3235) (index!19484 lt!235433)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4324) lt!235433) (= (select (arr!15860 a!3235) (index!19487 lt!235433)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300423 () SeekEntryResult!4324)

(assert (=> d!79247 (= lt!235433 e!300423)))

(declare-fun c!60350 () Bool)

(declare-fun lt!235435 () SeekEntryResult!4324)

(assert (=> d!79247 (= c!60350 (and ((_ is Intermediate!4324) lt!235435) (undefined!5136 lt!235435)))))

(assert (=> d!79247 (= lt!235435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79247 (validMask!0 mask!3524)))

(assert (=> d!79247 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235433)))

(declare-fun b!514511 () Bool)

(declare-fun e!300421 () SeekEntryResult!4324)

(assert (=> b!514511 (= e!300421 (Found!4324 (index!19486 lt!235435)))))

(declare-fun e!300422 () SeekEntryResult!4324)

(declare-fun b!514512 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32981 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!514512 (= e!300422 (seekKeyOrZeroReturnVacant!0 (x!48460 lt!235435) (index!19486 lt!235435) (index!19486 lt!235435) k0!2280 a!3235 mask!3524))))

(declare-fun b!514513 () Bool)

(assert (=> b!514513 (= e!300423 e!300421)))

(declare-fun lt!235434 () (_ BitVec 64))

(assert (=> b!514513 (= lt!235434 (select (arr!15860 a!3235) (index!19486 lt!235435)))))

(declare-fun c!60351 () Bool)

(assert (=> b!514513 (= c!60351 (= lt!235434 k0!2280))))

(declare-fun b!514514 () Bool)

(assert (=> b!514514 (= e!300423 Undefined!4324)))

(declare-fun b!514515 () Bool)

(assert (=> b!514515 (= e!300422 (MissingZero!4324 (index!19486 lt!235435)))))

(declare-fun b!514516 () Bool)

(declare-fun c!60349 () Bool)

(assert (=> b!514516 (= c!60349 (= lt!235434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514516 (= e!300421 e!300422)))

(assert (= (and d!79247 c!60350) b!514514))

(assert (= (and d!79247 (not c!60350)) b!514513))

(assert (= (and b!514513 c!60351) b!514511))

(assert (= (and b!514513 (not c!60351)) b!514516))

(assert (= (and b!514516 c!60349) b!514515))

(assert (= (and b!514516 (not c!60349)) b!514512))

(declare-fun m!495409 () Bool)

(assert (=> d!79247 m!495409))

(declare-fun m!495411 () Bool)

(assert (=> d!79247 m!495411))

(declare-fun m!495413 () Bool)

(assert (=> d!79247 m!495413))

(assert (=> d!79247 m!495411))

(declare-fun m!495415 () Bool)

(assert (=> d!79247 m!495415))

(declare-fun m!495417 () Bool)

(assert (=> d!79247 m!495417))

(assert (=> d!79247 m!495327))

(declare-fun m!495419 () Bool)

(assert (=> b!514512 m!495419))

(declare-fun m!495421 () Bool)

(assert (=> b!514513 m!495421))

(assert (=> b!514425 d!79247))

(declare-fun d!79249 () Bool)

(declare-fun res!314392 () Bool)

(declare-fun e!300428 () Bool)

(assert (=> d!79249 (=> res!314392 e!300428)))

(assert (=> d!79249 (= res!314392 (= (select (arr!15860 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79249 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300428)))

(declare-fun b!514521 () Bool)

(declare-fun e!300429 () Bool)

(assert (=> b!514521 (= e!300428 e!300429)))

(declare-fun res!314393 () Bool)

(assert (=> b!514521 (=> (not res!314393) (not e!300429))))

(assert (=> b!514521 (= res!314393 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16225 a!3235)))))

(declare-fun b!514522 () Bool)

(assert (=> b!514522 (= e!300429 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79249 (not res!314392)) b!514521))

(assert (= (and b!514521 res!314393) b!514522))

(declare-fun m!495423 () Bool)

(assert (=> d!79249 m!495423))

(declare-fun m!495425 () Bool)

(assert (=> b!514522 m!495425))

(assert (=> b!514430 d!79249))

(declare-fun d!79251 () Bool)

(declare-fun res!314398 () Bool)

(declare-fun e!300437 () Bool)

(assert (=> d!79251 (=> res!314398 e!300437)))

(assert (=> d!79251 (= res!314398 (bvsge #b00000000000000000000000000000000 (size!16225 a!3235)))))

(assert (=> d!79251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300437)))

(declare-fun b!514531 () Bool)

(declare-fun e!300436 () Bool)

(declare-fun call!31597 () Bool)

(assert (=> b!514531 (= e!300436 call!31597)))

(declare-fun b!514532 () Bool)

(declare-fun e!300438 () Bool)

(assert (=> b!514532 (= e!300437 e!300438)))

(declare-fun c!60354 () Bool)

(assert (=> b!514532 (= c!60354 (validKeyInArray!0 (select (arr!15860 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514533 () Bool)

(assert (=> b!514533 (= e!300438 call!31597)))

(declare-fun bm!31594 () Bool)

(assert (=> bm!31594 (= call!31597 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514534 () Bool)

(assert (=> b!514534 (= e!300438 e!300436)))

(declare-fun lt!235443 () (_ BitVec 64))

(assert (=> b!514534 (= lt!235443 (select (arr!15860 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235444 () Unit!15892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32981 (_ BitVec 64) (_ BitVec 32)) Unit!15892)

(assert (=> b!514534 (= lt!235444 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235443 #b00000000000000000000000000000000))))

(assert (=> b!514534 (arrayContainsKey!0 a!3235 lt!235443 #b00000000000000000000000000000000)))

(declare-fun lt!235442 () Unit!15892)

(assert (=> b!514534 (= lt!235442 lt!235444)))

(declare-fun res!314399 () Bool)

(assert (=> b!514534 (= res!314399 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4324 #b00000000000000000000000000000000)))))

(assert (=> b!514534 (=> (not res!314399) (not e!300436))))

(assert (= (and d!79251 (not res!314398)) b!514532))

(assert (= (and b!514532 c!60354) b!514534))

(assert (= (and b!514532 (not c!60354)) b!514533))

(assert (= (and b!514534 res!314399) b!514531))

(assert (= (or b!514531 b!514533) bm!31594))

(assert (=> b!514532 m!495423))

(assert (=> b!514532 m!495423))

(declare-fun m!495427 () Bool)

(assert (=> b!514532 m!495427))

(declare-fun m!495429 () Bool)

(assert (=> bm!31594 m!495429))

(assert (=> b!514534 m!495423))

(declare-fun m!495431 () Bool)

(assert (=> b!514534 m!495431))

(declare-fun m!495433 () Bool)

(assert (=> b!514534 m!495433))

(assert (=> b!514534 m!495423))

(declare-fun m!495435 () Bool)

(assert (=> b!514534 m!495435))

(assert (=> b!514431 d!79251))

(declare-fun d!79253 () Bool)

(declare-fun lt!235445 () SeekEntryResult!4324)

(assert (=> d!79253 (and (or ((_ is Undefined!4324) lt!235445) (not ((_ is Found!4324) lt!235445)) (and (bvsge (index!19485 lt!235445) #b00000000000000000000000000000000) (bvslt (index!19485 lt!235445) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235445) ((_ is Found!4324) lt!235445) (not ((_ is MissingZero!4324) lt!235445)) (and (bvsge (index!19484 lt!235445) #b00000000000000000000000000000000) (bvslt (index!19484 lt!235445) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235445) ((_ is Found!4324) lt!235445) ((_ is MissingZero!4324) lt!235445) (not ((_ is MissingVacant!4324) lt!235445)) (and (bvsge (index!19487 lt!235445) #b00000000000000000000000000000000) (bvslt (index!19487 lt!235445) (size!16225 a!3235)))) (or ((_ is Undefined!4324) lt!235445) (ite ((_ is Found!4324) lt!235445) (= (select (arr!15860 a!3235) (index!19485 lt!235445)) (select (arr!15860 a!3235) j!176)) (ite ((_ is MissingZero!4324) lt!235445) (= (select (arr!15860 a!3235) (index!19484 lt!235445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4324) lt!235445) (= (select (arr!15860 a!3235) (index!19487 lt!235445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300441 () SeekEntryResult!4324)

(assert (=> d!79253 (= lt!235445 e!300441)))

(declare-fun c!60356 () Bool)

(declare-fun lt!235447 () SeekEntryResult!4324)

(assert (=> d!79253 (= c!60356 (and ((_ is Intermediate!4324) lt!235447) (undefined!5136 lt!235447)))))

(assert (=> d!79253 (= lt!235447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79253 (validMask!0 mask!3524)))

(assert (=> d!79253 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) lt!235445)))

(declare-fun b!514535 () Bool)

(declare-fun e!300439 () SeekEntryResult!4324)

(assert (=> b!514535 (= e!300439 (Found!4324 (index!19486 lt!235447)))))

(declare-fun b!514536 () Bool)

(declare-fun e!300440 () SeekEntryResult!4324)

(assert (=> b!514536 (= e!300440 (seekKeyOrZeroReturnVacant!0 (x!48460 lt!235447) (index!19486 lt!235447) (index!19486 lt!235447) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514537 () Bool)

(assert (=> b!514537 (= e!300441 e!300439)))

(declare-fun lt!235446 () (_ BitVec 64))

(assert (=> b!514537 (= lt!235446 (select (arr!15860 a!3235) (index!19486 lt!235447)))))

(declare-fun c!60357 () Bool)

(assert (=> b!514537 (= c!60357 (= lt!235446 (select (arr!15860 a!3235) j!176)))))

(declare-fun b!514538 () Bool)

(assert (=> b!514538 (= e!300441 Undefined!4324)))

(declare-fun b!514539 () Bool)

(assert (=> b!514539 (= e!300440 (MissingZero!4324 (index!19486 lt!235447)))))

(declare-fun b!514540 () Bool)

(declare-fun c!60355 () Bool)

(assert (=> b!514540 (= c!60355 (= lt!235446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514540 (= e!300439 e!300440)))

(assert (= (and d!79253 c!60356) b!514538))

(assert (= (and d!79253 (not c!60356)) b!514537))

(assert (= (and b!514537 c!60357) b!514535))

(assert (= (and b!514537 (not c!60357)) b!514540))

(assert (= (and b!514540 c!60355) b!514539))

(assert (= (and b!514540 (not c!60355)) b!514536))

(declare-fun m!495437 () Bool)

(assert (=> d!79253 m!495437))

(assert (=> d!79253 m!495309))

(assert (=> d!79253 m!495301))

(declare-fun m!495439 () Bool)

(assert (=> d!79253 m!495439))

(assert (=> d!79253 m!495301))

(assert (=> d!79253 m!495309))

(declare-fun m!495441 () Bool)

(assert (=> d!79253 m!495441))

(declare-fun m!495443 () Bool)

(assert (=> d!79253 m!495443))

(assert (=> d!79253 m!495327))

(assert (=> b!514536 m!495301))

(declare-fun m!495445 () Bool)

(assert (=> b!514536 m!495445))

(declare-fun m!495447 () Bool)

(assert (=> b!514537 m!495447))

(assert (=> b!514426 d!79253))

(declare-fun d!79255 () Bool)

(assert (=> d!79255 (= (validKeyInArray!0 (select (arr!15860 a!3235) j!176)) (and (not (= (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15860 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514432 d!79255))

(declare-fun d!79257 () Bool)

(assert (=> d!79257 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46602 d!79257))

(declare-fun d!79271 () Bool)

(assert (=> d!79271 (= (array_inv!11743 a!3235) (bvsge (size!16225 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46602 d!79271))

(declare-fun d!79273 () Bool)

(assert (=> d!79273 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514422 d!79273))

(declare-fun b!514589 () Bool)

(declare-fun e!300479 () Bool)

(declare-fun lt!235488 () SeekEntryResult!4324)

(assert (=> b!514589 (= e!300479 (bvsge (x!48460 lt!235488) #b01111111111111111111111111111110))))

(declare-fun b!514590 () Bool)

(declare-fun e!300480 () SeekEntryResult!4324)

(declare-fun e!300477 () SeekEntryResult!4324)

(assert (=> b!514590 (= e!300480 e!300477)))

(declare-fun lt!235487 () (_ BitVec 64))

(declare-fun c!60371 () Bool)

(assert (=> b!514590 (= c!60371 (or (= lt!235487 (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235487 lt!235487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514591 () Bool)

(assert (=> b!514591 (= e!300480 (Intermediate!4324 true lt!235395 #b00000000000000000000000000000000))))

(declare-fun d!79275 () Bool)

(assert (=> d!79275 e!300479))

(declare-fun c!60372 () Bool)

(assert (=> d!79275 (= c!60372 (and ((_ is Intermediate!4324) lt!235488) (undefined!5136 lt!235488)))))

(assert (=> d!79275 (= lt!235488 e!300480)))

(declare-fun c!60370 () Bool)

(assert (=> d!79275 (= c!60370 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79275 (= lt!235487 (select (arr!15860 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235))) lt!235395))))

(assert (=> d!79275 (validMask!0 mask!3524)))

(assert (=> d!79275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235395 (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)) mask!3524) lt!235488)))

(declare-fun b!514592 () Bool)

(assert (=> b!514592 (= e!300477 (Intermediate!4324 false lt!235395 #b00000000000000000000000000000000))))

(declare-fun b!514593 () Bool)

(assert (=> b!514593 (and (bvsge (index!19486 lt!235488) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235488) (size!16225 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)))))))

(declare-fun res!314426 () Bool)

(assert (=> b!514593 (= res!314426 (= (select (arr!15860 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235))) (index!19486 lt!235488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300478 () Bool)

(assert (=> b!514593 (=> res!314426 e!300478)))

(declare-fun b!514594 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514594 (= e!300477 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235395 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)) mask!3524))))

(declare-fun b!514595 () Bool)

(assert (=> b!514595 (and (bvsge (index!19486 lt!235488) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235488) (size!16225 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)))))))

(assert (=> b!514595 (= e!300478 (= (select (arr!15860 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235))) (index!19486 lt!235488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514596 () Bool)

(declare-fun e!300476 () Bool)

(assert (=> b!514596 (= e!300479 e!300476)))

(declare-fun res!314427 () Bool)

(assert (=> b!514596 (= res!314427 (and ((_ is Intermediate!4324) lt!235488) (not (undefined!5136 lt!235488)) (bvslt (x!48460 lt!235488) #b01111111111111111111111111111110) (bvsge (x!48460 lt!235488) #b00000000000000000000000000000000) (bvsge (x!48460 lt!235488) #b00000000000000000000000000000000)))))

(assert (=> b!514596 (=> (not res!314427) (not e!300476))))

(declare-fun b!514597 () Bool)

(assert (=> b!514597 (and (bvsge (index!19486 lt!235488) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235488) (size!16225 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235)))))))

(declare-fun res!314428 () Bool)

(assert (=> b!514597 (= res!314428 (= (select (arr!15860 (array!32982 (store (arr!15860 a!3235) i!1204 k0!2280) (size!16225 a!3235))) (index!19486 lt!235488)) (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!514597 (=> res!314428 e!300478)))

(assert (=> b!514597 (= e!300476 e!300478)))

(assert (= (and d!79275 c!60370) b!514591))

(assert (= (and d!79275 (not c!60370)) b!514590))

(assert (= (and b!514590 c!60371) b!514592))

(assert (= (and b!514590 (not c!60371)) b!514594))

(assert (= (and d!79275 c!60372) b!514589))

(assert (= (and d!79275 (not c!60372)) b!514596))

(assert (= (and b!514596 res!314427) b!514597))

(assert (= (and b!514597 (not res!314428)) b!514593))

(assert (= (and b!514593 (not res!314426)) b!514595))

(declare-fun m!495467 () Bool)

(assert (=> d!79275 m!495467))

(assert (=> d!79275 m!495327))

(declare-fun m!495469 () Bool)

(assert (=> b!514595 m!495469))

(declare-fun m!495471 () Bool)

(assert (=> b!514594 m!495471))

(assert (=> b!514594 m!495471))

(assert (=> b!514594 m!495307))

(declare-fun m!495473 () Bool)

(assert (=> b!514594 m!495473))

(assert (=> b!514593 m!495469))

(assert (=> b!514597 m!495469))

(assert (=> b!514429 d!79275))

(declare-fun d!79287 () Bool)

(declare-fun lt!235498 () (_ BitVec 32))

(declare-fun lt!235497 () (_ BitVec 32))

(assert (=> d!79287 (= lt!235498 (bvmul (bvxor lt!235497 (bvlshr lt!235497 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79287 (= lt!235497 ((_ extract 31 0) (bvand (bvxor (select (arr!15860 a!3235) j!176) (bvlshr (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79287 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314429 (let ((h!10953 ((_ extract 31 0) (bvand (bvxor (select (arr!15860 a!3235) j!176) (bvlshr (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48467 (bvmul (bvxor h!10953 (bvlshr h!10953 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48467 (bvlshr x!48467 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314429 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314429 #b00000000000000000000000000000000))))))

(assert (=> d!79287 (= (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524) (bvand (bvxor lt!235498 (bvlshr lt!235498 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514429 d!79287))

(declare-fun b!514616 () Bool)

(declare-fun e!300494 () Bool)

(declare-fun lt!235500 () SeekEntryResult!4324)

(assert (=> b!514616 (= e!300494 (bvsge (x!48460 lt!235500) #b01111111111111111111111111111110))))

(declare-fun b!514617 () Bool)

(declare-fun e!300495 () SeekEntryResult!4324)

(declare-fun e!300492 () SeekEntryResult!4324)

(assert (=> b!514617 (= e!300495 e!300492)))

(declare-fun lt!235499 () (_ BitVec 64))

(declare-fun c!60380 () Bool)

(assert (=> b!514617 (= c!60380 (or (= lt!235499 (select (arr!15860 a!3235) j!176)) (= (bvadd lt!235499 lt!235499) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514618 () Bool)

(assert (=> b!514618 (= e!300495 (Intermediate!4324 true lt!235394 #b00000000000000000000000000000000))))

(declare-fun d!79289 () Bool)

(assert (=> d!79289 e!300494))

(declare-fun c!60381 () Bool)

(assert (=> d!79289 (= c!60381 (and ((_ is Intermediate!4324) lt!235500) (undefined!5136 lt!235500)))))

(assert (=> d!79289 (= lt!235500 e!300495)))

(declare-fun c!60379 () Bool)

(assert (=> d!79289 (= c!60379 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79289 (= lt!235499 (select (arr!15860 a!3235) lt!235394))))

(assert (=> d!79289 (validMask!0 mask!3524)))

(assert (=> d!79289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235394 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) lt!235500)))

(declare-fun b!514619 () Bool)

(assert (=> b!514619 (= e!300492 (Intermediate!4324 false lt!235394 #b00000000000000000000000000000000))))

(declare-fun b!514620 () Bool)

(assert (=> b!514620 (and (bvsge (index!19486 lt!235500) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235500) (size!16225 a!3235)))))

(declare-fun res!314436 () Bool)

(assert (=> b!514620 (= res!314436 (= (select (arr!15860 a!3235) (index!19486 lt!235500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300493 () Bool)

(assert (=> b!514620 (=> res!314436 e!300493)))

(declare-fun b!514621 () Bool)

(assert (=> b!514621 (= e!300492 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235394 #b00000000000000000000000000000000 mask!3524) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514622 () Bool)

(assert (=> b!514622 (and (bvsge (index!19486 lt!235500) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235500) (size!16225 a!3235)))))

(assert (=> b!514622 (= e!300493 (= (select (arr!15860 a!3235) (index!19486 lt!235500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514623 () Bool)

(declare-fun e!300491 () Bool)

(assert (=> b!514623 (= e!300494 e!300491)))

(declare-fun res!314437 () Bool)

(assert (=> b!514623 (= res!314437 (and ((_ is Intermediate!4324) lt!235500) (not (undefined!5136 lt!235500)) (bvslt (x!48460 lt!235500) #b01111111111111111111111111111110) (bvsge (x!48460 lt!235500) #b00000000000000000000000000000000) (bvsge (x!48460 lt!235500) #b00000000000000000000000000000000)))))

(assert (=> b!514623 (=> (not res!314437) (not e!300491))))

(declare-fun b!514624 () Bool)

(assert (=> b!514624 (and (bvsge (index!19486 lt!235500) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235500) (size!16225 a!3235)))))

(declare-fun res!314438 () Bool)

(assert (=> b!514624 (= res!314438 (= (select (arr!15860 a!3235) (index!19486 lt!235500)) (select (arr!15860 a!3235) j!176)))))

(assert (=> b!514624 (=> res!314438 e!300493)))

(assert (=> b!514624 (= e!300491 e!300493)))

(assert (= (and d!79289 c!60379) b!514618))

(assert (= (and d!79289 (not c!60379)) b!514617))

(assert (= (and b!514617 c!60380) b!514619))

(assert (= (and b!514617 (not c!60380)) b!514621))

(assert (= (and d!79289 c!60381) b!514616))

(assert (= (and d!79289 (not c!60381)) b!514623))

(assert (= (and b!514623 res!314437) b!514624))

(assert (= (and b!514624 (not res!314438)) b!514620))

(assert (= (and b!514620 (not res!314436)) b!514622))

(declare-fun m!495475 () Bool)

(assert (=> d!79289 m!495475))

(assert (=> d!79289 m!495327))

(declare-fun m!495477 () Bool)

(assert (=> b!514622 m!495477))

(declare-fun m!495479 () Bool)

(assert (=> b!514621 m!495479))

(assert (=> b!514621 m!495479))

(assert (=> b!514621 m!495301))

(declare-fun m!495481 () Bool)

(assert (=> b!514621 m!495481))

(assert (=> b!514620 m!495477))

(assert (=> b!514624 m!495477))

(assert (=> b!514429 d!79289))

(declare-fun d!79291 () Bool)

(declare-fun res!314442 () Bool)

(declare-fun e!300502 () Bool)

(assert (=> d!79291 (=> res!314442 e!300502)))

(assert (=> d!79291 (= res!314442 (bvsge j!176 (size!16225 a!3235)))))

(assert (=> d!79291 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300502)))

(declare-fun b!514634 () Bool)

(declare-fun e!300501 () Bool)

(declare-fun call!31604 () Bool)

(assert (=> b!514634 (= e!300501 call!31604)))

(declare-fun b!514635 () Bool)

(declare-fun e!300503 () Bool)

(assert (=> b!514635 (= e!300502 e!300503)))

(declare-fun c!60385 () Bool)

(assert (=> b!514635 (= c!60385 (validKeyInArray!0 (select (arr!15860 a!3235) j!176)))))

(declare-fun b!514636 () Bool)

(assert (=> b!514636 (= e!300503 call!31604)))

(declare-fun bm!31601 () Bool)

(assert (=> bm!31601 (= call!31604 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514637 () Bool)

(assert (=> b!514637 (= e!300503 e!300501)))

(declare-fun lt!235504 () (_ BitVec 64))

(assert (=> b!514637 (= lt!235504 (select (arr!15860 a!3235) j!176))))

(declare-fun lt!235505 () Unit!15892)

(assert (=> b!514637 (= lt!235505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235504 j!176))))

(assert (=> b!514637 (arrayContainsKey!0 a!3235 lt!235504 #b00000000000000000000000000000000)))

(declare-fun lt!235503 () Unit!15892)

(assert (=> b!514637 (= lt!235503 lt!235505)))

(declare-fun res!314443 () Bool)

(assert (=> b!514637 (= res!314443 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) (Found!4324 j!176)))))

(assert (=> b!514637 (=> (not res!314443) (not e!300501))))

(assert (= (and d!79291 (not res!314442)) b!514635))

(assert (= (and b!514635 c!60385) b!514637))

(assert (= (and b!514635 (not c!60385)) b!514636))

(assert (= (and b!514637 res!314443) b!514634))

(assert (= (or b!514634 b!514636) bm!31601))

(assert (=> b!514635 m!495301))

(assert (=> b!514635 m!495301))

(assert (=> b!514635 m!495303))

(declare-fun m!495491 () Bool)

(assert (=> bm!31601 m!495491))

(assert (=> b!514637 m!495301))

(declare-fun m!495493 () Bool)

(assert (=> b!514637 m!495493))

(declare-fun m!495495 () Bool)

(assert (=> b!514637 m!495495))

(assert (=> b!514637 m!495301))

(assert (=> b!514637 m!495323))

(assert (=> b!514429 d!79291))

(declare-fun d!79295 () Bool)

(assert (=> d!79295 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235514 () Unit!15892)

(declare-fun choose!38 (array!32981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15892)

(assert (=> d!79295 (= lt!235514 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79295 (validMask!0 mask!3524)))

(assert (=> d!79295 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235514)))

(declare-fun bs!16244 () Bool)

(assert (= bs!16244 d!79295))

(assert (=> bs!16244 m!495311))

(declare-fun m!495505 () Bool)

(assert (=> bs!16244 m!495505))

(assert (=> bs!16244 m!495327))

(assert (=> b!514429 d!79295))

(declare-fun d!79299 () Bool)

(declare-fun lt!235518 () (_ BitVec 32))

(declare-fun lt!235517 () (_ BitVec 32))

(assert (=> d!79299 (= lt!235518 (bvmul (bvxor lt!235517 (bvlshr lt!235517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79299 (= lt!235517 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79299 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314429 (let ((h!10953 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48467 (bvmul (bvxor h!10953 (bvlshr h!10953 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48467 (bvlshr x!48467 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314429 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314429 #b00000000000000000000000000000000))))))

(assert (=> d!79299 (= (toIndex!0 (select (store (arr!15860 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235518 (bvlshr lt!235518 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514429 d!79299))

(declare-fun b!514693 () Bool)

(declare-fun e!300537 () Bool)

(declare-fun contains!2723 (List!10057 (_ BitVec 64)) Bool)

(assert (=> b!514693 (= e!300537 (contains!2723 Nil!10054 (select (arr!15860 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514694 () Bool)

(declare-fun e!300539 () Bool)

(declare-fun e!300538 () Bool)

(assert (=> b!514694 (= e!300539 e!300538)))

(declare-fun res!314465 () Bool)

(assert (=> b!514694 (=> (not res!314465) (not e!300538))))

(assert (=> b!514694 (= res!314465 (not e!300537))))

(declare-fun res!314466 () Bool)

(assert (=> b!514694 (=> (not res!314466) (not e!300537))))

(assert (=> b!514694 (= res!314466 (validKeyInArray!0 (select (arr!15860 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31604 () Bool)

(declare-fun call!31607 () Bool)

(declare-fun c!60403 () Bool)

(assert (=> bm!31604 (= call!31607 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60403 (Cons!10053 (select (arr!15860 a!3235) #b00000000000000000000000000000000) Nil!10054) Nil!10054)))))

(declare-fun d!79301 () Bool)

(declare-fun res!314467 () Bool)

(assert (=> d!79301 (=> res!314467 e!300539)))

(assert (=> d!79301 (= res!314467 (bvsge #b00000000000000000000000000000000 (size!16225 a!3235)))))

(assert (=> d!79301 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10054) e!300539)))

(declare-fun b!514695 () Bool)

(declare-fun e!300540 () Bool)

(assert (=> b!514695 (= e!300540 call!31607)))

(declare-fun b!514696 () Bool)

(assert (=> b!514696 (= e!300540 call!31607)))

(declare-fun b!514697 () Bool)

(assert (=> b!514697 (= e!300538 e!300540)))

(assert (=> b!514697 (= c!60403 (validKeyInArray!0 (select (arr!15860 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79301 (not res!314467)) b!514694))

(assert (= (and b!514694 res!314466) b!514693))

(assert (= (and b!514694 res!314465) b!514697))

(assert (= (and b!514697 c!60403) b!514696))

(assert (= (and b!514697 (not c!60403)) b!514695))

(assert (= (or b!514696 b!514695) bm!31604))

(assert (=> b!514693 m!495423))

(assert (=> b!514693 m!495423))

(declare-fun m!495525 () Bool)

(assert (=> b!514693 m!495525))

(assert (=> b!514694 m!495423))

(assert (=> b!514694 m!495423))

(assert (=> b!514694 m!495427))

(assert (=> bm!31604 m!495423))

(declare-fun m!495527 () Bool)

(assert (=> bm!31604 m!495527))

(assert (=> b!514697 m!495423))

(assert (=> b!514697 m!495423))

(assert (=> b!514697 m!495427))

(assert (=> b!514424 d!79301))

(check-sat (not b!514697) (not b!514693) (not d!79289) (not b!514532) (not bm!31594) (not bm!31604) (not b!514635) (not d!79275) (not d!79247) (not b!514594) (not b!514621) (not b!514536) (not d!79253) (not b!514522) (not b!514534) (not b!514637) (not b!514512) (not b!514694) (not bm!31601) (not d!79295))
(check-sat)
