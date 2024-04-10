; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65516 () Bool)

(assert start!65516)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41689 0))(
  ( (array!41690 (arr!19958 (Array (_ BitVec 32) (_ BitVec 64))) (size!20379 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41689)

(declare-fun e!417325 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!747469 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7558 0))(
  ( (MissingZero!7558 (index!32600 (_ BitVec 32))) (Found!7558 (index!32601 (_ BitVec 32))) (Intermediate!7558 (undefined!8370 Bool) (index!32602 (_ BitVec 32)) (x!63540 (_ BitVec 32))) (Undefined!7558) (MissingVacant!7558 (index!32603 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!747469 (= e!417325 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) (Found!7558 j!159)))))

(declare-fun b!747471 () Bool)

(declare-fun e!417321 () Bool)

(assert (=> b!747471 (= e!417321 true)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!747471 (= (select (store (arr!19958 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25612 0))(
  ( (Unit!25613) )
))
(declare-fun lt!332254 () Unit!25612)

(declare-fun e!417322 () Unit!25612)

(assert (=> b!747471 (= lt!332254 e!417322)))

(declare-fun c!82078 () Bool)

(assert (=> b!747471 (= c!82078 (= (select (store (arr!19958 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747472 () Bool)

(declare-fun res!504089 () Bool)

(declare-fun e!417323 () Bool)

(assert (=> b!747472 (=> (not res!504089) (not e!417323))))

(declare-datatypes ((List!13960 0))(
  ( (Nil!13957) (Cons!13956 (h!15028 (_ BitVec 64)) (t!20275 List!13960)) )
))
(declare-fun arrayNoDuplicates!0 (array!41689 (_ BitVec 32) List!13960) Bool)

(assert (=> b!747472 (= res!504089 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13957))))

(declare-fun b!747473 () Bool)

(declare-fun e!417320 () Bool)

(assert (=> b!747473 (= e!417323 e!417320)))

(declare-fun res!504090 () Bool)

(assert (=> b!747473 (=> (not res!504090) (not e!417320))))

(declare-fun lt!332247 () SeekEntryResult!7558)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747473 (= res!504090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19958 a!3186) j!159) mask!3328) (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332247))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747473 (= lt!332247 (Intermediate!7558 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747474 () Bool)

(declare-fun res!504081 () Bool)

(assert (=> b!747474 (=> res!504081 e!417321)))

(declare-fun lt!332246 () (_ BitVec 64))

(assert (=> b!747474 (= res!504081 (= (select (store (arr!19958 a!3186) i!1173 k!2102) index!1321) lt!332246))))

(declare-fun b!747475 () Bool)

(assert (=> b!747475 (= e!417325 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332247))))

(declare-fun b!747476 () Bool)

(declare-fun res!504079 () Bool)

(declare-fun e!417324 () Bool)

(assert (=> b!747476 (=> (not res!504079) (not e!417324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747476 (= res!504079 (validKeyInArray!0 (select (arr!19958 a!3186) j!159)))))

(declare-fun b!747477 () Bool)

(declare-fun e!417318 () Bool)

(assert (=> b!747477 (= e!417318 (not e!417321))))

(declare-fun res!504078 () Bool)

(assert (=> b!747477 (=> res!504078 e!417321)))

(declare-fun lt!332248 () SeekEntryResult!7558)

(assert (=> b!747477 (= res!504078 (or (not (is-Intermediate!7558 lt!332248)) (bvslt x!1131 (x!63540 lt!332248)) (not (= x!1131 (x!63540 lt!332248))) (not (= index!1321 (index!32602 lt!332248)))))))

(declare-fun e!417326 () Bool)

(assert (=> b!747477 e!417326))

(declare-fun res!504083 () Bool)

(assert (=> b!747477 (=> (not res!504083) (not e!417326))))

(declare-fun lt!332253 () SeekEntryResult!7558)

(declare-fun lt!332250 () SeekEntryResult!7558)

(assert (=> b!747477 (= res!504083 (= lt!332253 lt!332250))))

(assert (=> b!747477 (= lt!332250 (Found!7558 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!747477 (= lt!332253 (seekEntryOrOpen!0 (select (arr!19958 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41689 (_ BitVec 32)) Bool)

(assert (=> b!747477 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332255 () Unit!25612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25612)

(assert (=> b!747477 (= lt!332255 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747478 () Bool)

(declare-fun Unit!25614 () Unit!25612)

(assert (=> b!747478 (= e!417322 Unit!25614)))

(assert (=> b!747478 false))

(declare-fun res!504086 () Bool)

(assert (=> start!65516 (=> (not res!504086) (not e!417324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65516 (= res!504086 (validMask!0 mask!3328))))

(assert (=> start!65516 e!417324))

(assert (=> start!65516 true))

(declare-fun array_inv!15754 (array!41689) Bool)

(assert (=> start!65516 (array_inv!15754 a!3186)))

(declare-fun b!747470 () Bool)

(declare-fun res!504087 () Bool)

(assert (=> b!747470 (=> (not res!504087) (not e!417320))))

(assert (=> b!747470 (= res!504087 e!417325)))

(declare-fun c!82077 () Bool)

(assert (=> b!747470 (= c!82077 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747479 () Bool)

(declare-fun res!504082 () Bool)

(assert (=> b!747479 (=> (not res!504082) (not e!417324))))

(declare-fun arrayContainsKey!0 (array!41689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747479 (= res!504082 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747480 () Bool)

(assert (=> b!747480 (= e!417320 e!417318)))

(declare-fun res!504076 () Bool)

(assert (=> b!747480 (=> (not res!504076) (not e!417318))))

(declare-fun lt!332252 () SeekEntryResult!7558)

(assert (=> b!747480 (= res!504076 (= lt!332252 lt!332248))))

(declare-fun lt!332251 () array!41689)

(assert (=> b!747480 (= lt!332248 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332246 lt!332251 mask!3328))))

(assert (=> b!747480 (= lt!332252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332246 mask!3328) lt!332246 lt!332251 mask!3328))))

(assert (=> b!747480 (= lt!332246 (select (store (arr!19958 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747480 (= lt!332251 (array!41690 (store (arr!19958 a!3186) i!1173 k!2102) (size!20379 a!3186)))))

(declare-fun b!747481 () Bool)

(declare-fun Unit!25615 () Unit!25612)

(assert (=> b!747481 (= e!417322 Unit!25615)))

(declare-fun b!747482 () Bool)

(declare-fun res!504088 () Bool)

(assert (=> b!747482 (=> res!504088 e!417321)))

(assert (=> b!747482 (= res!504088 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332250)))))

(declare-fun b!747483 () Bool)

(declare-fun res!504084 () Bool)

(assert (=> b!747483 (=> (not res!504084) (not e!417323))))

(assert (=> b!747483 (= res!504084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747484 () Bool)

(assert (=> b!747484 (= e!417326 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332250))))

(declare-fun b!747485 () Bool)

(declare-fun res!504085 () Bool)

(assert (=> b!747485 (=> (not res!504085) (not e!417323))))

(assert (=> b!747485 (= res!504085 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20379 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20379 a!3186))))))

(declare-fun b!747486 () Bool)

(declare-fun res!504077 () Bool)

(assert (=> b!747486 (=> (not res!504077) (not e!417324))))

(assert (=> b!747486 (= res!504077 (and (= (size!20379 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20379 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20379 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747487 () Bool)

(declare-fun res!504080 () Bool)

(assert (=> b!747487 (=> (not res!504080) (not e!417324))))

(assert (=> b!747487 (= res!504080 (validKeyInArray!0 k!2102))))

(declare-fun b!747488 () Bool)

(assert (=> b!747488 (= e!417324 e!417323)))

(declare-fun res!504091 () Bool)

(assert (=> b!747488 (=> (not res!504091) (not e!417323))))

(declare-fun lt!332249 () SeekEntryResult!7558)

(assert (=> b!747488 (= res!504091 (or (= lt!332249 (MissingZero!7558 i!1173)) (= lt!332249 (MissingVacant!7558 i!1173))))))

(assert (=> b!747488 (= lt!332249 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747489 () Bool)

(declare-fun res!504092 () Bool)

(assert (=> b!747489 (=> (not res!504092) (not e!417320))))

(assert (=> b!747489 (= res!504092 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19958 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65516 res!504086) b!747486))

(assert (= (and b!747486 res!504077) b!747476))

(assert (= (and b!747476 res!504079) b!747487))

(assert (= (and b!747487 res!504080) b!747479))

(assert (= (and b!747479 res!504082) b!747488))

(assert (= (and b!747488 res!504091) b!747483))

(assert (= (and b!747483 res!504084) b!747472))

(assert (= (and b!747472 res!504089) b!747485))

(assert (= (and b!747485 res!504085) b!747473))

(assert (= (and b!747473 res!504090) b!747489))

(assert (= (and b!747489 res!504092) b!747470))

(assert (= (and b!747470 c!82077) b!747475))

(assert (= (and b!747470 (not c!82077)) b!747469))

(assert (= (and b!747470 res!504087) b!747480))

(assert (= (and b!747480 res!504076) b!747477))

(assert (= (and b!747477 res!504083) b!747484))

(assert (= (and b!747477 (not res!504078)) b!747482))

(assert (= (and b!747482 (not res!504088)) b!747474))

(assert (= (and b!747474 (not res!504081)) b!747471))

(assert (= (and b!747471 c!82078) b!747478))

(assert (= (and b!747471 (not c!82078)) b!747481))

(declare-fun m!697543 () Bool)

(assert (=> b!747473 m!697543))

(assert (=> b!747473 m!697543))

(declare-fun m!697545 () Bool)

(assert (=> b!747473 m!697545))

(assert (=> b!747473 m!697545))

(assert (=> b!747473 m!697543))

(declare-fun m!697547 () Bool)

(assert (=> b!747473 m!697547))

(assert (=> b!747477 m!697543))

(assert (=> b!747477 m!697543))

(declare-fun m!697549 () Bool)

(assert (=> b!747477 m!697549))

(declare-fun m!697551 () Bool)

(assert (=> b!747477 m!697551))

(declare-fun m!697553 () Bool)

(assert (=> b!747477 m!697553))

(declare-fun m!697555 () Bool)

(assert (=> b!747480 m!697555))

(declare-fun m!697557 () Bool)

(assert (=> b!747480 m!697557))

(declare-fun m!697559 () Bool)

(assert (=> b!747480 m!697559))

(declare-fun m!697561 () Bool)

(assert (=> b!747480 m!697561))

(assert (=> b!747480 m!697561))

(declare-fun m!697563 () Bool)

(assert (=> b!747480 m!697563))

(assert (=> b!747469 m!697543))

(assert (=> b!747469 m!697543))

(declare-fun m!697565 () Bool)

(assert (=> b!747469 m!697565))

(declare-fun m!697567 () Bool)

(assert (=> b!747483 m!697567))

(declare-fun m!697569 () Bool)

(assert (=> b!747488 m!697569))

(assert (=> b!747476 m!697543))

(assert (=> b!747476 m!697543))

(declare-fun m!697571 () Bool)

(assert (=> b!747476 m!697571))

(declare-fun m!697573 () Bool)

(assert (=> b!747479 m!697573))

(declare-fun m!697575 () Bool)

(assert (=> b!747489 m!697575))

(declare-fun m!697577 () Bool)

(assert (=> b!747472 m!697577))

(assert (=> b!747475 m!697543))

(assert (=> b!747475 m!697543))

(declare-fun m!697579 () Bool)

(assert (=> b!747475 m!697579))

(assert (=> b!747482 m!697543))

(assert (=> b!747482 m!697543))

(assert (=> b!747482 m!697565))

(assert (=> b!747471 m!697557))

(declare-fun m!697581 () Bool)

(assert (=> b!747471 m!697581))

(declare-fun m!697583 () Bool)

(assert (=> start!65516 m!697583))

(declare-fun m!697585 () Bool)

(assert (=> start!65516 m!697585))

(assert (=> b!747474 m!697557))

(assert (=> b!747474 m!697581))

(declare-fun m!697587 () Bool)

(assert (=> b!747487 m!697587))

(assert (=> b!747484 m!697543))

(assert (=> b!747484 m!697543))

(declare-fun m!697589 () Bool)

(assert (=> b!747484 m!697589))

(push 1)

