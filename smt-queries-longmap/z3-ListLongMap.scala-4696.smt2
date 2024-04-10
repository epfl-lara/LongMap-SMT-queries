; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65238 () Bool)

(assert start!65238)

(declare-fun b!739348 () Bool)

(declare-datatypes ((Unit!25272 0))(
  ( (Unit!25273) )
))
(declare-fun e!413435 () Unit!25272)

(declare-fun Unit!25274 () Unit!25272)

(assert (=> b!739348 (= e!413435 Unit!25274)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41411 0))(
  ( (array!41412 (arr!19819 (Array (_ BitVec 32) (_ BitVec 64))) (size!20240 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41411)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7419 0))(
  ( (MissingZero!7419 (index!32044 (_ BitVec 32))) (Found!7419 (index!32045 (_ BitVec 32))) (Intermediate!7419 (undefined!8231 Bool) (index!32046 (_ BitVec 32)) (x!63033 (_ BitVec 32))) (Undefined!7419) (MissingVacant!7419 (index!32047 (_ BitVec 32))) )
))
(declare-fun lt!328295 () SeekEntryResult!7419)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41411 (_ BitVec 32)) SeekEntryResult!7419)

(assert (=> b!739348 (= lt!328295 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328297 () (_ BitVec 32))

(declare-fun lt!328305 () SeekEntryResult!7419)

(assert (=> b!739348 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328297 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328305)))

(declare-fun b!739349 () Bool)

(declare-fun res!497114 () Bool)

(declare-fun e!413431 () Bool)

(assert (=> b!739349 (=> (not res!497114) (not e!413431))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739349 (= res!497114 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20240 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20240 a!3186))))))

(declare-fun e!413427 () Bool)

(declare-fun lt!328301 () SeekEntryResult!7419)

(declare-fun b!739350 () Bool)

(assert (=> b!739350 (= e!413427 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328301))))

(declare-fun b!739351 () Bool)

(declare-fun Unit!25275 () Unit!25272)

(assert (=> b!739351 (= e!413435 Unit!25275)))

(declare-fun lt!328303 () SeekEntryResult!7419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41411 (_ BitVec 32)) SeekEntryResult!7419)

(assert (=> b!739351 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328297 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328303)))

(declare-fun b!739352 () Bool)

(declare-fun e!413436 () Bool)

(assert (=> b!739352 (= e!413436 true)))

(declare-fun lt!328307 () (_ BitVec 64))

(declare-fun lt!328300 () SeekEntryResult!7419)

(declare-fun lt!328294 () array!41411)

(assert (=> b!739352 (= lt!328300 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328297 lt!328307 lt!328294 mask!3328))))

(declare-fun e!413429 () Bool)

(declare-fun b!739353 () Bool)

(assert (=> b!739353 (= e!413429 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328297 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328305)))))

(declare-fun b!739354 () Bool)

(declare-fun e!413434 () Bool)

(declare-fun e!413432 () Bool)

(assert (=> b!739354 (= e!413434 (not e!413432))))

(declare-fun res!497124 () Bool)

(assert (=> b!739354 (=> res!497124 e!413432)))

(declare-fun lt!328302 () SeekEntryResult!7419)

(get-info :version)

(assert (=> b!739354 (= res!497124 (or (not ((_ is Intermediate!7419) lt!328302)) (bvsge x!1131 (x!63033 lt!328302))))))

(assert (=> b!739354 (= lt!328305 (Found!7419 j!159))))

(declare-fun e!413430 () Bool)

(assert (=> b!739354 e!413430))

(declare-fun res!497119 () Bool)

(assert (=> b!739354 (=> (not res!497119) (not e!413430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41411 (_ BitVec 32)) Bool)

(assert (=> b!739354 (= res!497119 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328298 () Unit!25272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25272)

(assert (=> b!739354 (= lt!328298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739355 () Bool)

(declare-fun e!413438 () Bool)

(assert (=> b!739355 (= e!413438 e!413434)))

(declare-fun res!497123 () Bool)

(assert (=> b!739355 (=> (not res!497123) (not e!413434))))

(declare-fun lt!328306 () SeekEntryResult!7419)

(assert (=> b!739355 (= res!497123 (= lt!328306 lt!328302))))

(assert (=> b!739355 (= lt!328302 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328307 lt!328294 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739355 (= lt!328306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328307 mask!3328) lt!328307 lt!328294 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739355 (= lt!328307 (select (store (arr!19819 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739355 (= lt!328294 (array!41412 (store (arr!19819 a!3186) i!1173 k0!2102) (size!20240 a!3186)))))

(declare-fun res!497120 () Bool)

(declare-fun e!413433 () Bool)

(assert (=> start!65238 (=> (not res!497120) (not e!413433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65238 (= res!497120 (validMask!0 mask!3328))))

(assert (=> start!65238 e!413433))

(assert (=> start!65238 true))

(declare-fun array_inv!15615 (array!41411) Bool)

(assert (=> start!65238 (array_inv!15615 a!3186)))

(declare-fun b!739356 () Bool)

(assert (=> b!739356 (= e!413430 e!413427)))

(declare-fun res!497121 () Bool)

(assert (=> b!739356 (=> (not res!497121) (not e!413427))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41411 (_ BitVec 32)) SeekEntryResult!7419)

(assert (=> b!739356 (= res!497121 (= (seekEntryOrOpen!0 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328301))))

(assert (=> b!739356 (= lt!328301 (Found!7419 j!159))))

(declare-fun b!739357 () Bool)

(declare-fun res!497117 () Bool)

(assert (=> b!739357 (=> (not res!497117) (not e!413433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739357 (= res!497117 (validKeyInArray!0 k0!2102))))

(declare-fun b!739358 () Bool)

(declare-fun res!497112 () Bool)

(assert (=> b!739358 (=> (not res!497112) (not e!413433))))

(assert (=> b!739358 (= res!497112 (and (= (size!20240 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20240 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20240 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739359 () Bool)

(assert (=> b!739359 (= e!413429 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328297 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328303)))))

(declare-fun b!739360 () Bool)

(declare-fun res!497115 () Bool)

(assert (=> b!739360 (=> (not res!497115) (not e!413433))))

(assert (=> b!739360 (= res!497115 (validKeyInArray!0 (select (arr!19819 a!3186) j!159)))))

(declare-fun b!739361 () Bool)

(assert (=> b!739361 (= e!413433 e!413431)))

(declare-fun res!497110 () Bool)

(assert (=> b!739361 (=> (not res!497110) (not e!413431))))

(declare-fun lt!328299 () SeekEntryResult!7419)

(assert (=> b!739361 (= res!497110 (or (= lt!328299 (MissingZero!7419 i!1173)) (= lt!328299 (MissingVacant!7419 i!1173))))))

(assert (=> b!739361 (= lt!328299 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739362 () Bool)

(declare-fun e!413428 () Bool)

(assert (=> b!739362 (= e!413428 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328303))))

(declare-fun b!739363 () Bool)

(assert (=> b!739363 (= e!413432 e!413436)))

(declare-fun res!497116 () Bool)

(assert (=> b!739363 (=> res!497116 e!413436)))

(assert (=> b!739363 (= res!497116 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328297 #b00000000000000000000000000000000) (bvsge lt!328297 (size!20240 a!3186))))))

(declare-fun lt!328304 () Unit!25272)

(assert (=> b!739363 (= lt!328304 e!413435)))

(declare-fun c!81501 () Bool)

(declare-fun lt!328296 () Bool)

(assert (=> b!739363 (= c!81501 lt!328296)))

(assert (=> b!739363 (= lt!328296 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739363 (= lt!328297 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739364 () Bool)

(declare-fun res!497125 () Bool)

(assert (=> b!739364 (=> (not res!497125) (not e!413433))))

(declare-fun arrayContainsKey!0 (array!41411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739364 (= res!497125 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739365 () Bool)

(assert (=> b!739365 (= e!413428 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) (Found!7419 j!159)))))

(declare-fun b!739366 () Bool)

(declare-fun res!497111 () Bool)

(assert (=> b!739366 (=> (not res!497111) (not e!413431))))

(declare-datatypes ((List!13821 0))(
  ( (Nil!13818) (Cons!13817 (h!14889 (_ BitVec 64)) (t!20136 List!13821)) )
))
(declare-fun arrayNoDuplicates!0 (array!41411 (_ BitVec 32) List!13821) Bool)

(assert (=> b!739366 (= res!497111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13818))))

(declare-fun b!739367 () Bool)

(declare-fun res!497122 () Bool)

(assert (=> b!739367 (=> (not res!497122) (not e!413438))))

(assert (=> b!739367 (= res!497122 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19819 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739368 () Bool)

(assert (=> b!739368 (= e!413431 e!413438)))

(declare-fun res!497109 () Bool)

(assert (=> b!739368 (=> (not res!497109) (not e!413438))))

(assert (=> b!739368 (= res!497109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19819 a!3186) j!159) mask!3328) (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328303))))

(assert (=> b!739368 (= lt!328303 (Intermediate!7419 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739369 () Bool)

(declare-fun res!497118 () Bool)

(assert (=> b!739369 (=> (not res!497118) (not e!413431))))

(assert (=> b!739369 (= res!497118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739370 () Bool)

(declare-fun res!497113 () Bool)

(assert (=> b!739370 (=> (not res!497113) (not e!413438))))

(assert (=> b!739370 (= res!497113 e!413428)))

(declare-fun c!81502 () Bool)

(assert (=> b!739370 (= c!81502 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739371 () Bool)

(declare-fun res!497126 () Bool)

(assert (=> b!739371 (=> res!497126 e!413436)))

(assert (=> b!739371 (= res!497126 e!413429)))

(declare-fun c!81500 () Bool)

(assert (=> b!739371 (= c!81500 lt!328296)))

(assert (= (and start!65238 res!497120) b!739358))

(assert (= (and b!739358 res!497112) b!739360))

(assert (= (and b!739360 res!497115) b!739357))

(assert (= (and b!739357 res!497117) b!739364))

(assert (= (and b!739364 res!497125) b!739361))

(assert (= (and b!739361 res!497110) b!739369))

(assert (= (and b!739369 res!497118) b!739366))

(assert (= (and b!739366 res!497111) b!739349))

(assert (= (and b!739349 res!497114) b!739368))

(assert (= (and b!739368 res!497109) b!739367))

(assert (= (and b!739367 res!497122) b!739370))

(assert (= (and b!739370 c!81502) b!739362))

(assert (= (and b!739370 (not c!81502)) b!739365))

(assert (= (and b!739370 res!497113) b!739355))

(assert (= (and b!739355 res!497123) b!739354))

(assert (= (and b!739354 res!497119) b!739356))

(assert (= (and b!739356 res!497121) b!739350))

(assert (= (and b!739354 (not res!497124)) b!739363))

(assert (= (and b!739363 c!81501) b!739351))

(assert (= (and b!739363 (not c!81501)) b!739348))

(assert (= (and b!739363 (not res!497116)) b!739371))

(assert (= (and b!739371 c!81500) b!739359))

(assert (= (and b!739371 (not c!81500)) b!739353))

(assert (= (and b!739371 (not res!497126)) b!739352))

(declare-fun m!690751 () Bool)

(assert (=> b!739348 m!690751))

(assert (=> b!739348 m!690751))

(declare-fun m!690753 () Bool)

(assert (=> b!739348 m!690753))

(assert (=> b!739348 m!690751))

(declare-fun m!690755 () Bool)

(assert (=> b!739348 m!690755))

(declare-fun m!690757 () Bool)

(assert (=> b!739354 m!690757))

(declare-fun m!690759 () Bool)

(assert (=> b!739354 m!690759))

(declare-fun m!690761 () Bool)

(assert (=> b!739352 m!690761))

(assert (=> b!739356 m!690751))

(assert (=> b!739356 m!690751))

(declare-fun m!690763 () Bool)

(assert (=> b!739356 m!690763))

(declare-fun m!690765 () Bool)

(assert (=> b!739369 m!690765))

(assert (=> b!739350 m!690751))

(assert (=> b!739350 m!690751))

(declare-fun m!690767 () Bool)

(assert (=> b!739350 m!690767))

(assert (=> b!739351 m!690751))

(assert (=> b!739351 m!690751))

(declare-fun m!690769 () Bool)

(assert (=> b!739351 m!690769))

(declare-fun m!690771 () Bool)

(assert (=> b!739361 m!690771))

(assert (=> b!739368 m!690751))

(assert (=> b!739368 m!690751))

(declare-fun m!690773 () Bool)

(assert (=> b!739368 m!690773))

(assert (=> b!739368 m!690773))

(assert (=> b!739368 m!690751))

(declare-fun m!690775 () Bool)

(assert (=> b!739368 m!690775))

(assert (=> b!739365 m!690751))

(assert (=> b!739365 m!690751))

(assert (=> b!739365 m!690753))

(declare-fun m!690777 () Bool)

(assert (=> b!739366 m!690777))

(declare-fun m!690779 () Bool)

(assert (=> b!739364 m!690779))

(assert (=> b!739353 m!690751))

(assert (=> b!739353 m!690751))

(assert (=> b!739353 m!690755))

(declare-fun m!690781 () Bool)

(assert (=> b!739355 m!690781))

(declare-fun m!690783 () Bool)

(assert (=> b!739355 m!690783))

(declare-fun m!690785 () Bool)

(assert (=> b!739355 m!690785))

(assert (=> b!739355 m!690785))

(declare-fun m!690787 () Bool)

(assert (=> b!739355 m!690787))

(declare-fun m!690789 () Bool)

(assert (=> b!739355 m!690789))

(declare-fun m!690791 () Bool)

(assert (=> b!739357 m!690791))

(assert (=> b!739360 m!690751))

(assert (=> b!739360 m!690751))

(declare-fun m!690793 () Bool)

(assert (=> b!739360 m!690793))

(assert (=> b!739362 m!690751))

(assert (=> b!739362 m!690751))

(declare-fun m!690795 () Bool)

(assert (=> b!739362 m!690795))

(declare-fun m!690797 () Bool)

(assert (=> b!739367 m!690797))

(declare-fun m!690799 () Bool)

(assert (=> start!65238 m!690799))

(declare-fun m!690801 () Bool)

(assert (=> start!65238 m!690801))

(assert (=> b!739359 m!690751))

(assert (=> b!739359 m!690751))

(assert (=> b!739359 m!690769))

(declare-fun m!690803 () Bool)

(assert (=> b!739363 m!690803))

(check-sat (not b!739359) (not b!739366) (not b!739356) (not start!65238) (not b!739363) (not b!739351) (not b!739355) (not b!739348) (not b!739353) (not b!739354) (not b!739369) (not b!739352) (not b!739361) (not b!739350) (not b!739360) (not b!739368) (not b!739362) (not b!739357) (not b!739364) (not b!739365))
(check-sat)
