; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64764 () Bool)

(assert start!64764)

(declare-fun b!728675 () Bool)

(declare-fun res!488808 () Bool)

(declare-fun e!407994 () Bool)

(assert (=> b!728675 (=> (not res!488808) (not e!407994))))

(declare-datatypes ((array!41083 0))(
  ( (array!41084 (arr!19657 (Array (_ BitVec 32) (_ BitVec 64))) (size!20077 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41083)

(declare-datatypes ((List!13566 0))(
  ( (Nil!13563) (Cons!13562 (h!14628 (_ BitVec 64)) (t!19873 List!13566)) )
))
(declare-fun arrayNoDuplicates!0 (array!41083 (_ BitVec 32) List!13566) Bool)

(assert (=> b!728675 (= res!488808 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13563))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!728676 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407989 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7213 0))(
  ( (MissingZero!7213 (index!31220 (_ BitVec 32))) (Found!7213 (index!31221 (_ BitVec 32))) (Intermediate!7213 (undefined!8025 Bool) (index!31222 (_ BitVec 32)) (x!62375 (_ BitVec 32))) (Undefined!7213) (MissingVacant!7213 (index!31223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!728676 (= e!407989 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) (Found!7213 j!159)))))

(declare-fun b!728677 () Bool)

(declare-fun res!488818 () Bool)

(assert (=> b!728677 (=> (not res!488818) (not e!407994))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728677 (= res!488818 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20077 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20077 a!3186))))))

(declare-fun b!728678 () Bool)

(declare-fun res!488813 () Bool)

(declare-fun e!407991 () Bool)

(assert (=> b!728678 (=> (not res!488813) (not e!407991))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728678 (= res!488813 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!488811 () Bool)

(assert (=> start!64764 (=> (not res!488811) (not e!407991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64764 (= res!488811 (validMask!0 mask!3328))))

(assert (=> start!64764 e!407991))

(assert (=> start!64764 true))

(declare-fun array_inv!15516 (array!41083) Bool)

(assert (=> start!64764 (array_inv!15516 a!3186)))

(declare-fun b!728679 () Bool)

(declare-fun e!407988 () Bool)

(declare-fun e!407986 () Bool)

(assert (=> b!728679 (= e!407988 (not e!407986))))

(declare-fun res!488820 () Bool)

(assert (=> b!728679 (=> res!488820 e!407986)))

(declare-fun lt!322722 () SeekEntryResult!7213)

(get-info :version)

(assert (=> b!728679 (= res!488820 (or (not ((_ is Intermediate!7213) lt!322722)) (bvsge x!1131 (x!62375 lt!322722))))))

(declare-fun e!407992 () Bool)

(assert (=> b!728679 e!407992))

(declare-fun res!488819 () Bool)

(assert (=> b!728679 (=> (not res!488819) (not e!407992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41083 (_ BitVec 32)) Bool)

(assert (=> b!728679 (= res!488819 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24823 0))(
  ( (Unit!24824) )
))
(declare-fun lt!322720 () Unit!24823)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24823)

(assert (=> b!728679 (= lt!322720 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728680 () Bool)

(declare-fun e!407993 () Bool)

(assert (=> b!728680 (= e!407993 e!407988)))

(declare-fun res!488810 () Bool)

(assert (=> b!728680 (=> (not res!488810) (not e!407988))))

(declare-fun lt!322728 () SeekEntryResult!7213)

(assert (=> b!728680 (= res!488810 (= lt!322728 lt!322722))))

(declare-fun lt!322724 () (_ BitVec 64))

(declare-fun lt!322726 () array!41083)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!728680 (= lt!322722 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322724 lt!322726 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728680 (= lt!322728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322724 mask!3328) lt!322724 lt!322726 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728680 (= lt!322724 (select (store (arr!19657 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728680 (= lt!322726 (array!41084 (store (arr!19657 a!3186) i!1173 k0!2102) (size!20077 a!3186)))))

(declare-fun b!728681 () Bool)

(declare-fun lt!322725 () SeekEntryResult!7213)

(assert (=> b!728681 (= e!407989 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322725))))

(declare-fun b!728682 () Bool)

(declare-fun e!407990 () Bool)

(assert (=> b!728682 (= e!407992 e!407990)))

(declare-fun res!488807 () Bool)

(assert (=> b!728682 (=> (not res!488807) (not e!407990))))

(declare-fun lt!322721 () SeekEntryResult!7213)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!728682 (= res!488807 (= (seekEntryOrOpen!0 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322721))))

(assert (=> b!728682 (= lt!322721 (Found!7213 j!159))))

(declare-fun b!728683 () Bool)

(assert (=> b!728683 (= e!407991 e!407994)))

(declare-fun res!488806 () Bool)

(assert (=> b!728683 (=> (not res!488806) (not e!407994))))

(declare-fun lt!322723 () SeekEntryResult!7213)

(assert (=> b!728683 (= res!488806 (or (= lt!322723 (MissingZero!7213 i!1173)) (= lt!322723 (MissingVacant!7213 i!1173))))))

(assert (=> b!728683 (= lt!322723 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728684 () Bool)

(assert (=> b!728684 (= e!407994 e!407993)))

(declare-fun res!488817 () Bool)

(assert (=> b!728684 (=> (not res!488817) (not e!407993))))

(assert (=> b!728684 (= res!488817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322725))))

(assert (=> b!728684 (= lt!322725 (Intermediate!7213 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728685 () Bool)

(declare-fun res!488815 () Bool)

(assert (=> b!728685 (=> (not res!488815) (not e!407991))))

(assert (=> b!728685 (= res!488815 (and (= (size!20077 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20077 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20077 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728686 () Bool)

(declare-fun res!488814 () Bool)

(assert (=> b!728686 (=> (not res!488814) (not e!407991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728686 (= res!488814 (validKeyInArray!0 (select (arr!19657 a!3186) j!159)))))

(declare-fun b!728687 () Bool)

(declare-fun res!488812 () Bool)

(assert (=> b!728687 (=> (not res!488812) (not e!407993))))

(assert (=> b!728687 (= res!488812 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19657 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728688 () Bool)

(declare-fun res!488809 () Bool)

(assert (=> b!728688 (=> (not res!488809) (not e!407991))))

(assert (=> b!728688 (= res!488809 (validKeyInArray!0 k0!2102))))

(declare-fun b!728689 () Bool)

(assert (=> b!728689 (= e!407990 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322721))))

(declare-fun b!728690 () Bool)

(declare-fun res!488821 () Bool)

(assert (=> b!728690 (=> (not res!488821) (not e!407993))))

(assert (=> b!728690 (= res!488821 e!407989)))

(declare-fun c!80312 () Bool)

(assert (=> b!728690 (= c!80312 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728691 () Bool)

(declare-fun res!488816 () Bool)

(assert (=> b!728691 (=> (not res!488816) (not e!407994))))

(assert (=> b!728691 (= res!488816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728692 () Bool)

(assert (=> b!728692 (= e!407986 true)))

(declare-fun lt!322727 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728692 (= lt!322727 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (= (and start!64764 res!488811) b!728685))

(assert (= (and b!728685 res!488815) b!728686))

(assert (= (and b!728686 res!488814) b!728688))

(assert (= (and b!728688 res!488809) b!728678))

(assert (= (and b!728678 res!488813) b!728683))

(assert (= (and b!728683 res!488806) b!728691))

(assert (= (and b!728691 res!488816) b!728675))

(assert (= (and b!728675 res!488808) b!728677))

(assert (= (and b!728677 res!488818) b!728684))

(assert (= (and b!728684 res!488817) b!728687))

(assert (= (and b!728687 res!488812) b!728690))

(assert (= (and b!728690 c!80312) b!728681))

(assert (= (and b!728690 (not c!80312)) b!728676))

(assert (= (and b!728690 res!488821) b!728680))

(assert (= (and b!728680 res!488810) b!728679))

(assert (= (and b!728679 res!488819) b!728682))

(assert (= (and b!728682 res!488807) b!728689))

(assert (= (and b!728679 (not res!488820)) b!728692))

(declare-fun m!682875 () Bool)

(assert (=> b!728689 m!682875))

(assert (=> b!728689 m!682875))

(declare-fun m!682877 () Bool)

(assert (=> b!728689 m!682877))

(assert (=> b!728684 m!682875))

(assert (=> b!728684 m!682875))

(declare-fun m!682879 () Bool)

(assert (=> b!728684 m!682879))

(assert (=> b!728684 m!682879))

(assert (=> b!728684 m!682875))

(declare-fun m!682881 () Bool)

(assert (=> b!728684 m!682881))

(assert (=> b!728676 m!682875))

(assert (=> b!728676 m!682875))

(declare-fun m!682883 () Bool)

(assert (=> b!728676 m!682883))

(declare-fun m!682885 () Bool)

(assert (=> b!728683 m!682885))

(declare-fun m!682887 () Bool)

(assert (=> b!728675 m!682887))

(declare-fun m!682889 () Bool)

(assert (=> start!64764 m!682889))

(declare-fun m!682891 () Bool)

(assert (=> start!64764 m!682891))

(declare-fun m!682893 () Bool)

(assert (=> b!728678 m!682893))

(declare-fun m!682895 () Bool)

(assert (=> b!728679 m!682895))

(declare-fun m!682897 () Bool)

(assert (=> b!728679 m!682897))

(assert (=> b!728686 m!682875))

(assert (=> b!728686 m!682875))

(declare-fun m!682899 () Bool)

(assert (=> b!728686 m!682899))

(assert (=> b!728682 m!682875))

(assert (=> b!728682 m!682875))

(declare-fun m!682901 () Bool)

(assert (=> b!728682 m!682901))

(declare-fun m!682903 () Bool)

(assert (=> b!728692 m!682903))

(declare-fun m!682905 () Bool)

(assert (=> b!728687 m!682905))

(declare-fun m!682907 () Bool)

(assert (=> b!728691 m!682907))

(declare-fun m!682909 () Bool)

(assert (=> b!728688 m!682909))

(assert (=> b!728681 m!682875))

(assert (=> b!728681 m!682875))

(declare-fun m!682911 () Bool)

(assert (=> b!728681 m!682911))

(declare-fun m!682913 () Bool)

(assert (=> b!728680 m!682913))

(declare-fun m!682915 () Bool)

(assert (=> b!728680 m!682915))

(assert (=> b!728680 m!682913))

(declare-fun m!682917 () Bool)

(assert (=> b!728680 m!682917))

(declare-fun m!682919 () Bool)

(assert (=> b!728680 m!682919))

(declare-fun m!682921 () Bool)

(assert (=> b!728680 m!682921))

(check-sat (not b!728686) (not b!728692) (not b!728688) (not b!728691) (not b!728676) (not b!728675) (not b!728680) (not b!728681) (not b!728678) (not b!728683) (not b!728682) (not b!728679) (not b!728689) (not start!64764) (not b!728684))
(check-sat)
