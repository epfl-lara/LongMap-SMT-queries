; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65756 () Bool)

(assert start!65756)

(declare-fun b!755495 () Bool)

(declare-fun res!510670 () Bool)

(declare-fun e!421311 () Bool)

(assert (=> b!755495 (=> (not res!510670) (not e!421311))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41929 0))(
  ( (array!41930 (arr!20078 (Array (_ BitVec 32) (_ BitVec 64))) (size!20499 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41929)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755495 (= res!510670 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20078 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755496 () Bool)

(declare-fun res!510676 () Bool)

(assert (=> b!755496 (=> (not res!510676) (not e!421311))))

(declare-fun e!421310 () Bool)

(assert (=> b!755496 (= res!510676 e!421310)))

(declare-fun c!82797 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755496 (= c!82797 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755497 () Bool)

(declare-fun res!510663 () Bool)

(declare-fun e!421307 () Bool)

(assert (=> b!755497 (=> (not res!510663) (not e!421307))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41929 (_ BitVec 32)) Bool)

(assert (=> b!755497 (= res!510663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755498 () Bool)

(declare-fun res!510667 () Bool)

(declare-fun e!421313 () Bool)

(assert (=> b!755498 (=> (not res!510667) (not e!421313))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336296 () array!41929)

(declare-fun lt!336302 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7678 0))(
  ( (MissingZero!7678 (index!33080 (_ BitVec 32))) (Found!7678 (index!33081 (_ BitVec 32))) (Intermediate!7678 (undefined!8490 Bool) (index!33082 (_ BitVec 32)) (x!63980 (_ BitVec 32))) (Undefined!7678) (MissingVacant!7678 (index!33083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7678)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!755498 (= res!510667 (= (seekEntryOrOpen!0 lt!336302 lt!336296 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336302 lt!336296 mask!3328)))))

(declare-fun b!755499 () Bool)

(declare-fun res!510665 () Bool)

(assert (=> b!755499 (=> (not res!510665) (not e!421307))))

(declare-datatypes ((List!14080 0))(
  ( (Nil!14077) (Cons!14076 (h!15148 (_ BitVec 64)) (t!20395 List!14080)) )
))
(declare-fun arrayNoDuplicates!0 (array!41929 (_ BitVec 32) List!14080) Bool)

(assert (=> b!755499 (= res!510665 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14077))))

(declare-fun b!755500 () Bool)

(declare-fun res!510669 () Bool)

(declare-fun e!421302 () Bool)

(assert (=> b!755500 (=> (not res!510669) (not e!421302))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!755500 (= res!510669 (and (= (size!20499 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20499 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20499 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!336300 () SeekEntryResult!7678)

(declare-fun b!755501 () Bool)

(declare-fun e!421306 () Bool)

(assert (=> b!755501 (= e!421306 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336300))))

(declare-fun b!755502 () Bool)

(declare-datatypes ((Unit!26092 0))(
  ( (Unit!26093) )
))
(declare-fun e!421303 () Unit!26092)

(declare-fun Unit!26094 () Unit!26092)

(assert (=> b!755502 (= e!421303 Unit!26094)))

(assert (=> b!755502 false))

(declare-fun b!755504 () Bool)

(declare-fun res!510672 () Bool)

(assert (=> b!755504 (=> (not res!510672) (not e!421307))))

(assert (=> b!755504 (= res!510672 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20499 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20499 a!3186))))))

(declare-fun b!755505 () Bool)

(declare-fun res!510666 () Bool)

(assert (=> b!755505 (=> (not res!510666) (not e!421302))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755505 (= res!510666 (validKeyInArray!0 k!2102))))

(declare-fun b!755506 () Bool)

(declare-fun res!510679 () Bool)

(assert (=> b!755506 (=> (not res!510679) (not e!421302))))

(declare-fun arrayContainsKey!0 (array!41929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755506 (= res!510679 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755507 () Bool)

(declare-fun e!421305 () Bool)

(declare-fun e!421304 () Bool)

(assert (=> b!755507 (= e!421305 e!421304)))

(declare-fun res!510671 () Bool)

(assert (=> b!755507 (=> res!510671 e!421304)))

(declare-fun lt!336301 () (_ BitVec 64))

(assert (=> b!755507 (= res!510671 (= lt!336301 lt!336302))))

(assert (=> b!755507 (= lt!336301 (select (store (arr!20078 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755508 () Bool)

(declare-fun e!421312 () Bool)

(assert (=> b!755508 (= e!421311 e!421312)))

(declare-fun res!510662 () Bool)

(assert (=> b!755508 (=> (not res!510662) (not e!421312))))

(declare-fun lt!336304 () SeekEntryResult!7678)

(declare-fun lt!336299 () SeekEntryResult!7678)

(assert (=> b!755508 (= res!510662 (= lt!336304 lt!336299))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41929 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!755508 (= lt!336299 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336302 lt!336296 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755508 (= lt!336304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336302 mask!3328) lt!336302 lt!336296 mask!3328))))

(assert (=> b!755508 (= lt!336302 (select (store (arr!20078 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755508 (= lt!336296 (array!41930 (store (arr!20078 a!3186) i!1173 k!2102) (size!20499 a!3186)))))

(declare-fun b!755509 () Bool)

(assert (=> b!755509 (= e!421310 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) (Found!7678 j!159)))))

(declare-fun b!755510 () Bool)

(declare-fun lt!336298 () SeekEntryResult!7678)

(assert (=> b!755510 (= e!421310 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336298))))

(declare-fun b!755511 () Bool)

(declare-fun e!421309 () Bool)

(assert (=> b!755511 (= e!421309 e!421305)))

(declare-fun res!510675 () Bool)

(assert (=> b!755511 (=> res!510675 e!421305)))

(declare-fun lt!336305 () SeekEntryResult!7678)

(assert (=> b!755511 (= res!510675 (not (= lt!336305 lt!336300)))))

(assert (=> b!755511 (= lt!336305 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20078 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755512 () Bool)

(declare-fun lt!336295 () SeekEntryResult!7678)

(assert (=> b!755512 (= e!421313 (= lt!336295 lt!336305))))

(declare-fun b!755513 () Bool)

(declare-fun Unit!26095 () Unit!26092)

(assert (=> b!755513 (= e!421303 Unit!26095)))

(declare-fun res!510680 () Bool)

(assert (=> start!65756 (=> (not res!510680) (not e!421302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65756 (= res!510680 (validMask!0 mask!3328))))

(assert (=> start!65756 e!421302))

(assert (=> start!65756 true))

(declare-fun array_inv!15874 (array!41929) Bool)

(assert (=> start!65756 (array_inv!15874 a!3186)))

(declare-fun b!755503 () Bool)

(assert (=> b!755503 (= e!421304 true)))

(assert (=> b!755503 e!421313))

(declare-fun res!510673 () Bool)

(assert (=> b!755503 (=> (not res!510673) (not e!421313))))

(assert (=> b!755503 (= res!510673 (= lt!336301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336297 () Unit!26092)

(assert (=> b!755503 (= lt!336297 e!421303)))

(declare-fun c!82798 () Bool)

(assert (=> b!755503 (= c!82798 (= lt!336301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755514 () Bool)

(assert (=> b!755514 (= e!421302 e!421307)))

(declare-fun res!510668 () Bool)

(assert (=> b!755514 (=> (not res!510668) (not e!421307))))

(declare-fun lt!336294 () SeekEntryResult!7678)

(assert (=> b!755514 (= res!510668 (or (= lt!336294 (MissingZero!7678 i!1173)) (= lt!336294 (MissingVacant!7678 i!1173))))))

(assert (=> b!755514 (= lt!336294 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755515 () Bool)

(declare-fun res!510674 () Bool)

(assert (=> b!755515 (=> (not res!510674) (not e!421302))))

(assert (=> b!755515 (= res!510674 (validKeyInArray!0 (select (arr!20078 a!3186) j!159)))))

(declare-fun b!755516 () Bool)

(assert (=> b!755516 (= e!421312 (not e!421309))))

(declare-fun res!510664 () Bool)

(assert (=> b!755516 (=> res!510664 e!421309)))

(assert (=> b!755516 (= res!510664 (or (not (is-Intermediate!7678 lt!336299)) (bvslt x!1131 (x!63980 lt!336299)) (not (= x!1131 (x!63980 lt!336299))) (not (= index!1321 (index!33082 lt!336299)))))))

(assert (=> b!755516 e!421306))

(declare-fun res!510677 () Bool)

(assert (=> b!755516 (=> (not res!510677) (not e!421306))))

(assert (=> b!755516 (= res!510677 (= lt!336295 lt!336300))))

(assert (=> b!755516 (= lt!336300 (Found!7678 j!159))))

(assert (=> b!755516 (= lt!336295 (seekEntryOrOpen!0 (select (arr!20078 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755516 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336303 () Unit!26092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26092)

(assert (=> b!755516 (= lt!336303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755517 () Bool)

(assert (=> b!755517 (= e!421307 e!421311)))

(declare-fun res!510678 () Bool)

(assert (=> b!755517 (=> (not res!510678) (not e!421311))))

(assert (=> b!755517 (= res!510678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20078 a!3186) j!159) mask!3328) (select (arr!20078 a!3186) j!159) a!3186 mask!3328) lt!336298))))

(assert (=> b!755517 (= lt!336298 (Intermediate!7678 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65756 res!510680) b!755500))

(assert (= (and b!755500 res!510669) b!755515))

(assert (= (and b!755515 res!510674) b!755505))

(assert (= (and b!755505 res!510666) b!755506))

(assert (= (and b!755506 res!510679) b!755514))

(assert (= (and b!755514 res!510668) b!755497))

(assert (= (and b!755497 res!510663) b!755499))

(assert (= (and b!755499 res!510665) b!755504))

(assert (= (and b!755504 res!510672) b!755517))

(assert (= (and b!755517 res!510678) b!755495))

(assert (= (and b!755495 res!510670) b!755496))

(assert (= (and b!755496 c!82797) b!755510))

(assert (= (and b!755496 (not c!82797)) b!755509))

(assert (= (and b!755496 res!510676) b!755508))

(assert (= (and b!755508 res!510662) b!755516))

(assert (= (and b!755516 res!510677) b!755501))

(assert (= (and b!755516 (not res!510664)) b!755511))

(assert (= (and b!755511 (not res!510675)) b!755507))

(assert (= (and b!755507 (not res!510671)) b!755503))

(assert (= (and b!755503 c!82798) b!755502))

(assert (= (and b!755503 (not c!82798)) b!755513))

(assert (= (and b!755503 res!510673) b!755498))

(assert (= (and b!755498 res!510667) b!755512))

(declare-fun m!703683 () Bool)

(assert (=> start!65756 m!703683))

(declare-fun m!703685 () Bool)

(assert (=> start!65756 m!703685))

(declare-fun m!703687 () Bool)

(assert (=> b!755511 m!703687))

(assert (=> b!755511 m!703687))

(declare-fun m!703689 () Bool)

(assert (=> b!755511 m!703689))

(declare-fun m!703691 () Bool)

(assert (=> b!755498 m!703691))

(declare-fun m!703693 () Bool)

(assert (=> b!755498 m!703693))

(declare-fun m!703695 () Bool)

(assert (=> b!755514 m!703695))

(declare-fun m!703697 () Bool)

(assert (=> b!755497 m!703697))

(declare-fun m!703699 () Bool)

(assert (=> b!755508 m!703699))

(declare-fun m!703701 () Bool)

(assert (=> b!755508 m!703701))

(declare-fun m!703703 () Bool)

(assert (=> b!755508 m!703703))

(assert (=> b!755508 m!703701))

(declare-fun m!703705 () Bool)

(assert (=> b!755508 m!703705))

(declare-fun m!703707 () Bool)

(assert (=> b!755508 m!703707))

(declare-fun m!703709 () Bool)

(assert (=> b!755499 m!703709))

(assert (=> b!755507 m!703699))

(declare-fun m!703711 () Bool)

(assert (=> b!755507 m!703711))

(assert (=> b!755515 m!703687))

(assert (=> b!755515 m!703687))

(declare-fun m!703713 () Bool)

(assert (=> b!755515 m!703713))

(assert (=> b!755509 m!703687))

(assert (=> b!755509 m!703687))

(assert (=> b!755509 m!703689))

(assert (=> b!755501 m!703687))

(assert (=> b!755501 m!703687))

(declare-fun m!703715 () Bool)

(assert (=> b!755501 m!703715))

(declare-fun m!703717 () Bool)

(assert (=> b!755505 m!703717))

(assert (=> b!755517 m!703687))

(assert (=> b!755517 m!703687))

(declare-fun m!703719 () Bool)

(assert (=> b!755517 m!703719))

(assert (=> b!755517 m!703719))

(assert (=> b!755517 m!703687))

(declare-fun m!703721 () Bool)

(assert (=> b!755517 m!703721))

(declare-fun m!703723 () Bool)

(assert (=> b!755506 m!703723))

(assert (=> b!755510 m!703687))

(assert (=> b!755510 m!703687))

(declare-fun m!703725 () Bool)

(assert (=> b!755510 m!703725))

(declare-fun m!703727 () Bool)

(assert (=> b!755495 m!703727))

(assert (=> b!755516 m!703687))

(assert (=> b!755516 m!703687))

(declare-fun m!703729 () Bool)

(assert (=> b!755516 m!703729))

(declare-fun m!703731 () Bool)

(assert (=> b!755516 m!703731))

(declare-fun m!703733 () Bool)

(assert (=> b!755516 m!703733))

(push 1)

