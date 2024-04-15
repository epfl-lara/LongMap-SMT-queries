; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65234 () Bool)

(assert start!65234)

(declare-fun b!739674 () Bool)

(declare-fun e!413564 () Bool)

(declare-fun e!413567 () Bool)

(assert (=> b!739674 (= e!413564 e!413567)))

(declare-fun res!497438 () Bool)

(assert (=> b!739674 (=> (not res!497438) (not e!413567))))

(declare-datatypes ((array!41424 0))(
  ( (array!41425 (arr!19826 (Array (_ BitVec 32) (_ BitVec 64))) (size!20247 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41424)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7423 0))(
  ( (MissingZero!7423 (index!32060 (_ BitVec 32))) (Found!7423 (index!32061 (_ BitVec 32))) (Intermediate!7423 (undefined!8235 Bool) (index!32062 (_ BitVec 32)) (x!63056 (_ BitVec 32))) (Undefined!7423) (MissingVacant!7423 (index!32063 (_ BitVec 32))) )
))
(declare-fun lt!328392 () SeekEntryResult!7423)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41424 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739674 (= res!497438 (= (seekEntryOrOpen!0 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328392))))

(assert (=> b!739674 (= lt!328392 (Found!7423 j!159))))

(declare-fun b!739675 () Bool)

(declare-datatypes ((Unit!25268 0))(
  ( (Unit!25269) )
))
(declare-fun e!413568 () Unit!25268)

(declare-fun Unit!25270 () Unit!25268)

(assert (=> b!739675 (= e!413568 Unit!25270)))

(declare-fun lt!328393 () (_ BitVec 32))

(declare-fun lt!328391 () SeekEntryResult!7423)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41424 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739675 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328393 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328391)))

(declare-fun b!739676 () Bool)

(declare-fun e!413569 () Bool)

(declare-fun e!413562 () Bool)

(assert (=> b!739676 (= e!413569 (not e!413562))))

(declare-fun res!497436 () Bool)

(assert (=> b!739676 (=> res!497436 e!413562)))

(declare-fun lt!328398 () SeekEntryResult!7423)

(get-info :version)

(assert (=> b!739676 (= res!497436 (or (not ((_ is Intermediate!7423) lt!328398)) (bvsge x!1131 (x!63056 lt!328398))))))

(declare-fun lt!328396 () SeekEntryResult!7423)

(assert (=> b!739676 (= lt!328396 (Found!7423 j!159))))

(assert (=> b!739676 e!413564))

(declare-fun res!497440 () Bool)

(assert (=> b!739676 (=> (not res!497440) (not e!413564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41424 (_ BitVec 32)) Bool)

(assert (=> b!739676 (= res!497440 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328402 () Unit!25268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25268)

(assert (=> b!739676 (= lt!328402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739677 () Bool)

(declare-fun res!497434 () Bool)

(declare-fun e!413561 () Bool)

(assert (=> b!739677 (=> (not res!497434) (not e!413561))))

(assert (=> b!739677 (= res!497434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!497433 () Bool)

(declare-fun e!413572 () Bool)

(assert (=> start!65234 (=> (not res!497433) (not e!413572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65234 (= res!497433 (validMask!0 mask!3328))))

(assert (=> start!65234 e!413572))

(assert (=> start!65234 true))

(declare-fun array_inv!15709 (array!41424) Bool)

(assert (=> start!65234 (array_inv!15709 a!3186)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!739678 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41424 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!739678 (= e!413567 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328392))))

(declare-fun b!739679 () Bool)

(declare-fun e!413566 () Bool)

(assert (=> b!739679 (= e!413566 e!413569)))

(declare-fun res!497446 () Bool)

(assert (=> b!739679 (=> (not res!497446) (not e!413569))))

(declare-fun lt!328397 () SeekEntryResult!7423)

(assert (=> b!739679 (= res!497446 (= lt!328397 lt!328398))))

(declare-fun lt!328400 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!328399 () array!41424)

(assert (=> b!739679 (= lt!328398 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328400 lt!328399 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739679 (= lt!328397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328400 mask!3328) lt!328400 lt!328399 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739679 (= lt!328400 (select (store (arr!19826 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739679 (= lt!328399 (array!41425 (store (arr!19826 a!3186) i!1173 k0!2102) (size!20247 a!3186)))))

(declare-fun b!739680 () Bool)

(assert (=> b!739680 (= e!413561 e!413566)))

(declare-fun res!497443 () Bool)

(assert (=> b!739680 (=> (not res!497443) (not e!413566))))

(assert (=> b!739680 (= res!497443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19826 a!3186) j!159) mask!3328) (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328391))))

(assert (=> b!739680 (= lt!328391 (Intermediate!7423 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!413571 () Bool)

(declare-fun b!739681 () Bool)

(assert (=> b!739681 (= e!413571 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) (Found!7423 j!159)))))

(declare-fun b!739682 () Bool)

(declare-fun res!497437 () Bool)

(assert (=> b!739682 (=> (not res!497437) (not e!413561))))

(declare-datatypes ((List!13867 0))(
  ( (Nil!13864) (Cons!13863 (h!14935 (_ BitVec 64)) (t!20173 List!13867)) )
))
(declare-fun arrayNoDuplicates!0 (array!41424 (_ BitVec 32) List!13867) Bool)

(assert (=> b!739682 (= res!497437 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13864))))

(declare-fun b!739683 () Bool)

(declare-fun e!413565 () Bool)

(assert (=> b!739683 (= e!413562 e!413565)))

(declare-fun res!497441 () Bool)

(assert (=> b!739683 (=> res!497441 e!413565)))

(assert (=> b!739683 (= res!497441 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328393 #b00000000000000000000000000000000) (bvsge lt!328393 (size!20247 a!3186))))))

(declare-fun lt!328394 () Unit!25268)

(assert (=> b!739683 (= lt!328394 e!413568)))

(declare-fun c!81502 () Bool)

(declare-fun lt!328403 () Bool)

(assert (=> b!739683 (= c!81502 lt!328403)))

(assert (=> b!739683 (= lt!328403 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739683 (= lt!328393 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!413563 () Bool)

(declare-fun b!739684 () Bool)

(assert (=> b!739684 (= e!413563 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328393 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328391)))))

(declare-fun b!739685 () Bool)

(declare-fun res!497447 () Bool)

(assert (=> b!739685 (=> (not res!497447) (not e!413566))))

(assert (=> b!739685 (= res!497447 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19826 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739686 () Bool)

(assert (=> b!739686 (= e!413571 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328391))))

(declare-fun b!739687 () Bool)

(declare-fun res!497444 () Bool)

(assert (=> b!739687 (=> (not res!497444) (not e!413561))))

(assert (=> b!739687 (= res!497444 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20247 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20247 a!3186))))))

(declare-fun b!739688 () Bool)

(assert (=> b!739688 (= e!413563 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328393 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328396)))))

(declare-fun b!739689 () Bool)

(declare-fun res!497431 () Bool)

(assert (=> b!739689 (=> (not res!497431) (not e!413572))))

(declare-fun arrayContainsKey!0 (array!41424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739689 (= res!497431 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739690 () Bool)

(declare-fun res!497448 () Bool)

(assert (=> b!739690 (=> (not res!497448) (not e!413572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739690 (= res!497448 (validKeyInArray!0 (select (arr!19826 a!3186) j!159)))))

(declare-fun b!739691 () Bool)

(declare-fun res!497442 () Bool)

(assert (=> b!739691 (=> (not res!497442) (not e!413566))))

(assert (=> b!739691 (= res!497442 e!413571)))

(declare-fun c!81503 () Bool)

(assert (=> b!739691 (= c!81503 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739692 () Bool)

(declare-fun res!497435 () Bool)

(assert (=> b!739692 (=> (not res!497435) (not e!413572))))

(assert (=> b!739692 (= res!497435 (validKeyInArray!0 k0!2102))))

(declare-fun b!739693 () Bool)

(assert (=> b!739693 (= e!413572 e!413561)))

(declare-fun res!497432 () Bool)

(assert (=> b!739693 (=> (not res!497432) (not e!413561))))

(declare-fun lt!328395 () SeekEntryResult!7423)

(assert (=> b!739693 (= res!497432 (or (= lt!328395 (MissingZero!7423 i!1173)) (= lt!328395 (MissingVacant!7423 i!1173))))))

(assert (=> b!739693 (= lt!328395 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739694 () Bool)

(assert (=> b!739694 (= e!413565 true)))

(declare-fun lt!328401 () SeekEntryResult!7423)

(assert (=> b!739694 (= lt!328401 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328393 lt!328400 lt!328399 mask!3328))))

(declare-fun b!739695 () Bool)

(declare-fun res!497445 () Bool)

(assert (=> b!739695 (=> (not res!497445) (not e!413572))))

(assert (=> b!739695 (= res!497445 (and (= (size!20247 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20247 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20247 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739696 () Bool)

(declare-fun Unit!25271 () Unit!25268)

(assert (=> b!739696 (= e!413568 Unit!25271)))

(declare-fun lt!328390 () SeekEntryResult!7423)

(assert (=> b!739696 (= lt!328390 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739696 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328393 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328396)))

(declare-fun b!739697 () Bool)

(declare-fun res!497439 () Bool)

(assert (=> b!739697 (=> res!497439 e!413565)))

(assert (=> b!739697 (= res!497439 e!413563)))

(declare-fun c!81504 () Bool)

(assert (=> b!739697 (= c!81504 lt!328403)))

(assert (= (and start!65234 res!497433) b!739695))

(assert (= (and b!739695 res!497445) b!739690))

(assert (= (and b!739690 res!497448) b!739692))

(assert (= (and b!739692 res!497435) b!739689))

(assert (= (and b!739689 res!497431) b!739693))

(assert (= (and b!739693 res!497432) b!739677))

(assert (= (and b!739677 res!497434) b!739682))

(assert (= (and b!739682 res!497437) b!739687))

(assert (= (and b!739687 res!497444) b!739680))

(assert (= (and b!739680 res!497443) b!739685))

(assert (= (and b!739685 res!497447) b!739691))

(assert (= (and b!739691 c!81503) b!739686))

(assert (= (and b!739691 (not c!81503)) b!739681))

(assert (= (and b!739691 res!497442) b!739679))

(assert (= (and b!739679 res!497446) b!739676))

(assert (= (and b!739676 res!497440) b!739674))

(assert (= (and b!739674 res!497438) b!739678))

(assert (= (and b!739676 (not res!497436)) b!739683))

(assert (= (and b!739683 c!81502) b!739675))

(assert (= (and b!739683 (not c!81502)) b!739696))

(assert (= (and b!739683 (not res!497441)) b!739697))

(assert (= (and b!739697 c!81504) b!739684))

(assert (= (and b!739697 (not c!81504)) b!739688))

(assert (= (and b!739697 (not res!497439)) b!739694))

(declare-fun m!690425 () Bool)

(assert (=> b!739684 m!690425))

(assert (=> b!739684 m!690425))

(declare-fun m!690427 () Bool)

(assert (=> b!739684 m!690427))

(assert (=> b!739696 m!690425))

(assert (=> b!739696 m!690425))

(declare-fun m!690429 () Bool)

(assert (=> b!739696 m!690429))

(assert (=> b!739696 m!690425))

(declare-fun m!690431 () Bool)

(assert (=> b!739696 m!690431))

(declare-fun m!690433 () Bool)

(assert (=> b!739692 m!690433))

(assert (=> b!739688 m!690425))

(assert (=> b!739688 m!690425))

(assert (=> b!739688 m!690431))

(declare-fun m!690435 () Bool)

(assert (=> b!739677 m!690435))

(assert (=> b!739681 m!690425))

(assert (=> b!739681 m!690425))

(assert (=> b!739681 m!690429))

(declare-fun m!690437 () Bool)

(assert (=> start!65234 m!690437))

(declare-fun m!690439 () Bool)

(assert (=> start!65234 m!690439))

(assert (=> b!739678 m!690425))

(assert (=> b!739678 m!690425))

(declare-fun m!690441 () Bool)

(assert (=> b!739678 m!690441))

(declare-fun m!690443 () Bool)

(assert (=> b!739679 m!690443))

(declare-fun m!690445 () Bool)

(assert (=> b!739679 m!690445))

(declare-fun m!690447 () Bool)

(assert (=> b!739679 m!690447))

(declare-fun m!690449 () Bool)

(assert (=> b!739679 m!690449))

(assert (=> b!739679 m!690445))

(declare-fun m!690451 () Bool)

(assert (=> b!739679 m!690451))

(assert (=> b!739680 m!690425))

(assert (=> b!739680 m!690425))

(declare-fun m!690453 () Bool)

(assert (=> b!739680 m!690453))

(assert (=> b!739680 m!690453))

(assert (=> b!739680 m!690425))

(declare-fun m!690455 () Bool)

(assert (=> b!739680 m!690455))

(declare-fun m!690457 () Bool)

(assert (=> b!739676 m!690457))

(declare-fun m!690459 () Bool)

(assert (=> b!739676 m!690459))

(declare-fun m!690461 () Bool)

(assert (=> b!739694 m!690461))

(declare-fun m!690463 () Bool)

(assert (=> b!739685 m!690463))

(declare-fun m!690465 () Bool)

(assert (=> b!739689 m!690465))

(assert (=> b!739674 m!690425))

(assert (=> b!739674 m!690425))

(declare-fun m!690467 () Bool)

(assert (=> b!739674 m!690467))

(declare-fun m!690469 () Bool)

(assert (=> b!739693 m!690469))

(assert (=> b!739686 m!690425))

(assert (=> b!739686 m!690425))

(declare-fun m!690471 () Bool)

(assert (=> b!739686 m!690471))

(declare-fun m!690473 () Bool)

(assert (=> b!739682 m!690473))

(declare-fun m!690475 () Bool)

(assert (=> b!739683 m!690475))

(assert (=> b!739675 m!690425))

(assert (=> b!739675 m!690425))

(assert (=> b!739675 m!690427))

(assert (=> b!739690 m!690425))

(assert (=> b!739690 m!690425))

(declare-fun m!690477 () Bool)

(assert (=> b!739690 m!690477))

(check-sat (not b!739681) (not b!739682) (not b!739692) (not b!739677) (not b!739676) (not b!739688) (not b!739686) (not b!739689) (not b!739679) (not b!739674) (not b!739678) (not b!739680) (not b!739684) (not b!739683) (not start!65234) (not b!739693) (not b!739694) (not b!739675) (not b!739696) (not b!739690))
(check-sat)
