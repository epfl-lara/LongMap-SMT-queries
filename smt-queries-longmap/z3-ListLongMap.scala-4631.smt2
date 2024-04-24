; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64548 () Bool)

(assert start!64548)

(declare-fun b!725796 () Bool)

(declare-fun e!406496 () Bool)

(declare-fun e!406495 () Bool)

(assert (=> b!725796 (= e!406496 e!406495)))

(declare-fun res!486757 () Bool)

(assert (=> b!725796 (=> (not res!486757) (not e!406495))))

(declare-datatypes ((SeekEntryResult!7174 0))(
  ( (MissingZero!7174 (index!31064 (_ BitVec 32))) (Found!7174 (index!31065 (_ BitVec 32))) (Intermediate!7174 (undefined!7986 Bool) (index!31066 (_ BitVec 32)) (x!62211 (_ BitVec 32))) (Undefined!7174) (MissingVacant!7174 (index!31067 (_ BitVec 32))) )
))
(declare-fun lt!321487 () SeekEntryResult!7174)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725796 (= res!486757 (or (= lt!321487 (MissingZero!7174 i!1173)) (= lt!321487 (MissingVacant!7174 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40999 0))(
  ( (array!41000 (arr!19618 (Array (_ BitVec 32) (_ BitVec 64))) (size!20038 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40999)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40999 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!725796 (= lt!321487 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725797 () Bool)

(declare-fun res!486746 () Bool)

(assert (=> b!725797 (=> (not res!486746) (not e!406496))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!725797 (= res!486746 (and (= (size!20038 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20038 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20038 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!725798 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!406493 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40999 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!725798 (= e!406493 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) (Found!7174 j!159)))))

(declare-fun b!725800 () Bool)

(declare-fun res!486755 () Bool)

(assert (=> b!725800 (=> (not res!486755) (not e!406495))))

(declare-datatypes ((List!13527 0))(
  ( (Nil!13524) (Cons!13523 (h!14583 (_ BitVec 64)) (t!19834 List!13527)) )
))
(declare-fun arrayNoDuplicates!0 (array!40999 (_ BitVec 32) List!13527) Bool)

(assert (=> b!725800 (= res!486755 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13524))))

(declare-fun b!725801 () Bool)

(declare-fun res!486748 () Bool)

(assert (=> b!725801 (=> (not res!486748) (not e!406496))))

(declare-fun arrayContainsKey!0 (array!40999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725801 (= res!486748 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725802 () Bool)

(declare-fun res!486744 () Bool)

(assert (=> b!725802 (=> (not res!486744) (not e!406496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725802 (= res!486744 (validKeyInArray!0 k0!2102))))

(declare-fun lt!321488 () SeekEntryResult!7174)

(declare-fun e!406494 () Bool)

(declare-fun b!725803 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725803 (= e!406494 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321488))))

(declare-fun b!725804 () Bool)

(declare-fun e!406497 () Bool)

(assert (=> b!725804 (= e!406497 (not true))))

(declare-fun e!406492 () Bool)

(assert (=> b!725804 e!406492))

(declare-fun res!486753 () Bool)

(assert (=> b!725804 (=> (not res!486753) (not e!406492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40999 (_ BitVec 32)) Bool)

(assert (=> b!725804 (= res!486753 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24745 0))(
  ( (Unit!24746) )
))
(declare-fun lt!321486 () Unit!24745)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24745)

(assert (=> b!725804 (= lt!321486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725805 () Bool)

(declare-fun e!406491 () Bool)

(assert (=> b!725805 (= e!406495 e!406491)))

(declare-fun res!486756 () Bool)

(assert (=> b!725805 (=> (not res!486756) (not e!406491))))

(declare-fun lt!321489 () SeekEntryResult!7174)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40999 (_ BitVec 32)) SeekEntryResult!7174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725805 (= res!486756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19618 a!3186) j!159) mask!3328) (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321489))))

(assert (=> b!725805 (= lt!321489 (Intermediate!7174 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725806 () Bool)

(declare-fun res!486747 () Bool)

(assert (=> b!725806 (=> (not res!486747) (not e!406495))))

(assert (=> b!725806 (= res!486747 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20038 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20038 a!3186))))))

(declare-fun res!486750 () Bool)

(assert (=> start!64548 (=> (not res!486750) (not e!406496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64548 (= res!486750 (validMask!0 mask!3328))))

(assert (=> start!64548 e!406496))

(assert (=> start!64548 true))

(declare-fun array_inv!15477 (array!40999) Bool)

(assert (=> start!64548 (array_inv!15477 a!3186)))

(declare-fun b!725799 () Bool)

(assert (=> b!725799 (= e!406491 e!406497)))

(declare-fun res!486743 () Bool)

(assert (=> b!725799 (=> (not res!486743) (not e!406497))))

(declare-fun lt!321484 () array!40999)

(declare-fun lt!321485 () (_ BitVec 64))

(assert (=> b!725799 (= res!486743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321485 mask!3328) lt!321485 lt!321484 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321485 lt!321484 mask!3328)))))

(assert (=> b!725799 (= lt!321485 (select (store (arr!19618 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725799 (= lt!321484 (array!41000 (store (arr!19618 a!3186) i!1173 k0!2102) (size!20038 a!3186)))))

(declare-fun b!725807 () Bool)

(declare-fun res!486752 () Bool)

(assert (=> b!725807 (=> (not res!486752) (not e!406491))))

(assert (=> b!725807 (= res!486752 e!406493)))

(declare-fun c!79901 () Bool)

(assert (=> b!725807 (= c!79901 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725808 () Bool)

(assert (=> b!725808 (= e!406493 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321489))))

(declare-fun b!725809 () Bool)

(assert (=> b!725809 (= e!406492 e!406494)))

(declare-fun res!486754 () Bool)

(assert (=> b!725809 (=> (not res!486754) (not e!406494))))

(assert (=> b!725809 (= res!486754 (= (seekEntryOrOpen!0 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321488))))

(assert (=> b!725809 (= lt!321488 (Found!7174 j!159))))

(declare-fun b!725810 () Bool)

(declare-fun res!486751 () Bool)

(assert (=> b!725810 (=> (not res!486751) (not e!406496))))

(assert (=> b!725810 (= res!486751 (validKeyInArray!0 (select (arr!19618 a!3186) j!159)))))

(declare-fun b!725811 () Bool)

(declare-fun res!486745 () Bool)

(assert (=> b!725811 (=> (not res!486745) (not e!406495))))

(assert (=> b!725811 (= res!486745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725812 () Bool)

(declare-fun res!486749 () Bool)

(assert (=> b!725812 (=> (not res!486749) (not e!406491))))

(assert (=> b!725812 (= res!486749 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19618 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64548 res!486750) b!725797))

(assert (= (and b!725797 res!486746) b!725810))

(assert (= (and b!725810 res!486751) b!725802))

(assert (= (and b!725802 res!486744) b!725801))

(assert (= (and b!725801 res!486748) b!725796))

(assert (= (and b!725796 res!486757) b!725811))

(assert (= (and b!725811 res!486745) b!725800))

(assert (= (and b!725800 res!486755) b!725806))

(assert (= (and b!725806 res!486747) b!725805))

(assert (= (and b!725805 res!486756) b!725812))

(assert (= (and b!725812 res!486749) b!725807))

(assert (= (and b!725807 c!79901) b!725808))

(assert (= (and b!725807 (not c!79901)) b!725798))

(assert (= (and b!725807 res!486752) b!725799))

(assert (= (and b!725799 res!486743) b!725804))

(assert (= (and b!725804 res!486753) b!725809))

(assert (= (and b!725809 res!486754) b!725803))

(declare-fun m!680475 () Bool)

(assert (=> b!725810 m!680475))

(assert (=> b!725810 m!680475))

(declare-fun m!680477 () Bool)

(assert (=> b!725810 m!680477))

(declare-fun m!680479 () Bool)

(assert (=> b!725812 m!680479))

(declare-fun m!680481 () Bool)

(assert (=> b!725804 m!680481))

(declare-fun m!680483 () Bool)

(assert (=> b!725804 m!680483))

(declare-fun m!680485 () Bool)

(assert (=> b!725796 m!680485))

(declare-fun m!680487 () Bool)

(assert (=> b!725802 m!680487))

(assert (=> b!725809 m!680475))

(assert (=> b!725809 m!680475))

(declare-fun m!680489 () Bool)

(assert (=> b!725809 m!680489))

(declare-fun m!680491 () Bool)

(assert (=> b!725811 m!680491))

(declare-fun m!680493 () Bool)

(assert (=> start!64548 m!680493))

(declare-fun m!680495 () Bool)

(assert (=> start!64548 m!680495))

(declare-fun m!680497 () Bool)

(assert (=> b!725799 m!680497))

(declare-fun m!680499 () Bool)

(assert (=> b!725799 m!680499))

(declare-fun m!680501 () Bool)

(assert (=> b!725799 m!680501))

(assert (=> b!725799 m!680497))

(declare-fun m!680503 () Bool)

(assert (=> b!725799 m!680503))

(declare-fun m!680505 () Bool)

(assert (=> b!725799 m!680505))

(assert (=> b!725805 m!680475))

(assert (=> b!725805 m!680475))

(declare-fun m!680507 () Bool)

(assert (=> b!725805 m!680507))

(assert (=> b!725805 m!680507))

(assert (=> b!725805 m!680475))

(declare-fun m!680509 () Bool)

(assert (=> b!725805 m!680509))

(declare-fun m!680511 () Bool)

(assert (=> b!725801 m!680511))

(assert (=> b!725808 m!680475))

(assert (=> b!725808 m!680475))

(declare-fun m!680513 () Bool)

(assert (=> b!725808 m!680513))

(assert (=> b!725803 m!680475))

(assert (=> b!725803 m!680475))

(declare-fun m!680515 () Bool)

(assert (=> b!725803 m!680515))

(declare-fun m!680517 () Bool)

(assert (=> b!725800 m!680517))

(assert (=> b!725798 m!680475))

(assert (=> b!725798 m!680475))

(declare-fun m!680519 () Bool)

(assert (=> b!725798 m!680519))

(check-sat (not b!725796) (not b!725805) (not start!64548) (not b!725800) (not b!725802) (not b!725804) (not b!725811) (not b!725803) (not b!725801) (not b!725798) (not b!725799) (not b!725808) (not b!725809) (not b!725810))
(check-sat)
