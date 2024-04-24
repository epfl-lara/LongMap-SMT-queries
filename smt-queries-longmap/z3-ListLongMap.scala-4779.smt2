; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65862 () Bool)

(assert start!65862)

(declare-fun b!755481 () Bool)

(declare-fun e!421385 () Bool)

(assert (=> b!755481 (= e!421385 true)))

(declare-fun e!421387 () Bool)

(assert (=> b!755481 e!421387))

(declare-fun res!510341 () Bool)

(assert (=> b!755481 (=> (not res!510341) (not e!421387))))

(declare-fun lt!336212 () (_ BitVec 64))

(assert (=> b!755481 (= res!510341 (= lt!336212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26029 0))(
  ( (Unit!26030) )
))
(declare-fun lt!336220 () Unit!26029)

(declare-fun e!421384 () Unit!26029)

(assert (=> b!755481 (= lt!336220 e!421384)))

(declare-fun c!82955 () Bool)

(assert (=> b!755481 (= c!82955 (= lt!336212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755482 () Bool)

(declare-fun Unit!26031 () Unit!26029)

(assert (=> b!755482 (= e!421384 Unit!26031)))

(declare-fun b!755483 () Bool)

(declare-fun res!510357 () Bool)

(declare-fun e!421394 () Bool)

(assert (=> b!755483 (=> (not res!510357) (not e!421394))))

(declare-datatypes ((array!41905 0))(
  ( (array!41906 (arr!20062 (Array (_ BitVec 32) (_ BitVec 64))) (size!20482 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41905)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!755483 (= res!510357 (and (= (size!20482 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20482 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20482 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755484 () Bool)

(declare-fun Unit!26032 () Unit!26029)

(assert (=> b!755484 (= e!421384 Unit!26032)))

(assert (=> b!755484 false))

(declare-fun b!755485 () Bool)

(declare-fun e!421389 () Bool)

(declare-fun e!421395 () Bool)

(assert (=> b!755485 (= e!421389 e!421395)))

(declare-fun res!510354 () Bool)

(assert (=> b!755485 (=> (not res!510354) (not e!421395))))

(declare-datatypes ((SeekEntryResult!7618 0))(
  ( (MissingZero!7618 (index!32840 (_ BitVec 32))) (Found!7618 (index!32841 (_ BitVec 32))) (Intermediate!7618 (undefined!8430 Bool) (index!32842 (_ BitVec 32)) (x!63908 (_ BitVec 32))) (Undefined!7618) (MissingVacant!7618 (index!32843 (_ BitVec 32))) )
))
(declare-fun lt!336215 () SeekEntryResult!7618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755485 (= res!510354 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20062 a!3186) j!159) mask!3328) (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!336215))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755485 (= lt!336215 (Intermediate!7618 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755487 () Bool)

(declare-fun e!421386 () Bool)

(assert (=> b!755487 (= e!421386 e!421385)))

(declare-fun res!510343 () Bool)

(assert (=> b!755487 (=> res!510343 e!421385)))

(declare-fun lt!336221 () (_ BitVec 64))

(assert (=> b!755487 (= res!510343 (= lt!336212 lt!336221))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755487 (= lt!336212 (select (store (arr!20062 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755488 () Bool)

(declare-fun res!510353 () Bool)

(assert (=> b!755488 (=> (not res!510353) (not e!421394))))

(declare-fun arrayContainsKey!0 (array!41905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755488 (= res!510353 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755489 () Bool)

(declare-fun e!421392 () Bool)

(declare-fun lt!336213 () SeekEntryResult!7618)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!755489 (= e!421392 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!336213))))

(declare-fun b!755490 () Bool)

(declare-fun res!510345 () Bool)

(assert (=> b!755490 (=> (not res!510345) (not e!421389))))

(declare-datatypes ((List!13971 0))(
  ( (Nil!13968) (Cons!13967 (h!15045 (_ BitVec 64)) (t!20278 List!13971)) )
))
(declare-fun arrayNoDuplicates!0 (array!41905 (_ BitVec 32) List!13971) Bool)

(assert (=> b!755490 (= res!510345 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13968))))

(declare-fun b!755491 () Bool)

(declare-fun res!510351 () Bool)

(assert (=> b!755491 (=> (not res!510351) (not e!421395))))

(declare-fun e!421390 () Bool)

(assert (=> b!755491 (= res!510351 e!421390)))

(declare-fun c!82954 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!755491 (= c!82954 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755492 () Bool)

(declare-fun e!421393 () Bool)

(assert (=> b!755492 (= e!421395 e!421393)))

(declare-fun res!510358 () Bool)

(assert (=> b!755492 (=> (not res!510358) (not e!421393))))

(declare-fun lt!336222 () SeekEntryResult!7618)

(declare-fun lt!336211 () SeekEntryResult!7618)

(assert (=> b!755492 (= res!510358 (= lt!336222 lt!336211))))

(declare-fun lt!336217 () array!41905)

(assert (=> b!755492 (= lt!336211 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336221 lt!336217 mask!3328))))

(assert (=> b!755492 (= lt!336222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336221 mask!3328) lt!336221 lt!336217 mask!3328))))

(assert (=> b!755492 (= lt!336221 (select (store (arr!20062 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755492 (= lt!336217 (array!41906 (store (arr!20062 a!3186) i!1173 k0!2102) (size!20482 a!3186)))))

(declare-fun b!755493 () Bool)

(declare-fun res!510352 () Bool)

(assert (=> b!755493 (=> (not res!510352) (not e!421394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755493 (= res!510352 (validKeyInArray!0 (select (arr!20062 a!3186) j!159)))))

(declare-fun b!755494 () Bool)

(declare-fun res!510346 () Bool)

(assert (=> b!755494 (=> (not res!510346) (not e!421395))))

(assert (=> b!755494 (= res!510346 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20062 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755495 () Bool)

(assert (=> b!755495 (= e!421390 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) (Found!7618 j!159)))))

(declare-fun b!755496 () Bool)

(declare-fun res!510348 () Bool)

(assert (=> b!755496 (=> (not res!510348) (not e!421387))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!755496 (= res!510348 (= (seekEntryOrOpen!0 lt!336221 lt!336217 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336221 lt!336217 mask!3328)))))

(declare-fun b!755497 () Bool)

(declare-fun lt!336218 () SeekEntryResult!7618)

(declare-fun lt!336214 () SeekEntryResult!7618)

(assert (=> b!755497 (= e!421387 (= lt!336218 lt!336214))))

(declare-fun b!755498 () Bool)

(declare-fun e!421388 () Bool)

(assert (=> b!755498 (= e!421388 e!421386)))

(declare-fun res!510347 () Bool)

(assert (=> b!755498 (=> res!510347 e!421386)))

(assert (=> b!755498 (= res!510347 (not (= lt!336214 lt!336213)))))

(assert (=> b!755498 (= lt!336214 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755499 () Bool)

(assert (=> b!755499 (= e!421390 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!336215))))

(declare-fun b!755500 () Bool)

(declare-fun res!510349 () Bool)

(assert (=> b!755500 (=> (not res!510349) (not e!421389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41905 (_ BitVec 32)) Bool)

(assert (=> b!755500 (= res!510349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755501 () Bool)

(declare-fun res!510356 () Bool)

(assert (=> b!755501 (=> (not res!510356) (not e!421394))))

(assert (=> b!755501 (= res!510356 (validKeyInArray!0 k0!2102))))

(declare-fun b!755486 () Bool)

(assert (=> b!755486 (= e!421393 (not e!421388))))

(declare-fun res!510355 () Bool)

(assert (=> b!755486 (=> res!510355 e!421388)))

(get-info :version)

(assert (=> b!755486 (= res!510355 (or (not ((_ is Intermediate!7618) lt!336211)) (bvslt x!1131 (x!63908 lt!336211)) (not (= x!1131 (x!63908 lt!336211))) (not (= index!1321 (index!32842 lt!336211)))))))

(assert (=> b!755486 e!421392))

(declare-fun res!510344 () Bool)

(assert (=> b!755486 (=> (not res!510344) (not e!421392))))

(assert (=> b!755486 (= res!510344 (= lt!336218 lt!336213))))

(assert (=> b!755486 (= lt!336213 (Found!7618 j!159))))

(assert (=> b!755486 (= lt!336218 (seekEntryOrOpen!0 (select (arr!20062 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755486 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336219 () Unit!26029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26029)

(assert (=> b!755486 (= lt!336219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!510342 () Bool)

(assert (=> start!65862 (=> (not res!510342) (not e!421394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65862 (= res!510342 (validMask!0 mask!3328))))

(assert (=> start!65862 e!421394))

(assert (=> start!65862 true))

(declare-fun array_inv!15921 (array!41905) Bool)

(assert (=> start!65862 (array_inv!15921 a!3186)))

(declare-fun b!755502 () Bool)

(declare-fun res!510350 () Bool)

(assert (=> b!755502 (=> (not res!510350) (not e!421389))))

(assert (=> b!755502 (= res!510350 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20482 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20482 a!3186))))))

(declare-fun b!755503 () Bool)

(assert (=> b!755503 (= e!421394 e!421389)))

(declare-fun res!510340 () Bool)

(assert (=> b!755503 (=> (not res!510340) (not e!421389))))

(declare-fun lt!336216 () SeekEntryResult!7618)

(assert (=> b!755503 (= res!510340 (or (= lt!336216 (MissingZero!7618 i!1173)) (= lt!336216 (MissingVacant!7618 i!1173))))))

(assert (=> b!755503 (= lt!336216 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65862 res!510342) b!755483))

(assert (= (and b!755483 res!510357) b!755493))

(assert (= (and b!755493 res!510352) b!755501))

(assert (= (and b!755501 res!510356) b!755488))

(assert (= (and b!755488 res!510353) b!755503))

(assert (= (and b!755503 res!510340) b!755500))

(assert (= (and b!755500 res!510349) b!755490))

(assert (= (and b!755490 res!510345) b!755502))

(assert (= (and b!755502 res!510350) b!755485))

(assert (= (and b!755485 res!510354) b!755494))

(assert (= (and b!755494 res!510346) b!755491))

(assert (= (and b!755491 c!82954) b!755499))

(assert (= (and b!755491 (not c!82954)) b!755495))

(assert (= (and b!755491 res!510351) b!755492))

(assert (= (and b!755492 res!510358) b!755486))

(assert (= (and b!755486 res!510344) b!755489))

(assert (= (and b!755486 (not res!510355)) b!755498))

(assert (= (and b!755498 (not res!510347)) b!755487))

(assert (= (and b!755487 (not res!510343)) b!755481))

(assert (= (and b!755481 c!82955) b!755484))

(assert (= (and b!755481 (not c!82955)) b!755482))

(assert (= (and b!755481 res!510341) b!755496))

(assert (= (and b!755496 res!510348) b!755497))

(declare-fun m!704271 () Bool)

(assert (=> b!755489 m!704271))

(assert (=> b!755489 m!704271))

(declare-fun m!704273 () Bool)

(assert (=> b!755489 m!704273))

(assert (=> b!755499 m!704271))

(assert (=> b!755499 m!704271))

(declare-fun m!704275 () Bool)

(assert (=> b!755499 m!704275))

(declare-fun m!704277 () Bool)

(assert (=> b!755490 m!704277))

(declare-fun m!704279 () Bool)

(assert (=> b!755492 m!704279))

(declare-fun m!704281 () Bool)

(assert (=> b!755492 m!704281))

(declare-fun m!704283 () Bool)

(assert (=> b!755492 m!704283))

(declare-fun m!704285 () Bool)

(assert (=> b!755492 m!704285))

(declare-fun m!704287 () Bool)

(assert (=> b!755492 m!704287))

(assert (=> b!755492 m!704279))

(declare-fun m!704289 () Bool)

(assert (=> b!755503 m!704289))

(declare-fun m!704291 () Bool)

(assert (=> b!755501 m!704291))

(assert (=> b!755493 m!704271))

(assert (=> b!755493 m!704271))

(declare-fun m!704293 () Bool)

(assert (=> b!755493 m!704293))

(assert (=> b!755498 m!704271))

(assert (=> b!755498 m!704271))

(declare-fun m!704295 () Bool)

(assert (=> b!755498 m!704295))

(assert (=> b!755487 m!704285))

(declare-fun m!704297 () Bool)

(assert (=> b!755487 m!704297))

(assert (=> b!755486 m!704271))

(assert (=> b!755486 m!704271))

(declare-fun m!704299 () Bool)

(assert (=> b!755486 m!704299))

(declare-fun m!704301 () Bool)

(assert (=> b!755486 m!704301))

(declare-fun m!704303 () Bool)

(assert (=> b!755486 m!704303))

(declare-fun m!704305 () Bool)

(assert (=> b!755496 m!704305))

(declare-fun m!704307 () Bool)

(assert (=> b!755496 m!704307))

(declare-fun m!704309 () Bool)

(assert (=> b!755500 m!704309))

(declare-fun m!704311 () Bool)

(assert (=> b!755494 m!704311))

(declare-fun m!704313 () Bool)

(assert (=> b!755488 m!704313))

(assert (=> b!755485 m!704271))

(assert (=> b!755485 m!704271))

(declare-fun m!704315 () Bool)

(assert (=> b!755485 m!704315))

(assert (=> b!755485 m!704315))

(assert (=> b!755485 m!704271))

(declare-fun m!704317 () Bool)

(assert (=> b!755485 m!704317))

(assert (=> b!755495 m!704271))

(assert (=> b!755495 m!704271))

(assert (=> b!755495 m!704295))

(declare-fun m!704319 () Bool)

(assert (=> start!65862 m!704319))

(declare-fun m!704321 () Bool)

(assert (=> start!65862 m!704321))

(check-sat (not b!755499) (not b!755489) (not b!755495) (not b!755486) (not b!755500) (not b!755496) (not b!755490) (not b!755485) (not b!755501) (not b!755493) (not start!65862) (not b!755503) (not b!755498) (not b!755488) (not b!755492))
(check-sat)
