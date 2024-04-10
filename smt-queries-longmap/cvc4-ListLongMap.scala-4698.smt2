; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65252 () Bool)

(assert start!65252)

(declare-fun b!739852 () Bool)

(declare-fun e!413687 () Bool)

(assert (=> b!739852 (= e!413687 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328596 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7426 0))(
  ( (MissingZero!7426 (index!32072 (_ BitVec 32))) (Found!7426 (index!32073 (_ BitVec 32))) (Intermediate!7426 (undefined!8238 Bool) (index!32074 (_ BitVec 32)) (x!63056 (_ BitVec 32))) (Undefined!7426) (MissingVacant!7426 (index!32075 (_ BitVec 32))) )
))
(declare-fun lt!328592 () SeekEntryResult!7426)

(declare-fun lt!328594 () (_ BitVec 64))

(declare-datatypes ((array!41425 0))(
  ( (array!41426 (arr!19826 (Array (_ BitVec 32) (_ BitVec 64))) (size!20247 (_ BitVec 32))) )
))
(declare-fun lt!328588 () array!41425)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739852 (= lt!328592 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328596 lt!328594 lt!328588 mask!3328))))

(declare-fun b!739853 () Bool)

(declare-fun res!497490 () Bool)

(declare-fun e!413679 () Bool)

(assert (=> b!739853 (=> (not res!497490) (not e!413679))))

(declare-fun a!3186 () array!41425)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41425 (_ BitVec 32)) Bool)

(assert (=> b!739853 (= res!497490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739854 () Bool)

(declare-fun e!413690 () Bool)

(declare-fun e!413684 () Bool)

(assert (=> b!739854 (= e!413690 e!413684)))

(declare-fun res!497501 () Bool)

(assert (=> b!739854 (=> (not res!497501) (not e!413684))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!328590 () SeekEntryResult!7426)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739854 (= res!497501 (= (seekEntryOrOpen!0 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328590))))

(assert (=> b!739854 (= lt!328590 (Found!7426 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!739855 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!739855 (= e!413684 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328590))))

(declare-fun lt!328600 () SeekEntryResult!7426)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!739857 () Bool)

(declare-fun e!413682 () Bool)

(assert (=> b!739857 (= e!413682 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328600))))

(declare-fun b!739858 () Bool)

(declare-fun res!497496 () Bool)

(declare-fun e!413680 () Bool)

(assert (=> b!739858 (=> (not res!497496) (not e!413680))))

(assert (=> b!739858 (= res!497496 e!413682)))

(declare-fun c!81563 () Bool)

(assert (=> b!739858 (= c!81563 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739859 () Bool)

(declare-fun e!413683 () Bool)

(declare-fun e!413689 () Bool)

(assert (=> b!739859 (= e!413683 (not e!413689))))

(declare-fun res!497488 () Bool)

(assert (=> b!739859 (=> res!497488 e!413689)))

(declare-fun lt!328591 () SeekEntryResult!7426)

(assert (=> b!739859 (= res!497488 (or (not (is-Intermediate!7426 lt!328591)) (bvsge x!1131 (x!63056 lt!328591))))))

(declare-fun lt!328599 () SeekEntryResult!7426)

(assert (=> b!739859 (= lt!328599 (Found!7426 j!159))))

(assert (=> b!739859 e!413690))

(declare-fun res!497497 () Bool)

(assert (=> b!739859 (=> (not res!497497) (not e!413690))))

(assert (=> b!739859 (= res!497497 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25300 0))(
  ( (Unit!25301) )
))
(declare-fun lt!328593 () Unit!25300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25300)

(assert (=> b!739859 (= lt!328593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739860 () Bool)

(declare-fun res!497491 () Bool)

(declare-fun e!413688 () Bool)

(assert (=> b!739860 (=> (not res!497491) (not e!413688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739860 (= res!497491 (validKeyInArray!0 (select (arr!19826 a!3186) j!159)))))

(declare-fun b!739861 () Bool)

(declare-fun res!497489 () Bool)

(assert (=> b!739861 (=> (not res!497489) (not e!413688))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739861 (= res!497489 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739862 () Bool)

(declare-fun res!497503 () Bool)

(assert (=> b!739862 (=> (not res!497503) (not e!413680))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739862 (= res!497503 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19826 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!497493 () Bool)

(assert (=> start!65252 (=> (not res!497493) (not e!413688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65252 (= res!497493 (validMask!0 mask!3328))))

(assert (=> start!65252 e!413688))

(assert (=> start!65252 true))

(declare-fun array_inv!15622 (array!41425) Bool)

(assert (=> start!65252 (array_inv!15622 a!3186)))

(declare-fun b!739856 () Bool)

(assert (=> b!739856 (= e!413689 e!413687)))

(declare-fun res!497504 () Bool)

(assert (=> b!739856 (=> res!497504 e!413687)))

(assert (=> b!739856 (= res!497504 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328596 #b00000000000000000000000000000000) (bvsge lt!328596 (size!20247 a!3186))))))

(declare-fun lt!328597 () Unit!25300)

(declare-fun e!413686 () Unit!25300)

(assert (=> b!739856 (= lt!328597 e!413686)))

(declare-fun c!81565 () Bool)

(declare-fun lt!328598 () Bool)

(assert (=> b!739856 (= c!81565 lt!328598)))

(assert (=> b!739856 (= lt!328598 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739856 (= lt!328596 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739863 () Bool)

(assert (=> b!739863 (= e!413682 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) (Found!7426 j!159)))))

(declare-fun b!739864 () Bool)

(declare-fun res!497487 () Bool)

(assert (=> b!739864 (=> (not res!497487) (not e!413679))))

(declare-datatypes ((List!13828 0))(
  ( (Nil!13825) (Cons!13824 (h!14896 (_ BitVec 64)) (t!20143 List!13828)) )
))
(declare-fun arrayNoDuplicates!0 (array!41425 (_ BitVec 32) List!13828) Bool)

(assert (=> b!739864 (= res!497487 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13825))))

(declare-fun b!739865 () Bool)

(assert (=> b!739865 (= e!413679 e!413680)))

(declare-fun res!497495 () Bool)

(assert (=> b!739865 (=> (not res!497495) (not e!413680))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739865 (= res!497495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19826 a!3186) j!159) mask!3328) (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328600))))

(assert (=> b!739865 (= lt!328600 (Intermediate!7426 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739866 () Bool)

(declare-fun res!497492 () Bool)

(assert (=> b!739866 (=> (not res!497492) (not e!413688))))

(assert (=> b!739866 (= res!497492 (validKeyInArray!0 k!2102))))

(declare-fun b!739867 () Bool)

(declare-fun e!413681 () Bool)

(assert (=> b!739867 (= e!413681 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328596 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328600)))))

(declare-fun b!739868 () Bool)

(declare-fun Unit!25302 () Unit!25300)

(assert (=> b!739868 (= e!413686 Unit!25302)))

(declare-fun lt!328595 () SeekEntryResult!7426)

(assert (=> b!739868 (= lt!328595 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739868 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328596 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328599)))

(declare-fun b!739869 () Bool)

(declare-fun Unit!25303 () Unit!25300)

(assert (=> b!739869 (= e!413686 Unit!25303)))

(assert (=> b!739869 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328596 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328600)))

(declare-fun b!739870 () Bool)

(assert (=> b!739870 (= e!413681 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328596 resIntermediateIndex!5 (select (arr!19826 a!3186) j!159) a!3186 mask!3328) lt!328599)))))

(declare-fun b!739871 () Bool)

(assert (=> b!739871 (= e!413688 e!413679)))

(declare-fun res!497500 () Bool)

(assert (=> b!739871 (=> (not res!497500) (not e!413679))))

(declare-fun lt!328589 () SeekEntryResult!7426)

(assert (=> b!739871 (= res!497500 (or (= lt!328589 (MissingZero!7426 i!1173)) (= lt!328589 (MissingVacant!7426 i!1173))))))

(assert (=> b!739871 (= lt!328589 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739872 () Bool)

(declare-fun res!497494 () Bool)

(assert (=> b!739872 (=> res!497494 e!413687)))

(assert (=> b!739872 (= res!497494 e!413681)))

(declare-fun c!81564 () Bool)

(assert (=> b!739872 (= c!81564 lt!328598)))

(declare-fun b!739873 () Bool)

(declare-fun res!497498 () Bool)

(assert (=> b!739873 (=> (not res!497498) (not e!413679))))

(assert (=> b!739873 (= res!497498 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20247 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20247 a!3186))))))

(declare-fun b!739874 () Bool)

(assert (=> b!739874 (= e!413680 e!413683)))

(declare-fun res!497502 () Bool)

(assert (=> b!739874 (=> (not res!497502) (not e!413683))))

(declare-fun lt!328601 () SeekEntryResult!7426)

(assert (=> b!739874 (= res!497502 (= lt!328601 lt!328591))))

(assert (=> b!739874 (= lt!328591 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328594 lt!328588 mask!3328))))

(assert (=> b!739874 (= lt!328601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328594 mask!3328) lt!328594 lt!328588 mask!3328))))

(assert (=> b!739874 (= lt!328594 (select (store (arr!19826 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739874 (= lt!328588 (array!41426 (store (arr!19826 a!3186) i!1173 k!2102) (size!20247 a!3186)))))

(declare-fun b!739875 () Bool)

(declare-fun res!497499 () Bool)

(assert (=> b!739875 (=> (not res!497499) (not e!413688))))

(assert (=> b!739875 (= res!497499 (and (= (size!20247 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20247 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20247 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65252 res!497493) b!739875))

(assert (= (and b!739875 res!497499) b!739860))

(assert (= (and b!739860 res!497491) b!739866))

(assert (= (and b!739866 res!497492) b!739861))

(assert (= (and b!739861 res!497489) b!739871))

(assert (= (and b!739871 res!497500) b!739853))

(assert (= (and b!739853 res!497490) b!739864))

(assert (= (and b!739864 res!497487) b!739873))

(assert (= (and b!739873 res!497498) b!739865))

(assert (= (and b!739865 res!497495) b!739862))

(assert (= (and b!739862 res!497503) b!739858))

(assert (= (and b!739858 c!81563) b!739857))

(assert (= (and b!739858 (not c!81563)) b!739863))

(assert (= (and b!739858 res!497496) b!739874))

(assert (= (and b!739874 res!497502) b!739859))

(assert (= (and b!739859 res!497497) b!739854))

(assert (= (and b!739854 res!497501) b!739855))

(assert (= (and b!739859 (not res!497488)) b!739856))

(assert (= (and b!739856 c!81565) b!739869))

(assert (= (and b!739856 (not c!81565)) b!739868))

(assert (= (and b!739856 (not res!497504)) b!739872))

(assert (= (and b!739872 c!81564) b!739867))

(assert (= (and b!739872 (not c!81564)) b!739870))

(assert (= (and b!739872 (not res!497494)) b!739852))

(declare-fun m!691129 () Bool)

(assert (=> b!739860 m!691129))

(assert (=> b!739860 m!691129))

(declare-fun m!691131 () Bool)

(assert (=> b!739860 m!691131))

(declare-fun m!691133 () Bool)

(assert (=> b!739866 m!691133))

(assert (=> b!739867 m!691129))

(assert (=> b!739867 m!691129))

(declare-fun m!691135 () Bool)

(assert (=> b!739867 m!691135))

(declare-fun m!691137 () Bool)

(assert (=> b!739859 m!691137))

(declare-fun m!691139 () Bool)

(assert (=> b!739859 m!691139))

(declare-fun m!691141 () Bool)

(assert (=> b!739862 m!691141))

(assert (=> b!739868 m!691129))

(assert (=> b!739868 m!691129))

(declare-fun m!691143 () Bool)

(assert (=> b!739868 m!691143))

(assert (=> b!739868 m!691129))

(declare-fun m!691145 () Bool)

(assert (=> b!739868 m!691145))

(assert (=> b!739857 m!691129))

(assert (=> b!739857 m!691129))

(declare-fun m!691147 () Bool)

(assert (=> b!739857 m!691147))

(assert (=> b!739865 m!691129))

(assert (=> b!739865 m!691129))

(declare-fun m!691149 () Bool)

(assert (=> b!739865 m!691149))

(assert (=> b!739865 m!691149))

(assert (=> b!739865 m!691129))

(declare-fun m!691151 () Bool)

(assert (=> b!739865 m!691151))

(declare-fun m!691153 () Bool)

(assert (=> b!739856 m!691153))

(declare-fun m!691155 () Bool)

(assert (=> b!739874 m!691155))

(declare-fun m!691157 () Bool)

(assert (=> b!739874 m!691157))

(declare-fun m!691159 () Bool)

(assert (=> b!739874 m!691159))

(assert (=> b!739874 m!691157))

(declare-fun m!691161 () Bool)

(assert (=> b!739874 m!691161))

(declare-fun m!691163 () Bool)

(assert (=> b!739874 m!691163))

(assert (=> b!739869 m!691129))

(assert (=> b!739869 m!691129))

(assert (=> b!739869 m!691135))

(assert (=> b!739870 m!691129))

(assert (=> b!739870 m!691129))

(assert (=> b!739870 m!691145))

(assert (=> b!739855 m!691129))

(assert (=> b!739855 m!691129))

(declare-fun m!691165 () Bool)

(assert (=> b!739855 m!691165))

(assert (=> b!739854 m!691129))

(assert (=> b!739854 m!691129))

(declare-fun m!691167 () Bool)

(assert (=> b!739854 m!691167))

(declare-fun m!691169 () Bool)

(assert (=> b!739864 m!691169))

(declare-fun m!691171 () Bool)

(assert (=> b!739871 m!691171))

(declare-fun m!691173 () Bool)

(assert (=> start!65252 m!691173))

(declare-fun m!691175 () Bool)

(assert (=> start!65252 m!691175))

(assert (=> b!739863 m!691129))

(assert (=> b!739863 m!691129))

(assert (=> b!739863 m!691143))

(declare-fun m!691177 () Bool)

(assert (=> b!739861 m!691177))

(declare-fun m!691179 () Bool)

(assert (=> b!739853 m!691179))

(declare-fun m!691181 () Bool)

(assert (=> b!739852 m!691181))

(push 1)

