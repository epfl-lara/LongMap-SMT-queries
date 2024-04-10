; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65818 () Bool)

(assert start!65818)

(declare-fun b!757634 () Bool)

(declare-fun e!422420 () Bool)

(declare-datatypes ((SeekEntryResult!7709 0))(
  ( (MissingZero!7709 (index!33204 (_ BitVec 32))) (Found!7709 (index!33205 (_ BitVec 32))) (Intermediate!7709 (undefined!8521 Bool) (index!33206 (_ BitVec 32)) (x!64099 (_ BitVec 32))) (Undefined!7709) (MissingVacant!7709 (index!33207 (_ BitVec 32))) )
))
(declare-fun lt!337412 () SeekEntryResult!7709)

(declare-fun lt!337416 () SeekEntryResult!7709)

(assert (=> b!757634 (= e!422420 (= lt!337412 lt!337416))))

(declare-fun b!757635 () Bool)

(declare-fun res!512439 () Bool)

(declare-fun e!422421 () Bool)

(assert (=> b!757635 (=> (not res!512439) (not e!422421))))

(declare-datatypes ((array!41991 0))(
  ( (array!41992 (arr!20109 (Array (_ BitVec 32) (_ BitVec 64))) (size!20530 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41991)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757635 (= res!512439 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757636 () Bool)

(declare-fun e!422424 () Bool)

(declare-fun e!422428 () Bool)

(assert (=> b!757636 (= e!422424 e!422428)))

(declare-fun res!512432 () Bool)

(assert (=> b!757636 (=> (not res!512432) (not e!422428))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!337418 () SeekEntryResult!7709)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41991 (_ BitVec 32)) SeekEntryResult!7709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757636 (= res!512432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20109 a!3186) j!159) mask!3328) (select (arr!20109 a!3186) j!159) a!3186 mask!3328) lt!337418))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757636 (= lt!337418 (Intermediate!7709 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757637 () Bool)

(declare-fun e!422426 () Bool)

(declare-fun e!422425 () Bool)

(assert (=> b!757637 (= e!422426 e!422425)))

(declare-fun res!512429 () Bool)

(assert (=> b!757637 (=> res!512429 e!422425)))

(declare-fun lt!337414 () SeekEntryResult!7709)

(assert (=> b!757637 (= res!512429 (not (= lt!337416 lt!337414)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41991 (_ BitVec 32)) SeekEntryResult!7709)

(assert (=> b!757637 (= lt!337416 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20109 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757638 () Bool)

(declare-fun e!422419 () Bool)

(assert (=> b!757638 (= e!422419 true)))

(assert (=> b!757638 e!422420))

(declare-fun res!512430 () Bool)

(assert (=> b!757638 (=> (not res!512430) (not e!422420))))

(declare-fun lt!337410 () (_ BitVec 64))

(assert (=> b!757638 (= res!512430 (= lt!337410 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26216 0))(
  ( (Unit!26217) )
))
(declare-fun lt!337411 () Unit!26216)

(declare-fun e!422429 () Unit!26216)

(assert (=> b!757638 (= lt!337411 e!422429)))

(declare-fun c!82984 () Bool)

(assert (=> b!757638 (= c!82984 (= lt!337410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757639 () Bool)

(declare-fun Unit!26218 () Unit!26216)

(assert (=> b!757639 (= e!422429 Unit!26218)))

(declare-fun e!422427 () Bool)

(declare-fun b!757640 () Bool)

(assert (=> b!757640 (= e!422427 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20109 a!3186) j!159) a!3186 mask!3328) (Found!7709 j!159)))))

(declare-fun b!757641 () Bool)

(declare-fun res!512440 () Bool)

(assert (=> b!757641 (=> (not res!512440) (not e!422421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757641 (= res!512440 (validKeyInArray!0 k!2102))))

(declare-fun b!757642 () Bool)

(declare-fun res!512433 () Bool)

(assert (=> b!757642 (=> (not res!512433) (not e!422428))))

(assert (=> b!757642 (= res!512433 e!422427)))

(declare-fun c!82983 () Bool)

(assert (=> b!757642 (= c!82983 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757643 () Bool)

(declare-fun res!512431 () Bool)

(assert (=> b!757643 (=> (not res!512431) (not e!422424))))

(declare-datatypes ((List!14111 0))(
  ( (Nil!14108) (Cons!14107 (h!15179 (_ BitVec 64)) (t!20426 List!14111)) )
))
(declare-fun arrayNoDuplicates!0 (array!41991 (_ BitVec 32) List!14111) Bool)

(assert (=> b!757643 (= res!512431 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14108))))

(declare-fun b!757644 () Bool)

(declare-fun e!422422 () Bool)

(assert (=> b!757644 (= e!422428 e!422422)))

(declare-fun res!512441 () Bool)

(assert (=> b!757644 (=> (not res!512441) (not e!422422))))

(declare-fun lt!337413 () SeekEntryResult!7709)

(declare-fun lt!337417 () SeekEntryResult!7709)

(assert (=> b!757644 (= res!512441 (= lt!337413 lt!337417))))

(declare-fun lt!337415 () array!41991)

(declare-fun lt!337421 () (_ BitVec 64))

(assert (=> b!757644 (= lt!337417 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337421 lt!337415 mask!3328))))

(assert (=> b!757644 (= lt!337413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337421 mask!3328) lt!337421 lt!337415 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757644 (= lt!337421 (select (store (arr!20109 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757644 (= lt!337415 (array!41992 (store (arr!20109 a!3186) i!1173 k!2102) (size!20530 a!3186)))))

(declare-fun b!757645 () Bool)

(assert (=> b!757645 (= e!422422 (not e!422426))))

(declare-fun res!512446 () Bool)

(assert (=> b!757645 (=> res!512446 e!422426)))

(assert (=> b!757645 (= res!512446 (or (not (is-Intermediate!7709 lt!337417)) (bvslt x!1131 (x!64099 lt!337417)) (not (= x!1131 (x!64099 lt!337417))) (not (= index!1321 (index!33206 lt!337417)))))))

(declare-fun e!422423 () Bool)

(assert (=> b!757645 e!422423))

(declare-fun res!512436 () Bool)

(assert (=> b!757645 (=> (not res!512436) (not e!422423))))

(assert (=> b!757645 (= res!512436 (= lt!337412 lt!337414))))

(assert (=> b!757645 (= lt!337414 (Found!7709 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41991 (_ BitVec 32)) SeekEntryResult!7709)

(assert (=> b!757645 (= lt!337412 (seekEntryOrOpen!0 (select (arr!20109 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41991 (_ BitVec 32)) Bool)

(assert (=> b!757645 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337420 () Unit!26216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26216)

(assert (=> b!757645 (= lt!337420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757646 () Bool)

(assert (=> b!757646 (= e!422425 e!422419)))

(declare-fun res!512444 () Bool)

(assert (=> b!757646 (=> res!512444 e!422419)))

(assert (=> b!757646 (= res!512444 (= lt!337410 lt!337421))))

(assert (=> b!757646 (= lt!337410 (select (store (arr!20109 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757647 () Bool)

(declare-fun res!512445 () Bool)

(assert (=> b!757647 (=> (not res!512445) (not e!422424))))

(assert (=> b!757647 (= res!512445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757648 () Bool)

(declare-fun res!512442 () Bool)

(assert (=> b!757648 (=> (not res!512442) (not e!422428))))

(assert (=> b!757648 (= res!512442 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20109 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757649 () Bool)

(declare-fun res!512434 () Bool)

(assert (=> b!757649 (=> (not res!512434) (not e!422421))))

(assert (=> b!757649 (= res!512434 (validKeyInArray!0 (select (arr!20109 a!3186) j!159)))))

(declare-fun res!512435 () Bool)

(assert (=> start!65818 (=> (not res!512435) (not e!422421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65818 (= res!512435 (validMask!0 mask!3328))))

(assert (=> start!65818 e!422421))

(assert (=> start!65818 true))

(declare-fun array_inv!15905 (array!41991) Bool)

(assert (=> start!65818 (array_inv!15905 a!3186)))

(declare-fun b!757650 () Bool)

(declare-fun res!512438 () Bool)

(assert (=> b!757650 (=> (not res!512438) (not e!422421))))

(assert (=> b!757650 (= res!512438 (and (= (size!20530 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20530 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20530 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757651 () Bool)

(declare-fun res!512447 () Bool)

(assert (=> b!757651 (=> (not res!512447) (not e!422424))))

(assert (=> b!757651 (= res!512447 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20530 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20530 a!3186))))))

(declare-fun b!757652 () Bool)

(assert (=> b!757652 (= e!422423 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20109 a!3186) j!159) a!3186 mask!3328) lt!337414))))

(declare-fun b!757653 () Bool)

(declare-fun res!512443 () Bool)

(assert (=> b!757653 (=> (not res!512443) (not e!422420))))

(assert (=> b!757653 (= res!512443 (= (seekEntryOrOpen!0 lt!337421 lt!337415 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337421 lt!337415 mask!3328)))))

(declare-fun b!757654 () Bool)

(declare-fun Unit!26219 () Unit!26216)

(assert (=> b!757654 (= e!422429 Unit!26219)))

(assert (=> b!757654 false))

(declare-fun b!757655 () Bool)

(assert (=> b!757655 (= e!422427 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20109 a!3186) j!159) a!3186 mask!3328) lt!337418))))

(declare-fun b!757656 () Bool)

(assert (=> b!757656 (= e!422421 e!422424)))

(declare-fun res!512437 () Bool)

(assert (=> b!757656 (=> (not res!512437) (not e!422424))))

(declare-fun lt!337419 () SeekEntryResult!7709)

(assert (=> b!757656 (= res!512437 (or (= lt!337419 (MissingZero!7709 i!1173)) (= lt!337419 (MissingVacant!7709 i!1173))))))

(assert (=> b!757656 (= lt!337419 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65818 res!512435) b!757650))

(assert (= (and b!757650 res!512438) b!757649))

(assert (= (and b!757649 res!512434) b!757641))

(assert (= (and b!757641 res!512440) b!757635))

(assert (= (and b!757635 res!512439) b!757656))

(assert (= (and b!757656 res!512437) b!757647))

(assert (= (and b!757647 res!512445) b!757643))

(assert (= (and b!757643 res!512431) b!757651))

(assert (= (and b!757651 res!512447) b!757636))

(assert (= (and b!757636 res!512432) b!757648))

(assert (= (and b!757648 res!512442) b!757642))

(assert (= (and b!757642 c!82983) b!757655))

(assert (= (and b!757642 (not c!82983)) b!757640))

(assert (= (and b!757642 res!512433) b!757644))

(assert (= (and b!757644 res!512441) b!757645))

(assert (= (and b!757645 res!512436) b!757652))

(assert (= (and b!757645 (not res!512446)) b!757637))

(assert (= (and b!757637 (not res!512429)) b!757646))

(assert (= (and b!757646 (not res!512444)) b!757638))

(assert (= (and b!757638 c!82984) b!757654))

(assert (= (and b!757638 (not c!82984)) b!757639))

(assert (= (and b!757638 res!512430) b!757653))

(assert (= (and b!757653 res!512443) b!757634))

(declare-fun m!705295 () Bool)

(assert (=> b!757635 m!705295))

(declare-fun m!705297 () Bool)

(assert (=> b!757641 m!705297))

(declare-fun m!705299 () Bool)

(assert (=> b!757649 m!705299))

(assert (=> b!757649 m!705299))

(declare-fun m!705301 () Bool)

(assert (=> b!757649 m!705301))

(assert (=> b!757652 m!705299))

(assert (=> b!757652 m!705299))

(declare-fun m!705303 () Bool)

(assert (=> b!757652 m!705303))

(assert (=> b!757645 m!705299))

(assert (=> b!757645 m!705299))

(declare-fun m!705305 () Bool)

(assert (=> b!757645 m!705305))

(declare-fun m!705307 () Bool)

(assert (=> b!757645 m!705307))

(declare-fun m!705309 () Bool)

(assert (=> b!757645 m!705309))

(declare-fun m!705311 () Bool)

(assert (=> b!757643 m!705311))

(declare-fun m!705313 () Bool)

(assert (=> b!757644 m!705313))

(declare-fun m!705315 () Bool)

(assert (=> b!757644 m!705315))

(declare-fun m!705317 () Bool)

(assert (=> b!757644 m!705317))

(declare-fun m!705319 () Bool)

(assert (=> b!757644 m!705319))

(declare-fun m!705321 () Bool)

(assert (=> b!757644 m!705321))

(assert (=> b!757644 m!705315))

(assert (=> b!757655 m!705299))

(assert (=> b!757655 m!705299))

(declare-fun m!705323 () Bool)

(assert (=> b!757655 m!705323))

(declare-fun m!705325 () Bool)

(assert (=> b!757647 m!705325))

(declare-fun m!705327 () Bool)

(assert (=> b!757653 m!705327))

(declare-fun m!705329 () Bool)

(assert (=> b!757653 m!705329))

(assert (=> b!757646 m!705319))

(declare-fun m!705331 () Bool)

(assert (=> b!757646 m!705331))

(declare-fun m!705333 () Bool)

(assert (=> b!757656 m!705333))

(assert (=> b!757640 m!705299))

(assert (=> b!757640 m!705299))

(declare-fun m!705335 () Bool)

(assert (=> b!757640 m!705335))

(assert (=> b!757636 m!705299))

(assert (=> b!757636 m!705299))

(declare-fun m!705337 () Bool)

(assert (=> b!757636 m!705337))

(assert (=> b!757636 m!705337))

(assert (=> b!757636 m!705299))

(declare-fun m!705339 () Bool)

(assert (=> b!757636 m!705339))

(declare-fun m!705341 () Bool)

(assert (=> b!757648 m!705341))

(declare-fun m!705343 () Bool)

(assert (=> start!65818 m!705343))

(declare-fun m!705345 () Bool)

(assert (=> start!65818 m!705345))

(assert (=> b!757637 m!705299))

(assert (=> b!757637 m!705299))

(assert (=> b!757637 m!705335))

(push 1)

