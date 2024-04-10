; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65268 () Bool)

(assert start!65268)

(declare-fun b!740442 () Bool)

(declare-fun res!497936 () Bool)

(declare-fun e!413974 () Bool)

(assert (=> b!740442 (=> (not res!497936) (not e!413974))))

(declare-datatypes ((array!41441 0))(
  ( (array!41442 (arr!19834 (Array (_ BitVec 32) (_ BitVec 64))) (size!20255 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41441)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!740442 (= res!497936 (and (= (size!20255 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20255 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20255 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740444 () Bool)

(declare-fun res!497939 () Bool)

(declare-fun e!413977 () Bool)

(assert (=> b!740444 (=> res!497939 e!413977)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328931 () array!41441)

(declare-fun lt!328925 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7434 0))(
  ( (MissingZero!7434 (index!32104 (_ BitVec 32))) (Found!7434 (index!32105 (_ BitVec 32))) (Intermediate!7434 (undefined!8246 Bool) (index!32106 (_ BitVec 32)) (x!63088 (_ BitVec 32))) (Undefined!7434) (MissingVacant!7434 (index!32107 (_ BitVec 32))) )
))
(declare-fun lt!328924 () SeekEntryResult!7434)

(declare-fun lt!328936 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41441 (_ BitVec 32)) SeekEntryResult!7434)

(assert (=> b!740444 (= res!497939 (not (= lt!328924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328925 lt!328936 lt!328931 mask!3328))))))

(declare-fun b!740445 () Bool)

(declare-fun res!497944 () Bool)

(declare-fun e!413971 () Bool)

(assert (=> b!740445 (=> (not res!497944) (not e!413971))))

(declare-datatypes ((List!13836 0))(
  ( (Nil!13833) (Cons!13832 (h!14904 (_ BitVec 64)) (t!20151 List!13836)) )
))
(declare-fun arrayNoDuplicates!0 (array!41441 (_ BitVec 32) List!13836) Bool)

(assert (=> b!740445 (= res!497944 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13833))))

(declare-fun b!740446 () Bool)

(declare-datatypes ((Unit!25332 0))(
  ( (Unit!25333) )
))
(declare-fun e!413972 () Unit!25332)

(declare-fun Unit!25334 () Unit!25332)

(assert (=> b!740446 (= e!413972 Unit!25334)))

(declare-fun lt!328934 () SeekEntryResult!7434)

(assert (=> b!740446 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328925 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328934)))

(declare-fun b!740447 () Bool)

(declare-fun res!497945 () Bool)

(assert (=> b!740447 (=> (not res!497945) (not e!413971))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740447 (= res!497945 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20255 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20255 a!3186))))))

(declare-fun b!740448 () Bool)

(declare-fun e!413973 () Bool)

(assert (=> b!740448 (= e!413971 e!413973)))

(declare-fun res!497947 () Bool)

(assert (=> b!740448 (=> (not res!497947) (not e!413973))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740448 (= res!497947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19834 a!3186) j!159) mask!3328) (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328934))))

(assert (=> b!740448 (= lt!328934 (Intermediate!7434 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740449 () Bool)

(declare-fun e!413968 () Bool)

(assert (=> b!740449 (= e!413968 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328925 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328934)))))

(declare-fun b!740450 () Bool)

(declare-fun e!413967 () Bool)

(declare-fun e!413970 () Bool)

(assert (=> b!740450 (= e!413967 (not e!413970))))

(declare-fun res!497942 () Bool)

(assert (=> b!740450 (=> res!497942 e!413970)))

(declare-fun lt!328926 () SeekEntryResult!7434)

(get-info :version)

(assert (=> b!740450 (= res!497942 (or (not ((_ is Intermediate!7434) lt!328926)) (bvsge x!1131 (x!63088 lt!328926))))))

(declare-fun lt!328937 () SeekEntryResult!7434)

(assert (=> b!740450 (= lt!328937 (Found!7434 j!159))))

(declare-fun e!413975 () Bool)

(assert (=> b!740450 e!413975))

(declare-fun res!497940 () Bool)

(assert (=> b!740450 (=> (not res!497940) (not e!413975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41441 (_ BitVec 32)) Bool)

(assert (=> b!740450 (= res!497940 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328932 () Unit!25332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25332)

(assert (=> b!740450 (= lt!328932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740451 () Bool)

(declare-fun res!497935 () Bool)

(assert (=> b!740451 (=> (not res!497935) (not e!413973))))

(declare-fun e!413969 () Bool)

(assert (=> b!740451 (= res!497935 e!413969)))

(declare-fun c!81637 () Bool)

(assert (=> b!740451 (= c!81637 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740452 () Bool)

(declare-fun res!497949 () Bool)

(assert (=> b!740452 (=> (not res!497949) (not e!413973))))

(assert (=> b!740452 (= res!497949 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19834 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740453 () Bool)

(assert (=> b!740453 (= e!413977 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41441 (_ BitVec 32)) SeekEntryResult!7434)

(assert (=> b!740453 (= (seekEntryOrOpen!0 lt!328936 lt!328931 mask!3328) lt!328937)))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!328927 () Unit!25332)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25332)

(assert (=> b!740453 (= lt!328927 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328925 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740443 () Bool)

(assert (=> b!740443 (= e!413974 e!413971)))

(declare-fun res!497934 () Bool)

(assert (=> b!740443 (=> (not res!497934) (not e!413971))))

(declare-fun lt!328933 () SeekEntryResult!7434)

(assert (=> b!740443 (= res!497934 (or (= lt!328933 (MissingZero!7434 i!1173)) (= lt!328933 (MissingVacant!7434 i!1173))))))

(assert (=> b!740443 (= lt!328933 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!497946 () Bool)

(assert (=> start!65268 (=> (not res!497946) (not e!413974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65268 (= res!497946 (validMask!0 mask!3328))))

(assert (=> start!65268 e!413974))

(assert (=> start!65268 true))

(declare-fun array_inv!15630 (array!41441) Bool)

(assert (=> start!65268 (array_inv!15630 a!3186)))

(declare-fun b!740454 () Bool)

(declare-fun res!497948 () Bool)

(assert (=> b!740454 (=> (not res!497948) (not e!413971))))

(assert (=> b!740454 (= res!497948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740455 () Bool)

(declare-fun res!497950 () Bool)

(assert (=> b!740455 (=> (not res!497950) (not e!413974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740455 (= res!497950 (validKeyInArray!0 k0!2102))))

(declare-fun b!740456 () Bool)

(declare-fun Unit!25335 () Unit!25332)

(assert (=> b!740456 (= e!413972 Unit!25335)))

(declare-fun lt!328928 () SeekEntryResult!7434)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41441 (_ BitVec 32)) SeekEntryResult!7434)

(assert (=> b!740456 (= lt!328928 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740456 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328925 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328937)))

(declare-fun b!740457 () Bool)

(declare-fun e!413978 () Bool)

(assert (=> b!740457 (= e!413975 e!413978)))

(declare-fun res!497951 () Bool)

(assert (=> b!740457 (=> (not res!497951) (not e!413978))))

(declare-fun lt!328930 () SeekEntryResult!7434)

(assert (=> b!740457 (= res!497951 (= (seekEntryOrOpen!0 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328930))))

(assert (=> b!740457 (= lt!328930 (Found!7434 j!159))))

(declare-fun b!740458 () Bool)

(assert (=> b!740458 (= e!413968 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328925 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328937)))))

(declare-fun b!740459 () Bool)

(assert (=> b!740459 (= e!413969 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328934))))

(declare-fun b!740460 () Bool)

(assert (=> b!740460 (= e!413970 e!413977)))

(declare-fun res!497943 () Bool)

(assert (=> b!740460 (=> res!497943 e!413977)))

(assert (=> b!740460 (= res!497943 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328925 #b00000000000000000000000000000000) (bvsge lt!328925 (size!20255 a!3186))))))

(declare-fun lt!328929 () Unit!25332)

(assert (=> b!740460 (= lt!328929 e!413972)))

(declare-fun c!81635 () Bool)

(declare-fun lt!328935 () Bool)

(assert (=> b!740460 (= c!81635 lt!328935)))

(assert (=> b!740460 (= lt!328935 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740460 (= lt!328925 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740461 () Bool)

(assert (=> b!740461 (= e!413969 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) (Found!7434 j!159)))))

(declare-fun b!740462 () Bool)

(declare-fun res!497937 () Bool)

(assert (=> b!740462 (=> (not res!497937) (not e!413974))))

(declare-fun arrayContainsKey!0 (array!41441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740462 (= res!497937 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740463 () Bool)

(declare-fun res!497933 () Bool)

(assert (=> b!740463 (=> (not res!497933) (not e!413974))))

(assert (=> b!740463 (= res!497933 (validKeyInArray!0 (select (arr!19834 a!3186) j!159)))))

(declare-fun b!740464 () Bool)

(declare-fun res!497941 () Bool)

(assert (=> b!740464 (=> res!497941 e!413977)))

(assert (=> b!740464 (= res!497941 e!413968)))

(declare-fun c!81636 () Bool)

(assert (=> b!740464 (= c!81636 lt!328935)))

(declare-fun b!740465 () Bool)

(assert (=> b!740465 (= e!413973 e!413967)))

(declare-fun res!497938 () Bool)

(assert (=> b!740465 (=> (not res!497938) (not e!413967))))

(assert (=> b!740465 (= res!497938 (= lt!328924 lt!328926))))

(assert (=> b!740465 (= lt!328926 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328936 lt!328931 mask!3328))))

(assert (=> b!740465 (= lt!328924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328936 mask!3328) lt!328936 lt!328931 mask!3328))))

(assert (=> b!740465 (= lt!328936 (select (store (arr!19834 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740465 (= lt!328931 (array!41442 (store (arr!19834 a!3186) i!1173 k0!2102) (size!20255 a!3186)))))

(declare-fun b!740466 () Bool)

(assert (=> b!740466 (= e!413978 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!328930))))

(assert (= (and start!65268 res!497946) b!740442))

(assert (= (and b!740442 res!497936) b!740463))

(assert (= (and b!740463 res!497933) b!740455))

(assert (= (and b!740455 res!497950) b!740462))

(assert (= (and b!740462 res!497937) b!740443))

(assert (= (and b!740443 res!497934) b!740454))

(assert (= (and b!740454 res!497948) b!740445))

(assert (= (and b!740445 res!497944) b!740447))

(assert (= (and b!740447 res!497945) b!740448))

(assert (= (and b!740448 res!497947) b!740452))

(assert (= (and b!740452 res!497949) b!740451))

(assert (= (and b!740451 c!81637) b!740459))

(assert (= (and b!740451 (not c!81637)) b!740461))

(assert (= (and b!740451 res!497935) b!740465))

(assert (= (and b!740465 res!497938) b!740450))

(assert (= (and b!740450 res!497940) b!740457))

(assert (= (and b!740457 res!497951) b!740466))

(assert (= (and b!740450 (not res!497942)) b!740460))

(assert (= (and b!740460 c!81635) b!740446))

(assert (= (and b!740460 (not c!81635)) b!740456))

(assert (= (and b!740460 (not res!497943)) b!740464))

(assert (= (and b!740464 c!81636) b!740449))

(assert (= (and b!740464 (not c!81636)) b!740458))

(assert (= (and b!740464 (not res!497941)) b!740444))

(assert (= (and b!740444 (not res!497939)) b!740453))

(declare-fun m!691577 () Bool)

(assert (=> b!740454 m!691577))

(declare-fun m!691579 () Bool)

(assert (=> b!740466 m!691579))

(assert (=> b!740466 m!691579))

(declare-fun m!691581 () Bool)

(assert (=> b!740466 m!691581))

(assert (=> b!740458 m!691579))

(assert (=> b!740458 m!691579))

(declare-fun m!691583 () Bool)

(assert (=> b!740458 m!691583))

(assert (=> b!740448 m!691579))

(assert (=> b!740448 m!691579))

(declare-fun m!691585 () Bool)

(assert (=> b!740448 m!691585))

(assert (=> b!740448 m!691585))

(assert (=> b!740448 m!691579))

(declare-fun m!691587 () Bool)

(assert (=> b!740448 m!691587))

(declare-fun m!691589 () Bool)

(assert (=> b!740450 m!691589))

(declare-fun m!691591 () Bool)

(assert (=> b!740450 m!691591))

(assert (=> b!740463 m!691579))

(assert (=> b!740463 m!691579))

(declare-fun m!691593 () Bool)

(assert (=> b!740463 m!691593))

(declare-fun m!691595 () Bool)

(assert (=> b!740444 m!691595))

(assert (=> b!740459 m!691579))

(assert (=> b!740459 m!691579))

(declare-fun m!691597 () Bool)

(assert (=> b!740459 m!691597))

(declare-fun m!691599 () Bool)

(assert (=> b!740462 m!691599))

(declare-fun m!691601 () Bool)

(assert (=> b!740460 m!691601))

(declare-fun m!691603 () Bool)

(assert (=> b!740443 m!691603))

(declare-fun m!691605 () Bool)

(assert (=> b!740452 m!691605))

(assert (=> b!740446 m!691579))

(assert (=> b!740446 m!691579))

(declare-fun m!691607 () Bool)

(assert (=> b!740446 m!691607))

(declare-fun m!691609 () Bool)

(assert (=> b!740453 m!691609))

(declare-fun m!691611 () Bool)

(assert (=> b!740453 m!691611))

(assert (=> b!740457 m!691579))

(assert (=> b!740457 m!691579))

(declare-fun m!691613 () Bool)

(assert (=> b!740457 m!691613))

(assert (=> b!740461 m!691579))

(assert (=> b!740461 m!691579))

(declare-fun m!691615 () Bool)

(assert (=> b!740461 m!691615))

(declare-fun m!691617 () Bool)

(assert (=> start!65268 m!691617))

(declare-fun m!691619 () Bool)

(assert (=> start!65268 m!691619))

(declare-fun m!691621 () Bool)

(assert (=> b!740465 m!691621))

(assert (=> b!740465 m!691621))

(declare-fun m!691623 () Bool)

(assert (=> b!740465 m!691623))

(declare-fun m!691625 () Bool)

(assert (=> b!740465 m!691625))

(declare-fun m!691627 () Bool)

(assert (=> b!740465 m!691627))

(declare-fun m!691629 () Bool)

(assert (=> b!740465 m!691629))

(assert (=> b!740456 m!691579))

(assert (=> b!740456 m!691579))

(assert (=> b!740456 m!691615))

(assert (=> b!740456 m!691579))

(assert (=> b!740456 m!691583))

(declare-fun m!691631 () Bool)

(assert (=> b!740445 m!691631))

(declare-fun m!691633 () Bool)

(assert (=> b!740455 m!691633))

(assert (=> b!740449 m!691579))

(assert (=> b!740449 m!691579))

(assert (=> b!740449 m!691607))

(check-sat (not b!740459) (not b!740454) (not b!740453) (not b!740456) (not start!65268) (not b!740466) (not b!740460) (not b!740450) (not b!740443) (not b!740448) (not b!740465) (not b!740462) (not b!740458) (not b!740463) (not b!740455) (not b!740446) (not b!740444) (not b!740461) (not b!740449) (not b!740445) (not b!740457))
(check-sat)
