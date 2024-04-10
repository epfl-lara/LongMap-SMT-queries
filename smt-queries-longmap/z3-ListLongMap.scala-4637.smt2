; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64524 () Bool)

(assert start!64524)

(declare-fun b!726447 () Bool)

(declare-fun res!487439 () Bool)

(declare-fun e!406734 () Bool)

(assert (=> b!726447 (=> (not res!487439) (not e!406734))))

(declare-datatypes ((array!41042 0))(
  ( (array!41043 (arr!19642 (Array (_ BitVec 32) (_ BitVec 64))) (size!20063 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41042)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!726447 (= res!487439 (and (= (size!20063 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20063 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20063 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726448 () Bool)

(declare-fun e!406733 () Bool)

(declare-fun e!406732 () Bool)

(assert (=> b!726448 (= e!406733 e!406732)))

(declare-fun res!487438 () Bool)

(assert (=> b!726448 (=> (not res!487438) (not e!406732))))

(declare-datatypes ((SeekEntryResult!7242 0))(
  ( (MissingZero!7242 (index!31336 (_ BitVec 32))) (Found!7242 (index!31337 (_ BitVec 32))) (Intermediate!7242 (undefined!8054 Bool) (index!31338 (_ BitVec 32)) (x!62324 (_ BitVec 32))) (Undefined!7242) (MissingVacant!7242 (index!31339 (_ BitVec 32))) )
))
(declare-fun lt!321730 () SeekEntryResult!7242)

(declare-fun lt!321727 () SeekEntryResult!7242)

(assert (=> b!726448 (= res!487438 (= lt!321730 lt!321727))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321724 () array!41042)

(declare-fun lt!321726 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41042 (_ BitVec 32)) SeekEntryResult!7242)

(assert (=> b!726448 (= lt!321727 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321726 lt!321724 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726448 (= lt!321730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321726 mask!3328) lt!321726 lt!321724 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726448 (= lt!321726 (select (store (arr!19642 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726448 (= lt!321724 (array!41043 (store (arr!19642 a!3186) i!1173 k0!2102) (size!20063 a!3186)))))

(declare-fun b!726449 () Bool)

(get-info :version)

(assert (=> b!726449 (= e!406732 (not (or (not ((_ is Intermediate!7242) lt!321727)) (bvsge x!1131 (x!62324 lt!321727)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!406731 () Bool)

(assert (=> b!726449 e!406731))

(declare-fun res!487431 () Bool)

(assert (=> b!726449 (=> (not res!487431) (not e!406731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41042 (_ BitVec 32)) Bool)

(assert (=> b!726449 (= res!487431 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24802 0))(
  ( (Unit!24803) )
))
(declare-fun lt!321725 () Unit!24802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24802)

(assert (=> b!726449 (= lt!321725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726450 () Bool)

(declare-fun res!487429 () Bool)

(assert (=> b!726450 (=> (not res!487429) (not e!406733))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!726450 (= res!487429 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19642 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726451 () Bool)

(declare-fun e!406736 () Bool)

(assert (=> b!726451 (= e!406734 e!406736)))

(declare-fun res!487436 () Bool)

(assert (=> b!726451 (=> (not res!487436) (not e!406736))))

(declare-fun lt!321728 () SeekEntryResult!7242)

(assert (=> b!726451 (= res!487436 (or (= lt!321728 (MissingZero!7242 i!1173)) (= lt!321728 (MissingVacant!7242 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41042 (_ BitVec 32)) SeekEntryResult!7242)

(assert (=> b!726451 (= lt!321728 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726452 () Bool)

(declare-fun res!487433 () Bool)

(assert (=> b!726452 (=> (not res!487433) (not e!406736))))

(declare-datatypes ((List!13644 0))(
  ( (Nil!13641) (Cons!13640 (h!14697 (_ BitVec 64)) (t!19959 List!13644)) )
))
(declare-fun arrayNoDuplicates!0 (array!41042 (_ BitVec 32) List!13644) Bool)

(assert (=> b!726452 (= res!487433 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13641))))

(declare-fun b!726453 () Bool)

(declare-fun res!487432 () Bool)

(assert (=> b!726453 (=> (not res!487432) (not e!406734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726453 (= res!487432 (validKeyInArray!0 k0!2102))))

(declare-fun b!726454 () Bool)

(declare-fun res!487437 () Bool)

(assert (=> b!726454 (=> (not res!487437) (not e!406734))))

(declare-fun arrayContainsKey!0 (array!41042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726454 (= res!487437 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!321731 () SeekEntryResult!7242)

(declare-fun e!406730 () Bool)

(declare-fun b!726455 () Bool)

(assert (=> b!726455 (= e!406730 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!321731))))

(declare-fun b!726456 () Bool)

(declare-fun res!487428 () Bool)

(assert (=> b!726456 (=> (not res!487428) (not e!406733))))

(assert (=> b!726456 (= res!487428 e!406730)))

(declare-fun c!79882 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726456 (= c!79882 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726457 () Bool)

(declare-fun res!487440 () Bool)

(assert (=> b!726457 (=> (not res!487440) (not e!406736))))

(assert (=> b!726457 (= res!487440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20063 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20063 a!3186))))))

(declare-fun b!726458 () Bool)

(declare-fun res!487442 () Bool)

(assert (=> b!726458 (=> (not res!487442) (not e!406734))))

(assert (=> b!726458 (= res!487442 (validKeyInArray!0 (select (arr!19642 a!3186) j!159)))))

(declare-fun b!726446 () Bool)

(assert (=> b!726446 (= e!406736 e!406733)))

(declare-fun res!487434 () Bool)

(assert (=> b!726446 (=> (not res!487434) (not e!406733))))

(assert (=> b!726446 (= res!487434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19642 a!3186) j!159) mask!3328) (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!321731))))

(assert (=> b!726446 (= lt!321731 (Intermediate!7242 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!487430 () Bool)

(assert (=> start!64524 (=> (not res!487430) (not e!406734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64524 (= res!487430 (validMask!0 mask!3328))))

(assert (=> start!64524 e!406734))

(assert (=> start!64524 true))

(declare-fun array_inv!15438 (array!41042) Bool)

(assert (=> start!64524 (array_inv!15438 a!3186)))

(declare-fun b!726459 () Bool)

(declare-fun res!487441 () Bool)

(assert (=> b!726459 (=> (not res!487441) (not e!406736))))

(assert (=> b!726459 (= res!487441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726460 () Bool)

(declare-fun e!406735 () Bool)

(assert (=> b!726460 (= e!406731 e!406735)))

(declare-fun res!487435 () Bool)

(assert (=> b!726460 (=> (not res!487435) (not e!406735))))

(declare-fun lt!321729 () SeekEntryResult!7242)

(assert (=> b!726460 (= res!487435 (= (seekEntryOrOpen!0 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!321729))))

(assert (=> b!726460 (= lt!321729 (Found!7242 j!159))))

(declare-fun b!726461 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41042 (_ BitVec 32)) SeekEntryResult!7242)

(assert (=> b!726461 (= e!406730 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) (Found!7242 j!159)))))

(declare-fun b!726462 () Bool)

(assert (=> b!726462 (= e!406735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!321729))))

(assert (= (and start!64524 res!487430) b!726447))

(assert (= (and b!726447 res!487439) b!726458))

(assert (= (and b!726458 res!487442) b!726453))

(assert (= (and b!726453 res!487432) b!726454))

(assert (= (and b!726454 res!487437) b!726451))

(assert (= (and b!726451 res!487436) b!726459))

(assert (= (and b!726459 res!487441) b!726452))

(assert (= (and b!726452 res!487433) b!726457))

(assert (= (and b!726457 res!487440) b!726446))

(assert (= (and b!726446 res!487434) b!726450))

(assert (= (and b!726450 res!487429) b!726456))

(assert (= (and b!726456 c!79882) b!726455))

(assert (= (and b!726456 (not c!79882)) b!726461))

(assert (= (and b!726456 res!487428) b!726448))

(assert (= (and b!726448 res!487438) b!726449))

(assert (= (and b!726449 res!487431) b!726460))

(assert (= (and b!726460 res!487435) b!726462))

(declare-fun m!680507 () Bool)

(assert (=> b!726451 m!680507))

(declare-fun m!680509 () Bool)

(assert (=> b!726449 m!680509))

(declare-fun m!680511 () Bool)

(assert (=> b!726449 m!680511))

(declare-fun m!680513 () Bool)

(assert (=> b!726453 m!680513))

(declare-fun m!680515 () Bool)

(assert (=> b!726459 m!680515))

(declare-fun m!680517 () Bool)

(assert (=> b!726461 m!680517))

(assert (=> b!726461 m!680517))

(declare-fun m!680519 () Bool)

(assert (=> b!726461 m!680519))

(assert (=> b!726458 m!680517))

(assert (=> b!726458 m!680517))

(declare-fun m!680521 () Bool)

(assert (=> b!726458 m!680521))

(declare-fun m!680523 () Bool)

(assert (=> b!726454 m!680523))

(declare-fun m!680525 () Bool)

(assert (=> b!726450 m!680525))

(declare-fun m!680527 () Bool)

(assert (=> start!64524 m!680527))

(declare-fun m!680529 () Bool)

(assert (=> start!64524 m!680529))

(declare-fun m!680531 () Bool)

(assert (=> b!726448 m!680531))

(declare-fun m!680533 () Bool)

(assert (=> b!726448 m!680533))

(assert (=> b!726448 m!680533))

(declare-fun m!680535 () Bool)

(assert (=> b!726448 m!680535))

(declare-fun m!680537 () Bool)

(assert (=> b!726448 m!680537))

(declare-fun m!680539 () Bool)

(assert (=> b!726448 m!680539))

(assert (=> b!726460 m!680517))

(assert (=> b!726460 m!680517))

(declare-fun m!680541 () Bool)

(assert (=> b!726460 m!680541))

(assert (=> b!726462 m!680517))

(assert (=> b!726462 m!680517))

(declare-fun m!680543 () Bool)

(assert (=> b!726462 m!680543))

(assert (=> b!726446 m!680517))

(assert (=> b!726446 m!680517))

(declare-fun m!680545 () Bool)

(assert (=> b!726446 m!680545))

(assert (=> b!726446 m!680545))

(assert (=> b!726446 m!680517))

(declare-fun m!680547 () Bool)

(assert (=> b!726446 m!680547))

(declare-fun m!680549 () Bool)

(assert (=> b!726452 m!680549))

(assert (=> b!726455 m!680517))

(assert (=> b!726455 m!680517))

(declare-fun m!680551 () Bool)

(assert (=> b!726455 m!680551))

(check-sat (not b!726462) (not b!726451) (not b!726460) (not start!64524) (not b!726455) (not b!726459) (not b!726461) (not b!726454) (not b!726458) (not b!726452) (not b!726453) (not b!726449) (not b!726446) (not b!726448))
(check-sat)
