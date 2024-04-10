; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65724 () Bool)

(assert start!65724)

(declare-fun b!754391 () Bool)

(declare-fun res!509752 () Bool)

(declare-fun e!420729 () Bool)

(assert (=> b!754391 (=> (not res!509752) (not e!420729))))

(declare-datatypes ((array!41897 0))(
  ( (array!41898 (arr!20062 (Array (_ BitVec 32) (_ BitVec 64))) (size!20483 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41897)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41897 (_ BitVec 32)) Bool)

(assert (=> b!754391 (= res!509752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754392 () Bool)

(declare-fun res!509754 () Bool)

(declare-fun e!420730 () Bool)

(assert (=> b!754392 (=> (not res!509754) (not e!420730))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754392 (= res!509754 (validKeyInArray!0 (select (arr!20062 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!754393 () Bool)

(declare-datatypes ((SeekEntryResult!7662 0))(
  ( (MissingZero!7662 (index!33016 (_ BitVec 32))) (Found!7662 (index!33017 (_ BitVec 32))) (Intermediate!7662 (undefined!8474 Bool) (index!33018 (_ BitVec 32)) (x!63924 (_ BitVec 32))) (Undefined!7662) (MissingVacant!7662 (index!33019 (_ BitVec 32))) )
))
(declare-fun lt!335728 () SeekEntryResult!7662)

(declare-fun e!420727 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41897 (_ BitVec 32)) SeekEntryResult!7662)

(assert (=> b!754393 (= e!420727 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!335728))))

(declare-fun b!754394 () Bool)

(declare-fun res!509758 () Bool)

(assert (=> b!754394 (=> (not res!509758) (not e!420730))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754394 (= res!509758 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754395 () Bool)

(declare-fun e!420737 () Bool)

(declare-fun e!420735 () Bool)

(assert (=> b!754395 (= e!420737 e!420735)))

(declare-fun res!509764 () Bool)

(assert (=> b!754395 (=> res!509764 e!420735)))

(declare-fun lt!335724 () (_ BitVec 64))

(declare-fun lt!335729 () (_ BitVec 64))

(assert (=> b!754395 (= res!509764 (= lt!335724 lt!335729))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754395 (= lt!335724 (select (store (arr!20062 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754396 () Bool)

(declare-fun res!509759 () Bool)

(declare-fun e!420732 () Bool)

(assert (=> b!754396 (=> (not res!509759) (not e!420732))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!754396 (= res!509759 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20062 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!509761 () Bool)

(assert (=> start!65724 (=> (not res!509761) (not e!420730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65724 (= res!509761 (validMask!0 mask!3328))))

(assert (=> start!65724 e!420730))

(assert (=> start!65724 true))

(declare-fun array_inv!15858 (array!41897) Bool)

(assert (=> start!65724 (array_inv!15858 a!3186)))

(declare-fun b!754397 () Bool)

(declare-fun e!420736 () Bool)

(assert (=> b!754397 (= e!420732 e!420736)))

(declare-fun res!509756 () Bool)

(assert (=> b!754397 (=> (not res!509756) (not e!420736))))

(declare-fun lt!335720 () SeekEntryResult!7662)

(declare-fun lt!335725 () SeekEntryResult!7662)

(assert (=> b!754397 (= res!509756 (= lt!335720 lt!335725))))

(declare-fun lt!335726 () array!41897)

(assert (=> b!754397 (= lt!335725 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335729 lt!335726 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754397 (= lt!335720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335729 mask!3328) lt!335729 lt!335726 mask!3328))))

(assert (=> b!754397 (= lt!335729 (select (store (arr!20062 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754397 (= lt!335726 (array!41898 (store (arr!20062 a!3186) i!1173 k0!2102) (size!20483 a!3186)))))

(declare-fun b!754398 () Bool)

(declare-datatypes ((Unit!26028 0))(
  ( (Unit!26029) )
))
(declare-fun e!420733 () Unit!26028)

(declare-fun Unit!26030 () Unit!26028)

(assert (=> b!754398 (= e!420733 Unit!26030)))

(declare-fun b!754399 () Bool)

(declare-fun res!509766 () Bool)

(assert (=> b!754399 (=> (not res!509766) (not e!420732))))

(assert (=> b!754399 (= res!509766 e!420727)))

(declare-fun c!82702 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754399 (= c!82702 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754400 () Bool)

(declare-fun res!509767 () Bool)

(assert (=> b!754400 (=> (not res!509767) (not e!420730))))

(assert (=> b!754400 (= res!509767 (validKeyInArray!0 k0!2102))))

(declare-fun b!754401 () Bool)

(declare-fun e!420734 () Bool)

(declare-fun lt!335719 () SeekEntryResult!7662)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41897 (_ BitVec 32)) SeekEntryResult!7662)

(assert (=> b!754401 (= e!420734 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!335719))))

(declare-fun b!754402 () Bool)

(assert (=> b!754402 (= e!420727 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328) (Found!7662 j!159)))))

(declare-fun b!754403 () Bool)

(declare-fun res!509768 () Bool)

(assert (=> b!754403 (=> (not res!509768) (not e!420730))))

(assert (=> b!754403 (= res!509768 (and (= (size!20483 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20483 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20483 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754404 () Bool)

(declare-fun res!509751 () Bool)

(assert (=> b!754404 (=> (not res!509751) (not e!420729))))

(declare-datatypes ((List!14064 0))(
  ( (Nil!14061) (Cons!14060 (h!15132 (_ BitVec 64)) (t!20379 List!14064)) )
))
(declare-fun arrayNoDuplicates!0 (array!41897 (_ BitVec 32) List!14064) Bool)

(assert (=> b!754404 (= res!509751 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14061))))

(declare-fun b!754405 () Bool)

(declare-fun res!509757 () Bool)

(declare-fun e!420728 () Bool)

(assert (=> b!754405 (=> (not res!509757) (not e!420728))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41897 (_ BitVec 32)) SeekEntryResult!7662)

(assert (=> b!754405 (= res!509757 (= (seekEntryOrOpen!0 lt!335729 lt!335726 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335729 lt!335726 mask!3328)))))

(declare-fun b!754406 () Bool)

(declare-fun e!420731 () Bool)

(assert (=> b!754406 (= e!420736 (not e!420731))))

(declare-fun res!509753 () Bool)

(assert (=> b!754406 (=> res!509753 e!420731)))

(get-info :version)

(assert (=> b!754406 (= res!509753 (or (not ((_ is Intermediate!7662) lt!335725)) (bvslt x!1131 (x!63924 lt!335725)) (not (= x!1131 (x!63924 lt!335725))) (not (= index!1321 (index!33018 lt!335725)))))))

(assert (=> b!754406 e!420734))

(declare-fun res!509755 () Bool)

(assert (=> b!754406 (=> (not res!509755) (not e!420734))))

(declare-fun lt!335723 () SeekEntryResult!7662)

(assert (=> b!754406 (= res!509755 (= lt!335723 lt!335719))))

(assert (=> b!754406 (= lt!335719 (Found!7662 j!159))))

(assert (=> b!754406 (= lt!335723 (seekEntryOrOpen!0 (select (arr!20062 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754406 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335722 () Unit!26028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26028)

(assert (=> b!754406 (= lt!335722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754407 () Bool)

(assert (=> b!754407 (= e!420730 e!420729)))

(declare-fun res!509750 () Bool)

(assert (=> b!754407 (=> (not res!509750) (not e!420729))))

(declare-fun lt!335721 () SeekEntryResult!7662)

(assert (=> b!754407 (= res!509750 (or (= lt!335721 (MissingZero!7662 i!1173)) (= lt!335721 (MissingVacant!7662 i!1173))))))

(assert (=> b!754407 (= lt!335721 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754408 () Bool)

(declare-fun Unit!26031 () Unit!26028)

(assert (=> b!754408 (= e!420733 Unit!26031)))

(assert (=> b!754408 false))

(declare-fun b!754409 () Bool)

(declare-fun res!509762 () Bool)

(assert (=> b!754409 (=> (not res!509762) (not e!420729))))

(assert (=> b!754409 (= res!509762 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20483 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20483 a!3186))))))

(declare-fun b!754410 () Bool)

(assert (=> b!754410 (= e!420731 e!420737)))

(declare-fun res!509763 () Bool)

(assert (=> b!754410 (=> res!509763 e!420737)))

(declare-fun lt!335718 () SeekEntryResult!7662)

(assert (=> b!754410 (= res!509763 (not (= lt!335718 lt!335719)))))

(assert (=> b!754410 (= lt!335718 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20062 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754411 () Bool)

(assert (=> b!754411 (= e!420729 e!420732)))

(declare-fun res!509760 () Bool)

(assert (=> b!754411 (=> (not res!509760) (not e!420732))))

(assert (=> b!754411 (= res!509760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20062 a!3186) j!159) mask!3328) (select (arr!20062 a!3186) j!159) a!3186 mask!3328) lt!335728))))

(assert (=> b!754411 (= lt!335728 (Intermediate!7662 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754412 () Bool)

(assert (=> b!754412 (= e!420735 true)))

(assert (=> b!754412 e!420728))

(declare-fun res!509765 () Bool)

(assert (=> b!754412 (=> (not res!509765) (not e!420728))))

(assert (=> b!754412 (= res!509765 (= lt!335724 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335727 () Unit!26028)

(assert (=> b!754412 (= lt!335727 e!420733)))

(declare-fun c!82701 () Bool)

(assert (=> b!754412 (= c!82701 (= lt!335724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754413 () Bool)

(assert (=> b!754413 (= e!420728 (= lt!335723 lt!335718))))

(assert (= (and start!65724 res!509761) b!754403))

(assert (= (and b!754403 res!509768) b!754392))

(assert (= (and b!754392 res!509754) b!754400))

(assert (= (and b!754400 res!509767) b!754394))

(assert (= (and b!754394 res!509758) b!754407))

(assert (= (and b!754407 res!509750) b!754391))

(assert (= (and b!754391 res!509752) b!754404))

(assert (= (and b!754404 res!509751) b!754409))

(assert (= (and b!754409 res!509762) b!754411))

(assert (= (and b!754411 res!509760) b!754396))

(assert (= (and b!754396 res!509759) b!754399))

(assert (= (and b!754399 c!82702) b!754393))

(assert (= (and b!754399 (not c!82702)) b!754402))

(assert (= (and b!754399 res!509766) b!754397))

(assert (= (and b!754397 res!509756) b!754406))

(assert (= (and b!754406 res!509755) b!754401))

(assert (= (and b!754406 (not res!509753)) b!754410))

(assert (= (and b!754410 (not res!509763)) b!754395))

(assert (= (and b!754395 (not res!509764)) b!754412))

(assert (= (and b!754412 c!82701) b!754408))

(assert (= (and b!754412 (not c!82701)) b!754398))

(assert (= (and b!754412 res!509765) b!754405))

(assert (= (and b!754405 res!509757) b!754413))

(declare-fun m!702851 () Bool)

(assert (=> b!754401 m!702851))

(assert (=> b!754401 m!702851))

(declare-fun m!702853 () Bool)

(assert (=> b!754401 m!702853))

(assert (=> b!754393 m!702851))

(assert (=> b!754393 m!702851))

(declare-fun m!702855 () Bool)

(assert (=> b!754393 m!702855))

(assert (=> b!754410 m!702851))

(assert (=> b!754410 m!702851))

(declare-fun m!702857 () Bool)

(assert (=> b!754410 m!702857))

(declare-fun m!702859 () Bool)

(assert (=> b!754400 m!702859))

(assert (=> b!754392 m!702851))

(assert (=> b!754392 m!702851))

(declare-fun m!702861 () Bool)

(assert (=> b!754392 m!702861))

(assert (=> b!754411 m!702851))

(assert (=> b!754411 m!702851))

(declare-fun m!702863 () Bool)

(assert (=> b!754411 m!702863))

(assert (=> b!754411 m!702863))

(assert (=> b!754411 m!702851))

(declare-fun m!702865 () Bool)

(assert (=> b!754411 m!702865))

(declare-fun m!702867 () Bool)

(assert (=> b!754407 m!702867))

(declare-fun m!702869 () Bool)

(assert (=> b!754396 m!702869))

(declare-fun m!702871 () Bool)

(assert (=> b!754394 m!702871))

(declare-fun m!702873 () Bool)

(assert (=> b!754405 m!702873))

(declare-fun m!702875 () Bool)

(assert (=> b!754405 m!702875))

(assert (=> b!754402 m!702851))

(assert (=> b!754402 m!702851))

(assert (=> b!754402 m!702857))

(declare-fun m!702877 () Bool)

(assert (=> start!65724 m!702877))

(declare-fun m!702879 () Bool)

(assert (=> start!65724 m!702879))

(declare-fun m!702881 () Bool)

(assert (=> b!754404 m!702881))

(declare-fun m!702883 () Bool)

(assert (=> b!754397 m!702883))

(declare-fun m!702885 () Bool)

(assert (=> b!754397 m!702885))

(declare-fun m!702887 () Bool)

(assert (=> b!754397 m!702887))

(declare-fun m!702889 () Bool)

(assert (=> b!754397 m!702889))

(assert (=> b!754397 m!702883))

(declare-fun m!702891 () Bool)

(assert (=> b!754397 m!702891))

(assert (=> b!754406 m!702851))

(assert (=> b!754406 m!702851))

(declare-fun m!702893 () Bool)

(assert (=> b!754406 m!702893))

(declare-fun m!702895 () Bool)

(assert (=> b!754406 m!702895))

(declare-fun m!702897 () Bool)

(assert (=> b!754406 m!702897))

(assert (=> b!754395 m!702885))

(declare-fun m!702899 () Bool)

(assert (=> b!754395 m!702899))

(declare-fun m!702901 () Bool)

(assert (=> b!754391 m!702901))

(check-sat (not b!754393) (not b!754400) (not b!754404) (not b!754410) (not b!754401) (not b!754406) (not b!754405) (not start!65724) (not b!754394) (not b!754407) (not b!754411) (not b!754397) (not b!754402) (not b!754391) (not b!754392))
(check-sat)
