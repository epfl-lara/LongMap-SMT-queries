; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66998 () Bool)

(assert start!66998)

(declare-fun res!523108 () Bool)

(declare-fun e!430479 () Bool)

(assert (=> start!66998 (=> (not res!523108) (not e!430479))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66998 (= res!523108 (validMask!0 mask!3328))))

(assert (=> start!66998 e!430479))

(assert (=> start!66998 true))

(declare-datatypes ((array!42441 0))(
  ( (array!42442 (arr!20318 (Array (_ BitVec 32) (_ BitVec 64))) (size!20739 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42441)

(declare-fun array_inv!16201 (array!42441) Bool)

(assert (=> start!66998 (array_inv!16201 a!3186)))

(declare-fun b!773356 () Bool)

(declare-datatypes ((SeekEntryResult!7915 0))(
  ( (MissingZero!7915 (index!34028 (_ BitVec 32))) (Found!7915 (index!34029 (_ BitVec 32))) (Intermediate!7915 (undefined!8727 Bool) (index!34030 (_ BitVec 32)) (x!64977 (_ BitVec 32))) (Undefined!7915) (MissingVacant!7915 (index!34031 (_ BitVec 32))) )
))
(declare-fun lt!344261 () SeekEntryResult!7915)

(declare-fun lt!344267 () (_ BitVec 32))

(declare-fun e!430474 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42441 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!773356 (= e!430474 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344267 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344261))))

(declare-fun b!773357 () Bool)

(declare-fun res!523104 () Bool)

(assert (=> b!773357 (=> (not res!523104) (not e!430479))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773357 (= res!523104 (validKeyInArray!0 k0!2102))))

(declare-fun b!773358 () Bool)

(declare-fun res!523116 () Bool)

(declare-fun e!430473 () Bool)

(assert (=> b!773358 (=> (not res!523116) (not e!430473))))

(declare-datatypes ((List!14359 0))(
  ( (Nil!14356) (Cons!14355 (h!15460 (_ BitVec 64)) (t!20665 List!14359)) )
))
(declare-fun arrayNoDuplicates!0 (array!42441 (_ BitVec 32) List!14359) Bool)

(assert (=> b!773358 (= res!523116 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14356))))

(declare-fun b!773359 () Bool)

(declare-fun e!430472 () Bool)

(assert (=> b!773359 (= e!430473 e!430472)))

(declare-fun res!523114 () Bool)

(assert (=> b!773359 (=> (not res!523114) (not e!430472))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773359 (= res!523114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20318 a!3186) j!159) mask!3328) (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344261))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773359 (= lt!344261 (Intermediate!7915 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773360 () Bool)

(declare-datatypes ((Unit!26654 0))(
  ( (Unit!26655) )
))
(declare-fun e!430478 () Unit!26654)

(declare-fun Unit!26656 () Unit!26654)

(assert (=> b!773360 (= e!430478 Unit!26656)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344262 () SeekEntryResult!7915)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42441 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!773360 (= lt!344262 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344265 () SeekEntryResult!7915)

(assert (=> b!773360 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344267 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344265)))

(declare-fun b!773361 () Bool)

(assert (=> b!773361 (= e!430474 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344267 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344265))))

(declare-fun b!773362 () Bool)

(declare-fun e!430482 () Bool)

(declare-fun e!430483 () Bool)

(assert (=> b!773362 (= e!430482 e!430483)))

(declare-fun res!523103 () Bool)

(assert (=> b!773362 (=> (not res!523103) (not e!430483))))

(declare-fun lt!344271 () SeekEntryResult!7915)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42441 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!773362 (= res!523103 (= (seekEntryOrOpen!0 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344271))))

(assert (=> b!773362 (= lt!344271 (Found!7915 j!159))))

(declare-fun e!430481 () Bool)

(declare-fun b!773363 () Bool)

(assert (=> b!773363 (= e!430481 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159)))))

(declare-fun b!773364 () Bool)

(declare-fun res!523105 () Bool)

(assert (=> b!773364 (=> (not res!523105) (not e!430472))))

(assert (=> b!773364 (= res!523105 e!430481)))

(declare-fun c!85525 () Bool)

(assert (=> b!773364 (= c!85525 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773365 () Bool)

(declare-fun e!430476 () Bool)

(declare-fun e!430480 () Bool)

(assert (=> b!773365 (= e!430476 (not e!430480))))

(declare-fun res!523110 () Bool)

(assert (=> b!773365 (=> res!523110 e!430480)))

(declare-fun lt!344268 () SeekEntryResult!7915)

(get-info :version)

(assert (=> b!773365 (= res!523110 (or (not ((_ is Intermediate!7915) lt!344268)) (bvsge x!1131 (x!64977 lt!344268))))))

(assert (=> b!773365 (= lt!344265 (Found!7915 j!159))))

(assert (=> b!773365 e!430482))

(declare-fun res!523109 () Bool)

(assert (=> b!773365 (=> (not res!523109) (not e!430482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42441 (_ BitVec 32)) Bool)

(assert (=> b!773365 (= res!523109 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344263 () Unit!26654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26654)

(assert (=> b!773365 (= lt!344263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773366 () Bool)

(declare-fun e!430477 () Bool)

(assert (=> b!773366 (= e!430480 e!430477)))

(declare-fun res!523118 () Bool)

(assert (=> b!773366 (=> res!523118 e!430477)))

(assert (=> b!773366 (= res!523118 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344267 #b00000000000000000000000000000000) (bvsge lt!344267 (size!20739 a!3186))))))

(declare-fun lt!344264 () Unit!26654)

(assert (=> b!773366 (= lt!344264 e!430478)))

(declare-fun c!85526 () Bool)

(declare-fun lt!344270 () Bool)

(assert (=> b!773366 (= c!85526 lt!344270)))

(assert (=> b!773366 (= lt!344270 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773366 (= lt!344267 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773367 () Bool)

(declare-fun Unit!26657 () Unit!26654)

(assert (=> b!773367 (= e!430478 Unit!26657)))

(assert (=> b!773367 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344267 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344261)))

(declare-fun b!773368 () Bool)

(declare-fun res!523106 () Bool)

(assert (=> b!773368 (=> (not res!523106) (not e!430479))))

(assert (=> b!773368 (= res!523106 (validKeyInArray!0 (select (arr!20318 a!3186) j!159)))))

(declare-fun b!773369 () Bool)

(assert (=> b!773369 (= e!430481 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344261))))

(declare-fun b!773370 () Bool)

(declare-fun res!523112 () Bool)

(assert (=> b!773370 (=> (not res!523112) (not e!430473))))

(assert (=> b!773370 (= res!523112 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20739 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20739 a!3186))))))

(declare-fun b!773371 () Bool)

(declare-fun res!523111 () Bool)

(assert (=> b!773371 (=> (not res!523111) (not e!430479))))

(declare-fun arrayContainsKey!0 (array!42441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773371 (= res!523111 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773372 () Bool)

(declare-fun res!523107 () Bool)

(assert (=> b!773372 (=> (not res!523107) (not e!430472))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773372 (= res!523107 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20318 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773373 () Bool)

(assert (=> b!773373 (= e!430483 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344271))))

(declare-fun b!773374 () Bool)

(assert (=> b!773374 (= e!430472 e!430476)))

(declare-fun res!523113 () Bool)

(assert (=> b!773374 (=> (not res!523113) (not e!430476))))

(declare-fun lt!344273 () SeekEntryResult!7915)

(assert (=> b!773374 (= res!523113 (= lt!344273 lt!344268))))

(declare-fun lt!344269 () array!42441)

(declare-fun lt!344266 () (_ BitVec 64))

(assert (=> b!773374 (= lt!344268 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344266 lt!344269 mask!3328))))

(assert (=> b!773374 (= lt!344273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344266 mask!3328) lt!344266 lt!344269 mask!3328))))

(assert (=> b!773374 (= lt!344266 (select (store (arr!20318 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773374 (= lt!344269 (array!42442 (store (arr!20318 a!3186) i!1173 k0!2102) (size!20739 a!3186)))))

(declare-fun b!773375 () Bool)

(declare-fun res!523115 () Bool)

(assert (=> b!773375 (=> (not res!523115) (not e!430479))))

(assert (=> b!773375 (= res!523115 (and (= (size!20739 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20739 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20739 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773376 () Bool)

(declare-fun res!523117 () Bool)

(assert (=> b!773376 (=> (not res!523117) (not e!430473))))

(assert (=> b!773376 (= res!523117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773377 () Bool)

(assert (=> b!773377 (= e!430477 e!430474)))

(declare-fun c!85527 () Bool)

(assert (=> b!773377 (= c!85527 lt!344270)))

(declare-fun b!773378 () Bool)

(assert (=> b!773378 (= e!430479 e!430473)))

(declare-fun res!523119 () Bool)

(assert (=> b!773378 (=> (not res!523119) (not e!430473))))

(declare-fun lt!344272 () SeekEntryResult!7915)

(assert (=> b!773378 (= res!523119 (or (= lt!344272 (MissingZero!7915 i!1173)) (= lt!344272 (MissingVacant!7915 i!1173))))))

(assert (=> b!773378 (= lt!344272 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66998 res!523108) b!773375))

(assert (= (and b!773375 res!523115) b!773368))

(assert (= (and b!773368 res!523106) b!773357))

(assert (= (and b!773357 res!523104) b!773371))

(assert (= (and b!773371 res!523111) b!773378))

(assert (= (and b!773378 res!523119) b!773376))

(assert (= (and b!773376 res!523117) b!773358))

(assert (= (and b!773358 res!523116) b!773370))

(assert (= (and b!773370 res!523112) b!773359))

(assert (= (and b!773359 res!523114) b!773372))

(assert (= (and b!773372 res!523107) b!773364))

(assert (= (and b!773364 c!85525) b!773369))

(assert (= (and b!773364 (not c!85525)) b!773363))

(assert (= (and b!773364 res!523105) b!773374))

(assert (= (and b!773374 res!523113) b!773365))

(assert (= (and b!773365 res!523109) b!773362))

(assert (= (and b!773362 res!523103) b!773373))

(assert (= (and b!773365 (not res!523110)) b!773366))

(assert (= (and b!773366 c!85526) b!773367))

(assert (= (and b!773366 (not c!85526)) b!773360))

(assert (= (and b!773366 (not res!523118)) b!773377))

(assert (= (and b!773377 c!85527) b!773356))

(assert (= (and b!773377 (not c!85527)) b!773361))

(declare-fun m!717549 () Bool)

(assert (=> b!773368 m!717549))

(assert (=> b!773368 m!717549))

(declare-fun m!717551 () Bool)

(assert (=> b!773368 m!717551))

(declare-fun m!717553 () Bool)

(assert (=> b!773372 m!717553))

(declare-fun m!717555 () Bool)

(assert (=> b!773357 m!717555))

(assert (=> b!773369 m!717549))

(assert (=> b!773369 m!717549))

(declare-fun m!717557 () Bool)

(assert (=> b!773369 m!717557))

(declare-fun m!717559 () Bool)

(assert (=> b!773378 m!717559))

(assert (=> b!773362 m!717549))

(assert (=> b!773362 m!717549))

(declare-fun m!717561 () Bool)

(assert (=> b!773362 m!717561))

(declare-fun m!717563 () Bool)

(assert (=> b!773366 m!717563))

(assert (=> b!773363 m!717549))

(assert (=> b!773363 m!717549))

(declare-fun m!717565 () Bool)

(assert (=> b!773363 m!717565))

(assert (=> b!773361 m!717549))

(assert (=> b!773361 m!717549))

(declare-fun m!717567 () Bool)

(assert (=> b!773361 m!717567))

(assert (=> b!773367 m!717549))

(assert (=> b!773367 m!717549))

(declare-fun m!717569 () Bool)

(assert (=> b!773367 m!717569))

(assert (=> b!773360 m!717549))

(assert (=> b!773360 m!717549))

(assert (=> b!773360 m!717565))

(assert (=> b!773360 m!717549))

(assert (=> b!773360 m!717567))

(declare-fun m!717571 () Bool)

(assert (=> b!773376 m!717571))

(declare-fun m!717573 () Bool)

(assert (=> b!773374 m!717573))

(declare-fun m!717575 () Bool)

(assert (=> b!773374 m!717575))

(declare-fun m!717577 () Bool)

(assert (=> b!773374 m!717577))

(declare-fun m!717579 () Bool)

(assert (=> b!773374 m!717579))

(declare-fun m!717581 () Bool)

(assert (=> b!773374 m!717581))

(assert (=> b!773374 m!717575))

(assert (=> b!773359 m!717549))

(assert (=> b!773359 m!717549))

(declare-fun m!717583 () Bool)

(assert (=> b!773359 m!717583))

(assert (=> b!773359 m!717583))

(assert (=> b!773359 m!717549))

(declare-fun m!717585 () Bool)

(assert (=> b!773359 m!717585))

(declare-fun m!717587 () Bool)

(assert (=> b!773365 m!717587))

(declare-fun m!717589 () Bool)

(assert (=> b!773365 m!717589))

(declare-fun m!717591 () Bool)

(assert (=> b!773371 m!717591))

(declare-fun m!717593 () Bool)

(assert (=> start!66998 m!717593))

(declare-fun m!717595 () Bool)

(assert (=> start!66998 m!717595))

(assert (=> b!773373 m!717549))

(assert (=> b!773373 m!717549))

(declare-fun m!717597 () Bool)

(assert (=> b!773373 m!717597))

(assert (=> b!773356 m!717549))

(assert (=> b!773356 m!717549))

(assert (=> b!773356 m!717569))

(declare-fun m!717599 () Bool)

(assert (=> b!773358 m!717599))

(check-sat (not b!773360) (not b!773366) (not b!773374) (not b!773378) (not b!773358) (not b!773363) (not b!773367) (not b!773369) (not b!773373) (not b!773362) (not b!773361) (not b!773357) (not b!773368) (not start!66998) (not b!773365) (not b!773376) (not b!773359) (not b!773371) (not b!773356))
(check-sat)
