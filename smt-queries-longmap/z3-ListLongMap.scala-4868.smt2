; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67124 () Bool)

(assert start!67124)

(declare-fun e!431495 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775272 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42479 0))(
  ( (array!42480 (arr!20335 (Array (_ BitVec 32) (_ BitVec 64))) (size!20756 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42479)

(declare-datatypes ((SeekEntryResult!7935 0))(
  ( (MissingZero!7935 (index!34108 (_ BitVec 32))) (Found!7935 (index!34109 (_ BitVec 32))) (Intermediate!7935 (undefined!8747 Bool) (index!34110 (_ BitVec 32)) (x!65054 (_ BitVec 32))) (Undefined!7935) (MissingVacant!7935 (index!34111 (_ BitVec 32))) )
))
(declare-fun lt!345351 () SeekEntryResult!7935)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42479 (_ BitVec 32)) SeekEntryResult!7935)

(assert (=> b!775272 (= e!431495 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345351))))

(declare-fun b!775273 () Bool)

(declare-fun e!431493 () Bool)

(declare-fun e!431497 () Bool)

(assert (=> b!775273 (= e!431493 (not e!431497))))

(declare-fun res!524246 () Bool)

(assert (=> b!775273 (=> res!524246 e!431497)))

(declare-fun lt!345340 () SeekEntryResult!7935)

(get-info :version)

(assert (=> b!775273 (= res!524246 (or (not ((_ is Intermediate!7935) lt!345340)) (bvsge x!1131 (x!65054 lt!345340))))))

(declare-fun lt!345343 () SeekEntryResult!7935)

(assert (=> b!775273 (= lt!345343 (Found!7935 j!159))))

(declare-fun e!431504 () Bool)

(assert (=> b!775273 e!431504))

(declare-fun res!524248 () Bool)

(assert (=> b!775273 (=> (not res!524248) (not e!431504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42479 (_ BitVec 32)) Bool)

(assert (=> b!775273 (= res!524248 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26754 0))(
  ( (Unit!26755) )
))
(declare-fun lt!345352 () Unit!26754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26754)

(assert (=> b!775273 (= lt!345352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775274 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!345341 () SeekEntryResult!7935)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!431494 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42479 (_ BitVec 32)) SeekEntryResult!7935)

(assert (=> b!775274 (= e!431494 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345341))))

(declare-fun b!775275 () Bool)

(assert (=> b!775275 (= e!431504 e!431494)))

(declare-fun res!524255 () Bool)

(assert (=> b!775275 (=> (not res!524255) (not e!431494))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42479 (_ BitVec 32)) SeekEntryResult!7935)

(assert (=> b!775275 (= res!524255 (= (seekEntryOrOpen!0 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345341))))

(assert (=> b!775275 (= lt!345341 (Found!7935 j!159))))

(declare-fun b!775276 () Bool)

(declare-fun res!524254 () Bool)

(declare-fun e!431499 () Bool)

(assert (=> b!775276 (=> res!524254 e!431499)))

(declare-fun e!431500 () Bool)

(assert (=> b!775276 (= res!524254 e!431500)))

(declare-fun c!85913 () Bool)

(declare-fun lt!345345 () Bool)

(assert (=> b!775276 (= c!85913 lt!345345)))

(declare-fun b!775277 () Bool)

(declare-fun e!431498 () Bool)

(declare-fun e!431501 () Bool)

(assert (=> b!775277 (= e!431498 e!431501)))

(declare-fun res!524257 () Bool)

(assert (=> b!775277 (=> (not res!524257) (not e!431501))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775277 (= res!524257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20335 a!3186) j!159) mask!3328) (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345351))))

(assert (=> b!775277 (= lt!345351 (Intermediate!7935 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775278 () Bool)

(declare-fun res!524252 () Bool)

(assert (=> b!775278 (=> res!524252 e!431499)))

(declare-fun lt!345350 () SeekEntryResult!7935)

(declare-fun lt!345347 () (_ BitVec 32))

(declare-fun lt!345349 () (_ BitVec 64))

(declare-fun lt!345344 () array!42479)

(assert (=> b!775278 (= res!524252 (not (= lt!345350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345347 lt!345349 lt!345344 mask!3328))))))

(declare-fun b!775279 () Bool)

(assert (=> b!775279 (= e!431500 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345347 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345343)))))

(declare-fun b!775280 () Bool)

(declare-fun res!524261 () Bool)

(declare-fun e!431496 () Bool)

(assert (=> b!775280 (=> (not res!524261) (not e!431496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775280 (= res!524261 (validKeyInArray!0 (select (arr!20335 a!3186) j!159)))))

(declare-fun b!775281 () Bool)

(declare-fun res!524253 () Bool)

(assert (=> b!775281 (=> (not res!524253) (not e!431498))))

(declare-datatypes ((List!14337 0))(
  ( (Nil!14334) (Cons!14333 (h!15441 (_ BitVec 64)) (t!20652 List!14337)) )
))
(declare-fun arrayNoDuplicates!0 (array!42479 (_ BitVec 32) List!14337) Bool)

(assert (=> b!775281 (= res!524253 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14334))))

(declare-fun res!524260 () Bool)

(assert (=> start!67124 (=> (not res!524260) (not e!431496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67124 (= res!524260 (validMask!0 mask!3328))))

(assert (=> start!67124 e!431496))

(assert (=> start!67124 true))

(declare-fun array_inv!16131 (array!42479) Bool)

(assert (=> start!67124 (array_inv!16131 a!3186)))

(declare-fun b!775282 () Bool)

(assert (=> b!775282 (= e!431500 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345347 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345351)))))

(declare-fun b!775283 () Bool)

(assert (=> b!775283 (= e!431496 e!431498)))

(declare-fun res!524256 () Bool)

(assert (=> b!775283 (=> (not res!524256) (not e!431498))))

(declare-fun lt!345346 () SeekEntryResult!7935)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775283 (= res!524256 (or (= lt!345346 (MissingZero!7935 i!1173)) (= lt!345346 (MissingVacant!7935 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!775283 (= lt!345346 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775284 () Bool)

(declare-fun e!431503 () Unit!26754)

(declare-fun Unit!26756 () Unit!26754)

(assert (=> b!775284 (= e!431503 Unit!26756)))

(assert (=> b!775284 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345347 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345351)))

(declare-fun b!775285 () Bool)

(declare-fun res!524258 () Bool)

(assert (=> b!775285 (=> (not res!524258) (not e!431496))))

(assert (=> b!775285 (= res!524258 (and (= (size!20756 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20756 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20756 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775286 () Bool)

(declare-fun res!524263 () Bool)

(assert (=> b!775286 (=> (not res!524263) (not e!431498))))

(assert (=> b!775286 (= res!524263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775287 () Bool)

(assert (=> b!775287 (= e!431495 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) (Found!7935 j!159)))))

(declare-fun b!775288 () Bool)

(declare-fun res!524264 () Bool)

(assert (=> b!775288 (=> (not res!524264) (not e!431501))))

(assert (=> b!775288 (= res!524264 e!431495)))

(declare-fun c!85914 () Bool)

(assert (=> b!775288 (= c!85914 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775289 () Bool)

(declare-fun Unit!26757 () Unit!26754)

(assert (=> b!775289 (= e!431503 Unit!26757)))

(declare-fun lt!345348 () SeekEntryResult!7935)

(assert (=> b!775289 (= lt!345348 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775289 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345347 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345343)))

(declare-fun b!775290 () Bool)

(assert (=> b!775290 (= e!431497 e!431499)))

(declare-fun res!524262 () Bool)

(assert (=> b!775290 (=> res!524262 e!431499)))

(assert (=> b!775290 (= res!524262 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345347 #b00000000000000000000000000000000) (bvsge lt!345347 (size!20756 a!3186))))))

(declare-fun lt!345342 () Unit!26754)

(assert (=> b!775290 (= lt!345342 e!431503)))

(declare-fun c!85915 () Bool)

(assert (=> b!775290 (= c!85915 lt!345345)))

(assert (=> b!775290 (= lt!345345 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775290 (= lt!345347 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775291 () Bool)

(declare-fun res!524247 () Bool)

(assert (=> b!775291 (=> (not res!524247) (not e!431501))))

(assert (=> b!775291 (= res!524247 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20335 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775292 () Bool)

(declare-fun res!524249 () Bool)

(assert (=> b!775292 (=> (not res!524249) (not e!431496))))

(assert (=> b!775292 (= res!524249 (validKeyInArray!0 k0!2102))))

(declare-fun b!775293 () Bool)

(assert (=> b!775293 (= e!431499 true)))

(assert (=> b!775293 (= (seekEntryOrOpen!0 lt!345349 lt!345344 mask!3328) lt!345343)))

(declare-fun lt!345353 () Unit!26754)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26754)

(assert (=> b!775293 (= lt!345353 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345347 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775294 () Bool)

(assert (=> b!775294 (= e!431501 e!431493)))

(declare-fun res!524251 () Bool)

(assert (=> b!775294 (=> (not res!524251) (not e!431493))))

(assert (=> b!775294 (= res!524251 (= lt!345350 lt!345340))))

(assert (=> b!775294 (= lt!345340 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345349 lt!345344 mask!3328))))

(assert (=> b!775294 (= lt!345350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345349 mask!3328) lt!345349 lt!345344 mask!3328))))

(assert (=> b!775294 (= lt!345349 (select (store (arr!20335 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775294 (= lt!345344 (array!42480 (store (arr!20335 a!3186) i!1173 k0!2102) (size!20756 a!3186)))))

(declare-fun b!775295 () Bool)

(declare-fun res!524259 () Bool)

(assert (=> b!775295 (=> (not res!524259) (not e!431498))))

(assert (=> b!775295 (= res!524259 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20756 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20756 a!3186))))))

(declare-fun b!775296 () Bool)

(declare-fun res!524250 () Bool)

(assert (=> b!775296 (=> (not res!524250) (not e!431496))))

(declare-fun arrayContainsKey!0 (array!42479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775296 (= res!524250 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67124 res!524260) b!775285))

(assert (= (and b!775285 res!524258) b!775280))

(assert (= (and b!775280 res!524261) b!775292))

(assert (= (and b!775292 res!524249) b!775296))

(assert (= (and b!775296 res!524250) b!775283))

(assert (= (and b!775283 res!524256) b!775286))

(assert (= (and b!775286 res!524263) b!775281))

(assert (= (and b!775281 res!524253) b!775295))

(assert (= (and b!775295 res!524259) b!775277))

(assert (= (and b!775277 res!524257) b!775291))

(assert (= (and b!775291 res!524247) b!775288))

(assert (= (and b!775288 c!85914) b!775272))

(assert (= (and b!775288 (not c!85914)) b!775287))

(assert (= (and b!775288 res!524264) b!775294))

(assert (= (and b!775294 res!524251) b!775273))

(assert (= (and b!775273 res!524248) b!775275))

(assert (= (and b!775275 res!524255) b!775274))

(assert (= (and b!775273 (not res!524246)) b!775290))

(assert (= (and b!775290 c!85915) b!775284))

(assert (= (and b!775290 (not c!85915)) b!775289))

(assert (= (and b!775290 (not res!524262)) b!775276))

(assert (= (and b!775276 c!85913) b!775282))

(assert (= (and b!775276 (not c!85913)) b!775279))

(assert (= (and b!775276 (not res!524254)) b!775278))

(assert (= (and b!775278 (not res!524252)) b!775293))

(declare-fun m!719535 () Bool)

(assert (=> b!775281 m!719535))

(declare-fun m!719537 () Bool)

(assert (=> b!775287 m!719537))

(assert (=> b!775287 m!719537))

(declare-fun m!719539 () Bool)

(assert (=> b!775287 m!719539))

(declare-fun m!719541 () Bool)

(assert (=> b!775278 m!719541))

(declare-fun m!719543 () Bool)

(assert (=> b!775273 m!719543))

(declare-fun m!719545 () Bool)

(assert (=> b!775273 m!719545))

(assert (=> b!775282 m!719537))

(assert (=> b!775282 m!719537))

(declare-fun m!719547 () Bool)

(assert (=> b!775282 m!719547))

(declare-fun m!719549 () Bool)

(assert (=> b!775283 m!719549))

(assert (=> b!775272 m!719537))

(assert (=> b!775272 m!719537))

(declare-fun m!719551 () Bool)

(assert (=> b!775272 m!719551))

(assert (=> b!775289 m!719537))

(assert (=> b!775289 m!719537))

(assert (=> b!775289 m!719539))

(assert (=> b!775289 m!719537))

(declare-fun m!719553 () Bool)

(assert (=> b!775289 m!719553))

(declare-fun m!719555 () Bool)

(assert (=> b!775286 m!719555))

(assert (=> b!775284 m!719537))

(assert (=> b!775284 m!719537))

(assert (=> b!775284 m!719547))

(assert (=> b!775280 m!719537))

(assert (=> b!775280 m!719537))

(declare-fun m!719557 () Bool)

(assert (=> b!775280 m!719557))

(declare-fun m!719559 () Bool)

(assert (=> b!775290 m!719559))

(declare-fun m!719561 () Bool)

(assert (=> b!775292 m!719561))

(assert (=> b!775274 m!719537))

(assert (=> b!775274 m!719537))

(declare-fun m!719563 () Bool)

(assert (=> b!775274 m!719563))

(assert (=> b!775277 m!719537))

(assert (=> b!775277 m!719537))

(declare-fun m!719565 () Bool)

(assert (=> b!775277 m!719565))

(assert (=> b!775277 m!719565))

(assert (=> b!775277 m!719537))

(declare-fun m!719567 () Bool)

(assert (=> b!775277 m!719567))

(declare-fun m!719569 () Bool)

(assert (=> b!775296 m!719569))

(declare-fun m!719571 () Bool)

(assert (=> start!67124 m!719571))

(declare-fun m!719573 () Bool)

(assert (=> start!67124 m!719573))

(declare-fun m!719575 () Bool)

(assert (=> b!775293 m!719575))

(declare-fun m!719577 () Bool)

(assert (=> b!775293 m!719577))

(assert (=> b!775275 m!719537))

(assert (=> b!775275 m!719537))

(declare-fun m!719579 () Bool)

(assert (=> b!775275 m!719579))

(declare-fun m!719581 () Bool)

(assert (=> b!775291 m!719581))

(declare-fun m!719583 () Bool)

(assert (=> b!775294 m!719583))

(declare-fun m!719585 () Bool)

(assert (=> b!775294 m!719585))

(declare-fun m!719587 () Bool)

(assert (=> b!775294 m!719587))

(declare-fun m!719589 () Bool)

(assert (=> b!775294 m!719589))

(declare-fun m!719591 () Bool)

(assert (=> b!775294 m!719591))

(assert (=> b!775294 m!719587))

(assert (=> b!775279 m!719537))

(assert (=> b!775279 m!719537))

(assert (=> b!775279 m!719553))

(check-sat (not start!67124) (not b!775274) (not b!775283) (not b!775289) (not b!775280) (not b!775296) (not b!775292) (not b!775279) (not b!775278) (not b!775293) (not b!775290) (not b!775286) (not b!775287) (not b!775275) (not b!775273) (not b!775272) (not b!775284) (not b!775277) (not b!775281) (not b!775282) (not b!775294))
(check-sat)
