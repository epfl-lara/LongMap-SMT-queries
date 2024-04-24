; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65832 () Bool)

(assert start!65832)

(declare-fun b!754446 () Bool)

(declare-fun res!509495 () Bool)

(declare-fun e!420847 () Bool)

(assert (=> b!754446 (=> (not res!509495) (not e!420847))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41875 0))(
  ( (array!41876 (arr!20047 (Array (_ BitVec 32) (_ BitVec 64))) (size!20467 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41875)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754446 (= res!509495 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20047 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754447 () Bool)

(declare-fun e!420846 () Bool)

(declare-fun e!420848 () Bool)

(assert (=> b!754447 (= e!420846 (not e!420848))))

(declare-fun res!509499 () Bool)

(assert (=> b!754447 (=> res!509499 e!420848)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7603 0))(
  ( (MissingZero!7603 (index!32780 (_ BitVec 32))) (Found!7603 (index!32781 (_ BitVec 32))) (Intermediate!7603 (undefined!8415 Bool) (index!32782 (_ BitVec 32)) (x!63853 (_ BitVec 32))) (Undefined!7603) (MissingVacant!7603 (index!32783 (_ BitVec 32))) )
))
(declare-fun lt!335675 () SeekEntryResult!7603)

(get-info :version)

(assert (=> b!754447 (= res!509499 (or (not ((_ is Intermediate!7603) lt!335675)) (bvslt x!1131 (x!63853 lt!335675)) (not (= x!1131 (x!63853 lt!335675))) (not (= index!1321 (index!32782 lt!335675)))))))

(declare-fun e!420844 () Bool)

(assert (=> b!754447 e!420844))

(declare-fun res!509497 () Bool)

(assert (=> b!754447 (=> (not res!509497) (not e!420844))))

(declare-fun lt!335681 () SeekEntryResult!7603)

(declare-fun lt!335674 () SeekEntryResult!7603)

(assert (=> b!754447 (= res!509497 (= lt!335681 lt!335674))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754447 (= lt!335674 (Found!7603 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!754447 (= lt!335681 (seekEntryOrOpen!0 (select (arr!20047 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41875 (_ BitVec 32)) Bool)

(assert (=> b!754447 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25969 0))(
  ( (Unit!25970) )
))
(declare-fun lt!335678 () Unit!25969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25969)

(assert (=> b!754447 (= lt!335678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754448 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!754448 (= e!420844 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335674))))

(declare-fun b!754449 () Bool)

(declare-fun res!509485 () Bool)

(assert (=> b!754449 (=> (not res!509485) (not e!420847))))

(declare-fun e!420845 () Bool)

(assert (=> b!754449 (= res!509485 e!420845)))

(declare-fun c!82865 () Bool)

(assert (=> b!754449 (= c!82865 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754450 () Bool)

(declare-fun e!420851 () Bool)

(declare-fun lt!335676 () SeekEntryResult!7603)

(assert (=> b!754450 (= e!420851 (= lt!335681 lt!335676))))

(declare-fun lt!335682 () SeekEntryResult!7603)

(declare-fun b!754451 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!754451 (= e!420845 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335682))))

(declare-fun b!754452 () Bool)

(declare-fun res!509488 () Bool)

(declare-fun e!420853 () Bool)

(assert (=> b!754452 (=> (not res!509488) (not e!420853))))

(assert (=> b!754452 (= res!509488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754453 () Bool)

(declare-fun e!420852 () Bool)

(declare-fun e!420854 () Bool)

(assert (=> b!754453 (= e!420852 e!420854)))

(declare-fun res!509494 () Bool)

(assert (=> b!754453 (=> res!509494 e!420854)))

(declare-fun lt!335673 () (_ BitVec 64))

(declare-fun lt!335677 () (_ BitVec 64))

(assert (=> b!754453 (= res!509494 (= lt!335673 lt!335677))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!754453 (= lt!335673 (select (store (arr!20047 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754454 () Bool)

(declare-fun res!509503 () Bool)

(assert (=> b!754454 (=> (not res!509503) (not e!420853))))

(assert (=> b!754454 (= res!509503 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20467 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20467 a!3186))))))

(declare-fun b!754455 () Bool)

(declare-fun res!509493 () Bool)

(assert (=> b!754455 (=> (not res!509493) (not e!420853))))

(declare-datatypes ((List!13956 0))(
  ( (Nil!13953) (Cons!13952 (h!15030 (_ BitVec 64)) (t!20263 List!13956)) )
))
(declare-fun arrayNoDuplicates!0 (array!41875 (_ BitVec 32) List!13956) Bool)

(assert (=> b!754455 (= res!509493 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13953))))

(declare-fun b!754457 () Bool)

(assert (=> b!754457 (= e!420848 e!420852)))

(declare-fun res!509489 () Bool)

(assert (=> b!754457 (=> res!509489 e!420852)))

(assert (=> b!754457 (= res!509489 (not (= lt!335676 lt!335674)))))

(assert (=> b!754457 (= lt!335676 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754458 () Bool)

(declare-fun e!420850 () Unit!25969)

(declare-fun Unit!25971 () Unit!25969)

(assert (=> b!754458 (= e!420850 Unit!25971)))

(declare-fun b!754459 () Bool)

(declare-fun res!509491 () Bool)

(declare-fun e!420855 () Bool)

(assert (=> b!754459 (=> (not res!509491) (not e!420855))))

(assert (=> b!754459 (= res!509491 (and (= (size!20467 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20467 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20467 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754460 () Bool)

(declare-fun res!509487 () Bool)

(assert (=> b!754460 (=> (not res!509487) (not e!420851))))

(declare-fun lt!335672 () array!41875)

(assert (=> b!754460 (= res!509487 (= (seekEntryOrOpen!0 lt!335677 lt!335672 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335677 lt!335672 mask!3328)))))

(declare-fun b!754461 () Bool)

(declare-fun res!509501 () Bool)

(assert (=> b!754461 (=> (not res!509501) (not e!420855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754461 (= res!509501 (validKeyInArray!0 (select (arr!20047 a!3186) j!159)))))

(declare-fun b!754462 () Bool)

(assert (=> b!754462 (= e!420847 e!420846)))

(declare-fun res!509502 () Bool)

(assert (=> b!754462 (=> (not res!509502) (not e!420846))))

(declare-fun lt!335671 () SeekEntryResult!7603)

(assert (=> b!754462 (= res!509502 (= lt!335671 lt!335675))))

(assert (=> b!754462 (= lt!335675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335677 lt!335672 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754462 (= lt!335671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335677 mask!3328) lt!335677 lt!335672 mask!3328))))

(assert (=> b!754462 (= lt!335677 (select (store (arr!20047 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754462 (= lt!335672 (array!41876 (store (arr!20047 a!3186) i!1173 k0!2102) (size!20467 a!3186)))))

(declare-fun b!754463 () Bool)

(assert (=> b!754463 (= e!420853 e!420847)))

(declare-fun res!509498 () Bool)

(assert (=> b!754463 (=> (not res!509498) (not e!420847))))

(assert (=> b!754463 (= res!509498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20047 a!3186) j!159) mask!3328) (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335682))))

(assert (=> b!754463 (= lt!335682 (Intermediate!7603 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754464 () Bool)

(assert (=> b!754464 (= e!420854 true)))

(assert (=> b!754464 e!420851))

(declare-fun res!509500 () Bool)

(assert (=> b!754464 (=> (not res!509500) (not e!420851))))

(assert (=> b!754464 (= res!509500 (= lt!335673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335679 () Unit!25969)

(assert (=> b!754464 (= lt!335679 e!420850)))

(declare-fun c!82864 () Bool)

(assert (=> b!754464 (= c!82864 (= lt!335673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754465 () Bool)

(declare-fun res!509496 () Bool)

(assert (=> b!754465 (=> (not res!509496) (not e!420855))))

(declare-fun arrayContainsKey!0 (array!41875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754465 (= res!509496 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754456 () Bool)

(assert (=> b!754456 (= e!420845 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) (Found!7603 j!159)))))

(declare-fun res!509486 () Bool)

(assert (=> start!65832 (=> (not res!509486) (not e!420855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65832 (= res!509486 (validMask!0 mask!3328))))

(assert (=> start!65832 e!420855))

(assert (=> start!65832 true))

(declare-fun array_inv!15906 (array!41875) Bool)

(assert (=> start!65832 (array_inv!15906 a!3186)))

(declare-fun b!754466 () Bool)

(assert (=> b!754466 (= e!420855 e!420853)))

(declare-fun res!509490 () Bool)

(assert (=> b!754466 (=> (not res!509490) (not e!420853))))

(declare-fun lt!335680 () SeekEntryResult!7603)

(assert (=> b!754466 (= res!509490 (or (= lt!335680 (MissingZero!7603 i!1173)) (= lt!335680 (MissingVacant!7603 i!1173))))))

(assert (=> b!754466 (= lt!335680 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754467 () Bool)

(declare-fun Unit!25972 () Unit!25969)

(assert (=> b!754467 (= e!420850 Unit!25972)))

(assert (=> b!754467 false))

(declare-fun b!754468 () Bool)

(declare-fun res!509492 () Bool)

(assert (=> b!754468 (=> (not res!509492) (not e!420855))))

(assert (=> b!754468 (= res!509492 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65832 res!509486) b!754459))

(assert (= (and b!754459 res!509491) b!754461))

(assert (= (and b!754461 res!509501) b!754468))

(assert (= (and b!754468 res!509492) b!754465))

(assert (= (and b!754465 res!509496) b!754466))

(assert (= (and b!754466 res!509490) b!754452))

(assert (= (and b!754452 res!509488) b!754455))

(assert (= (and b!754455 res!509493) b!754454))

(assert (= (and b!754454 res!509503) b!754463))

(assert (= (and b!754463 res!509498) b!754446))

(assert (= (and b!754446 res!509495) b!754449))

(assert (= (and b!754449 c!82865) b!754451))

(assert (= (and b!754449 (not c!82865)) b!754456))

(assert (= (and b!754449 res!509485) b!754462))

(assert (= (and b!754462 res!509502) b!754447))

(assert (= (and b!754447 res!509497) b!754448))

(assert (= (and b!754447 (not res!509499)) b!754457))

(assert (= (and b!754457 (not res!509489)) b!754453))

(assert (= (and b!754453 (not res!509494)) b!754464))

(assert (= (and b!754464 c!82864) b!754467))

(assert (= (and b!754464 (not c!82864)) b!754458))

(assert (= (and b!754464 res!509500) b!754460))

(assert (= (and b!754460 res!509487) b!754450))

(declare-fun m!703491 () Bool)

(assert (=> b!754460 m!703491))

(declare-fun m!703493 () Bool)

(assert (=> b!754460 m!703493))

(declare-fun m!703495 () Bool)

(assert (=> b!754457 m!703495))

(assert (=> b!754457 m!703495))

(declare-fun m!703497 () Bool)

(assert (=> b!754457 m!703497))

(assert (=> b!754463 m!703495))

(assert (=> b!754463 m!703495))

(declare-fun m!703499 () Bool)

(assert (=> b!754463 m!703499))

(assert (=> b!754463 m!703499))

(assert (=> b!754463 m!703495))

(declare-fun m!703501 () Bool)

(assert (=> b!754463 m!703501))

(assert (=> b!754451 m!703495))

(assert (=> b!754451 m!703495))

(declare-fun m!703503 () Bool)

(assert (=> b!754451 m!703503))

(declare-fun m!703505 () Bool)

(assert (=> b!754466 m!703505))

(declare-fun m!703507 () Bool)

(assert (=> b!754468 m!703507))

(declare-fun m!703509 () Bool)

(assert (=> b!754446 m!703509))

(declare-fun m!703511 () Bool)

(assert (=> b!754452 m!703511))

(assert (=> b!754448 m!703495))

(assert (=> b!754448 m!703495))

(declare-fun m!703513 () Bool)

(assert (=> b!754448 m!703513))

(declare-fun m!703515 () Bool)

(assert (=> b!754455 m!703515))

(declare-fun m!703517 () Bool)

(assert (=> b!754453 m!703517))

(declare-fun m!703519 () Bool)

(assert (=> b!754453 m!703519))

(assert (=> b!754456 m!703495))

(assert (=> b!754456 m!703495))

(assert (=> b!754456 m!703497))

(declare-fun m!703521 () Bool)

(assert (=> start!65832 m!703521))

(declare-fun m!703523 () Bool)

(assert (=> start!65832 m!703523))

(declare-fun m!703525 () Bool)

(assert (=> b!754462 m!703525))

(assert (=> b!754462 m!703517))

(assert (=> b!754462 m!703525))

(declare-fun m!703527 () Bool)

(assert (=> b!754462 m!703527))

(declare-fun m!703529 () Bool)

(assert (=> b!754462 m!703529))

(declare-fun m!703531 () Bool)

(assert (=> b!754462 m!703531))

(declare-fun m!703533 () Bool)

(assert (=> b!754465 m!703533))

(assert (=> b!754447 m!703495))

(assert (=> b!754447 m!703495))

(declare-fun m!703535 () Bool)

(assert (=> b!754447 m!703535))

(declare-fun m!703537 () Bool)

(assert (=> b!754447 m!703537))

(declare-fun m!703539 () Bool)

(assert (=> b!754447 m!703539))

(assert (=> b!754461 m!703495))

(assert (=> b!754461 m!703495))

(declare-fun m!703541 () Bool)

(assert (=> b!754461 m!703541))

(check-sat (not b!754447) (not b!754452) (not b!754448) (not b!754466) (not b!754468) (not b!754461) (not b!754456) (not b!754455) (not b!754463) (not b!754462) (not b!754460) (not b!754451) (not b!754465) (not b!754457) (not start!65832))
(check-sat)
