; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65240 () Bool)

(assert start!65240)

(declare-fun b!739892 () Bool)

(declare-fun res!497613 () Bool)

(declare-fun e!413670 () Bool)

(assert (=> b!739892 (=> (not res!497613) (not e!413670))))

(declare-fun e!413672 () Bool)

(assert (=> b!739892 (= res!497613 e!413672)))

(declare-fun c!81531 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739892 (= c!81531 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41430 0))(
  ( (array!41431 (arr!19829 (Array (_ BitVec 32) (_ BitVec 64))) (size!20250 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41430)

(declare-fun lt!328521 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7426 0))(
  ( (MissingZero!7426 (index!32072 (_ BitVec 32))) (Found!7426 (index!32073 (_ BitVec 32))) (Intermediate!7426 (undefined!8238 Bool) (index!32074 (_ BitVec 32)) (x!63067 (_ BitVec 32))) (Undefined!7426) (MissingVacant!7426 (index!32075 (_ BitVec 32))) )
))
(declare-fun lt!328516 () SeekEntryResult!7426)

(declare-fun b!739893 () Bool)

(declare-fun e!413680 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41430 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739893 (= e!413680 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328521 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328516)))))

(declare-fun b!739894 () Bool)

(declare-fun res!497611 () Bool)

(assert (=> b!739894 (=> (not res!497611) (not e!413670))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739894 (= res!497611 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19829 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739896 () Bool)

(declare-fun e!413678 () Bool)

(declare-fun e!413677 () Bool)

(assert (=> b!739896 (= e!413678 e!413677)))

(declare-fun res!497599 () Bool)

(assert (=> b!739896 (=> res!497599 e!413677)))

(assert (=> b!739896 (= res!497599 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328521 #b00000000000000000000000000000000) (bvsge lt!328521 (size!20250 a!3186))))))

(declare-datatypes ((Unit!25280 0))(
  ( (Unit!25281) )
))
(declare-fun lt!328528 () Unit!25280)

(declare-fun e!413676 () Unit!25280)

(assert (=> b!739896 (= lt!328528 e!413676)))

(declare-fun c!81529 () Bool)

(declare-fun lt!328518 () Bool)

(assert (=> b!739896 (= c!81529 lt!328518)))

(assert (=> b!739896 (= lt!328518 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739896 (= lt!328521 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739897 () Bool)

(declare-fun res!497601 () Bool)

(declare-fun e!413679 () Bool)

(assert (=> b!739897 (=> (not res!497601) (not e!413679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739897 (= res!497601 (validKeyInArray!0 (select (arr!19829 a!3186) j!159)))))

(declare-fun b!739898 () Bool)

(declare-fun lt!328529 () SeekEntryResult!7426)

(declare-fun e!413675 () Bool)

(assert (=> b!739898 (= e!413675 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328529))))

(declare-fun lt!328519 () SeekEntryResult!7426)

(declare-fun b!739899 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41430 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739899 (= e!413672 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328519))))

(declare-fun b!739900 () Bool)

(declare-fun e!413674 () Bool)

(assert (=> b!739900 (= e!413674 e!413675)))

(declare-fun res!497607 () Bool)

(assert (=> b!739900 (=> (not res!497607) (not e!413675))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41430 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739900 (= res!497607 (= (seekEntryOrOpen!0 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328529))))

(assert (=> b!739900 (= lt!328529 (Found!7426 j!159))))

(declare-fun b!739901 () Bool)

(declare-fun e!413671 () Bool)

(assert (=> b!739901 (= e!413679 e!413671)))

(declare-fun res!497598 () Bool)

(assert (=> b!739901 (=> (not res!497598) (not e!413671))))

(declare-fun lt!328526 () SeekEntryResult!7426)

(assert (=> b!739901 (= res!497598 (or (= lt!328526 (MissingZero!7426 i!1173)) (= lt!328526 (MissingVacant!7426 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739901 (= lt!328526 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739902 () Bool)

(declare-fun res!497608 () Bool)

(assert (=> b!739902 (=> (not res!497608) (not e!413679))))

(assert (=> b!739902 (= res!497608 (validKeyInArray!0 k0!2102))))

(declare-fun b!739903 () Bool)

(declare-fun res!497602 () Bool)

(assert (=> b!739903 (=> (not res!497602) (not e!413671))))

(assert (=> b!739903 (= res!497602 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20250 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20250 a!3186))))))

(declare-fun b!739904 () Bool)

(declare-fun res!497595 () Bool)

(assert (=> b!739904 (=> (not res!497595) (not e!413679))))

(declare-fun arrayContainsKey!0 (array!41430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739904 (= res!497595 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739905 () Bool)

(declare-fun Unit!25282 () Unit!25280)

(assert (=> b!739905 (= e!413676 Unit!25282)))

(declare-fun lt!328520 () SeekEntryResult!7426)

(assert (=> b!739905 (= lt!328520 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739905 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328521 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328516)))

(declare-fun b!739906 () Bool)

(declare-fun res!497600 () Bool)

(assert (=> b!739906 (=> (not res!497600) (not e!413671))))

(declare-datatypes ((List!13870 0))(
  ( (Nil!13867) (Cons!13866 (h!14938 (_ BitVec 64)) (t!20176 List!13870)) )
))
(declare-fun arrayNoDuplicates!0 (array!41430 (_ BitVec 32) List!13870) Bool)

(assert (=> b!739906 (= res!497600 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13867))))

(declare-fun b!739907 () Bool)

(declare-fun Unit!25283 () Unit!25280)

(assert (=> b!739907 (= e!413676 Unit!25283)))

(assert (=> b!739907 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328521 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328519)))

(declare-fun b!739908 () Bool)

(assert (=> b!739908 (= e!413672 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) (Found!7426 j!159)))))

(declare-fun b!739909 () Bool)

(declare-fun res!497605 () Bool)

(assert (=> b!739909 (=> res!497605 e!413677)))

(declare-fun lt!328527 () array!41430)

(declare-fun lt!328517 () (_ BitVec 64))

(declare-fun lt!328525 () SeekEntryResult!7426)

(assert (=> b!739909 (= res!497605 (not (= lt!328525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328521 lt!328517 lt!328527 mask!3328))))))

(declare-fun b!739910 () Bool)

(declare-fun res!497604 () Bool)

(assert (=> b!739910 (=> (not res!497604) (not e!413679))))

(assert (=> b!739910 (= res!497604 (and (= (size!20250 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20250 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20250 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!497603 () Bool)

(assert (=> start!65240 (=> (not res!497603) (not e!413679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65240 (= res!497603 (validMask!0 mask!3328))))

(assert (=> start!65240 e!413679))

(assert (=> start!65240 true))

(declare-fun array_inv!15712 (array!41430) Bool)

(assert (=> start!65240 (array_inv!15712 a!3186)))

(declare-fun b!739895 () Bool)

(assert (=> b!739895 (= e!413671 e!413670)))

(declare-fun res!497610 () Bool)

(assert (=> b!739895 (=> (not res!497610) (not e!413670))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739895 (= res!497610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19829 a!3186) j!159) mask!3328) (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328519))))

(assert (=> b!739895 (= lt!328519 (Intermediate!7426 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739911 () Bool)

(declare-fun e!413669 () Bool)

(assert (=> b!739911 (= e!413669 (not e!413678))))

(declare-fun res!497609 () Bool)

(assert (=> b!739911 (=> res!497609 e!413678)))

(declare-fun lt!328524 () SeekEntryResult!7426)

(get-info :version)

(assert (=> b!739911 (= res!497609 (or (not ((_ is Intermediate!7426) lt!328524)) (bvsge x!1131 (x!63067 lt!328524))))))

(assert (=> b!739911 (= lt!328516 (Found!7426 j!159))))

(assert (=> b!739911 e!413674))

(declare-fun res!497597 () Bool)

(assert (=> b!739911 (=> (not res!497597) (not e!413674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41430 (_ BitVec 32)) Bool)

(assert (=> b!739911 (= res!497597 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328522 () Unit!25280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25280)

(assert (=> b!739911 (= lt!328522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739912 () Bool)

(assert (=> b!739912 (= e!413670 e!413669)))

(declare-fun res!497612 () Bool)

(assert (=> b!739912 (=> (not res!497612) (not e!413669))))

(assert (=> b!739912 (= res!497612 (= lt!328525 lt!328524))))

(assert (=> b!739912 (= lt!328524 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328517 lt!328527 mask!3328))))

(assert (=> b!739912 (= lt!328525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328517 mask!3328) lt!328517 lt!328527 mask!3328))))

(assert (=> b!739912 (= lt!328517 (select (store (arr!19829 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739912 (= lt!328527 (array!41431 (store (arr!19829 a!3186) i!1173 k0!2102) (size!20250 a!3186)))))

(declare-fun b!739913 () Bool)

(assert (=> b!739913 (= e!413677 true)))

(assert (=> b!739913 (= (seekEntryOrOpen!0 lt!328517 lt!328527 mask!3328) lt!328516)))

(declare-fun lt!328523 () Unit!25280)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25280)

(assert (=> b!739913 (= lt!328523 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328521 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!739914 () Bool)

(assert (=> b!739914 (= e!413680 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328521 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328519)))))

(declare-fun b!739915 () Bool)

(declare-fun res!497606 () Bool)

(assert (=> b!739915 (=> res!497606 e!413677)))

(assert (=> b!739915 (= res!497606 e!413680)))

(declare-fun c!81530 () Bool)

(assert (=> b!739915 (= c!81530 lt!328518)))

(declare-fun b!739916 () Bool)

(declare-fun res!497596 () Bool)

(assert (=> b!739916 (=> (not res!497596) (not e!413671))))

(assert (=> b!739916 (= res!497596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65240 res!497603) b!739910))

(assert (= (and b!739910 res!497604) b!739897))

(assert (= (and b!739897 res!497601) b!739902))

(assert (= (and b!739902 res!497608) b!739904))

(assert (= (and b!739904 res!497595) b!739901))

(assert (= (and b!739901 res!497598) b!739916))

(assert (= (and b!739916 res!497596) b!739906))

(assert (= (and b!739906 res!497600) b!739903))

(assert (= (and b!739903 res!497602) b!739895))

(assert (= (and b!739895 res!497610) b!739894))

(assert (= (and b!739894 res!497611) b!739892))

(assert (= (and b!739892 c!81531) b!739899))

(assert (= (and b!739892 (not c!81531)) b!739908))

(assert (= (and b!739892 res!497613) b!739912))

(assert (= (and b!739912 res!497612) b!739911))

(assert (= (and b!739911 res!497597) b!739900))

(assert (= (and b!739900 res!497607) b!739898))

(assert (= (and b!739911 (not res!497609)) b!739896))

(assert (= (and b!739896 c!81529) b!739907))

(assert (= (and b!739896 (not c!81529)) b!739905))

(assert (= (and b!739896 (not res!497599)) b!739915))

(assert (= (and b!739915 c!81530) b!739914))

(assert (= (and b!739915 (not c!81530)) b!739893))

(assert (= (and b!739915 (not res!497606)) b!739909))

(assert (= (and b!739909 (not res!497605)) b!739913))

(declare-fun m!690587 () Bool)

(assert (=> b!739902 m!690587))

(declare-fun m!690589 () Bool)

(assert (=> b!739904 m!690589))

(declare-fun m!690591 () Bool)

(assert (=> b!739911 m!690591))

(declare-fun m!690593 () Bool)

(assert (=> b!739911 m!690593))

(declare-fun m!690595 () Bool)

(assert (=> b!739894 m!690595))

(declare-fun m!690597 () Bool)

(assert (=> b!739914 m!690597))

(assert (=> b!739914 m!690597))

(declare-fun m!690599 () Bool)

(assert (=> b!739914 m!690599))

(declare-fun m!690601 () Bool)

(assert (=> b!739906 m!690601))

(declare-fun m!690603 () Bool)

(assert (=> b!739916 m!690603))

(assert (=> b!739898 m!690597))

(assert (=> b!739898 m!690597))

(declare-fun m!690605 () Bool)

(assert (=> b!739898 m!690605))

(assert (=> b!739897 m!690597))

(assert (=> b!739897 m!690597))

(declare-fun m!690607 () Bool)

(assert (=> b!739897 m!690607))

(declare-fun m!690609 () Bool)

(assert (=> b!739901 m!690609))

(assert (=> b!739900 m!690597))

(assert (=> b!739900 m!690597))

(declare-fun m!690611 () Bool)

(assert (=> b!739900 m!690611))

(assert (=> b!739895 m!690597))

(assert (=> b!739895 m!690597))

(declare-fun m!690613 () Bool)

(assert (=> b!739895 m!690613))

(assert (=> b!739895 m!690613))

(assert (=> b!739895 m!690597))

(declare-fun m!690615 () Bool)

(assert (=> b!739895 m!690615))

(assert (=> b!739908 m!690597))

(assert (=> b!739908 m!690597))

(declare-fun m!690617 () Bool)

(assert (=> b!739908 m!690617))

(declare-fun m!690619 () Bool)

(assert (=> b!739909 m!690619))

(assert (=> b!739899 m!690597))

(assert (=> b!739899 m!690597))

(declare-fun m!690621 () Bool)

(assert (=> b!739899 m!690621))

(declare-fun m!690623 () Bool)

(assert (=> b!739913 m!690623))

(declare-fun m!690625 () Bool)

(assert (=> b!739913 m!690625))

(assert (=> b!739907 m!690597))

(assert (=> b!739907 m!690597))

(assert (=> b!739907 m!690599))

(declare-fun m!690627 () Bool)

(assert (=> start!65240 m!690627))

(declare-fun m!690629 () Bool)

(assert (=> start!65240 m!690629))

(assert (=> b!739893 m!690597))

(assert (=> b!739893 m!690597))

(declare-fun m!690631 () Bool)

(assert (=> b!739893 m!690631))

(declare-fun m!690633 () Bool)

(assert (=> b!739896 m!690633))

(assert (=> b!739905 m!690597))

(assert (=> b!739905 m!690597))

(assert (=> b!739905 m!690617))

(assert (=> b!739905 m!690597))

(assert (=> b!739905 m!690631))

(declare-fun m!690635 () Bool)

(assert (=> b!739912 m!690635))

(declare-fun m!690637 () Bool)

(assert (=> b!739912 m!690637))

(assert (=> b!739912 m!690635))

(declare-fun m!690639 () Bool)

(assert (=> b!739912 m!690639))

(declare-fun m!690641 () Bool)

(assert (=> b!739912 m!690641))

(declare-fun m!690643 () Bool)

(assert (=> b!739912 m!690643))

(check-sat (not b!739904) (not start!65240) (not b!739912) (not b!739908) (not b!739905) (not b!739902) (not b!739899) (not b!739913) (not b!739898) (not b!739895) (not b!739909) (not b!739914) (not b!739896) (not b!739897) (not b!739916) (not b!739911) (not b!739893) (not b!739907) (not b!739900) (not b!739901) (not b!739906))
(check-sat)
