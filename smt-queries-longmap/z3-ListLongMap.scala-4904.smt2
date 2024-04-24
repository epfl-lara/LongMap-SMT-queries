; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67786 () Bool)

(assert start!67786)

(declare-fun b!784403 () Bool)

(declare-fun e!436198 () Bool)

(assert (=> b!784403 (= e!436198 true)))

(declare-fun e!436199 () Bool)

(assert (=> b!784403 e!436199))

(declare-fun res!530547 () Bool)

(assert (=> b!784403 (=> (not res!530547) (not e!436199))))

(declare-fun lt!349601 () (_ BitVec 64))

(assert (=> b!784403 (= res!530547 (= lt!349601 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27037 0))(
  ( (Unit!27038) )
))
(declare-fun lt!349606 () Unit!27037)

(declare-fun e!436203 () Unit!27037)

(assert (=> b!784403 (= lt!349606 e!436203)))

(declare-fun c!87341 () Bool)

(assert (=> b!784403 (= c!87341 (= lt!349601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784404 () Bool)

(declare-fun e!436194 () Bool)

(declare-fun e!436201 () Bool)

(assert (=> b!784404 (= e!436194 e!436201)))

(declare-fun res!530556 () Bool)

(assert (=> b!784404 (=> res!530556 e!436201)))

(declare-datatypes ((SeekEntryResult!7993 0))(
  ( (MissingZero!7993 (index!34340 (_ BitVec 32))) (Found!7993 (index!34341 (_ BitVec 32))) (Intermediate!7993 (undefined!8805 Bool) (index!34342 (_ BitVec 32)) (x!65456 (_ BitVec 32))) (Undefined!7993) (MissingVacant!7993 (index!34343 (_ BitVec 32))) )
))
(declare-fun lt!349605 () SeekEntryResult!7993)

(declare-fun lt!349602 () SeekEntryResult!7993)

(assert (=> b!784404 (= res!530556 (not (= lt!349605 lt!349602)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42706 0))(
  ( (array!42707 (arr!20437 (Array (_ BitVec 32) (_ BitVec 64))) (size!20857 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42706)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!784404 (= lt!349605 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784405 () Bool)

(declare-fun res!530551 () Bool)

(declare-fun e!436196 () Bool)

(assert (=> b!784405 (=> (not res!530551) (not e!436196))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784405 (= res!530551 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20437 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784406 () Bool)

(declare-fun e!436204 () Bool)

(assert (=> b!784406 (= e!436204 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) (Found!7993 j!159)))))

(declare-fun b!784407 () Bool)

(declare-fun e!436200 () Bool)

(assert (=> b!784407 (= e!436200 e!436196)))

(declare-fun res!530550 () Bool)

(assert (=> b!784407 (=> (not res!530550) (not e!436196))))

(declare-fun lt!349604 () SeekEntryResult!7993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!7993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784407 (= res!530550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20437 a!3186) j!159) mask!3328) (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349604))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784407 (= lt!349604 (Intermediate!7993 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784408 () Bool)

(declare-fun res!530554 () Bool)

(assert (=> b!784408 (=> (not res!530554) (not e!436200))))

(assert (=> b!784408 (= res!530554 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20857 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20857 a!3186))))))

(declare-fun b!784409 () Bool)

(declare-fun Unit!27039 () Unit!27037)

(assert (=> b!784409 (= e!436203 Unit!27039)))

(assert (=> b!784409 false))

(declare-fun b!784410 () Bool)

(declare-fun res!530552 () Bool)

(declare-fun e!436195 () Bool)

(assert (=> b!784410 (=> (not res!530552) (not e!436195))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784410 (= res!530552 (validKeyInArray!0 k0!2102))))

(declare-fun b!784411 () Bool)

(declare-fun res!530548 () Bool)

(assert (=> b!784411 (=> (not res!530548) (not e!436195))))

(assert (=> b!784411 (= res!530548 (validKeyInArray!0 (select (arr!20437 a!3186) j!159)))))

(declare-fun b!784412 () Bool)

(declare-fun res!530546 () Bool)

(assert (=> b!784412 (=> (not res!530546) (not e!436195))))

(assert (=> b!784412 (= res!530546 (and (= (size!20857 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20857 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20857 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784414 () Bool)

(assert (=> b!784414 (= e!436195 e!436200)))

(declare-fun res!530553 () Bool)

(assert (=> b!784414 (=> (not res!530553) (not e!436200))))

(declare-fun lt!349609 () SeekEntryResult!7993)

(assert (=> b!784414 (= res!530553 (or (= lt!349609 (MissingZero!7993 i!1173)) (= lt!349609 (MissingVacant!7993 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!784414 (= lt!349609 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784415 () Bool)

(declare-fun Unit!27040 () Unit!27037)

(assert (=> b!784415 (= e!436203 Unit!27040)))

(declare-fun b!784416 () Bool)

(declare-fun res!530557 () Bool)

(assert (=> b!784416 (=> (not res!530557) (not e!436200))))

(declare-datatypes ((List!14346 0))(
  ( (Nil!14343) (Cons!14342 (h!15471 (_ BitVec 64)) (t!20653 List!14346)) )
))
(declare-fun arrayNoDuplicates!0 (array!42706 (_ BitVec 32) List!14346) Bool)

(assert (=> b!784416 (= res!530557 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14343))))

(declare-fun b!784417 () Bool)

(declare-fun e!436202 () Bool)

(assert (=> b!784417 (= e!436202 (not e!436194))))

(declare-fun res!530560 () Bool)

(assert (=> b!784417 (=> res!530560 e!436194)))

(declare-fun lt!349607 () SeekEntryResult!7993)

(get-info :version)

(assert (=> b!784417 (= res!530560 (or (not ((_ is Intermediate!7993) lt!349607)) (bvslt x!1131 (x!65456 lt!349607)) (not (= x!1131 (x!65456 lt!349607))) (not (= index!1321 (index!34342 lt!349607)))))))

(declare-fun e!436197 () Bool)

(assert (=> b!784417 e!436197))

(declare-fun res!530562 () Bool)

(assert (=> b!784417 (=> (not res!530562) (not e!436197))))

(declare-fun lt!349608 () SeekEntryResult!7993)

(assert (=> b!784417 (= res!530562 (= lt!349608 lt!349602))))

(assert (=> b!784417 (= lt!349602 (Found!7993 j!159))))

(assert (=> b!784417 (= lt!349608 (seekEntryOrOpen!0 (select (arr!20437 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42706 (_ BitVec 32)) Bool)

(assert (=> b!784417 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349611 () Unit!27037)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27037)

(assert (=> b!784417 (= lt!349611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784418 () Bool)

(declare-fun res!530559 () Bool)

(assert (=> b!784418 (=> (not res!530559) (not e!436195))))

(declare-fun arrayContainsKey!0 (array!42706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784418 (= res!530559 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784419 () Bool)

(assert (=> b!784419 (= e!436199 (= lt!349608 lt!349605))))

(declare-fun b!784420 () Bool)

(assert (=> b!784420 (= e!436197 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349602))))

(declare-fun b!784421 () Bool)

(declare-fun res!530558 () Bool)

(assert (=> b!784421 (=> (not res!530558) (not e!436200))))

(assert (=> b!784421 (= res!530558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784422 () Bool)

(assert (=> b!784422 (= e!436201 e!436198)))

(declare-fun res!530555 () Bool)

(assert (=> b!784422 (=> res!530555 e!436198)))

(declare-fun lt!349612 () (_ BitVec 64))

(assert (=> b!784422 (= res!530555 (= lt!349601 lt!349612))))

(assert (=> b!784422 (= lt!349601 (select (store (arr!20437 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784423 () Bool)

(assert (=> b!784423 (= e!436204 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349604))))

(declare-fun b!784424 () Bool)

(declare-fun res!530561 () Bool)

(assert (=> b!784424 (=> (not res!530561) (not e!436199))))

(declare-fun lt!349603 () array!42706)

(assert (=> b!784424 (= res!530561 (= (seekEntryOrOpen!0 lt!349612 lt!349603 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349612 lt!349603 mask!3328)))))

(declare-fun b!784425 () Bool)

(declare-fun res!530544 () Bool)

(assert (=> b!784425 (=> (not res!530544) (not e!436196))))

(assert (=> b!784425 (= res!530544 e!436204)))

(declare-fun c!87340 () Bool)

(assert (=> b!784425 (= c!87340 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784413 () Bool)

(assert (=> b!784413 (= e!436196 e!436202)))

(declare-fun res!530545 () Bool)

(assert (=> b!784413 (=> (not res!530545) (not e!436202))))

(declare-fun lt!349610 () SeekEntryResult!7993)

(assert (=> b!784413 (= res!530545 (= lt!349610 lt!349607))))

(assert (=> b!784413 (= lt!349607 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349612 lt!349603 mask!3328))))

(assert (=> b!784413 (= lt!349610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349612 mask!3328) lt!349612 lt!349603 mask!3328))))

(assert (=> b!784413 (= lt!349612 (select (store (arr!20437 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784413 (= lt!349603 (array!42707 (store (arr!20437 a!3186) i!1173 k0!2102) (size!20857 a!3186)))))

(declare-fun res!530549 () Bool)

(assert (=> start!67786 (=> (not res!530549) (not e!436195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67786 (= res!530549 (validMask!0 mask!3328))))

(assert (=> start!67786 e!436195))

(assert (=> start!67786 true))

(declare-fun array_inv!16296 (array!42706) Bool)

(assert (=> start!67786 (array_inv!16296 a!3186)))

(assert (= (and start!67786 res!530549) b!784412))

(assert (= (and b!784412 res!530546) b!784411))

(assert (= (and b!784411 res!530548) b!784410))

(assert (= (and b!784410 res!530552) b!784418))

(assert (= (and b!784418 res!530559) b!784414))

(assert (= (and b!784414 res!530553) b!784421))

(assert (= (and b!784421 res!530558) b!784416))

(assert (= (and b!784416 res!530557) b!784408))

(assert (= (and b!784408 res!530554) b!784407))

(assert (= (and b!784407 res!530550) b!784405))

(assert (= (and b!784405 res!530551) b!784425))

(assert (= (and b!784425 c!87340) b!784423))

(assert (= (and b!784425 (not c!87340)) b!784406))

(assert (= (and b!784425 res!530544) b!784413))

(assert (= (and b!784413 res!530545) b!784417))

(assert (= (and b!784417 res!530562) b!784420))

(assert (= (and b!784417 (not res!530560)) b!784404))

(assert (= (and b!784404 (not res!530556)) b!784422))

(assert (= (and b!784422 (not res!530555)) b!784403))

(assert (= (and b!784403 c!87341) b!784409))

(assert (= (and b!784403 (not c!87341)) b!784415))

(assert (= (and b!784403 res!530547) b!784424))

(assert (= (and b!784424 res!530561) b!784419))

(declare-fun m!727307 () Bool)

(assert (=> b!784404 m!727307))

(assert (=> b!784404 m!727307))

(declare-fun m!727309 () Bool)

(assert (=> b!784404 m!727309))

(declare-fun m!727311 () Bool)

(assert (=> b!784413 m!727311))

(declare-fun m!727313 () Bool)

(assert (=> b!784413 m!727313))

(declare-fun m!727315 () Bool)

(assert (=> b!784413 m!727315))

(declare-fun m!727317 () Bool)

(assert (=> b!784413 m!727317))

(declare-fun m!727319 () Bool)

(assert (=> b!784413 m!727319))

(assert (=> b!784413 m!727311))

(declare-fun m!727321 () Bool)

(assert (=> b!784405 m!727321))

(declare-fun m!727323 () Bool)

(assert (=> start!67786 m!727323))

(declare-fun m!727325 () Bool)

(assert (=> start!67786 m!727325))

(assert (=> b!784407 m!727307))

(assert (=> b!784407 m!727307))

(declare-fun m!727327 () Bool)

(assert (=> b!784407 m!727327))

(assert (=> b!784407 m!727327))

(assert (=> b!784407 m!727307))

(declare-fun m!727329 () Bool)

(assert (=> b!784407 m!727329))

(declare-fun m!727331 () Bool)

(assert (=> b!784421 m!727331))

(assert (=> b!784423 m!727307))

(assert (=> b!784423 m!727307))

(declare-fun m!727333 () Bool)

(assert (=> b!784423 m!727333))

(declare-fun m!727335 () Bool)

(assert (=> b!784416 m!727335))

(declare-fun m!727337 () Bool)

(assert (=> b!784424 m!727337))

(declare-fun m!727339 () Bool)

(assert (=> b!784424 m!727339))

(assert (=> b!784422 m!727315))

(declare-fun m!727341 () Bool)

(assert (=> b!784422 m!727341))

(declare-fun m!727343 () Bool)

(assert (=> b!784414 m!727343))

(declare-fun m!727345 () Bool)

(assert (=> b!784410 m!727345))

(assert (=> b!784417 m!727307))

(assert (=> b!784417 m!727307))

(declare-fun m!727347 () Bool)

(assert (=> b!784417 m!727347))

(declare-fun m!727349 () Bool)

(assert (=> b!784417 m!727349))

(declare-fun m!727351 () Bool)

(assert (=> b!784417 m!727351))

(assert (=> b!784411 m!727307))

(assert (=> b!784411 m!727307))

(declare-fun m!727353 () Bool)

(assert (=> b!784411 m!727353))

(assert (=> b!784420 m!727307))

(assert (=> b!784420 m!727307))

(declare-fun m!727355 () Bool)

(assert (=> b!784420 m!727355))

(declare-fun m!727357 () Bool)

(assert (=> b!784418 m!727357))

(assert (=> b!784406 m!727307))

(assert (=> b!784406 m!727307))

(assert (=> b!784406 m!727309))

(check-sat (not b!784424) (not b!784414) (not start!67786) (not b!784416) (not b!784407) (not b!784404) (not b!784410) (not b!784421) (not b!784423) (not b!784420) (not b!784413) (not b!784411) (not b!784418) (not b!784406) (not b!784417))
(check-sat)
