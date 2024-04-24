; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64788 () Bool)

(assert start!64788)

(declare-fun b!729323 () Bool)

(declare-fun e!408313 () Bool)

(assert (=> b!729323 (= e!408313 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!323052 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729323 (= lt!323052 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!729324 () Bool)

(declare-fun res!489396 () Bool)

(declare-fun e!408317 () Bool)

(assert (=> b!729324 (=> (not res!489396) (not e!408317))))

(declare-fun e!408311 () Bool)

(assert (=> b!729324 (= res!489396 e!408311)))

(declare-fun c!80348 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729324 (= c!80348 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729325 () Bool)

(declare-fun res!489397 () Bool)

(declare-fun e!408316 () Bool)

(assert (=> b!729325 (=> (not res!489397) (not e!408316))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41107 0))(
  ( (array!41108 (arr!19669 (Array (_ BitVec 32) (_ BitVec 64))) (size!20089 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41107)

(assert (=> b!729325 (= res!489397 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20089 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20089 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7225 0))(
  ( (MissingZero!7225 (index!31268 (_ BitVec 32))) (Found!7225 (index!31269 (_ BitVec 32))) (Intermediate!7225 (undefined!8037 Bool) (index!31270 (_ BitVec 32)) (x!62419 (_ BitVec 32))) (Undefined!7225) (MissingVacant!7225 (index!31271 (_ BitVec 32))) )
))
(declare-fun lt!323050 () SeekEntryResult!7225)

(declare-fun b!729326 () Bool)

(declare-fun e!408312 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!729326 (= e!408312 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!323050))))

(declare-fun b!729327 () Bool)

(declare-fun e!408310 () Bool)

(assert (=> b!729327 (= e!408310 (not e!408313))))

(declare-fun res!489385 () Bool)

(assert (=> b!729327 (=> res!489385 e!408313)))

(declare-fun lt!323045 () SeekEntryResult!7225)

(get-info :version)

(assert (=> b!729327 (= res!489385 (or (not ((_ is Intermediate!7225) lt!323045)) (bvsge x!1131 (x!62419 lt!323045))))))

(declare-fun e!408314 () Bool)

(assert (=> b!729327 e!408314))

(declare-fun res!489383 () Bool)

(assert (=> b!729327 (=> (not res!489383) (not e!408314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41107 (_ BitVec 32)) Bool)

(assert (=> b!729327 (= res!489383 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24847 0))(
  ( (Unit!24848) )
))
(declare-fun lt!323046 () Unit!24847)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24847)

(assert (=> b!729327 (= lt!323046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729328 () Bool)

(assert (=> b!729328 (= e!408314 e!408312)))

(declare-fun res!489389 () Bool)

(assert (=> b!729328 (=> (not res!489389) (not e!408312))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!729328 (= res!489389 (= (seekEntryOrOpen!0 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!323050))))

(assert (=> b!729328 (= lt!323050 (Found!7225 j!159))))

(declare-fun b!729329 () Bool)

(declare-fun res!489388 () Bool)

(assert (=> b!729329 (=> (not res!489388) (not e!408316))))

(declare-datatypes ((List!13578 0))(
  ( (Nil!13575) (Cons!13574 (h!14640 (_ BitVec 64)) (t!19885 List!13578)) )
))
(declare-fun arrayNoDuplicates!0 (array!41107 (_ BitVec 32) List!13578) Bool)

(assert (=> b!729329 (= res!489388 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13575))))

(declare-fun res!489382 () Bool)

(declare-fun e!408318 () Bool)

(assert (=> start!64788 (=> (not res!489382) (not e!408318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64788 (= res!489382 (validMask!0 mask!3328))))

(assert (=> start!64788 e!408318))

(assert (=> start!64788 true))

(declare-fun array_inv!15528 (array!41107) Bool)

(assert (=> start!64788 (array_inv!15528 a!3186)))

(declare-fun b!729330 () Bool)

(declare-fun res!489393 () Bool)

(assert (=> b!729330 (=> (not res!489393) (not e!408318))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729330 (= res!489393 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729331 () Bool)

(declare-fun res!489384 () Bool)

(assert (=> b!729331 (=> (not res!489384) (not e!408318))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729331 (= res!489384 (and (= (size!20089 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20089 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20089 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729332 () Bool)

(assert (=> b!729332 (= e!408311 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) (Found!7225 j!159)))))

(declare-fun b!729333 () Bool)

(assert (=> b!729333 (= e!408317 e!408310)))

(declare-fun res!489386 () Bool)

(assert (=> b!729333 (=> (not res!489386) (not e!408310))))

(declare-fun lt!323049 () SeekEntryResult!7225)

(assert (=> b!729333 (= res!489386 (= lt!323049 lt!323045))))

(declare-fun lt!323047 () (_ BitVec 64))

(declare-fun lt!323048 () array!41107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!729333 (= lt!323045 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323047 lt!323048 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729333 (= lt!323049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323047 mask!3328) lt!323047 lt!323048 mask!3328))))

(assert (=> b!729333 (= lt!323047 (select (store (arr!19669 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729333 (= lt!323048 (array!41108 (store (arr!19669 a!3186) i!1173 k0!2102) (size!20089 a!3186)))))

(declare-fun b!729334 () Bool)

(assert (=> b!729334 (= e!408318 e!408316)))

(declare-fun res!489395 () Bool)

(assert (=> b!729334 (=> (not res!489395) (not e!408316))))

(declare-fun lt!323051 () SeekEntryResult!7225)

(assert (=> b!729334 (= res!489395 (or (= lt!323051 (MissingZero!7225 i!1173)) (= lt!323051 (MissingVacant!7225 i!1173))))))

(assert (=> b!729334 (= lt!323051 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729335 () Bool)

(declare-fun res!489387 () Bool)

(assert (=> b!729335 (=> (not res!489387) (not e!408316))))

(assert (=> b!729335 (= res!489387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729336 () Bool)

(declare-fun res!489391 () Bool)

(assert (=> b!729336 (=> (not res!489391) (not e!408318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729336 (= res!489391 (validKeyInArray!0 k0!2102))))

(declare-fun b!729337 () Bool)

(declare-fun res!489390 () Bool)

(assert (=> b!729337 (=> (not res!489390) (not e!408318))))

(assert (=> b!729337 (= res!489390 (validKeyInArray!0 (select (arr!19669 a!3186) j!159)))))

(declare-fun lt!323044 () SeekEntryResult!7225)

(declare-fun b!729338 () Bool)

(assert (=> b!729338 (= e!408311 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!323044))))

(declare-fun b!729339 () Bool)

(declare-fun res!489392 () Bool)

(assert (=> b!729339 (=> (not res!489392) (not e!408317))))

(assert (=> b!729339 (= res!489392 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19669 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729340 () Bool)

(assert (=> b!729340 (= e!408316 e!408317)))

(declare-fun res!489394 () Bool)

(assert (=> b!729340 (=> (not res!489394) (not e!408317))))

(assert (=> b!729340 (= res!489394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19669 a!3186) j!159) mask!3328) (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!323044))))

(assert (=> b!729340 (= lt!323044 (Intermediate!7225 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64788 res!489382) b!729331))

(assert (= (and b!729331 res!489384) b!729337))

(assert (= (and b!729337 res!489390) b!729336))

(assert (= (and b!729336 res!489391) b!729330))

(assert (= (and b!729330 res!489393) b!729334))

(assert (= (and b!729334 res!489395) b!729335))

(assert (= (and b!729335 res!489387) b!729329))

(assert (= (and b!729329 res!489388) b!729325))

(assert (= (and b!729325 res!489397) b!729340))

(assert (= (and b!729340 res!489394) b!729339))

(assert (= (and b!729339 res!489392) b!729324))

(assert (= (and b!729324 c!80348) b!729338))

(assert (= (and b!729324 (not c!80348)) b!729332))

(assert (= (and b!729324 res!489396) b!729333))

(assert (= (and b!729333 res!489386) b!729327))

(assert (= (and b!729327 res!489383) b!729328))

(assert (= (and b!729328 res!489389) b!729326))

(assert (= (and b!729327 (not res!489385)) b!729323))

(declare-fun m!683451 () Bool)

(assert (=> b!729323 m!683451))

(declare-fun m!683453 () Bool)

(assert (=> b!729326 m!683453))

(assert (=> b!729326 m!683453))

(declare-fun m!683455 () Bool)

(assert (=> b!729326 m!683455))

(declare-fun m!683457 () Bool)

(assert (=> b!729339 m!683457))

(assert (=> b!729340 m!683453))

(assert (=> b!729340 m!683453))

(declare-fun m!683459 () Bool)

(assert (=> b!729340 m!683459))

(assert (=> b!729340 m!683459))

(assert (=> b!729340 m!683453))

(declare-fun m!683461 () Bool)

(assert (=> b!729340 m!683461))

(declare-fun m!683463 () Bool)

(assert (=> b!729333 m!683463))

(declare-fun m!683465 () Bool)

(assert (=> b!729333 m!683465))

(declare-fun m!683467 () Bool)

(assert (=> b!729333 m!683467))

(declare-fun m!683469 () Bool)

(assert (=> b!729333 m!683469))

(assert (=> b!729333 m!683465))

(declare-fun m!683471 () Bool)

(assert (=> b!729333 m!683471))

(declare-fun m!683473 () Bool)

(assert (=> start!64788 m!683473))

(declare-fun m!683475 () Bool)

(assert (=> start!64788 m!683475))

(declare-fun m!683477 () Bool)

(assert (=> b!729330 m!683477))

(declare-fun m!683479 () Bool)

(assert (=> b!729329 m!683479))

(declare-fun m!683481 () Bool)

(assert (=> b!729335 m!683481))

(declare-fun m!683483 () Bool)

(assert (=> b!729336 m!683483))

(declare-fun m!683485 () Bool)

(assert (=> b!729327 m!683485))

(declare-fun m!683487 () Bool)

(assert (=> b!729327 m!683487))

(assert (=> b!729338 m!683453))

(assert (=> b!729338 m!683453))

(declare-fun m!683489 () Bool)

(assert (=> b!729338 m!683489))

(assert (=> b!729337 m!683453))

(assert (=> b!729337 m!683453))

(declare-fun m!683491 () Bool)

(assert (=> b!729337 m!683491))

(declare-fun m!683493 () Bool)

(assert (=> b!729334 m!683493))

(assert (=> b!729328 m!683453))

(assert (=> b!729328 m!683453))

(declare-fun m!683495 () Bool)

(assert (=> b!729328 m!683495))

(assert (=> b!729332 m!683453))

(assert (=> b!729332 m!683453))

(declare-fun m!683497 () Bool)

(assert (=> b!729332 m!683497))

(check-sat (not b!729327) (not b!729340) (not b!729333) (not b!729335) (not b!729336) (not b!729337) (not b!729332) (not b!729326) (not b!729323) (not b!729328) (not b!729338) (not b!729334) (not b!729329) (not b!729330) (not start!64788))
(check-sat)
