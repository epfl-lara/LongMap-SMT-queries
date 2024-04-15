; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67094 () Bool)

(assert start!67094)

(declare-fun b!774722 () Bool)

(declare-fun e!431196 () Bool)

(declare-fun e!431197 () Bool)

(assert (=> b!774722 (= e!431196 e!431197)))

(declare-fun res!523912 () Bool)

(assert (=> b!774722 (=> (not res!523912) (not e!431197))))

(declare-datatypes ((array!42468 0))(
  ( (array!42469 (arr!20330 (Array (_ BitVec 32) (_ BitVec 64))) (size!20751 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42468)

(declare-datatypes ((SeekEntryResult!7927 0))(
  ( (MissingZero!7927 (index!34076 (_ BitVec 32))) (Found!7927 (index!34077 (_ BitVec 32))) (Intermediate!7927 (undefined!8739 Bool) (index!34078 (_ BitVec 32)) (x!65033 (_ BitVec 32))) (Undefined!7927) (MissingVacant!7927 (index!34079 (_ BitVec 32))) )
))
(declare-fun lt!344940 () SeekEntryResult!7927)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42468 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774722 (= res!523912 (= (seekEntryOrOpen!0 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344940))))

(assert (=> b!774722 (= lt!344940 (Found!7927 j!159))))

(declare-fun b!774723 () Bool)

(declare-datatypes ((Unit!26702 0))(
  ( (Unit!26703) )
))
(declare-fun e!431206 () Unit!26702)

(declare-fun Unit!26704 () Unit!26702)

(assert (=> b!774723 (= e!431206 Unit!26704)))

(declare-fun lt!344939 () (_ BitVec 32))

(declare-fun lt!344937 () SeekEntryResult!7927)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42468 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774723 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344939 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344937)))

(declare-fun b!774724 () Bool)

(declare-fun res!523909 () Bool)

(declare-fun e!431202 () Bool)

(assert (=> b!774724 (=> (not res!523909) (not e!431202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774724 (= res!523909 (validKeyInArray!0 (select (arr!20330 a!3186) j!159)))))

(declare-fun b!774725 () Bool)

(declare-fun res!523913 () Bool)

(declare-fun e!431199 () Bool)

(assert (=> b!774725 (=> res!523913 e!431199)))

(declare-fun lt!344934 () (_ BitVec 64))

(declare-fun lt!344936 () SeekEntryResult!7927)

(declare-fun lt!344933 () array!42468)

(assert (=> b!774725 (= res!523913 (not (= lt!344936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344939 lt!344934 lt!344933 mask!3328))))))

(declare-fun b!774726 () Bool)

(assert (=> b!774726 (= e!431199 true)))

(declare-fun lt!344942 () SeekEntryResult!7927)

(assert (=> b!774726 (= (seekEntryOrOpen!0 lt!344934 lt!344933 mask!3328) lt!344942)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!344932 () Unit!26702)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26702)

(assert (=> b!774726 (= lt!344932 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!344939 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774728 () Bool)

(declare-fun res!523911 () Bool)

(assert (=> b!774728 (=> res!523911 e!431199)))

(declare-fun e!431205 () Bool)

(assert (=> b!774728 (= res!523911 e!431205)))

(declare-fun c!85808 () Bool)

(declare-fun lt!344943 () Bool)

(assert (=> b!774728 (= c!85808 lt!344943)))

(declare-fun b!774729 () Bool)

(declare-fun e!431200 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42468 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774729 (= e!431200 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) (Found!7927 j!159)))))

(declare-fun b!774730 () Bool)

(assert (=> b!774730 (= e!431197 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344940))))

(declare-fun b!774731 () Bool)

(declare-fun res!523914 () Bool)

(assert (=> b!774731 (=> (not res!523914) (not e!431202))))

(assert (=> b!774731 (= res!523914 (and (= (size!20751 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20751 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20751 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774732 () Bool)

(declare-fun res!523921 () Bool)

(assert (=> b!774732 (=> (not res!523921) (not e!431202))))

(declare-fun arrayContainsKey!0 (array!42468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774732 (= res!523921 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774733 () Bool)

(declare-fun res!523915 () Bool)

(declare-fun e!431198 () Bool)

(assert (=> b!774733 (=> (not res!523915) (not e!431198))))

(assert (=> b!774733 (= res!523915 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20751 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20751 a!3186))))))

(declare-fun b!774734 () Bool)

(declare-fun e!431195 () Bool)

(assert (=> b!774734 (= e!431195 e!431199)))

(declare-fun res!523908 () Bool)

(assert (=> b!774734 (=> res!523908 e!431199)))

(assert (=> b!774734 (= res!523908 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344939 #b00000000000000000000000000000000) (bvsge lt!344939 (size!20751 a!3186))))))

(declare-fun lt!344945 () Unit!26702)

(assert (=> b!774734 (= lt!344945 e!431206)))

(declare-fun c!85807 () Bool)

(assert (=> b!774734 (= c!85807 lt!344943)))

(assert (=> b!774734 (= lt!344943 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774734 (= lt!344939 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774735 () Bool)

(assert (=> b!774735 (= e!431200 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344937))))

(declare-fun b!774736 () Bool)

(assert (=> b!774736 (= e!431202 e!431198)))

(declare-fun res!523917 () Bool)

(assert (=> b!774736 (=> (not res!523917) (not e!431198))))

(declare-fun lt!344938 () SeekEntryResult!7927)

(assert (=> b!774736 (= res!523917 (or (= lt!344938 (MissingZero!7927 i!1173)) (= lt!344938 (MissingVacant!7927 i!1173))))))

(assert (=> b!774736 (= lt!344938 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774737 () Bool)

(assert (=> b!774737 (= e!431205 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344939 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344937)))))

(declare-fun b!774738 () Bool)

(declare-fun res!523919 () Bool)

(declare-fun e!431204 () Bool)

(assert (=> b!774738 (=> (not res!523919) (not e!431204))))

(assert (=> b!774738 (= res!523919 e!431200)))

(declare-fun c!85809 () Bool)

(assert (=> b!774738 (= c!85809 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!523926 () Bool)

(assert (=> start!67094 (=> (not res!523926) (not e!431202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67094 (= res!523926 (validMask!0 mask!3328))))

(assert (=> start!67094 e!431202))

(assert (=> start!67094 true))

(declare-fun array_inv!16213 (array!42468) Bool)

(assert (=> start!67094 (array_inv!16213 a!3186)))

(declare-fun b!774727 () Bool)

(declare-fun res!523910 () Bool)

(assert (=> b!774727 (=> (not res!523910) (not e!431202))))

(assert (=> b!774727 (= res!523910 (validKeyInArray!0 k0!2102))))

(declare-fun b!774739 () Bool)

(declare-fun res!523918 () Bool)

(assert (=> b!774739 (=> (not res!523918) (not e!431198))))

(declare-datatypes ((List!14371 0))(
  ( (Nil!14368) (Cons!14367 (h!15475 (_ BitVec 64)) (t!20677 List!14371)) )
))
(declare-fun arrayNoDuplicates!0 (array!42468 (_ BitVec 32) List!14371) Bool)

(assert (=> b!774739 (= res!523918 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14368))))

(declare-fun b!774740 () Bool)

(declare-fun Unit!26705 () Unit!26702)

(assert (=> b!774740 (= e!431206 Unit!26705)))

(declare-fun lt!344944 () SeekEntryResult!7927)

(assert (=> b!774740 (= lt!344944 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774740 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344939 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344942)))

(declare-fun b!774741 () Bool)

(declare-fun e!431203 () Bool)

(assert (=> b!774741 (= e!431203 (not e!431195))))

(declare-fun res!523924 () Bool)

(assert (=> b!774741 (=> res!523924 e!431195)))

(declare-fun lt!344935 () SeekEntryResult!7927)

(get-info :version)

(assert (=> b!774741 (= res!523924 (or (not ((_ is Intermediate!7927) lt!344935)) (bvsge x!1131 (x!65033 lt!344935))))))

(assert (=> b!774741 (= lt!344942 (Found!7927 j!159))))

(assert (=> b!774741 e!431196))

(declare-fun res!523916 () Bool)

(assert (=> b!774741 (=> (not res!523916) (not e!431196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42468 (_ BitVec 32)) Bool)

(assert (=> b!774741 (= res!523916 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344941 () Unit!26702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26702)

(assert (=> b!774741 (= lt!344941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774742 () Bool)

(declare-fun res!523922 () Bool)

(assert (=> b!774742 (=> (not res!523922) (not e!431204))))

(assert (=> b!774742 (= res!523922 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20330 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774743 () Bool)

(assert (=> b!774743 (= e!431198 e!431204)))

(declare-fun res!523920 () Bool)

(assert (=> b!774743 (=> (not res!523920) (not e!431204))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774743 (= res!523920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20330 a!3186) j!159) mask!3328) (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344937))))

(assert (=> b!774743 (= lt!344937 (Intermediate!7927 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774744 () Bool)

(declare-fun res!523923 () Bool)

(assert (=> b!774744 (=> (not res!523923) (not e!431198))))

(assert (=> b!774744 (= res!523923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774745 () Bool)

(assert (=> b!774745 (= e!431205 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344939 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!344942)))))

(declare-fun b!774746 () Bool)

(assert (=> b!774746 (= e!431204 e!431203)))

(declare-fun res!523925 () Bool)

(assert (=> b!774746 (=> (not res!523925) (not e!431203))))

(assert (=> b!774746 (= res!523925 (= lt!344936 lt!344935))))

(assert (=> b!774746 (= lt!344935 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344934 lt!344933 mask!3328))))

(assert (=> b!774746 (= lt!344936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344934 mask!3328) lt!344934 lt!344933 mask!3328))))

(assert (=> b!774746 (= lt!344934 (select (store (arr!20330 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774746 (= lt!344933 (array!42469 (store (arr!20330 a!3186) i!1173 k0!2102) (size!20751 a!3186)))))

(assert (= (and start!67094 res!523926) b!774731))

(assert (= (and b!774731 res!523914) b!774724))

(assert (= (and b!774724 res!523909) b!774727))

(assert (= (and b!774727 res!523910) b!774732))

(assert (= (and b!774732 res!523921) b!774736))

(assert (= (and b!774736 res!523917) b!774744))

(assert (= (and b!774744 res!523923) b!774739))

(assert (= (and b!774739 res!523918) b!774733))

(assert (= (and b!774733 res!523915) b!774743))

(assert (= (and b!774743 res!523920) b!774742))

(assert (= (and b!774742 res!523922) b!774738))

(assert (= (and b!774738 c!85809) b!774735))

(assert (= (and b!774738 (not c!85809)) b!774729))

(assert (= (and b!774738 res!523919) b!774746))

(assert (= (and b!774746 res!523925) b!774741))

(assert (= (and b!774741 res!523916) b!774722))

(assert (= (and b!774722 res!523912) b!774730))

(assert (= (and b!774741 (not res!523924)) b!774734))

(assert (= (and b!774734 c!85807) b!774723))

(assert (= (and b!774734 (not c!85807)) b!774740))

(assert (= (and b!774734 (not res!523908)) b!774728))

(assert (= (and b!774728 c!85808) b!774737))

(assert (= (and b!774728 (not c!85808)) b!774745))

(assert (= (and b!774728 (not res!523911)) b!774725))

(assert (= (and b!774725 (not res!523913)) b!774726))

(declare-fun m!718545 () Bool)

(assert (=> b!774729 m!718545))

(assert (=> b!774729 m!718545))

(declare-fun m!718547 () Bool)

(assert (=> b!774729 m!718547))

(assert (=> b!774740 m!718545))

(assert (=> b!774740 m!718545))

(assert (=> b!774740 m!718547))

(assert (=> b!774740 m!718545))

(declare-fun m!718549 () Bool)

(assert (=> b!774740 m!718549))

(declare-fun m!718551 () Bool)

(assert (=> b!774744 m!718551))

(declare-fun m!718553 () Bool)

(assert (=> b!774725 m!718553))

(declare-fun m!718555 () Bool)

(assert (=> start!67094 m!718555))

(declare-fun m!718557 () Bool)

(assert (=> start!67094 m!718557))

(declare-fun m!718559 () Bool)

(assert (=> b!774742 m!718559))

(assert (=> b!774745 m!718545))

(assert (=> b!774745 m!718545))

(assert (=> b!774745 m!718549))

(declare-fun m!718561 () Bool)

(assert (=> b!774732 m!718561))

(assert (=> b!774737 m!718545))

(assert (=> b!774737 m!718545))

(declare-fun m!718563 () Bool)

(assert (=> b!774737 m!718563))

(declare-fun m!718565 () Bool)

(assert (=> b!774741 m!718565))

(declare-fun m!718567 () Bool)

(assert (=> b!774741 m!718567))

(declare-fun m!718569 () Bool)

(assert (=> b!774734 m!718569))

(assert (=> b!774730 m!718545))

(assert (=> b!774730 m!718545))

(declare-fun m!718571 () Bool)

(assert (=> b!774730 m!718571))

(declare-fun m!718573 () Bool)

(assert (=> b!774726 m!718573))

(declare-fun m!718575 () Bool)

(assert (=> b!774726 m!718575))

(declare-fun m!718577 () Bool)

(assert (=> b!774727 m!718577))

(declare-fun m!718579 () Bool)

(assert (=> b!774736 m!718579))

(assert (=> b!774743 m!718545))

(assert (=> b!774743 m!718545))

(declare-fun m!718581 () Bool)

(assert (=> b!774743 m!718581))

(assert (=> b!774743 m!718581))

(assert (=> b!774743 m!718545))

(declare-fun m!718583 () Bool)

(assert (=> b!774743 m!718583))

(declare-fun m!718585 () Bool)

(assert (=> b!774746 m!718585))

(declare-fun m!718587 () Bool)

(assert (=> b!774746 m!718587))

(declare-fun m!718589 () Bool)

(assert (=> b!774746 m!718589))

(declare-fun m!718591 () Bool)

(assert (=> b!774746 m!718591))

(assert (=> b!774746 m!718587))

(declare-fun m!718593 () Bool)

(assert (=> b!774746 m!718593))

(assert (=> b!774724 m!718545))

(assert (=> b!774724 m!718545))

(declare-fun m!718595 () Bool)

(assert (=> b!774724 m!718595))

(declare-fun m!718597 () Bool)

(assert (=> b!774739 m!718597))

(assert (=> b!774723 m!718545))

(assert (=> b!774723 m!718545))

(assert (=> b!774723 m!718563))

(assert (=> b!774722 m!718545))

(assert (=> b!774722 m!718545))

(declare-fun m!718599 () Bool)

(assert (=> b!774722 m!718599))

(assert (=> b!774735 m!718545))

(assert (=> b!774735 m!718545))

(declare-fun m!718601 () Bool)

(assert (=> b!774735 m!718601))

(check-sat (not b!774746) (not b!774727) (not b!774725) (not b!774740) (not b!774737) (not b!774729) (not b!774722) (not b!774739) (not b!774724) (not b!774723) (not b!774736) (not b!774734) (not b!774726) (not start!67094) (not b!774730) (not b!774744) (not b!774745) (not b!774741) (not b!774743) (not b!774735) (not b!774732))
(check-sat)
