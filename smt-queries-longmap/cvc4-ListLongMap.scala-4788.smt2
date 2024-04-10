; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65792 () Bool)

(assert start!65792)

(declare-fun b!756737 () Bool)

(declare-datatypes ((Unit!26164 0))(
  ( (Unit!26165) )
))
(declare-fun e!421951 () Unit!26164)

(declare-fun Unit!26166 () Unit!26164)

(assert (=> b!756737 (= e!421951 Unit!26166)))

(declare-fun b!756738 () Bool)

(declare-fun e!421955 () Bool)

(declare-fun e!421953 () Bool)

(assert (=> b!756738 (= e!421955 e!421953)))

(declare-fun res!511688 () Bool)

(assert (=> b!756738 (=> (not res!511688) (not e!421953))))

(declare-datatypes ((array!41965 0))(
  ( (array!41966 (arr!20096 (Array (_ BitVec 32) (_ BitVec 64))) (size!20517 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41965)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7696 0))(
  ( (MissingZero!7696 (index!33152 (_ BitVec 32))) (Found!7696 (index!33153 (_ BitVec 32))) (Intermediate!7696 (undefined!8508 Bool) (index!33154 (_ BitVec 32)) (x!64046 (_ BitVec 32))) (Undefined!7696) (MissingVacant!7696 (index!33155 (_ BitVec 32))) )
))
(declare-fun lt!336943 () SeekEntryResult!7696)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756738 (= res!511688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20096 a!3186) j!159) mask!3328) (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336943))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756738 (= lt!336943 (Intermediate!7696 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756739 () Bool)

(declare-fun res!511704 () Bool)

(declare-fun e!421950 () Bool)

(assert (=> b!756739 (=> (not res!511704) (not e!421950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756739 (= res!511704 (validKeyInArray!0 (select (arr!20096 a!3186) j!159)))))

(declare-fun b!756740 () Bool)

(declare-fun Unit!26167 () Unit!26164)

(assert (=> b!756740 (= e!421951 Unit!26167)))

(assert (=> b!756740 false))

(declare-fun b!756741 () Bool)

(declare-fun res!511693 () Bool)

(assert (=> b!756741 (=> (not res!511693) (not e!421955))))

(declare-datatypes ((List!14098 0))(
  ( (Nil!14095) (Cons!14094 (h!15166 (_ BitVec 64)) (t!20413 List!14098)) )
))
(declare-fun arrayNoDuplicates!0 (array!41965 (_ BitVec 32) List!14098) Bool)

(assert (=> b!756741 (= res!511693 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14095))))

(declare-fun b!756742 () Bool)

(declare-fun res!511698 () Bool)

(assert (=> b!756742 (=> (not res!511698) (not e!421950))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756742 (= res!511698 (and (= (size!20517 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20517 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20517 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756743 () Bool)

(declare-fun res!511689 () Bool)

(assert (=> b!756743 (=> (not res!511689) (not e!421953))))

(declare-fun e!421959 () Bool)

(assert (=> b!756743 (= res!511689 e!421959)))

(declare-fun c!82906 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!756743 (= c!82906 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756744 () Bool)

(declare-fun e!421956 () Bool)

(assert (=> b!756744 (= e!421956 true)))

(declare-fun e!421957 () Bool)

(assert (=> b!756744 e!421957))

(declare-fun res!511703 () Bool)

(assert (=> b!756744 (=> (not res!511703) (not e!421957))))

(declare-fun lt!336945 () (_ BitVec 64))

(assert (=> b!756744 (= res!511703 (= lt!336945 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336947 () Unit!26164)

(assert (=> b!756744 (= lt!336947 e!421951)))

(declare-fun c!82905 () Bool)

(assert (=> b!756744 (= c!82905 (= lt!336945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756746 () Bool)

(declare-fun res!511705 () Bool)

(assert (=> b!756746 (=> (not res!511705) (not e!421950))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756746 (= res!511705 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756747 () Bool)

(declare-fun lt!336949 () SeekEntryResult!7696)

(declare-fun lt!336948 () SeekEntryResult!7696)

(assert (=> b!756747 (= e!421957 (= lt!336949 lt!336948))))

(declare-fun lt!336946 () SeekEntryResult!7696)

(declare-fun e!421954 () Bool)

(declare-fun b!756748 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!756748 (= e!421954 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336946))))

(declare-fun b!756749 () Bool)

(declare-fun res!511706 () Bool)

(assert (=> b!756749 (=> (not res!511706) (not e!421953))))

(assert (=> b!756749 (= res!511706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20096 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756750 () Bool)

(declare-fun res!511697 () Bool)

(assert (=> b!756750 (=> (not res!511697) (not e!421955))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!756750 (= res!511697 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20517 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20517 a!3186))))))

(declare-fun b!756751 () Bool)

(declare-fun res!511700 () Bool)

(assert (=> b!756751 (=> (not res!511700) (not e!421957))))

(declare-fun lt!336944 () (_ BitVec 64))

(declare-fun lt!336951 () array!41965)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!756751 (= res!511700 (= (seekEntryOrOpen!0 lt!336944 lt!336951 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336944 lt!336951 mask!3328)))))

(declare-fun b!756752 () Bool)

(declare-fun e!421958 () Bool)

(assert (=> b!756752 (= e!421953 e!421958)))

(declare-fun res!511692 () Bool)

(assert (=> b!756752 (=> (not res!511692) (not e!421958))))

(declare-fun lt!336953 () SeekEntryResult!7696)

(declare-fun lt!336942 () SeekEntryResult!7696)

(assert (=> b!756752 (= res!511692 (= lt!336953 lt!336942))))

(assert (=> b!756752 (= lt!336942 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336944 lt!336951 mask!3328))))

(assert (=> b!756752 (= lt!336953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336944 mask!3328) lt!336944 lt!336951 mask!3328))))

(assert (=> b!756752 (= lt!336944 (select (store (arr!20096 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756752 (= lt!336951 (array!41966 (store (arr!20096 a!3186) i!1173 k!2102) (size!20517 a!3186)))))

(declare-fun b!756753 () Bool)

(declare-fun e!421960 () Bool)

(assert (=> b!756753 (= e!421960 e!421956)))

(declare-fun res!511695 () Bool)

(assert (=> b!756753 (=> res!511695 e!421956)))

(assert (=> b!756753 (= res!511695 (= lt!336945 lt!336944))))

(assert (=> b!756753 (= lt!336945 (select (store (arr!20096 a!3186) i!1173 k!2102) index!1321))))

(declare-fun res!511694 () Bool)

(assert (=> start!65792 (=> (not res!511694) (not e!421950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65792 (= res!511694 (validMask!0 mask!3328))))

(assert (=> start!65792 e!421950))

(assert (=> start!65792 true))

(declare-fun array_inv!15892 (array!41965) Bool)

(assert (=> start!65792 (array_inv!15892 a!3186)))

(declare-fun b!756745 () Bool)

(declare-fun res!511691 () Bool)

(assert (=> b!756745 (=> (not res!511691) (not e!421955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41965 (_ BitVec 32)) Bool)

(assert (=> b!756745 (= res!511691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756754 () Bool)

(declare-fun e!421952 () Bool)

(assert (=> b!756754 (= e!421952 e!421960)))

(declare-fun res!511696 () Bool)

(assert (=> b!756754 (=> res!511696 e!421960)))

(assert (=> b!756754 (= res!511696 (not (= lt!336948 lt!336946)))))

(assert (=> b!756754 (= lt!336948 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756755 () Bool)

(assert (=> b!756755 (= e!421950 e!421955)))

(declare-fun res!511699 () Bool)

(assert (=> b!756755 (=> (not res!511699) (not e!421955))))

(declare-fun lt!336952 () SeekEntryResult!7696)

(assert (=> b!756755 (= res!511699 (or (= lt!336952 (MissingZero!7696 i!1173)) (= lt!336952 (MissingVacant!7696 i!1173))))))

(assert (=> b!756755 (= lt!336952 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756756 () Bool)

(declare-fun res!511690 () Bool)

(assert (=> b!756756 (=> (not res!511690) (not e!421950))))

(assert (=> b!756756 (= res!511690 (validKeyInArray!0 k!2102))))

(declare-fun b!756757 () Bool)

(assert (=> b!756757 (= e!421958 (not e!421952))))

(declare-fun res!511701 () Bool)

(assert (=> b!756757 (=> res!511701 e!421952)))

(assert (=> b!756757 (= res!511701 (or (not (is-Intermediate!7696 lt!336942)) (bvslt x!1131 (x!64046 lt!336942)) (not (= x!1131 (x!64046 lt!336942))) (not (= index!1321 (index!33154 lt!336942)))))))

(assert (=> b!756757 e!421954))

(declare-fun res!511702 () Bool)

(assert (=> b!756757 (=> (not res!511702) (not e!421954))))

(assert (=> b!756757 (= res!511702 (= lt!336949 lt!336946))))

(assert (=> b!756757 (= lt!336946 (Found!7696 j!159))))

(assert (=> b!756757 (= lt!336949 (seekEntryOrOpen!0 (select (arr!20096 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756757 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336950 () Unit!26164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26164)

(assert (=> b!756757 (= lt!336950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756758 () Bool)

(assert (=> b!756758 (= e!421959 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336943))))

(declare-fun b!756759 () Bool)

(assert (=> b!756759 (= e!421959 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) (Found!7696 j!159)))))

(assert (= (and start!65792 res!511694) b!756742))

(assert (= (and b!756742 res!511698) b!756739))

(assert (= (and b!756739 res!511704) b!756756))

(assert (= (and b!756756 res!511690) b!756746))

(assert (= (and b!756746 res!511705) b!756755))

(assert (= (and b!756755 res!511699) b!756745))

(assert (= (and b!756745 res!511691) b!756741))

(assert (= (and b!756741 res!511693) b!756750))

(assert (= (and b!756750 res!511697) b!756738))

(assert (= (and b!756738 res!511688) b!756749))

(assert (= (and b!756749 res!511706) b!756743))

(assert (= (and b!756743 c!82906) b!756758))

(assert (= (and b!756743 (not c!82906)) b!756759))

(assert (= (and b!756743 res!511689) b!756752))

(assert (= (and b!756752 res!511692) b!756757))

(assert (= (and b!756757 res!511702) b!756748))

(assert (= (and b!756757 (not res!511701)) b!756754))

(assert (= (and b!756754 (not res!511696)) b!756753))

(assert (= (and b!756753 (not res!511695)) b!756744))

(assert (= (and b!756744 c!82905) b!756740))

(assert (= (and b!756744 (not c!82905)) b!756737))

(assert (= (and b!756744 res!511703) b!756751))

(assert (= (and b!756751 res!511700) b!756747))

(declare-fun m!704619 () Bool)

(assert (=> b!756749 m!704619))

(declare-fun m!704621 () Bool)

(assert (=> b!756748 m!704621))

(assert (=> b!756748 m!704621))

(declare-fun m!704623 () Bool)

(assert (=> b!756748 m!704623))

(declare-fun m!704625 () Bool)

(assert (=> b!756752 m!704625))

(declare-fun m!704627 () Bool)

(assert (=> b!756752 m!704627))

(assert (=> b!756752 m!704625))

(declare-fun m!704629 () Bool)

(assert (=> b!756752 m!704629))

(declare-fun m!704631 () Bool)

(assert (=> b!756752 m!704631))

(declare-fun m!704633 () Bool)

(assert (=> b!756752 m!704633))

(declare-fun m!704635 () Bool)

(assert (=> b!756746 m!704635))

(assert (=> b!756739 m!704621))

(assert (=> b!756739 m!704621))

(declare-fun m!704637 () Bool)

(assert (=> b!756739 m!704637))

(declare-fun m!704639 () Bool)

(assert (=> b!756751 m!704639))

(declare-fun m!704641 () Bool)

(assert (=> b!756751 m!704641))

(declare-fun m!704643 () Bool)

(assert (=> b!756741 m!704643))

(declare-fun m!704645 () Bool)

(assert (=> b!756755 m!704645))

(assert (=> b!756754 m!704621))

(assert (=> b!756754 m!704621))

(declare-fun m!704647 () Bool)

(assert (=> b!756754 m!704647))

(assert (=> b!756738 m!704621))

(assert (=> b!756738 m!704621))

(declare-fun m!704649 () Bool)

(assert (=> b!756738 m!704649))

(assert (=> b!756738 m!704649))

(assert (=> b!756738 m!704621))

(declare-fun m!704651 () Bool)

(assert (=> b!756738 m!704651))

(assert (=> b!756757 m!704621))

(assert (=> b!756757 m!704621))

(declare-fun m!704653 () Bool)

(assert (=> b!756757 m!704653))

(declare-fun m!704655 () Bool)

(assert (=> b!756757 m!704655))

(declare-fun m!704657 () Bool)

(assert (=> b!756757 m!704657))

(declare-fun m!704659 () Bool)

(assert (=> start!65792 m!704659))

(declare-fun m!704661 () Bool)

(assert (=> start!65792 m!704661))

(assert (=> b!756753 m!704631))

(declare-fun m!704663 () Bool)

(assert (=> b!756753 m!704663))

(assert (=> b!756759 m!704621))

(assert (=> b!756759 m!704621))

(assert (=> b!756759 m!704647))

(declare-fun m!704665 () Bool)

(assert (=> b!756756 m!704665))

(assert (=> b!756758 m!704621))

(assert (=> b!756758 m!704621))

(declare-fun m!704667 () Bool)

(assert (=> b!756758 m!704667))

(declare-fun m!704669 () Bool)

(assert (=> b!756745 m!704669))

(push 1)

