; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65774 () Bool)

(assert start!65774)

(declare-fun b!756556 () Bool)

(declare-fun res!511644 () Bool)

(declare-fun e!421839 () Bool)

(assert (=> b!756556 (=> (not res!511644) (not e!421839))))

(declare-datatypes ((array!41964 0))(
  ( (array!41965 (arr!20096 (Array (_ BitVec 32) (_ BitVec 64))) (size!20517 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41964)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41964 (_ BitVec 32)) Bool)

(assert (=> b!756556 (= res!511644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756557 () Bool)

(declare-datatypes ((Unit!26132 0))(
  ( (Unit!26133) )
))
(declare-fun e!421835 () Unit!26132)

(declare-fun Unit!26134 () Unit!26132)

(assert (=> b!756557 (= e!421835 Unit!26134)))

(declare-fun b!756558 () Bool)

(declare-fun Unit!26135 () Unit!26132)

(assert (=> b!756558 (= e!421835 Unit!26135)))

(assert (=> b!756558 false))

(declare-fun b!756559 () Bool)

(declare-fun e!421836 () Bool)

(assert (=> b!756559 (= e!421836 true)))

(declare-fun e!421841 () Bool)

(assert (=> b!756559 e!421841))

(declare-fun res!511652 () Bool)

(assert (=> b!756559 (=> (not res!511652) (not e!421841))))

(declare-fun lt!336747 () (_ BitVec 64))

(assert (=> b!756559 (= res!511652 (= lt!336747 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336739 () Unit!26132)

(assert (=> b!756559 (= lt!336739 e!421835)))

(declare-fun c!82842 () Bool)

(assert (=> b!756559 (= c!82842 (= lt!336747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756560 () Bool)

(declare-fun e!421832 () Bool)

(assert (=> b!756560 (= e!421832 e!421836)))

(declare-fun res!511647 () Bool)

(assert (=> b!756560 (=> res!511647 e!421836)))

(declare-fun lt!336743 () (_ BitVec 64))

(assert (=> b!756560 (= res!511647 (= lt!336747 lt!336743))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756560 (= lt!336747 (select (store (arr!20096 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756561 () Bool)

(declare-fun res!511653 () Bool)

(declare-fun e!421843 () Bool)

(assert (=> b!756561 (=> (not res!511653) (not e!421843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756561 (= res!511653 (validKeyInArray!0 k0!2102))))

(declare-fun b!756562 () Bool)

(declare-fun res!511646 () Bool)

(assert (=> b!756562 (=> (not res!511646) (not e!421843))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756562 (= res!511646 (and (= (size!20517 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20517 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20517 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756563 () Bool)

(declare-fun e!421838 () Bool)

(declare-fun e!421840 () Bool)

(assert (=> b!756563 (= e!421838 e!421840)))

(declare-fun res!511640 () Bool)

(assert (=> b!756563 (=> (not res!511640) (not e!421840))))

(declare-datatypes ((SeekEntryResult!7693 0))(
  ( (MissingZero!7693 (index!33140 (_ BitVec 32))) (Found!7693 (index!33141 (_ BitVec 32))) (Intermediate!7693 (undefined!8505 Bool) (index!33142 (_ BitVec 32)) (x!64046 (_ BitVec 32))) (Undefined!7693) (MissingVacant!7693 (index!33143 (_ BitVec 32))) )
))
(declare-fun lt!336749 () SeekEntryResult!7693)

(declare-fun lt!336740 () SeekEntryResult!7693)

(assert (=> b!756563 (= res!511640 (= lt!336749 lt!336740))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336741 () array!41964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41964 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!756563 (= lt!336740 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336743 lt!336741 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756563 (= lt!336749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336743 mask!3328) lt!336743 lt!336741 mask!3328))))

(assert (=> b!756563 (= lt!336743 (select (store (arr!20096 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756563 (= lt!336741 (array!41965 (store (arr!20096 a!3186) i!1173 k0!2102) (size!20517 a!3186)))))

(declare-fun b!756564 () Bool)

(declare-fun res!511639 () Bool)

(assert (=> b!756564 (=> (not res!511639) (not e!421843))))

(declare-fun arrayContainsKey!0 (array!41964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756564 (= res!511639 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756565 () Bool)

(declare-fun e!421837 () Bool)

(assert (=> b!756565 (= e!421837 e!421832)))

(declare-fun res!511648 () Bool)

(assert (=> b!756565 (=> res!511648 e!421832)))

(declare-fun lt!336748 () SeekEntryResult!7693)

(declare-fun lt!336745 () SeekEntryResult!7693)

(assert (=> b!756565 (= res!511648 (not (= lt!336748 lt!336745)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41964 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!756565 (= lt!336748 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756566 () Bool)

(declare-fun lt!336738 () SeekEntryResult!7693)

(assert (=> b!756566 (= e!421841 (= lt!336738 lt!336748))))

(declare-fun e!421834 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!756567 () Bool)

(assert (=> b!756567 (= e!421834 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336745))))

(declare-fun b!756568 () Bool)

(declare-fun res!511635 () Bool)

(assert (=> b!756568 (=> (not res!511635) (not e!421838))))

(declare-fun e!421833 () Bool)

(assert (=> b!756568 (= res!511635 e!421833)))

(declare-fun c!82841 () Bool)

(assert (=> b!756568 (= c!82841 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756569 () Bool)

(assert (=> b!756569 (= e!421839 e!421838)))

(declare-fun res!511637 () Bool)

(assert (=> b!756569 (=> (not res!511637) (not e!421838))))

(declare-fun lt!336744 () SeekEntryResult!7693)

(assert (=> b!756569 (= res!511637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20096 a!3186) j!159) mask!3328) (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336744))))

(assert (=> b!756569 (= lt!336744 (Intermediate!7693 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756570 () Bool)

(assert (=> b!756570 (= e!421833 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) (Found!7693 j!159)))))

(declare-fun b!756571 () Bool)

(declare-fun res!511643 () Bool)

(assert (=> b!756571 (=> (not res!511643) (not e!421843))))

(assert (=> b!756571 (= res!511643 (validKeyInArray!0 (select (arr!20096 a!3186) j!159)))))

(declare-fun b!756572 () Bool)

(assert (=> b!756572 (= e!421833 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20096 a!3186) j!159) a!3186 mask!3328) lt!336744))))

(declare-fun b!756573 () Bool)

(declare-fun res!511642 () Bool)

(assert (=> b!756573 (=> (not res!511642) (not e!421838))))

(assert (=> b!756573 (= res!511642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20096 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756574 () Bool)

(assert (=> b!756574 (= e!421843 e!421839)))

(declare-fun res!511649 () Bool)

(assert (=> b!756574 (=> (not res!511649) (not e!421839))))

(declare-fun lt!336746 () SeekEntryResult!7693)

(assert (=> b!756574 (= res!511649 (or (= lt!336746 (MissingZero!7693 i!1173)) (= lt!336746 (MissingVacant!7693 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41964 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!756574 (= lt!336746 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756575 () Bool)

(declare-fun res!511651 () Bool)

(assert (=> b!756575 (=> (not res!511651) (not e!421839))))

(assert (=> b!756575 (= res!511651 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20517 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20517 a!3186))))))

(declare-fun res!511638 () Bool)

(assert (=> start!65774 (=> (not res!511638) (not e!421843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65774 (= res!511638 (validMask!0 mask!3328))))

(assert (=> start!65774 e!421843))

(assert (=> start!65774 true))

(declare-fun array_inv!15979 (array!41964) Bool)

(assert (=> start!65774 (array_inv!15979 a!3186)))

(declare-fun b!756576 () Bool)

(declare-fun res!511645 () Bool)

(assert (=> b!756576 (=> (not res!511645) (not e!421841))))

(assert (=> b!756576 (= res!511645 (= (seekEntryOrOpen!0 lt!336743 lt!336741 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336743 lt!336741 mask!3328)))))

(declare-fun b!756577 () Bool)

(declare-fun res!511650 () Bool)

(assert (=> b!756577 (=> (not res!511650) (not e!421839))))

(declare-datatypes ((List!14137 0))(
  ( (Nil!14134) (Cons!14133 (h!15205 (_ BitVec 64)) (t!20443 List!14137)) )
))
(declare-fun arrayNoDuplicates!0 (array!41964 (_ BitVec 32) List!14137) Bool)

(assert (=> b!756577 (= res!511650 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14134))))

(declare-fun b!756578 () Bool)

(assert (=> b!756578 (= e!421840 (not e!421837))))

(declare-fun res!511636 () Bool)

(assert (=> b!756578 (=> res!511636 e!421837)))

(get-info :version)

(assert (=> b!756578 (= res!511636 (or (not ((_ is Intermediate!7693) lt!336740)) (bvslt x!1131 (x!64046 lt!336740)) (not (= x!1131 (x!64046 lt!336740))) (not (= index!1321 (index!33142 lt!336740)))))))

(assert (=> b!756578 e!421834))

(declare-fun res!511641 () Bool)

(assert (=> b!756578 (=> (not res!511641) (not e!421834))))

(assert (=> b!756578 (= res!511641 (= lt!336738 lt!336745))))

(assert (=> b!756578 (= lt!336745 (Found!7693 j!159))))

(assert (=> b!756578 (= lt!336738 (seekEntryOrOpen!0 (select (arr!20096 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756578 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336742 () Unit!26132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26132)

(assert (=> b!756578 (= lt!336742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65774 res!511638) b!756562))

(assert (= (and b!756562 res!511646) b!756571))

(assert (= (and b!756571 res!511643) b!756561))

(assert (= (and b!756561 res!511653) b!756564))

(assert (= (and b!756564 res!511639) b!756574))

(assert (= (and b!756574 res!511649) b!756556))

(assert (= (and b!756556 res!511644) b!756577))

(assert (= (and b!756577 res!511650) b!756575))

(assert (= (and b!756575 res!511651) b!756569))

(assert (= (and b!756569 res!511637) b!756573))

(assert (= (and b!756573 res!511642) b!756568))

(assert (= (and b!756568 c!82841) b!756572))

(assert (= (and b!756568 (not c!82841)) b!756570))

(assert (= (and b!756568 res!511635) b!756563))

(assert (= (and b!756563 res!511640) b!756578))

(assert (= (and b!756578 res!511641) b!756567))

(assert (= (and b!756578 (not res!511636)) b!756565))

(assert (= (and b!756565 (not res!511648)) b!756560))

(assert (= (and b!756560 (not res!511647)) b!756559))

(assert (= (and b!756559 c!82842) b!756558))

(assert (= (and b!756559 (not c!82842)) b!756557))

(assert (= (and b!756559 res!511652) b!756576))

(assert (= (and b!756576 res!511645) b!756566))

(declare-fun m!703913 () Bool)

(assert (=> start!65774 m!703913))

(declare-fun m!703915 () Bool)

(assert (=> start!65774 m!703915))

(declare-fun m!703917 () Bool)

(assert (=> b!756576 m!703917))

(declare-fun m!703919 () Bool)

(assert (=> b!756576 m!703919))

(declare-fun m!703921 () Bool)

(assert (=> b!756572 m!703921))

(assert (=> b!756572 m!703921))

(declare-fun m!703923 () Bool)

(assert (=> b!756572 m!703923))

(assert (=> b!756565 m!703921))

(assert (=> b!756565 m!703921))

(declare-fun m!703925 () Bool)

(assert (=> b!756565 m!703925))

(declare-fun m!703927 () Bool)

(assert (=> b!756560 m!703927))

(declare-fun m!703929 () Bool)

(assert (=> b!756560 m!703929))

(declare-fun m!703931 () Bool)

(assert (=> b!756574 m!703931))

(declare-fun m!703933 () Bool)

(assert (=> b!756573 m!703933))

(assert (=> b!756569 m!703921))

(assert (=> b!756569 m!703921))

(declare-fun m!703935 () Bool)

(assert (=> b!756569 m!703935))

(assert (=> b!756569 m!703935))

(assert (=> b!756569 m!703921))

(declare-fun m!703937 () Bool)

(assert (=> b!756569 m!703937))

(declare-fun m!703939 () Bool)

(assert (=> b!756577 m!703939))

(declare-fun m!703941 () Bool)

(assert (=> b!756563 m!703941))

(declare-fun m!703943 () Bool)

(assert (=> b!756563 m!703943))

(assert (=> b!756563 m!703927))

(declare-fun m!703945 () Bool)

(assert (=> b!756563 m!703945))

(assert (=> b!756563 m!703943))

(declare-fun m!703947 () Bool)

(assert (=> b!756563 m!703947))

(assert (=> b!756578 m!703921))

(assert (=> b!756578 m!703921))

(declare-fun m!703949 () Bool)

(assert (=> b!756578 m!703949))

(declare-fun m!703951 () Bool)

(assert (=> b!756578 m!703951))

(declare-fun m!703953 () Bool)

(assert (=> b!756578 m!703953))

(declare-fun m!703955 () Bool)

(assert (=> b!756556 m!703955))

(assert (=> b!756570 m!703921))

(assert (=> b!756570 m!703921))

(assert (=> b!756570 m!703925))

(assert (=> b!756567 m!703921))

(assert (=> b!756567 m!703921))

(declare-fun m!703957 () Bool)

(assert (=> b!756567 m!703957))

(declare-fun m!703959 () Bool)

(assert (=> b!756564 m!703959))

(declare-fun m!703961 () Bool)

(assert (=> b!756561 m!703961))

(assert (=> b!756571 m!703921))

(assert (=> b!756571 m!703921))

(declare-fun m!703963 () Bool)

(assert (=> b!756571 m!703963))

(check-sat (not b!756570) (not b!756572) (not b!756571) (not b!756563) (not b!756576) (not b!756565) (not b!756561) (not b!756574) (not b!756578) (not b!756564) (not b!756577) (not b!756567) (not b!756569) (not b!756556) (not start!65774))
(check-sat)
