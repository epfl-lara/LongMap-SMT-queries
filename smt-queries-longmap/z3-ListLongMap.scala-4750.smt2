; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65540 () Bool)

(assert start!65540)

(declare-fun b!748614 () Bool)

(declare-fun res!505105 () Bool)

(declare-fun e!417769 () Bool)

(assert (=> b!748614 (=> (not res!505105) (not e!417769))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41730 0))(
  ( (array!41731 (arr!19979 (Array (_ BitVec 32) (_ BitVec 64))) (size!20400 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41730)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748614 (= res!505105 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20400 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20400 a!3186))))))

(declare-fun b!748615 () Bool)

(declare-fun res!505100 () Bool)

(declare-fun e!417773 () Bool)

(assert (=> b!748615 (=> (not res!505100) (not e!417773))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748615 (= res!505100 (validKeyInArray!0 (select (arr!19979 a!3186) j!159)))))

(declare-fun b!748616 () Bool)

(declare-fun e!417770 () Bool)

(assert (=> b!748616 (= e!417769 e!417770)))

(declare-fun res!505112 () Bool)

(assert (=> b!748616 (=> (not res!505112) (not e!417770))))

(declare-datatypes ((SeekEntryResult!7576 0))(
  ( (MissingZero!7576 (index!32672 (_ BitVec 32))) (Found!7576 (index!32673 (_ BitVec 32))) (Intermediate!7576 (undefined!8388 Bool) (index!32674 (_ BitVec 32)) (x!63617 (_ BitVec 32))) (Undefined!7576) (MissingVacant!7576 (index!32675 (_ BitVec 32))) )
))
(declare-fun lt!332671 () SeekEntryResult!7576)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41730 (_ BitVec 32)) SeekEntryResult!7576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748616 (= res!505112 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19979 a!3186) j!159) mask!3328) (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332671))))

(assert (=> b!748616 (= lt!332671 (Intermediate!7576 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748617 () Bool)

(declare-fun e!417774 () Bool)

(assert (=> b!748617 (= e!417774 true)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748617 (= (select (store (arr!19979 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25664 0))(
  ( (Unit!25665) )
))
(declare-fun lt!332670 () Unit!25664)

(declare-fun e!417767 () Unit!25664)

(assert (=> b!748617 (= lt!332670 e!417767)))

(declare-fun c!82139 () Bool)

(assert (=> b!748617 (= c!82139 (= (select (store (arr!19979 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748618 () Bool)

(declare-fun res!505102 () Bool)

(assert (=> b!748618 (=> (not res!505102) (not e!417769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41730 (_ BitVec 32)) Bool)

(assert (=> b!748618 (= res!505102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748619 () Bool)

(declare-fun e!417768 () Bool)

(assert (=> b!748619 (= e!417770 e!417768)))

(declare-fun res!505108 () Bool)

(assert (=> b!748619 (=> (not res!505108) (not e!417768))))

(declare-fun lt!332672 () SeekEntryResult!7576)

(declare-fun lt!332675 () SeekEntryResult!7576)

(assert (=> b!748619 (= res!505108 (= lt!332672 lt!332675))))

(declare-fun lt!332673 () array!41730)

(declare-fun lt!332674 () (_ BitVec 64))

(assert (=> b!748619 (= lt!332675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332674 lt!332673 mask!3328))))

(assert (=> b!748619 (= lt!332672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332674 mask!3328) lt!332674 lt!332673 mask!3328))))

(assert (=> b!748619 (= lt!332674 (select (store (arr!19979 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748619 (= lt!332673 (array!41731 (store (arr!19979 a!3186) i!1173 k0!2102) (size!20400 a!3186)))))

(declare-fun b!748620 () Bool)

(declare-fun e!417775 () Bool)

(assert (=> b!748620 (= e!417775 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332671))))

(declare-fun e!417772 () Bool)

(declare-fun b!748621 () Bool)

(declare-fun lt!332668 () SeekEntryResult!7576)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41730 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!748621 (= e!417772 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332668))))

(declare-fun res!505109 () Bool)

(assert (=> start!65540 (=> (not res!505109) (not e!417773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65540 (= res!505109 (validMask!0 mask!3328))))

(assert (=> start!65540 e!417773))

(assert (=> start!65540 true))

(declare-fun array_inv!15862 (array!41730) Bool)

(assert (=> start!65540 (array_inv!15862 a!3186)))

(declare-fun b!748622 () Bool)

(assert (=> b!748622 (= e!417775 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) (Found!7576 j!159)))))

(declare-fun b!748623 () Bool)

(declare-fun res!505107 () Bool)

(assert (=> b!748623 (=> (not res!505107) (not e!417773))))

(declare-fun arrayContainsKey!0 (array!41730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748623 (= res!505107 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748624 () Bool)

(declare-fun res!505113 () Bool)

(assert (=> b!748624 (=> (not res!505113) (not e!417773))))

(assert (=> b!748624 (= res!505113 (and (= (size!20400 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20400 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20400 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748625 () Bool)

(declare-fun res!505097 () Bool)

(assert (=> b!748625 (=> (not res!505097) (not e!417773))))

(assert (=> b!748625 (= res!505097 (validKeyInArray!0 k0!2102))))

(declare-fun b!748626 () Bool)

(declare-fun res!505101 () Bool)

(assert (=> b!748626 (=> res!505101 e!417774)))

(assert (=> b!748626 (= res!505101 (= (select (store (arr!19979 a!3186) i!1173 k0!2102) index!1321) lt!332674))))

(declare-fun b!748627 () Bool)

(declare-fun res!505106 () Bool)

(assert (=> b!748627 (=> (not res!505106) (not e!417770))))

(assert (=> b!748627 (= res!505106 e!417775)))

(declare-fun c!82140 () Bool)

(assert (=> b!748627 (= c!82140 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748628 () Bool)

(assert (=> b!748628 (= e!417768 (not e!417774))))

(declare-fun res!505098 () Bool)

(assert (=> b!748628 (=> res!505098 e!417774)))

(get-info :version)

(assert (=> b!748628 (= res!505098 (or (not ((_ is Intermediate!7576) lt!332675)) (bvslt x!1131 (x!63617 lt!332675)) (not (= x!1131 (x!63617 lt!332675))) (not (= index!1321 (index!32674 lt!332675)))))))

(assert (=> b!748628 e!417772))

(declare-fun res!505103 () Bool)

(assert (=> b!748628 (=> (not res!505103) (not e!417772))))

(declare-fun lt!332669 () SeekEntryResult!7576)

(assert (=> b!748628 (= res!505103 (= lt!332669 lt!332668))))

(assert (=> b!748628 (= lt!332668 (Found!7576 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41730 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!748628 (= lt!332669 (seekEntryOrOpen!0 (select (arr!19979 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748628 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332667 () Unit!25664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25664)

(assert (=> b!748628 (= lt!332667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748629 () Bool)

(assert (=> b!748629 (= e!417773 e!417769)))

(declare-fun res!505099 () Bool)

(assert (=> b!748629 (=> (not res!505099) (not e!417769))))

(declare-fun lt!332666 () SeekEntryResult!7576)

(assert (=> b!748629 (= res!505099 (or (= lt!332666 (MissingZero!7576 i!1173)) (= lt!332666 (MissingVacant!7576 i!1173))))))

(assert (=> b!748629 (= lt!332666 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748630 () Bool)

(declare-fun Unit!25666 () Unit!25664)

(assert (=> b!748630 (= e!417767 Unit!25666)))

(declare-fun b!748631 () Bool)

(declare-fun res!505104 () Bool)

(assert (=> b!748631 (=> (not res!505104) (not e!417770))))

(assert (=> b!748631 (= res!505104 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19979 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748632 () Bool)

(declare-fun Unit!25667 () Unit!25664)

(assert (=> b!748632 (= e!417767 Unit!25667)))

(assert (=> b!748632 false))

(declare-fun b!748633 () Bool)

(declare-fun res!505111 () Bool)

(assert (=> b!748633 (=> (not res!505111) (not e!417769))))

(declare-datatypes ((List!14020 0))(
  ( (Nil!14017) (Cons!14016 (h!15088 (_ BitVec 64)) (t!20326 List!14020)) )
))
(declare-fun arrayNoDuplicates!0 (array!41730 (_ BitVec 32) List!14020) Bool)

(assert (=> b!748633 (= res!505111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14017))))

(declare-fun b!748634 () Bool)

(declare-fun res!505110 () Bool)

(assert (=> b!748634 (=> res!505110 e!417774)))

(assert (=> b!748634 (= res!505110 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332668)))))

(assert (= (and start!65540 res!505109) b!748624))

(assert (= (and b!748624 res!505113) b!748615))

(assert (= (and b!748615 res!505100) b!748625))

(assert (= (and b!748625 res!505097) b!748623))

(assert (= (and b!748623 res!505107) b!748629))

(assert (= (and b!748629 res!505099) b!748618))

(assert (= (and b!748618 res!505102) b!748633))

(assert (= (and b!748633 res!505111) b!748614))

(assert (= (and b!748614 res!505105) b!748616))

(assert (= (and b!748616 res!505112) b!748631))

(assert (= (and b!748631 res!505104) b!748627))

(assert (= (and b!748627 c!82140) b!748620))

(assert (= (and b!748627 (not c!82140)) b!748622))

(assert (= (and b!748627 res!505106) b!748619))

(assert (= (and b!748619 res!505108) b!748628))

(assert (= (and b!748628 res!505103) b!748621))

(assert (= (and b!748628 (not res!505098)) b!748634))

(assert (= (and b!748634 (not res!505110)) b!748626))

(assert (= (and b!748626 (not res!505101)) b!748617))

(assert (= (and b!748617 c!82139) b!748632))

(assert (= (and b!748617 (not c!82139)) b!748630))

(declare-fun m!697847 () Bool)

(assert (=> b!748615 m!697847))

(assert (=> b!748615 m!697847))

(declare-fun m!697849 () Bool)

(assert (=> b!748615 m!697849))

(assert (=> b!748620 m!697847))

(assert (=> b!748620 m!697847))

(declare-fun m!697851 () Bool)

(assert (=> b!748620 m!697851))

(declare-fun m!697853 () Bool)

(assert (=> b!748629 m!697853))

(assert (=> b!748622 m!697847))

(assert (=> b!748622 m!697847))

(declare-fun m!697855 () Bool)

(assert (=> b!748622 m!697855))

(assert (=> b!748621 m!697847))

(assert (=> b!748621 m!697847))

(declare-fun m!697857 () Bool)

(assert (=> b!748621 m!697857))

(assert (=> b!748616 m!697847))

(assert (=> b!748616 m!697847))

(declare-fun m!697859 () Bool)

(assert (=> b!748616 m!697859))

(assert (=> b!748616 m!697859))

(assert (=> b!748616 m!697847))

(declare-fun m!697861 () Bool)

(assert (=> b!748616 m!697861))

(declare-fun m!697863 () Bool)

(assert (=> start!65540 m!697863))

(declare-fun m!697865 () Bool)

(assert (=> start!65540 m!697865))

(declare-fun m!697867 () Bool)

(assert (=> b!748617 m!697867))

(declare-fun m!697869 () Bool)

(assert (=> b!748617 m!697869))

(declare-fun m!697871 () Bool)

(assert (=> b!748623 m!697871))

(assert (=> b!748626 m!697867))

(assert (=> b!748626 m!697869))

(assert (=> b!748628 m!697847))

(assert (=> b!748628 m!697847))

(declare-fun m!697873 () Bool)

(assert (=> b!748628 m!697873))

(declare-fun m!697875 () Bool)

(assert (=> b!748628 m!697875))

(declare-fun m!697877 () Bool)

(assert (=> b!748628 m!697877))

(assert (=> b!748634 m!697847))

(assert (=> b!748634 m!697847))

(assert (=> b!748634 m!697855))

(declare-fun m!697879 () Bool)

(assert (=> b!748631 m!697879))

(declare-fun m!697881 () Bool)

(assert (=> b!748618 m!697881))

(declare-fun m!697883 () Bool)

(assert (=> b!748619 m!697883))

(assert (=> b!748619 m!697867))

(assert (=> b!748619 m!697883))

(declare-fun m!697885 () Bool)

(assert (=> b!748619 m!697885))

(declare-fun m!697887 () Bool)

(assert (=> b!748619 m!697887))

(declare-fun m!697889 () Bool)

(assert (=> b!748619 m!697889))

(declare-fun m!697891 () Bool)

(assert (=> b!748625 m!697891))

(declare-fun m!697893 () Bool)

(assert (=> b!748633 m!697893))

(check-sat (not b!748628) (not b!748633) (not start!65540) (not b!748634) (not b!748623) (not b!748616) (not b!748622) (not b!748619) (not b!748625) (not b!748615) (not b!748621) (not b!748620) (not b!748618) (not b!748629))
(check-sat)
