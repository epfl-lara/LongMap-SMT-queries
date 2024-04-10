; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65666 () Bool)

(assert start!65666)

(declare-fun b!752390 () Bool)

(declare-fun e!419689 () Bool)

(declare-fun e!419690 () Bool)

(assert (=> b!752390 (= e!419689 e!419690)))

(declare-fun res!508100 () Bool)

(assert (=> b!752390 (=> res!508100 e!419690)))

(declare-datatypes ((SeekEntryResult!7633 0))(
  ( (MissingZero!7633 (index!32900 (_ BitVec 32))) (Found!7633 (index!32901 (_ BitVec 32))) (Intermediate!7633 (undefined!8445 Bool) (index!32902 (_ BitVec 32)) (x!63815 (_ BitVec 32))) (Undefined!7633) (MissingVacant!7633 (index!32903 (_ BitVec 32))) )
))
(declare-fun lt!334679 () SeekEntryResult!7633)

(declare-fun lt!334681 () SeekEntryResult!7633)

(assert (=> b!752390 (= res!508100 (not (= lt!334679 lt!334681)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41839 0))(
  ( (array!41840 (arr!20033 (Array (_ BitVec 32) (_ BitVec 64))) (size!20454 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41839)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!752390 (= lt!334679 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752391 () Bool)

(declare-fun e!419692 () Bool)

(declare-fun e!419686 () Bool)

(assert (=> b!752391 (= e!419692 e!419686)))

(declare-fun res!508098 () Bool)

(assert (=> b!752391 (=> (not res!508098) (not e!419686))))

(declare-fun lt!334677 () SeekEntryResult!7633)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752391 (= res!508098 (or (= lt!334677 (MissingZero!7633 i!1173)) (= lt!334677 (MissingVacant!7633 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!752391 (= lt!334677 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752392 () Bool)

(declare-fun res!508109 () Bool)

(assert (=> b!752392 (=> (not res!508109) (not e!419692))))

(declare-fun arrayContainsKey!0 (array!41839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752392 (= res!508109 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752393 () Bool)

(declare-fun res!508105 () Bool)

(assert (=> b!752393 (=> (not res!508105) (not e!419686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41839 (_ BitVec 32)) Bool)

(assert (=> b!752393 (= res!508105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752394 () Bool)

(declare-fun res!508115 () Bool)

(assert (=> b!752394 (=> (not res!508115) (not e!419692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752394 (= res!508115 (validKeyInArray!0 (select (arr!20033 a!3186) j!159)))))

(declare-fun b!752395 () Bool)

(declare-fun res!508113 () Bool)

(assert (=> b!752395 (=> (not res!508113) (not e!419686))))

(declare-datatypes ((List!14035 0))(
  ( (Nil!14032) (Cons!14031 (h!15103 (_ BitVec 64)) (t!20350 List!14035)) )
))
(declare-fun arrayNoDuplicates!0 (array!41839 (_ BitVec 32) List!14035) Bool)

(assert (=> b!752395 (= res!508113 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14032))))

(declare-fun b!752396 () Bool)

(declare-fun res!508103 () Bool)

(declare-fun e!419685 () Bool)

(assert (=> b!752396 (=> (not res!508103) (not e!419685))))

(declare-fun e!419688 () Bool)

(assert (=> b!752396 (= res!508103 e!419688)))

(declare-fun c!82528 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752396 (= c!82528 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!508097 () Bool)

(assert (=> start!65666 (=> (not res!508097) (not e!419692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65666 (= res!508097 (validMask!0 mask!3328))))

(assert (=> start!65666 e!419692))

(assert (=> start!65666 true))

(declare-fun array_inv!15829 (array!41839) Bool)

(assert (=> start!65666 (array_inv!15829 a!3186)))

(declare-fun b!752397 () Bool)

(declare-fun res!508107 () Bool)

(assert (=> b!752397 (=> (not res!508107) (not e!419692))))

(assert (=> b!752397 (= res!508107 (validKeyInArray!0 k!2102))))

(declare-fun b!752398 () Bool)

(declare-fun e!419691 () Bool)

(assert (=> b!752398 (= e!419690 e!419691)))

(declare-fun res!508106 () Bool)

(assert (=> b!752398 (=> res!508106 e!419691)))

(declare-fun lt!334682 () (_ BitVec 64))

(declare-fun lt!334674 () (_ BitVec 64))

(assert (=> b!752398 (= res!508106 (= lt!334682 lt!334674))))

(assert (=> b!752398 (= lt!334682 (select (store (arr!20033 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752399 () Bool)

(declare-fun res!508111 () Bool)

(assert (=> b!752399 (=> (not res!508111) (not e!419686))))

(assert (=> b!752399 (= res!508111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20454 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20454 a!3186))))))

(declare-fun b!752400 () Bool)

(declare-datatypes ((Unit!25912 0))(
  ( (Unit!25913) )
))
(declare-fun e!419693 () Unit!25912)

(declare-fun Unit!25914 () Unit!25912)

(assert (=> b!752400 (= e!419693 Unit!25914)))

(assert (=> b!752400 false))

(declare-fun b!752401 () Bool)

(declare-fun res!508114 () Bool)

(declare-fun e!419684 () Bool)

(assert (=> b!752401 (=> (not res!508114) (not e!419684))))

(declare-fun lt!334683 () array!41839)

(assert (=> b!752401 (= res!508114 (= (seekEntryOrOpen!0 lt!334674 lt!334683 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334674 lt!334683 mask!3328)))))

(declare-fun lt!334680 () SeekEntryResult!7633)

(declare-fun b!752402 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!752402 (= e!419688 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334680))))

(declare-fun b!752403 () Bool)

(declare-fun res!508108 () Bool)

(assert (=> b!752403 (=> (not res!508108) (not e!419685))))

(assert (=> b!752403 (= res!508108 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20033 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752404 () Bool)

(declare-fun res!508110 () Bool)

(assert (=> b!752404 (=> (not res!508110) (not e!419692))))

(assert (=> b!752404 (= res!508110 (and (= (size!20454 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20454 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20454 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752405 () Bool)

(declare-fun lt!334675 () SeekEntryResult!7633)

(assert (=> b!752405 (= e!419684 (= lt!334675 lt!334679))))

(declare-fun e!419683 () Bool)

(declare-fun b!752406 () Bool)

(assert (=> b!752406 (= e!419683 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334681))))

(declare-fun b!752407 () Bool)

(assert (=> b!752407 (= e!419686 e!419685)))

(declare-fun res!508102 () Bool)

(assert (=> b!752407 (=> (not res!508102) (not e!419685))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752407 (= res!508102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20033 a!3186) j!159) mask!3328) (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334680))))

(assert (=> b!752407 (= lt!334680 (Intermediate!7633 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752408 () Bool)

(declare-fun e!419687 () Bool)

(assert (=> b!752408 (= e!419687 (not e!419689))))

(declare-fun res!508112 () Bool)

(assert (=> b!752408 (=> res!508112 e!419689)))

(declare-fun lt!334685 () SeekEntryResult!7633)

(assert (=> b!752408 (= res!508112 (or (not (is-Intermediate!7633 lt!334685)) (bvslt x!1131 (x!63815 lt!334685)) (not (= x!1131 (x!63815 lt!334685))) (not (= index!1321 (index!32902 lt!334685)))))))

(assert (=> b!752408 e!419683))

(declare-fun res!508104 () Bool)

(assert (=> b!752408 (=> (not res!508104) (not e!419683))))

(assert (=> b!752408 (= res!508104 (= lt!334675 lt!334681))))

(assert (=> b!752408 (= lt!334681 (Found!7633 j!159))))

(assert (=> b!752408 (= lt!334675 (seekEntryOrOpen!0 (select (arr!20033 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752408 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334676 () Unit!25912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25912)

(assert (=> b!752408 (= lt!334676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752409 () Bool)

(assert (=> b!752409 (= e!419685 e!419687)))

(declare-fun res!508099 () Bool)

(assert (=> b!752409 (=> (not res!508099) (not e!419687))))

(declare-fun lt!334684 () SeekEntryResult!7633)

(assert (=> b!752409 (= res!508099 (= lt!334684 lt!334685))))

(assert (=> b!752409 (= lt!334685 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334674 lt!334683 mask!3328))))

(assert (=> b!752409 (= lt!334684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334674 mask!3328) lt!334674 lt!334683 mask!3328))))

(assert (=> b!752409 (= lt!334674 (select (store (arr!20033 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752409 (= lt!334683 (array!41840 (store (arr!20033 a!3186) i!1173 k!2102) (size!20454 a!3186)))))

(declare-fun b!752410 () Bool)

(declare-fun Unit!25915 () Unit!25912)

(assert (=> b!752410 (= e!419693 Unit!25915)))

(declare-fun b!752411 () Bool)

(assert (=> b!752411 (= e!419688 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) (Found!7633 j!159)))))

(declare-fun b!752412 () Bool)

(assert (=> b!752412 (= e!419691 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!752412 e!419684))

(declare-fun res!508101 () Bool)

(assert (=> b!752412 (=> (not res!508101) (not e!419684))))

(assert (=> b!752412 (= res!508101 (= lt!334682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334678 () Unit!25912)

(assert (=> b!752412 (= lt!334678 e!419693)))

(declare-fun c!82527 () Bool)

(assert (=> b!752412 (= c!82527 (= lt!334682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65666 res!508097) b!752404))

(assert (= (and b!752404 res!508110) b!752394))

(assert (= (and b!752394 res!508115) b!752397))

(assert (= (and b!752397 res!508107) b!752392))

(assert (= (and b!752392 res!508109) b!752391))

(assert (= (and b!752391 res!508098) b!752393))

(assert (= (and b!752393 res!508105) b!752395))

(assert (= (and b!752395 res!508113) b!752399))

(assert (= (and b!752399 res!508111) b!752407))

(assert (= (and b!752407 res!508102) b!752403))

(assert (= (and b!752403 res!508108) b!752396))

(assert (= (and b!752396 c!82528) b!752402))

(assert (= (and b!752396 (not c!82528)) b!752411))

(assert (= (and b!752396 res!508103) b!752409))

(assert (= (and b!752409 res!508099) b!752408))

(assert (= (and b!752408 res!508104) b!752406))

(assert (= (and b!752408 (not res!508112)) b!752390))

(assert (= (and b!752390 (not res!508100)) b!752398))

(assert (= (and b!752398 (not res!508106)) b!752412))

(assert (= (and b!752412 c!82527) b!752400))

(assert (= (and b!752412 (not c!82527)) b!752410))

(assert (= (and b!752412 res!508101) b!752401))

(assert (= (and b!752401 res!508114) b!752405))

(declare-fun m!701343 () Bool)

(assert (=> b!752401 m!701343))

(declare-fun m!701345 () Bool)

(assert (=> b!752401 m!701345))

(declare-fun m!701347 () Bool)

(assert (=> b!752402 m!701347))

(assert (=> b!752402 m!701347))

(declare-fun m!701349 () Bool)

(assert (=> b!752402 m!701349))

(declare-fun m!701351 () Bool)

(assert (=> b!752391 m!701351))

(assert (=> b!752390 m!701347))

(assert (=> b!752390 m!701347))

(declare-fun m!701353 () Bool)

(assert (=> b!752390 m!701353))

(assert (=> b!752411 m!701347))

(assert (=> b!752411 m!701347))

(assert (=> b!752411 m!701353))

(assert (=> b!752394 m!701347))

(assert (=> b!752394 m!701347))

(declare-fun m!701355 () Bool)

(assert (=> b!752394 m!701355))

(declare-fun m!701357 () Bool)

(assert (=> b!752395 m!701357))

(declare-fun m!701359 () Bool)

(assert (=> b!752403 m!701359))

(assert (=> b!752406 m!701347))

(assert (=> b!752406 m!701347))

(declare-fun m!701361 () Bool)

(assert (=> b!752406 m!701361))

(declare-fun m!701363 () Bool)

(assert (=> b!752409 m!701363))

(declare-fun m!701365 () Bool)

(assert (=> b!752409 m!701365))

(declare-fun m!701367 () Bool)

(assert (=> b!752409 m!701367))

(declare-fun m!701369 () Bool)

(assert (=> b!752409 m!701369))

(assert (=> b!752409 m!701365))

(declare-fun m!701371 () Bool)

(assert (=> b!752409 m!701371))

(assert (=> b!752398 m!701363))

(declare-fun m!701373 () Bool)

(assert (=> b!752398 m!701373))

(declare-fun m!701375 () Bool)

(assert (=> b!752393 m!701375))

(assert (=> b!752407 m!701347))

(assert (=> b!752407 m!701347))

(declare-fun m!701377 () Bool)

(assert (=> b!752407 m!701377))

(assert (=> b!752407 m!701377))

(assert (=> b!752407 m!701347))

(declare-fun m!701379 () Bool)

(assert (=> b!752407 m!701379))

(declare-fun m!701381 () Bool)

(assert (=> b!752397 m!701381))

(declare-fun m!701383 () Bool)

(assert (=> b!752392 m!701383))

(declare-fun m!701385 () Bool)

(assert (=> start!65666 m!701385))

(declare-fun m!701387 () Bool)

(assert (=> start!65666 m!701387))

(assert (=> b!752408 m!701347))

(assert (=> b!752408 m!701347))

(declare-fun m!701389 () Bool)

(assert (=> b!752408 m!701389))

(declare-fun m!701391 () Bool)

(assert (=> b!752408 m!701391))

(declare-fun m!701393 () Bool)

(assert (=> b!752408 m!701393))

(push 1)

(assert (not b!752402))

(assert (not start!65666))

(assert (not b!752407))

(assert (not b!752406))

(assert (not b!752393))

(assert (not b!752392))

(assert (not b!752390))

(assert (not b!752391))

(assert (not b!752397))

(assert (not b!752411))

(assert (not b!752408))

(assert (not b!752409))

(assert (not b!752401))

(assert (not b!752395))

(assert (not b!752394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

