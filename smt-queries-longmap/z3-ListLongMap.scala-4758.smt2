; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65610 () Bool)

(assert start!65610)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333721 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41783 0))(
  ( (array!41784 (arr!20005 (Array (_ BitVec 32) (_ BitVec 64))) (size!20426 (_ BitVec 32))) )
))
(declare-fun lt!333715 () array!41783)

(declare-fun b!750507 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!418732 () Bool)

(declare-datatypes ((SeekEntryResult!7605 0))(
  ( (MissingZero!7605 (index!32788 (_ BitVec 32))) (Found!7605 (index!32789 (_ BitVec 32))) (Intermediate!7605 (undefined!8417 Bool) (index!32790 (_ BitVec 32)) (x!63715 (_ BitVec 32))) (Undefined!7605) (MissingVacant!7605 (index!32791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41783 (_ BitVec 32)) SeekEntryResult!7605)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41783 (_ BitVec 32)) SeekEntryResult!7605)

(assert (=> b!750507 (= e!418732 (= (seekEntryOrOpen!0 lt!333721 lt!333715 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333721 lt!333715 mask!3328)))))

(declare-fun b!750508 () Bool)

(declare-fun e!418725 () Bool)

(declare-fun e!418726 () Bool)

(assert (=> b!750508 (= e!418725 e!418726)))

(declare-fun res!506558 () Bool)

(assert (=> b!750508 (=> (not res!506558) (not e!418726))))

(declare-fun a!3186 () array!41783)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!333717 () SeekEntryResult!7605)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41783 (_ BitVec 32)) SeekEntryResult!7605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750508 (= res!506558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20005 a!3186) j!159) mask!3328) (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!333717))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750508 (= lt!333717 (Intermediate!7605 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750509 () Bool)

(declare-fun e!418728 () Bool)

(assert (=> b!750509 (= e!418728 e!418725)))

(declare-fun res!506565 () Bool)

(assert (=> b!750509 (=> (not res!506565) (not e!418725))))

(declare-fun lt!333720 () SeekEntryResult!7605)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750509 (= res!506565 (or (= lt!333720 (MissingZero!7605 i!1173)) (= lt!333720 (MissingVacant!7605 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750509 (= lt!333720 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750510 () Bool)

(declare-fun res!506560 () Bool)

(assert (=> b!750510 (=> (not res!506560) (not e!418728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750510 (= res!506560 (validKeyInArray!0 k0!2102))))

(declare-fun b!750511 () Bool)

(declare-fun e!418723 () Bool)

(declare-fun e!418733 () Bool)

(assert (=> b!750511 (= e!418723 e!418733)))

(declare-fun res!506552 () Bool)

(assert (=> b!750511 (=> res!506552 e!418733)))

(declare-fun lt!333718 () (_ BitVec 64))

(assert (=> b!750511 (= res!506552 (= lt!333718 lt!333721))))

(assert (=> b!750511 (= lt!333718 (select (store (arr!20005 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750512 () Bool)

(declare-datatypes ((Unit!25800 0))(
  ( (Unit!25801) )
))
(declare-fun e!418727 () Unit!25800)

(declare-fun Unit!25802 () Unit!25800)

(assert (=> b!750512 (= e!418727 Unit!25802)))

(declare-fun b!750513 () Bool)

(declare-fun e!418730 () Bool)

(assert (=> b!750513 (= e!418726 e!418730)))

(declare-fun res!506554 () Bool)

(assert (=> b!750513 (=> (not res!506554) (not e!418730))))

(declare-fun lt!333725 () SeekEntryResult!7605)

(declare-fun lt!333724 () SeekEntryResult!7605)

(assert (=> b!750513 (= res!506554 (= lt!333725 lt!333724))))

(assert (=> b!750513 (= lt!333724 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333721 lt!333715 mask!3328))))

(assert (=> b!750513 (= lt!333725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333721 mask!3328) lt!333721 lt!333715 mask!3328))))

(assert (=> b!750513 (= lt!333721 (select (store (arr!20005 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750513 (= lt!333715 (array!41784 (store (arr!20005 a!3186) i!1173 k0!2102) (size!20426 a!3186)))))

(declare-fun b!750514 () Bool)

(declare-fun res!506550 () Bool)

(assert (=> b!750514 (=> (not res!506550) (not e!418728))))

(assert (=> b!750514 (= res!506550 (and (= (size!20426 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20426 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20426 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750515 () Bool)

(declare-fun Unit!25803 () Unit!25800)

(assert (=> b!750515 (= e!418727 Unit!25803)))

(assert (=> b!750515 false))

(declare-fun b!750516 () Bool)

(declare-fun res!506553 () Bool)

(assert (=> b!750516 (=> (not res!506553) (not e!418726))))

(assert (=> b!750516 (= res!506553 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20005 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750517 () Bool)

(declare-fun res!506563 () Bool)

(assert (=> b!750517 (=> (not res!506563) (not e!418728))))

(assert (=> b!750517 (= res!506563 (validKeyInArray!0 (select (arr!20005 a!3186) j!159)))))

(declare-fun b!750518 () Bool)

(declare-fun res!506559 () Bool)

(assert (=> b!750518 (=> (not res!506559) (not e!418725))))

(declare-datatypes ((List!14007 0))(
  ( (Nil!14004) (Cons!14003 (h!15075 (_ BitVec 64)) (t!20322 List!14007)) )
))
(declare-fun arrayNoDuplicates!0 (array!41783 (_ BitVec 32) List!14007) Bool)

(assert (=> b!750518 (= res!506559 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14004))))

(declare-fun res!506566 () Bool)

(assert (=> start!65610 (=> (not res!506566) (not e!418728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65610 (= res!506566 (validMask!0 mask!3328))))

(assert (=> start!65610 e!418728))

(assert (=> start!65610 true))

(declare-fun array_inv!15801 (array!41783) Bool)

(assert (=> start!65610 (array_inv!15801 a!3186)))

(declare-fun e!418724 () Bool)

(declare-fun b!750519 () Bool)

(declare-fun lt!333716 () SeekEntryResult!7605)

(assert (=> b!750519 (= e!418724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!333716))))

(declare-fun b!750520 () Bool)

(declare-fun res!506551 () Bool)

(assert (=> b!750520 (=> (not res!506551) (not e!418725))))

(assert (=> b!750520 (= res!506551 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20426 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20426 a!3186))))))

(declare-fun b!750521 () Bool)

(declare-fun res!506562 () Bool)

(assert (=> b!750521 (=> (not res!506562) (not e!418725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41783 (_ BitVec 32)) Bool)

(assert (=> b!750521 (= res!506562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750522 () Bool)

(declare-fun res!506556 () Bool)

(assert (=> b!750522 (=> res!506556 e!418723)))

(assert (=> b!750522 (= res!506556 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!333716)))))

(declare-fun e!418731 () Bool)

(declare-fun b!750523 () Bool)

(assert (=> b!750523 (= e!418731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!333717))))

(declare-fun b!750524 () Bool)

(declare-fun res!506557 () Bool)

(assert (=> b!750524 (=> (not res!506557) (not e!418726))))

(assert (=> b!750524 (= res!506557 e!418731)))

(declare-fun c!82360 () Bool)

(assert (=> b!750524 (= c!82360 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750525 () Bool)

(assert (=> b!750525 (= e!418730 (not e!418723))))

(declare-fun res!506561 () Bool)

(assert (=> b!750525 (=> res!506561 e!418723)))

(get-info :version)

(assert (=> b!750525 (= res!506561 (or (not ((_ is Intermediate!7605) lt!333724)) (bvslt x!1131 (x!63715 lt!333724)) (not (= x!1131 (x!63715 lt!333724))) (not (= index!1321 (index!32790 lt!333724)))))))

(assert (=> b!750525 e!418724))

(declare-fun res!506567 () Bool)

(assert (=> b!750525 (=> (not res!506567) (not e!418724))))

(declare-fun lt!333719 () SeekEntryResult!7605)

(assert (=> b!750525 (= res!506567 (= lt!333719 lt!333716))))

(assert (=> b!750525 (= lt!333716 (Found!7605 j!159))))

(assert (=> b!750525 (= lt!333719 (seekEntryOrOpen!0 (select (arr!20005 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750525 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333722 () Unit!25800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25800)

(assert (=> b!750525 (= lt!333722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750526 () Bool)

(assert (=> b!750526 (= e!418733 true)))

(assert (=> b!750526 e!418732))

(declare-fun res!506564 () Bool)

(assert (=> b!750526 (=> (not res!506564) (not e!418732))))

(assert (=> b!750526 (= res!506564 (= lt!333718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333723 () Unit!25800)

(assert (=> b!750526 (= lt!333723 e!418727)))

(declare-fun c!82359 () Bool)

(assert (=> b!750526 (= c!82359 (= lt!333718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750527 () Bool)

(assert (=> b!750527 (= e!418731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) (Found!7605 j!159)))))

(declare-fun b!750528 () Bool)

(declare-fun res!506555 () Bool)

(assert (=> b!750528 (=> (not res!506555) (not e!418728))))

(declare-fun arrayContainsKey!0 (array!41783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750528 (= res!506555 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65610 res!506566) b!750514))

(assert (= (and b!750514 res!506550) b!750517))

(assert (= (and b!750517 res!506563) b!750510))

(assert (= (and b!750510 res!506560) b!750528))

(assert (= (and b!750528 res!506555) b!750509))

(assert (= (and b!750509 res!506565) b!750521))

(assert (= (and b!750521 res!506562) b!750518))

(assert (= (and b!750518 res!506559) b!750520))

(assert (= (and b!750520 res!506551) b!750508))

(assert (= (and b!750508 res!506558) b!750516))

(assert (= (and b!750516 res!506553) b!750524))

(assert (= (and b!750524 c!82360) b!750523))

(assert (= (and b!750524 (not c!82360)) b!750527))

(assert (= (and b!750524 res!506557) b!750513))

(assert (= (and b!750513 res!506554) b!750525))

(assert (= (and b!750525 res!506567) b!750519))

(assert (= (and b!750525 (not res!506561)) b!750522))

(assert (= (and b!750522 (not res!506556)) b!750511))

(assert (= (and b!750511 (not res!506552)) b!750526))

(assert (= (and b!750526 c!82359) b!750515))

(assert (= (and b!750526 (not c!82359)) b!750512))

(assert (= (and b!750526 res!506564) b!750507))

(declare-fun m!699887 () Bool)

(assert (=> start!65610 m!699887))

(declare-fun m!699889 () Bool)

(assert (=> start!65610 m!699889))

(declare-fun m!699891 () Bool)

(assert (=> b!750510 m!699891))

(declare-fun m!699893 () Bool)

(assert (=> b!750525 m!699893))

(assert (=> b!750525 m!699893))

(declare-fun m!699895 () Bool)

(assert (=> b!750525 m!699895))

(declare-fun m!699897 () Bool)

(assert (=> b!750525 m!699897))

(declare-fun m!699899 () Bool)

(assert (=> b!750525 m!699899))

(assert (=> b!750523 m!699893))

(assert (=> b!750523 m!699893))

(declare-fun m!699901 () Bool)

(assert (=> b!750523 m!699901))

(assert (=> b!750519 m!699893))

(assert (=> b!750519 m!699893))

(declare-fun m!699903 () Bool)

(assert (=> b!750519 m!699903))

(declare-fun m!699905 () Bool)

(assert (=> b!750509 m!699905))

(declare-fun m!699907 () Bool)

(assert (=> b!750511 m!699907))

(declare-fun m!699909 () Bool)

(assert (=> b!750511 m!699909))

(declare-fun m!699911 () Bool)

(assert (=> b!750507 m!699911))

(declare-fun m!699913 () Bool)

(assert (=> b!750507 m!699913))

(declare-fun m!699915 () Bool)

(assert (=> b!750518 m!699915))

(declare-fun m!699917 () Bool)

(assert (=> b!750513 m!699917))

(declare-fun m!699919 () Bool)

(assert (=> b!750513 m!699919))

(assert (=> b!750513 m!699917))

(assert (=> b!750513 m!699907))

(declare-fun m!699921 () Bool)

(assert (=> b!750513 m!699921))

(declare-fun m!699923 () Bool)

(assert (=> b!750513 m!699923))

(declare-fun m!699925 () Bool)

(assert (=> b!750516 m!699925))

(declare-fun m!699927 () Bool)

(assert (=> b!750521 m!699927))

(assert (=> b!750527 m!699893))

(assert (=> b!750527 m!699893))

(declare-fun m!699929 () Bool)

(assert (=> b!750527 m!699929))

(assert (=> b!750522 m!699893))

(assert (=> b!750522 m!699893))

(assert (=> b!750522 m!699929))

(assert (=> b!750517 m!699893))

(assert (=> b!750517 m!699893))

(declare-fun m!699931 () Bool)

(assert (=> b!750517 m!699931))

(assert (=> b!750508 m!699893))

(assert (=> b!750508 m!699893))

(declare-fun m!699933 () Bool)

(assert (=> b!750508 m!699933))

(assert (=> b!750508 m!699933))

(assert (=> b!750508 m!699893))

(declare-fun m!699935 () Bool)

(assert (=> b!750508 m!699935))

(declare-fun m!699937 () Bool)

(assert (=> b!750528 m!699937))

(check-sat (not b!750518) (not b!750522) (not b!750513) (not b!750523) (not b!750517) (not b!750507) (not start!65610) (not b!750519) (not b!750521) (not b!750528) (not b!750525) (not b!750527) (not b!750509) (not b!750510) (not b!750508))
(check-sat)
