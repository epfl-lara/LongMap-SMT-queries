; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67894 () Bool)

(assert start!67894)

(declare-fun b!789723 () Bool)

(declare-fun res!534961 () Bool)

(declare-fun e!438934 () Bool)

(assert (=> b!789723 (=> (not res!534961) (not e!438934))))

(declare-datatypes ((array!42871 0))(
  ( (array!42872 (arr!20522 (Array (_ BitVec 32) (_ BitVec 64))) (size!20943 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42871)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789723 (= res!534961 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789724 () Bool)

(declare-fun res!534958 () Bool)

(assert (=> b!789724 (=> (not res!534958) (not e!438934))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!789724 (= res!534958 (and (= (size!20943 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20943 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20943 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!534968 () Bool)

(assert (=> start!67894 (=> (not res!534968) (not e!438934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67894 (= res!534968 (validMask!0 mask!3328))))

(assert (=> start!67894 e!438934))

(assert (=> start!67894 true))

(declare-fun array_inv!16318 (array!42871) Bool)

(assert (=> start!67894 (array_inv!16318 a!3186)))

(declare-fun b!789725 () Bool)

(declare-fun e!438936 () Bool)

(declare-fun e!438935 () Bool)

(assert (=> b!789725 (= e!438936 e!438935)))

(declare-fun res!534964 () Bool)

(assert (=> b!789725 (=> (not res!534964) (not e!438935))))

(declare-datatypes ((SeekEntryResult!8122 0))(
  ( (MissingZero!8122 (index!34856 (_ BitVec 32))) (Found!8122 (index!34857 (_ BitVec 32))) (Intermediate!8122 (undefined!8934 Bool) (index!34858 (_ BitVec 32)) (x!65791 (_ BitVec 32))) (Undefined!8122) (MissingVacant!8122 (index!34859 (_ BitVec 32))) )
))
(declare-fun lt!352427 () SeekEntryResult!8122)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789725 (= res!534964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20522 a!3186) j!159) mask!3328) (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352427))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789725 (= lt!352427 (Intermediate!8122 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789726 () Bool)

(declare-fun res!534959 () Bool)

(assert (=> b!789726 (=> (not res!534959) (not e!438936))))

(declare-datatypes ((List!14524 0))(
  ( (Nil!14521) (Cons!14520 (h!15646 (_ BitVec 64)) (t!20839 List!14524)) )
))
(declare-fun arrayNoDuplicates!0 (array!42871 (_ BitVec 32) List!14524) Bool)

(assert (=> b!789726 (= res!534959 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14521))))

(declare-fun b!789727 () Bool)

(declare-fun e!438927 () Bool)

(declare-fun e!438933 () Bool)

(assert (=> b!789727 (= e!438927 (not e!438933))))

(declare-fun res!534956 () Bool)

(assert (=> b!789727 (=> res!534956 e!438933)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352422 () SeekEntryResult!8122)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!789727 (= res!534956 (or (not (is-Intermediate!8122 lt!352422)) (bvslt x!1131 (x!65791 lt!352422)) (not (= x!1131 (x!65791 lt!352422))) (not (= index!1321 (index!34858 lt!352422)))))))

(declare-fun e!438931 () Bool)

(assert (=> b!789727 e!438931))

(declare-fun res!534955 () Bool)

(assert (=> b!789727 (=> (not res!534955) (not e!438931))))

(declare-fun lt!352419 () SeekEntryResult!8122)

(declare-fun lt!352426 () SeekEntryResult!8122)

(assert (=> b!789727 (= res!534955 (= lt!352419 lt!352426))))

(assert (=> b!789727 (= lt!352426 (Found!8122 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!789727 (= lt!352419 (seekEntryOrOpen!0 (select (arr!20522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42871 (_ BitVec 32)) Bool)

(assert (=> b!789727 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27376 0))(
  ( (Unit!27377) )
))
(declare-fun lt!352420 () Unit!27376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27376)

(assert (=> b!789727 (= lt!352420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789728 () Bool)

(declare-fun e!438928 () Unit!27376)

(declare-fun Unit!27378 () Unit!27376)

(assert (=> b!789728 (= e!438928 Unit!27378)))

(assert (=> b!789728 false))

(declare-fun b!789729 () Bool)

(declare-fun res!534960 () Bool)

(assert (=> b!789729 (=> (not res!534960) (not e!438935))))

(assert (=> b!789729 (= res!534960 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20522 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789730 () Bool)

(declare-fun res!534951 () Bool)

(assert (=> b!789730 (=> (not res!534951) (not e!438934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789730 (= res!534951 (validKeyInArray!0 (select (arr!20522 a!3186) j!159)))))

(declare-fun b!789731 () Bool)

(declare-fun res!534965 () Bool)

(assert (=> b!789731 (=> (not res!534965) (not e!438934))))

(assert (=> b!789731 (= res!534965 (validKeyInArray!0 k!2102))))

(declare-fun b!789732 () Bool)

(declare-fun e!438938 () Bool)

(declare-fun e!438930 () Bool)

(assert (=> b!789732 (= e!438938 e!438930)))

(declare-fun res!534967 () Bool)

(assert (=> b!789732 (=> res!534967 e!438930)))

(declare-fun lt!352416 () (_ BitVec 64))

(declare-fun lt!352415 () (_ BitVec 64))

(assert (=> b!789732 (= res!534967 (= lt!352416 lt!352415))))

(assert (=> b!789732 (= lt!352416 (select (store (arr!20522 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789733 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!789733 (= e!438931 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352426))))

(declare-fun b!789734 () Bool)

(declare-fun res!534963 () Bool)

(assert (=> b!789734 (=> (not res!534963) (not e!438936))))

(assert (=> b!789734 (= res!534963 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20943 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20943 a!3186))))))

(declare-fun b!789735 () Bool)

(declare-fun Unit!27379 () Unit!27376)

(assert (=> b!789735 (= e!438928 Unit!27379)))

(declare-fun b!789736 () Bool)

(declare-fun e!438929 () Bool)

(assert (=> b!789736 (= e!438929 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) (Found!8122 j!159)))))

(declare-fun b!789737 () Bool)

(declare-fun e!438932 () Bool)

(assert (=> b!789737 (= e!438932 true)))

(declare-fun lt!352413 () SeekEntryResult!8122)

(declare-fun lt!352414 () SeekEntryResult!8122)

(assert (=> b!789737 (= lt!352413 lt!352414)))

(declare-fun lt!352425 () Unit!27376)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42871 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27376)

(assert (=> b!789737 (= lt!352425 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789738 () Bool)

(declare-fun res!534952 () Bool)

(assert (=> b!789738 (=> (not res!534952) (not e!438935))))

(assert (=> b!789738 (= res!534952 e!438929)))

(declare-fun c!87795 () Bool)

(assert (=> b!789738 (= c!87795 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789739 () Bool)

(declare-fun res!534957 () Bool)

(assert (=> b!789739 (=> (not res!534957) (not e!438936))))

(assert (=> b!789739 (= res!534957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789740 () Bool)

(assert (=> b!789740 (= e!438934 e!438936)))

(declare-fun res!534966 () Bool)

(assert (=> b!789740 (=> (not res!534966) (not e!438936))))

(declare-fun lt!352418 () SeekEntryResult!8122)

(assert (=> b!789740 (= res!534966 (or (= lt!352418 (MissingZero!8122 i!1173)) (= lt!352418 (MissingVacant!8122 i!1173))))))

(assert (=> b!789740 (= lt!352418 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789741 () Bool)

(assert (=> b!789741 (= e!438929 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352427))))

(declare-fun b!789742 () Bool)

(assert (=> b!789742 (= e!438933 e!438938)))

(declare-fun res!534953 () Bool)

(assert (=> b!789742 (=> res!534953 e!438938)))

(assert (=> b!789742 (= res!534953 (not (= lt!352414 lt!352426)))))

(assert (=> b!789742 (= lt!352414 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789743 () Bool)

(assert (=> b!789743 (= e!438930 e!438932)))

(declare-fun res!534962 () Bool)

(assert (=> b!789743 (=> res!534962 e!438932)))

(assert (=> b!789743 (= res!534962 (or (not (= (select (arr!20522 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352421 () SeekEntryResult!8122)

(assert (=> b!789743 (and (= lt!352421 lt!352413) (= lt!352419 lt!352414))))

(declare-fun lt!352424 () array!42871)

(assert (=> b!789743 (= lt!352413 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352415 lt!352424 mask!3328))))

(assert (=> b!789743 (= lt!352421 (seekEntryOrOpen!0 lt!352415 lt!352424 mask!3328))))

(assert (=> b!789743 (= lt!352416 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352417 () Unit!27376)

(assert (=> b!789743 (= lt!352417 e!438928)))

(declare-fun c!87796 () Bool)

(assert (=> b!789743 (= c!87796 (= lt!352416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789744 () Bool)

(assert (=> b!789744 (= e!438935 e!438927)))

(declare-fun res!534954 () Bool)

(assert (=> b!789744 (=> (not res!534954) (not e!438927))))

(declare-fun lt!352423 () SeekEntryResult!8122)

(assert (=> b!789744 (= res!534954 (= lt!352423 lt!352422))))

(assert (=> b!789744 (= lt!352422 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352415 lt!352424 mask!3328))))

(assert (=> b!789744 (= lt!352423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352415 mask!3328) lt!352415 lt!352424 mask!3328))))

(assert (=> b!789744 (= lt!352415 (select (store (arr!20522 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789744 (= lt!352424 (array!42872 (store (arr!20522 a!3186) i!1173 k!2102) (size!20943 a!3186)))))

(assert (= (and start!67894 res!534968) b!789724))

(assert (= (and b!789724 res!534958) b!789730))

(assert (= (and b!789730 res!534951) b!789731))

(assert (= (and b!789731 res!534965) b!789723))

(assert (= (and b!789723 res!534961) b!789740))

(assert (= (and b!789740 res!534966) b!789739))

(assert (= (and b!789739 res!534957) b!789726))

(assert (= (and b!789726 res!534959) b!789734))

(assert (= (and b!789734 res!534963) b!789725))

(assert (= (and b!789725 res!534964) b!789729))

(assert (= (and b!789729 res!534960) b!789738))

(assert (= (and b!789738 c!87795) b!789741))

(assert (= (and b!789738 (not c!87795)) b!789736))

(assert (= (and b!789738 res!534952) b!789744))

(assert (= (and b!789744 res!534954) b!789727))

(assert (= (and b!789727 res!534955) b!789733))

(assert (= (and b!789727 (not res!534956)) b!789742))

(assert (= (and b!789742 (not res!534953)) b!789732))

(assert (= (and b!789732 (not res!534967)) b!789743))

(assert (= (and b!789743 c!87796) b!789728))

(assert (= (and b!789743 (not c!87796)) b!789735))

(assert (= (and b!789743 (not res!534962)) b!789737))

(declare-fun m!730749 () Bool)

(assert (=> b!789729 m!730749))

(declare-fun m!730751 () Bool)

(assert (=> b!789744 m!730751))

(declare-fun m!730753 () Bool)

(assert (=> b!789744 m!730753))

(declare-fun m!730755 () Bool)

(assert (=> b!789744 m!730755))

(declare-fun m!730757 () Bool)

(assert (=> b!789744 m!730757))

(declare-fun m!730759 () Bool)

(assert (=> b!789744 m!730759))

(assert (=> b!789744 m!730757))

(declare-fun m!730761 () Bool)

(assert (=> b!789740 m!730761))

(declare-fun m!730763 () Bool)

(assert (=> b!789726 m!730763))

(declare-fun m!730765 () Bool)

(assert (=> b!789731 m!730765))

(declare-fun m!730767 () Bool)

(assert (=> start!67894 m!730767))

(declare-fun m!730769 () Bool)

(assert (=> start!67894 m!730769))

(declare-fun m!730771 () Bool)

(assert (=> b!789725 m!730771))

(assert (=> b!789725 m!730771))

(declare-fun m!730773 () Bool)

(assert (=> b!789725 m!730773))

(assert (=> b!789725 m!730773))

(assert (=> b!789725 m!730771))

(declare-fun m!730775 () Bool)

(assert (=> b!789725 m!730775))

(declare-fun m!730777 () Bool)

(assert (=> b!789723 m!730777))

(declare-fun m!730779 () Bool)

(assert (=> b!789743 m!730779))

(declare-fun m!730781 () Bool)

(assert (=> b!789743 m!730781))

(declare-fun m!730783 () Bool)

(assert (=> b!789743 m!730783))

(assert (=> b!789733 m!730771))

(assert (=> b!789733 m!730771))

(declare-fun m!730785 () Bool)

(assert (=> b!789733 m!730785))

(assert (=> b!789741 m!730771))

(assert (=> b!789741 m!730771))

(declare-fun m!730787 () Bool)

(assert (=> b!789741 m!730787))

(assert (=> b!789736 m!730771))

(assert (=> b!789736 m!730771))

(declare-fun m!730789 () Bool)

(assert (=> b!789736 m!730789))

(declare-fun m!730791 () Bool)

(assert (=> b!789739 m!730791))

(declare-fun m!730793 () Bool)

(assert (=> b!789737 m!730793))

(assert (=> b!789742 m!730771))

(assert (=> b!789742 m!730771))

(assert (=> b!789742 m!730789))

(assert (=> b!789727 m!730771))

(assert (=> b!789727 m!730771))

(declare-fun m!730795 () Bool)

(assert (=> b!789727 m!730795))

(declare-fun m!730797 () Bool)

(assert (=> b!789727 m!730797))

(declare-fun m!730799 () Bool)

(assert (=> b!789727 m!730799))

(assert (=> b!789732 m!730753))

(declare-fun m!730801 () Bool)

(assert (=> b!789732 m!730801))

(assert (=> b!789730 m!730771))

(assert (=> b!789730 m!730771))

(declare-fun m!730803 () Bool)

(assert (=> b!789730 m!730803))

(push 1)

(assert (not b!789726))

(assert (not b!789736))

(assert (not b!789725))

(assert (not b!789743))

(assert (not b!789723))

(assert (not b!789741))

(assert (not b!789739))

(assert (not b!789727))

(assert (not b!789744))

(assert (not b!789742))

(assert (not b!789740))

(assert (not b!789731))

(assert (not b!789737))

(assert (not b!789730))

(assert (not b!789733))

(assert (not start!67894))

(check-sat)

