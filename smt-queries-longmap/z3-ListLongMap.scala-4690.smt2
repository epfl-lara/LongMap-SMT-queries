; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65328 () Bool)

(assert start!65328)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41371 0))(
  ( (array!41372 (arr!19795 (Array (_ BitVec 32) (_ BitVec 64))) (size!20215 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41371)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!738725 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!413224 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7351 0))(
  ( (MissingZero!7351 (index!31772 (_ BitVec 32))) (Found!7351 (index!31773 (_ BitVec 32))) (Intermediate!7351 (undefined!8163 Bool) (index!31774 (_ BitVec 32)) (x!62929 (_ BitVec 32))) (Undefined!7351) (MissingVacant!7351 (index!31775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!738725 (= e!413224 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) (Found!7351 j!159)))))

(declare-fun b!738726 () Bool)

(declare-fun e!413228 () Bool)

(declare-fun e!413232 () Bool)

(assert (=> b!738726 (= e!413228 e!413232)))

(declare-fun res!496391 () Bool)

(assert (=> b!738726 (=> (not res!496391) (not e!413232))))

(declare-fun lt!327818 () SeekEntryResult!7351)

(declare-fun lt!327809 () SeekEntryResult!7351)

(assert (=> b!738726 (= res!496391 (= lt!327818 lt!327809))))

(declare-fun lt!327813 () array!41371)

(declare-fun lt!327819 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!738726 (= lt!327809 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327819 lt!327813 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738726 (= lt!327818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327819 mask!3328) lt!327819 lt!327813 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!738726 (= lt!327819 (select (store (arr!19795 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738726 (= lt!327813 (array!41372 (store (arr!19795 a!3186) i!1173 k0!2102) (size!20215 a!3186)))))

(declare-fun b!738727 () Bool)

(declare-datatypes ((Unit!25177 0))(
  ( (Unit!25178) )
))
(declare-fun e!413230 () Unit!25177)

(declare-fun Unit!25179 () Unit!25177)

(assert (=> b!738727 (= e!413230 Unit!25179)))

(declare-fun lt!327822 () SeekEntryResult!7351)

(assert (=> b!738727 (= lt!327822 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327820 () (_ BitVec 32))

(declare-fun lt!327817 () SeekEntryResult!7351)

(assert (=> b!738727 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327820 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327817)))

(declare-fun lt!327814 () SeekEntryResult!7351)

(declare-fun e!413229 () Bool)

(declare-fun b!738728 () Bool)

(assert (=> b!738728 (= e!413229 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327820 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327814)))))

(declare-fun b!738729 () Bool)

(declare-fun res!496390 () Bool)

(declare-fun e!413226 () Bool)

(assert (=> b!738729 (=> (not res!496390) (not e!413226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41371 (_ BitVec 32)) Bool)

(assert (=> b!738729 (= res!496390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738730 () Bool)

(assert (=> b!738730 (= e!413229 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327820 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327817)))))

(declare-fun b!738731 () Bool)

(declare-fun e!413225 () Bool)

(assert (=> b!738731 (= e!413232 (not e!413225))))

(declare-fun res!496405 () Bool)

(assert (=> b!738731 (=> res!496405 e!413225)))

(get-info :version)

(assert (=> b!738731 (= res!496405 (or (not ((_ is Intermediate!7351) lt!327809)) (bvsge x!1131 (x!62929 lt!327809))))))

(assert (=> b!738731 (= lt!327817 (Found!7351 j!159))))

(declare-fun e!413222 () Bool)

(assert (=> b!738731 e!413222))

(declare-fun res!496402 () Bool)

(assert (=> b!738731 (=> (not res!496402) (not e!413222))))

(assert (=> b!738731 (= res!496402 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327815 () Unit!25177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25177)

(assert (=> b!738731 (= lt!327815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738732 () Bool)

(declare-fun res!496398 () Bool)

(declare-fun e!413227 () Bool)

(assert (=> b!738732 (=> (not res!496398) (not e!413227))))

(assert (=> b!738732 (= res!496398 (and (= (size!20215 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20215 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20215 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738733 () Bool)

(declare-fun res!496403 () Bool)

(assert (=> b!738733 (=> (not res!496403) (not e!413227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738733 (= res!496403 (validKeyInArray!0 (select (arr!19795 a!3186) j!159)))))

(declare-fun b!738734 () Bool)

(declare-fun Unit!25180 () Unit!25177)

(assert (=> b!738734 (= e!413230 Unit!25180)))

(assert (=> b!738734 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327820 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327814)))

(declare-fun b!738735 () Bool)

(declare-fun res!496401 () Bool)

(assert (=> b!738735 (=> (not res!496401) (not e!413227))))

(assert (=> b!738735 (= res!496401 (validKeyInArray!0 k0!2102))))

(declare-fun res!496388 () Bool)

(assert (=> start!65328 (=> (not res!496388) (not e!413227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65328 (= res!496388 (validMask!0 mask!3328))))

(assert (=> start!65328 e!413227))

(assert (=> start!65328 true))

(declare-fun array_inv!15654 (array!41371) Bool)

(assert (=> start!65328 (array_inv!15654 a!3186)))

(declare-fun b!738736 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!413221 () Bool)

(declare-fun lt!327821 () SeekEntryResult!7351)

(assert (=> b!738736 (= e!413221 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327821))))

(declare-fun b!738737 () Bool)

(declare-fun res!496393 () Bool)

(assert (=> b!738737 (=> (not res!496393) (not e!413227))))

(declare-fun arrayContainsKey!0 (array!41371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738737 (= res!496393 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738738 () Bool)

(declare-fun res!496397 () Bool)

(assert (=> b!738738 (=> (not res!496397) (not e!413226))))

(declare-datatypes ((List!13704 0))(
  ( (Nil!13701) (Cons!13700 (h!14778 (_ BitVec 64)) (t!20011 List!13704)) )
))
(declare-fun arrayNoDuplicates!0 (array!41371 (_ BitVec 32) List!13704) Bool)

(assert (=> b!738738 (= res!496397 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13701))))

(declare-fun b!738739 () Bool)

(declare-fun res!496392 () Bool)

(assert (=> b!738739 (=> (not res!496392) (not e!413228))))

(assert (=> b!738739 (= res!496392 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19795 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738740 () Bool)

(assert (=> b!738740 (= e!413227 e!413226)))

(declare-fun res!496389 () Bool)

(assert (=> b!738740 (=> (not res!496389) (not e!413226))))

(declare-fun lt!327816 () SeekEntryResult!7351)

(assert (=> b!738740 (= res!496389 (or (= lt!327816 (MissingZero!7351 i!1173)) (= lt!327816 (MissingVacant!7351 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!738740 (= lt!327816 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738741 () Bool)

(declare-fun e!413231 () Bool)

(assert (=> b!738741 (= e!413225 e!413231)))

(declare-fun res!496396 () Bool)

(assert (=> b!738741 (=> res!496396 e!413231)))

(assert (=> b!738741 (= res!496396 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327820 #b00000000000000000000000000000000) (bvsge lt!327820 (size!20215 a!3186))))))

(declare-fun lt!327810 () Unit!25177)

(assert (=> b!738741 (= lt!327810 e!413230)))

(declare-fun c!81552 () Bool)

(declare-fun lt!327811 () Bool)

(assert (=> b!738741 (= c!81552 lt!327811)))

(assert (=> b!738741 (= lt!327811 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738741 (= lt!327820 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!738742 () Bool)

(declare-fun res!496395 () Bool)

(assert (=> b!738742 (=> res!496395 e!413231)))

(assert (=> b!738742 (= res!496395 e!413229)))

(declare-fun c!81553 () Bool)

(assert (=> b!738742 (= c!81553 lt!327811)))

(declare-fun b!738743 () Bool)

(assert (=> b!738743 (= e!413224 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327814))))

(declare-fun b!738744 () Bool)

(declare-fun res!496404 () Bool)

(assert (=> b!738744 (=> (not res!496404) (not e!413226))))

(assert (=> b!738744 (= res!496404 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20215 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20215 a!3186))))))

(declare-fun b!738745 () Bool)

(assert (=> b!738745 (= e!413231 true)))

(declare-fun lt!327812 () SeekEntryResult!7351)

(assert (=> b!738745 (= lt!327812 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327820 lt!327819 lt!327813 mask!3328))))

(declare-fun b!738746 () Bool)

(assert (=> b!738746 (= e!413226 e!413228)))

(declare-fun res!496400 () Bool)

(assert (=> b!738746 (=> (not res!496400) (not e!413228))))

(assert (=> b!738746 (= res!496400 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19795 a!3186) j!159) mask!3328) (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327814))))

(assert (=> b!738746 (= lt!327814 (Intermediate!7351 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738747 () Bool)

(declare-fun res!496394 () Bool)

(assert (=> b!738747 (=> (not res!496394) (not e!413228))))

(assert (=> b!738747 (= res!496394 e!413224)))

(declare-fun c!81554 () Bool)

(assert (=> b!738747 (= c!81554 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738748 () Bool)

(assert (=> b!738748 (= e!413222 e!413221)))

(declare-fun res!496399 () Bool)

(assert (=> b!738748 (=> (not res!496399) (not e!413221))))

(assert (=> b!738748 (= res!496399 (= (seekEntryOrOpen!0 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327821))))

(assert (=> b!738748 (= lt!327821 (Found!7351 j!159))))

(assert (= (and start!65328 res!496388) b!738732))

(assert (= (and b!738732 res!496398) b!738733))

(assert (= (and b!738733 res!496403) b!738735))

(assert (= (and b!738735 res!496401) b!738737))

(assert (= (and b!738737 res!496393) b!738740))

(assert (= (and b!738740 res!496389) b!738729))

(assert (= (and b!738729 res!496390) b!738738))

(assert (= (and b!738738 res!496397) b!738744))

(assert (= (and b!738744 res!496404) b!738746))

(assert (= (and b!738746 res!496400) b!738739))

(assert (= (and b!738739 res!496392) b!738747))

(assert (= (and b!738747 c!81554) b!738743))

(assert (= (and b!738747 (not c!81554)) b!738725))

(assert (= (and b!738747 res!496394) b!738726))

(assert (= (and b!738726 res!496391) b!738731))

(assert (= (and b!738731 res!496402) b!738748))

(assert (= (and b!738748 res!496399) b!738736))

(assert (= (and b!738731 (not res!496405)) b!738741))

(assert (= (and b!738741 c!81552) b!738734))

(assert (= (and b!738741 (not c!81552)) b!738727))

(assert (= (and b!738741 (not res!496396)) b!738742))

(assert (= (and b!738742 c!81553) b!738728))

(assert (= (and b!738742 (not c!81553)) b!738730))

(assert (= (and b!738742 (not res!496395)) b!738745))

(declare-fun m!690885 () Bool)

(assert (=> b!738733 m!690885))

(assert (=> b!738733 m!690885))

(declare-fun m!690887 () Bool)

(assert (=> b!738733 m!690887))

(declare-fun m!690889 () Bool)

(assert (=> b!738741 m!690889))

(assert (=> b!738728 m!690885))

(assert (=> b!738728 m!690885))

(declare-fun m!690891 () Bool)

(assert (=> b!738728 m!690891))

(declare-fun m!690893 () Bool)

(assert (=> b!738731 m!690893))

(declare-fun m!690895 () Bool)

(assert (=> b!738731 m!690895))

(assert (=> b!738730 m!690885))

(assert (=> b!738730 m!690885))

(declare-fun m!690897 () Bool)

(assert (=> b!738730 m!690897))

(declare-fun m!690899 () Bool)

(assert (=> b!738737 m!690899))

(assert (=> b!738743 m!690885))

(assert (=> b!738743 m!690885))

(declare-fun m!690901 () Bool)

(assert (=> b!738743 m!690901))

(declare-fun m!690903 () Bool)

(assert (=> b!738726 m!690903))

(declare-fun m!690905 () Bool)

(assert (=> b!738726 m!690905))

(assert (=> b!738726 m!690903))

(declare-fun m!690907 () Bool)

(assert (=> b!738726 m!690907))

(declare-fun m!690909 () Bool)

(assert (=> b!738726 m!690909))

(declare-fun m!690911 () Bool)

(assert (=> b!738726 m!690911))

(declare-fun m!690913 () Bool)

(assert (=> b!738735 m!690913))

(declare-fun m!690915 () Bool)

(assert (=> b!738745 m!690915))

(declare-fun m!690917 () Bool)

(assert (=> start!65328 m!690917))

(declare-fun m!690919 () Bool)

(assert (=> start!65328 m!690919))

(assert (=> b!738727 m!690885))

(assert (=> b!738727 m!690885))

(declare-fun m!690921 () Bool)

(assert (=> b!738727 m!690921))

(assert (=> b!738727 m!690885))

(assert (=> b!738727 m!690897))

(assert (=> b!738748 m!690885))

(assert (=> b!738748 m!690885))

(declare-fun m!690923 () Bool)

(assert (=> b!738748 m!690923))

(declare-fun m!690925 () Bool)

(assert (=> b!738738 m!690925))

(assert (=> b!738725 m!690885))

(assert (=> b!738725 m!690885))

(assert (=> b!738725 m!690921))

(assert (=> b!738736 m!690885))

(assert (=> b!738736 m!690885))

(declare-fun m!690927 () Bool)

(assert (=> b!738736 m!690927))

(assert (=> b!738734 m!690885))

(assert (=> b!738734 m!690885))

(assert (=> b!738734 m!690891))

(declare-fun m!690929 () Bool)

(assert (=> b!738740 m!690929))

(assert (=> b!738746 m!690885))

(assert (=> b!738746 m!690885))

(declare-fun m!690931 () Bool)

(assert (=> b!738746 m!690931))

(assert (=> b!738746 m!690931))

(assert (=> b!738746 m!690885))

(declare-fun m!690933 () Bool)

(assert (=> b!738746 m!690933))

(declare-fun m!690935 () Bool)

(assert (=> b!738739 m!690935))

(declare-fun m!690937 () Bool)

(assert (=> b!738729 m!690937))

(check-sat (not b!738736) (not b!738733) (not b!738748) (not b!738737) (not b!738746) (not b!738734) (not b!738738) (not b!738743) (not start!65328) (not b!738731) (not b!738727) (not b!738728) (not b!738725) (not b!738729) (not b!738730) (not b!738745) (not b!738741) (not b!738740) (not b!738726) (not b!738735))
(check-sat)
