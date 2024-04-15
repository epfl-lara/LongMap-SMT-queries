; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65246 () Bool)

(assert start!65246)

(declare-fun b!740117 () Bool)

(declare-fun res!497773 () Bool)

(declare-fun e!413778 () Bool)

(assert (=> b!740117 (=> (not res!497773) (not e!413778))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41436 0))(
  ( (array!41437 (arr!19832 (Array (_ BitVec 32) (_ BitVec 64))) (size!20253 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41436)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740117 (= res!497773 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20253 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20253 a!3186))))))

(declare-fun b!740118 () Bool)

(declare-fun res!497775 () Bool)

(declare-fun e!413777 () Bool)

(assert (=> b!740118 (=> (not res!497775) (not e!413777))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!740118 (= res!497775 (and (= (size!20253 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20253 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20253 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740119 () Bool)

(declare-fun e!413781 () Bool)

(declare-fun e!413786 () Bool)

(assert (=> b!740119 (= e!413781 e!413786)))

(declare-fun res!497784 () Bool)

(assert (=> b!740119 (=> (not res!497784) (not e!413786))))

(declare-datatypes ((SeekEntryResult!7429 0))(
  ( (MissingZero!7429 (index!32084 (_ BitVec 32))) (Found!7429 (index!32085 (_ BitVec 32))) (Intermediate!7429 (undefined!8241 Bool) (index!32086 (_ BitVec 32)) (x!63078 (_ BitVec 32))) (Undefined!7429) (MissingVacant!7429 (index!32087 (_ BitVec 32))) )
))
(declare-fun lt!328643 () SeekEntryResult!7429)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41436 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740119 (= res!497784 (= (seekEntryOrOpen!0 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328643))))

(assert (=> b!740119 (= lt!328643 (Found!7429 j!159))))

(declare-fun b!740120 () Bool)

(declare-fun res!497771 () Bool)

(assert (=> b!740120 (=> (not res!497771) (not e!413777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740120 (= res!497771 (validKeyInArray!0 (select (arr!19832 a!3186) j!159)))))

(declare-fun b!740121 () Bool)

(declare-fun res!497777 () Bool)

(declare-fun e!413779 () Bool)

(assert (=> b!740121 (=> res!497777 e!413779)))

(declare-fun lt!328648 () (_ BitVec 64))

(declare-fun lt!328649 () array!41436)

(declare-fun lt!328652 () SeekEntryResult!7429)

(declare-fun lt!328655 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41436 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740121 (= res!497777 (not (= lt!328652 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328655 lt!328648 lt!328649 mask!3328))))))

(declare-fun b!740122 () Bool)

(declare-fun res!497772 () Bool)

(assert (=> b!740122 (=> res!497772 e!413779)))

(declare-fun e!413788 () Bool)

(assert (=> b!740122 (= res!497772 e!413788)))

(declare-fun c!81557 () Bool)

(declare-fun lt!328650 () Bool)

(assert (=> b!740122 (= c!81557 lt!328650)))

(declare-fun b!740123 () Bool)

(assert (=> b!740123 (= e!413777 e!413778)))

(declare-fun res!497776 () Bool)

(assert (=> b!740123 (=> (not res!497776) (not e!413778))))

(declare-fun lt!328654 () SeekEntryResult!7429)

(assert (=> b!740123 (= res!497776 (or (= lt!328654 (MissingZero!7429 i!1173)) (= lt!328654 (MissingVacant!7429 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!740123 (= lt!328654 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!413780 () Bool)

(declare-fun b!740124 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41436 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740124 (= e!413780 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) (Found!7429 j!159)))))

(declare-fun b!740125 () Bool)

(declare-fun res!497770 () Bool)

(assert (=> b!740125 (=> (not res!497770) (not e!413778))))

(declare-datatypes ((List!13873 0))(
  ( (Nil!13870) (Cons!13869 (h!14941 (_ BitVec 64)) (t!20179 List!13873)) )
))
(declare-fun arrayNoDuplicates!0 (array!41436 (_ BitVec 32) List!13873) Bool)

(assert (=> b!740125 (= res!497770 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13870))))

(declare-fun b!740126 () Bool)

(declare-fun res!497766 () Bool)

(declare-fun e!413782 () Bool)

(assert (=> b!740126 (=> (not res!497766) (not e!413782))))

(assert (=> b!740126 (= res!497766 e!413780)))

(declare-fun c!81558 () Bool)

(assert (=> b!740126 (= c!81558 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740127 () Bool)

(declare-fun e!413783 () Bool)

(declare-fun e!413785 () Bool)

(assert (=> b!740127 (= e!413783 (not e!413785))))

(declare-fun res!497774 () Bool)

(assert (=> b!740127 (=> res!497774 e!413785)))

(declare-fun lt!328653 () SeekEntryResult!7429)

(get-info :version)

(assert (=> b!740127 (= res!497774 (or (not ((_ is Intermediate!7429) lt!328653)) (bvsge x!1131 (x!63078 lt!328653))))))

(declare-fun lt!328646 () SeekEntryResult!7429)

(assert (=> b!740127 (= lt!328646 (Found!7429 j!159))))

(assert (=> b!740127 e!413781))

(declare-fun res!497782 () Bool)

(assert (=> b!740127 (=> (not res!497782) (not e!413781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41436 (_ BitVec 32)) Bool)

(assert (=> b!740127 (= res!497782 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25292 0))(
  ( (Unit!25293) )
))
(declare-fun lt!328642 () Unit!25292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25292)

(assert (=> b!740127 (= lt!328642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740128 () Bool)

(assert (=> b!740128 (= e!413779 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!740128 (= (seekEntryOrOpen!0 lt!328648 lt!328649 mask!3328) lt!328646)))

(declare-fun lt!328645 () Unit!25292)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25292)

(assert (=> b!740128 (= lt!328645 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328655 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740129 () Bool)

(declare-fun e!413784 () Unit!25292)

(declare-fun Unit!25294 () Unit!25292)

(assert (=> b!740129 (= e!413784 Unit!25294)))

(declare-fun lt!328647 () SeekEntryResult!7429)

(assert (=> b!740129 (= lt!328647 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740129 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328655 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328646)))

(declare-fun res!497778 () Bool)

(assert (=> start!65246 (=> (not res!497778) (not e!413777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65246 (= res!497778 (validMask!0 mask!3328))))

(assert (=> start!65246 e!413777))

(assert (=> start!65246 true))

(declare-fun array_inv!15715 (array!41436) Bool)

(assert (=> start!65246 (array_inv!15715 a!3186)))

(declare-fun b!740130 () Bool)

(declare-fun lt!328651 () SeekEntryResult!7429)

(assert (=> b!740130 (= e!413788 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328655 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328651)))))

(declare-fun b!740131 () Bool)

(assert (=> b!740131 (= e!413782 e!413783)))

(declare-fun res!497783 () Bool)

(assert (=> b!740131 (=> (not res!497783) (not e!413783))))

(assert (=> b!740131 (= res!497783 (= lt!328652 lt!328653))))

(assert (=> b!740131 (= lt!328653 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328648 lt!328649 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740131 (= lt!328652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328648 mask!3328) lt!328648 lt!328649 mask!3328))))

(assert (=> b!740131 (= lt!328648 (select (store (arr!19832 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740131 (= lt!328649 (array!41437 (store (arr!19832 a!3186) i!1173 k0!2102) (size!20253 a!3186)))))

(declare-fun b!740132 () Bool)

(declare-fun res!497768 () Bool)

(assert (=> b!740132 (=> (not res!497768) (not e!413777))))

(assert (=> b!740132 (= res!497768 (validKeyInArray!0 k0!2102))))

(declare-fun b!740133 () Bool)

(assert (=> b!740133 (= e!413778 e!413782)))

(declare-fun res!497779 () Bool)

(assert (=> b!740133 (=> (not res!497779) (not e!413782))))

(assert (=> b!740133 (= res!497779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19832 a!3186) j!159) mask!3328) (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328651))))

(assert (=> b!740133 (= lt!328651 (Intermediate!7429 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740134 () Bool)

(assert (=> b!740134 (= e!413785 e!413779)))

(declare-fun res!497780 () Bool)

(assert (=> b!740134 (=> res!497780 e!413779)))

(assert (=> b!740134 (= res!497780 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328655 #b00000000000000000000000000000000) (bvsge lt!328655 (size!20253 a!3186))))))

(declare-fun lt!328644 () Unit!25292)

(assert (=> b!740134 (= lt!328644 e!413784)))

(declare-fun c!81556 () Bool)

(assert (=> b!740134 (= c!81556 lt!328650)))

(assert (=> b!740134 (= lt!328650 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740134 (= lt!328655 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740135 () Bool)

(assert (=> b!740135 (= e!413788 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328655 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328646)))))

(declare-fun b!740136 () Bool)

(assert (=> b!740136 (= e!413780 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328651))))

(declare-fun b!740137 () Bool)

(declare-fun res!497767 () Bool)

(assert (=> b!740137 (=> (not res!497767) (not e!413782))))

(assert (=> b!740137 (= res!497767 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19832 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740138 () Bool)

(declare-fun Unit!25295 () Unit!25292)

(assert (=> b!740138 (= e!413784 Unit!25295)))

(assert (=> b!740138 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328655 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328651)))

(declare-fun b!740139 () Bool)

(assert (=> b!740139 (= e!413786 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328643))))

(declare-fun b!740140 () Bool)

(declare-fun res!497781 () Bool)

(assert (=> b!740140 (=> (not res!497781) (not e!413778))))

(assert (=> b!740140 (= res!497781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740141 () Bool)

(declare-fun res!497769 () Bool)

(assert (=> b!740141 (=> (not res!497769) (not e!413777))))

(declare-fun arrayContainsKey!0 (array!41436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740141 (= res!497769 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65246 res!497778) b!740118))

(assert (= (and b!740118 res!497775) b!740120))

(assert (= (and b!740120 res!497771) b!740132))

(assert (= (and b!740132 res!497768) b!740141))

(assert (= (and b!740141 res!497769) b!740123))

(assert (= (and b!740123 res!497776) b!740140))

(assert (= (and b!740140 res!497781) b!740125))

(assert (= (and b!740125 res!497770) b!740117))

(assert (= (and b!740117 res!497773) b!740133))

(assert (= (and b!740133 res!497779) b!740137))

(assert (= (and b!740137 res!497767) b!740126))

(assert (= (and b!740126 c!81558) b!740136))

(assert (= (and b!740126 (not c!81558)) b!740124))

(assert (= (and b!740126 res!497766) b!740131))

(assert (= (and b!740131 res!497783) b!740127))

(assert (= (and b!740127 res!497782) b!740119))

(assert (= (and b!740119 res!497784) b!740139))

(assert (= (and b!740127 (not res!497774)) b!740134))

(assert (= (and b!740134 c!81556) b!740138))

(assert (= (and b!740134 (not c!81556)) b!740129))

(assert (= (and b!740134 (not res!497780)) b!740122))

(assert (= (and b!740122 c!81557) b!740130))

(assert (= (and b!740122 (not c!81557)) b!740135))

(assert (= (and b!740122 (not res!497772)) b!740121))

(assert (= (and b!740121 (not res!497777)) b!740128))

(declare-fun m!690761 () Bool)

(assert (=> b!740135 m!690761))

(assert (=> b!740135 m!690761))

(declare-fun m!690763 () Bool)

(assert (=> b!740135 m!690763))

(assert (=> b!740120 m!690761))

(assert (=> b!740120 m!690761))

(declare-fun m!690765 () Bool)

(assert (=> b!740120 m!690765))

(declare-fun m!690767 () Bool)

(assert (=> b!740128 m!690767))

(declare-fun m!690769 () Bool)

(assert (=> b!740128 m!690769))

(declare-fun m!690771 () Bool)

(assert (=> b!740131 m!690771))

(declare-fun m!690773 () Bool)

(assert (=> b!740131 m!690773))

(declare-fun m!690775 () Bool)

(assert (=> b!740131 m!690775))

(assert (=> b!740131 m!690775))

(declare-fun m!690777 () Bool)

(assert (=> b!740131 m!690777))

(declare-fun m!690779 () Bool)

(assert (=> b!740131 m!690779))

(assert (=> b!740136 m!690761))

(assert (=> b!740136 m!690761))

(declare-fun m!690781 () Bool)

(assert (=> b!740136 m!690781))

(assert (=> b!740119 m!690761))

(assert (=> b!740119 m!690761))

(declare-fun m!690783 () Bool)

(assert (=> b!740119 m!690783))

(declare-fun m!690785 () Bool)

(assert (=> b!740127 m!690785))

(declare-fun m!690787 () Bool)

(assert (=> b!740127 m!690787))

(declare-fun m!690789 () Bool)

(assert (=> b!740123 m!690789))

(declare-fun m!690791 () Bool)

(assert (=> b!740141 m!690791))

(assert (=> b!740138 m!690761))

(assert (=> b!740138 m!690761))

(declare-fun m!690793 () Bool)

(assert (=> b!740138 m!690793))

(assert (=> b!740130 m!690761))

(assert (=> b!740130 m!690761))

(assert (=> b!740130 m!690793))

(declare-fun m!690795 () Bool)

(assert (=> b!740121 m!690795))

(declare-fun m!690797 () Bool)

(assert (=> b!740140 m!690797))

(assert (=> b!740139 m!690761))

(assert (=> b!740139 m!690761))

(declare-fun m!690799 () Bool)

(assert (=> b!740139 m!690799))

(assert (=> b!740133 m!690761))

(assert (=> b!740133 m!690761))

(declare-fun m!690801 () Bool)

(assert (=> b!740133 m!690801))

(assert (=> b!740133 m!690801))

(assert (=> b!740133 m!690761))

(declare-fun m!690803 () Bool)

(assert (=> b!740133 m!690803))

(declare-fun m!690805 () Bool)

(assert (=> b!740132 m!690805))

(assert (=> b!740129 m!690761))

(assert (=> b!740129 m!690761))

(declare-fun m!690807 () Bool)

(assert (=> b!740129 m!690807))

(assert (=> b!740129 m!690761))

(assert (=> b!740129 m!690763))

(assert (=> b!740124 m!690761))

(assert (=> b!740124 m!690761))

(assert (=> b!740124 m!690807))

(declare-fun m!690809 () Bool)

(assert (=> b!740134 m!690809))

(declare-fun m!690811 () Bool)

(assert (=> b!740137 m!690811))

(declare-fun m!690813 () Bool)

(assert (=> start!65246 m!690813))

(declare-fun m!690815 () Bool)

(assert (=> start!65246 m!690815))

(declare-fun m!690817 () Bool)

(assert (=> b!740125 m!690817))

(check-sat (not b!740120) (not b!740138) (not b!740119) (not b!740121) (not b!740135) (not b!740128) (not b!740136) (not start!65246) (not b!740123) (not b!740127) (not b!740133) (not b!740129) (not b!740125) (not b!740140) (not b!740141) (not b!740130) (not b!740139) (not b!740131) (not b!740124) (not b!740134) (not b!740132))
(check-sat)
