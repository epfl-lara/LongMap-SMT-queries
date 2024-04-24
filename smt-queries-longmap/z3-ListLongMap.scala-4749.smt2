; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65682 () Bool)

(assert start!65682)

(declare-fun b!749420 () Bool)

(declare-fun res!505367 () Bool)

(declare-fun e!418320 () Bool)

(assert (=> b!749420 (=> res!505367 e!418320)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7528 0))(
  ( (MissingZero!7528 (index!32480 (_ BitVec 32))) (Found!7528 (index!32481 (_ BitVec 32))) (Intermediate!7528 (undefined!8340 Bool) (index!32482 (_ BitVec 32)) (x!63578 (_ BitVec 32))) (Undefined!7528) (MissingVacant!7528 (index!32483 (_ BitVec 32))) )
))
(declare-fun lt!333135 () SeekEntryResult!7528)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41725 0))(
  ( (array!41726 (arr!19972 (Array (_ BitVec 32) (_ BitVec 64))) (size!20392 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41725)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!749420 (= res!505367 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!333135)))))

(declare-fun b!749421 () Bool)

(declare-fun res!505363 () Bool)

(declare-fun e!418322 () Bool)

(assert (=> b!749421 (=> (not res!505363) (not e!418322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41725 (_ BitVec 32)) Bool)

(assert (=> b!749421 (= res!505363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749422 () Bool)

(declare-fun e!418326 () Bool)

(assert (=> b!749422 (= e!418326 e!418322)))

(declare-fun res!505373 () Bool)

(assert (=> b!749422 (=> (not res!505373) (not e!418322))))

(declare-fun lt!333132 () SeekEntryResult!7528)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749422 (= res!505373 (or (= lt!333132 (MissingZero!7528 i!1173)) (= lt!333132 (MissingVacant!7528 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!749422 (= lt!333132 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749423 () Bool)

(declare-fun res!505364 () Bool)

(assert (=> b!749423 (=> (not res!505364) (not e!418322))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749423 (= res!505364 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20392 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20392 a!3186))))))

(declare-fun b!749424 () Bool)

(declare-fun res!505369 () Bool)

(assert (=> b!749424 (=> (not res!505369) (not e!418322))))

(declare-datatypes ((List!13881 0))(
  ( (Nil!13878) (Cons!13877 (h!14955 (_ BitVec 64)) (t!20188 List!13881)) )
))
(declare-fun arrayNoDuplicates!0 (array!41725 (_ BitVec 32) List!13881) Bool)

(assert (=> b!749424 (= res!505369 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13878))))

(declare-fun b!749425 () Bool)

(declare-fun res!505375 () Bool)

(assert (=> b!749425 (=> (not res!505375) (not e!418326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749425 (= res!505375 (validKeyInArray!0 (select (arr!19972 a!3186) j!159)))))

(declare-fun b!749426 () Bool)

(assert (=> b!749426 (= e!418320 true)))

(assert (=> b!749426 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25669 0))(
  ( (Unit!25670) )
))
(declare-fun lt!333137 () Unit!25669)

(declare-fun e!418318 () Unit!25669)

(assert (=> b!749426 (= lt!333137 e!418318)))

(declare-fun c!82415 () Bool)

(assert (=> b!749426 (= c!82415 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749427 () Bool)

(declare-fun res!505374 () Bool)

(assert (=> b!749427 (=> (not res!505374) (not e!418326))))

(declare-fun arrayContainsKey!0 (array!41725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749427 (= res!505374 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749428 () Bool)

(declare-fun e!418321 () Bool)

(assert (=> b!749428 (= e!418321 (not e!418320))))

(declare-fun res!505368 () Bool)

(assert (=> b!749428 (=> res!505368 e!418320)))

(declare-fun lt!333136 () SeekEntryResult!7528)

(get-info :version)

(assert (=> b!749428 (= res!505368 (or (not ((_ is Intermediate!7528) lt!333136)) (bvslt x!1131 (x!63578 lt!333136)) (not (= x!1131 (x!63578 lt!333136))) (not (= index!1321 (index!32482 lt!333136)))))))

(declare-fun e!418324 () Bool)

(assert (=> b!749428 e!418324))

(declare-fun res!505365 () Bool)

(assert (=> b!749428 (=> (not res!505365) (not e!418324))))

(declare-fun lt!333131 () SeekEntryResult!7528)

(assert (=> b!749428 (= res!505365 (= lt!333131 lt!333135))))

(assert (=> b!749428 (= lt!333135 (Found!7528 j!159))))

(assert (=> b!749428 (= lt!333131 (seekEntryOrOpen!0 (select (arr!19972 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749428 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333129 () Unit!25669)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25669)

(assert (=> b!749428 (= lt!333129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!418319 () Bool)

(declare-fun lt!333130 () SeekEntryResult!7528)

(declare-fun b!749429 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!749429 (= e!418319 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!333130))))

(declare-fun b!749431 () Bool)

(assert (=> b!749431 (= e!418319 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) (Found!7528 j!159)))))

(declare-fun b!749432 () Bool)

(declare-fun res!505362 () Bool)

(assert (=> b!749432 (=> (not res!505362) (not e!418326))))

(assert (=> b!749432 (= res!505362 (and (= (size!20392 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20392 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20392 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749433 () Bool)

(declare-fun res!505361 () Bool)

(declare-fun e!418325 () Bool)

(assert (=> b!749433 (=> (not res!505361) (not e!418325))))

(assert (=> b!749433 (= res!505361 e!418319)))

(declare-fun c!82414 () Bool)

(assert (=> b!749433 (= c!82414 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749434 () Bool)

(assert (=> b!749434 (= e!418325 e!418321)))

(declare-fun res!505366 () Bool)

(assert (=> b!749434 (=> (not res!505366) (not e!418321))))

(declare-fun lt!333134 () SeekEntryResult!7528)

(assert (=> b!749434 (= res!505366 (= lt!333134 lt!333136))))

(declare-fun lt!333138 () (_ BitVec 64))

(declare-fun lt!333133 () array!41725)

(assert (=> b!749434 (= lt!333136 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333138 lt!333133 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749434 (= lt!333134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333138 mask!3328) lt!333138 lt!333133 mask!3328))))

(assert (=> b!749434 (= lt!333138 (select (store (arr!19972 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749434 (= lt!333133 (array!41726 (store (arr!19972 a!3186) i!1173 k0!2102) (size!20392 a!3186)))))

(declare-fun b!749435 () Bool)

(declare-fun Unit!25671 () Unit!25669)

(assert (=> b!749435 (= e!418318 Unit!25671)))

(assert (=> b!749435 false))

(declare-fun b!749436 () Bool)

(assert (=> b!749436 (= e!418322 e!418325)))

(declare-fun res!505370 () Bool)

(assert (=> b!749436 (=> (not res!505370) (not e!418325))))

(assert (=> b!749436 (= res!505370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19972 a!3186) j!159) mask!3328) (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!333130))))

(assert (=> b!749436 (= lt!333130 (Intermediate!7528 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749437 () Bool)

(declare-fun res!505371 () Bool)

(assert (=> b!749437 (=> res!505371 e!418320)))

(assert (=> b!749437 (= res!505371 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) lt!333138))))

(declare-fun b!749438 () Bool)

(declare-fun res!505359 () Bool)

(assert (=> b!749438 (=> (not res!505359) (not e!418325))))

(assert (=> b!749438 (= res!505359 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19972 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749439 () Bool)

(declare-fun Unit!25672 () Unit!25669)

(assert (=> b!749439 (= e!418318 Unit!25672)))

(declare-fun b!749440 () Bool)

(declare-fun res!505360 () Bool)

(assert (=> b!749440 (=> (not res!505360) (not e!418326))))

(assert (=> b!749440 (= res!505360 (validKeyInArray!0 k0!2102))))

(declare-fun res!505372 () Bool)

(assert (=> start!65682 (=> (not res!505372) (not e!418326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65682 (= res!505372 (validMask!0 mask!3328))))

(assert (=> start!65682 e!418326))

(assert (=> start!65682 true))

(declare-fun array_inv!15831 (array!41725) Bool)

(assert (=> start!65682 (array_inv!15831 a!3186)))

(declare-fun b!749430 () Bool)

(assert (=> b!749430 (= e!418324 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!333135))))

(assert (= (and start!65682 res!505372) b!749432))

(assert (= (and b!749432 res!505362) b!749425))

(assert (= (and b!749425 res!505375) b!749440))

(assert (= (and b!749440 res!505360) b!749427))

(assert (= (and b!749427 res!505374) b!749422))

(assert (= (and b!749422 res!505373) b!749421))

(assert (= (and b!749421 res!505363) b!749424))

(assert (= (and b!749424 res!505369) b!749423))

(assert (= (and b!749423 res!505364) b!749436))

(assert (= (and b!749436 res!505370) b!749438))

(assert (= (and b!749438 res!505359) b!749433))

(assert (= (and b!749433 c!82414) b!749429))

(assert (= (and b!749433 (not c!82414)) b!749431))

(assert (= (and b!749433 res!505361) b!749434))

(assert (= (and b!749434 res!505366) b!749428))

(assert (= (and b!749428 res!505365) b!749430))

(assert (= (and b!749428 (not res!505368)) b!749420))

(assert (= (and b!749420 (not res!505367)) b!749437))

(assert (= (and b!749437 (not res!505371)) b!749426))

(assert (= (and b!749426 c!82415) b!749435))

(assert (= (and b!749426 (not c!82415)) b!749439))

(declare-fun m!699621 () Bool)

(assert (=> b!749425 m!699621))

(assert (=> b!749425 m!699621))

(declare-fun m!699623 () Bool)

(assert (=> b!749425 m!699623))

(declare-fun m!699625 () Bool)

(assert (=> b!749426 m!699625))

(declare-fun m!699627 () Bool)

(assert (=> b!749426 m!699627))

(declare-fun m!699629 () Bool)

(assert (=> b!749427 m!699629))

(assert (=> b!749430 m!699621))

(assert (=> b!749430 m!699621))

(declare-fun m!699631 () Bool)

(assert (=> b!749430 m!699631))

(assert (=> b!749420 m!699621))

(assert (=> b!749420 m!699621))

(declare-fun m!699633 () Bool)

(assert (=> b!749420 m!699633))

(declare-fun m!699635 () Bool)

(assert (=> b!749424 m!699635))

(assert (=> b!749437 m!699625))

(assert (=> b!749437 m!699627))

(assert (=> b!749436 m!699621))

(assert (=> b!749436 m!699621))

(declare-fun m!699637 () Bool)

(assert (=> b!749436 m!699637))

(assert (=> b!749436 m!699637))

(assert (=> b!749436 m!699621))

(declare-fun m!699639 () Bool)

(assert (=> b!749436 m!699639))

(declare-fun m!699641 () Bool)

(assert (=> b!749421 m!699641))

(declare-fun m!699643 () Bool)

(assert (=> b!749422 m!699643))

(declare-fun m!699645 () Bool)

(assert (=> start!65682 m!699645))

(declare-fun m!699647 () Bool)

(assert (=> start!65682 m!699647))

(declare-fun m!699649 () Bool)

(assert (=> b!749440 m!699649))

(assert (=> b!749429 m!699621))

(assert (=> b!749429 m!699621))

(declare-fun m!699651 () Bool)

(assert (=> b!749429 m!699651))

(assert (=> b!749428 m!699621))

(assert (=> b!749428 m!699621))

(declare-fun m!699653 () Bool)

(assert (=> b!749428 m!699653))

(declare-fun m!699655 () Bool)

(assert (=> b!749428 m!699655))

(declare-fun m!699657 () Bool)

(assert (=> b!749428 m!699657))

(declare-fun m!699659 () Bool)

(assert (=> b!749434 m!699659))

(declare-fun m!699661 () Bool)

(assert (=> b!749434 m!699661))

(declare-fun m!699663 () Bool)

(assert (=> b!749434 m!699663))

(assert (=> b!749434 m!699659))

(declare-fun m!699665 () Bool)

(assert (=> b!749434 m!699665))

(assert (=> b!749434 m!699625))

(declare-fun m!699667 () Bool)

(assert (=> b!749438 m!699667))

(assert (=> b!749431 m!699621))

(assert (=> b!749431 m!699621))

(assert (=> b!749431 m!699633))

(check-sat (not start!65682) (not b!749428) (not b!749434) (not b!749424) (not b!749440) (not b!749431) (not b!749425) (not b!749427) (not b!749430) (not b!749422) (not b!749420) (not b!749436) (not b!749429) (not b!749421))
(check-sat)
