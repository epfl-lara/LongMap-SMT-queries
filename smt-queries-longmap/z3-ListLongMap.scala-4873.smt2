; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67130 () Bool)

(assert start!67130)

(declare-fun b!775860 () Bool)

(declare-fun e!431751 () Bool)

(declare-fun e!431755 () Bool)

(assert (=> b!775860 (= e!431751 (not e!431755))))

(declare-fun res!524838 () Bool)

(assert (=> b!775860 (=> res!524838 e!431755)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7945 0))(
  ( (MissingZero!7945 (index!34148 (_ BitVec 32))) (Found!7945 (index!34149 (_ BitVec 32))) (Intermediate!7945 (undefined!8757 Bool) (index!34150 (_ BitVec 32)) (x!65099 (_ BitVec 32))) (Undefined!7945) (MissingVacant!7945 (index!34151 (_ BitVec 32))) )
))
(declare-fun lt!345520 () SeekEntryResult!7945)

(get-info :version)

(assert (=> b!775860 (= res!524838 (or (not ((_ is Intermediate!7945) lt!345520)) (bvslt x!1131 (x!65099 lt!345520)) (not (= x!1131 (x!65099 lt!345520))) (not (= index!1321 (index!34150 lt!345520)))))))

(declare-fun e!431750 () Bool)

(assert (=> b!775860 e!431750))

(declare-fun res!524853 () Bool)

(assert (=> b!775860 (=> (not res!524853) (not e!431750))))

(declare-datatypes ((array!42504 0))(
  ( (array!42505 (arr!20348 (Array (_ BitVec 32) (_ BitVec 64))) (size!20769 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42504)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42504 (_ BitVec 32)) Bool)

(assert (=> b!775860 (= res!524853 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26756 0))(
  ( (Unit!26757) )
))
(declare-fun lt!345522 () Unit!26756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26756)

(assert (=> b!775860 (= lt!345522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775861 () Bool)

(declare-fun res!524840 () Bool)

(declare-fun e!431747 () Bool)

(assert (=> b!775861 (=> (not res!524840) (not e!431747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775861 (= res!524840 (validKeyInArray!0 (select (arr!20348 a!3186) j!159)))))

(declare-fun b!775862 () Bool)

(declare-fun res!524848 () Bool)

(declare-fun e!431749 () Bool)

(assert (=> b!775862 (=> (not res!524848) (not e!431749))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775862 (= res!524848 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20769 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20769 a!3186))))))

(declare-fun b!775863 () Bool)

(declare-fun res!524841 () Bool)

(assert (=> b!775863 (=> (not res!524841) (not e!431747))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!775863 (= res!524841 (validKeyInArray!0 k0!2102))))

(declare-fun b!775864 () Bool)

(declare-fun e!431754 () Bool)

(assert (=> b!775864 (= e!431749 e!431754)))

(declare-fun res!524839 () Bool)

(assert (=> b!775864 (=> (not res!524839) (not e!431754))))

(declare-fun lt!345518 () SeekEntryResult!7945)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42504 (_ BitVec 32)) SeekEntryResult!7945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775864 (= res!524839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20348 a!3186) j!159) mask!3328) (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345518))))

(assert (=> b!775864 (= lt!345518 (Intermediate!7945 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775865 () Bool)

(declare-fun res!524849 () Bool)

(assert (=> b!775865 (=> (not res!524849) (not e!431749))))

(assert (=> b!775865 (= res!524849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!431753 () Bool)

(declare-fun b!775866 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42504 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!775866 (= e!431753 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) (Found!7945 j!159)))))

(declare-fun b!775867 () Bool)

(declare-fun e!431748 () Bool)

(assert (=> b!775867 (= e!431750 e!431748)))

(declare-fun res!524845 () Bool)

(assert (=> b!775867 (=> (not res!524845) (not e!431748))))

(declare-fun lt!345517 () SeekEntryResult!7945)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42504 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!775867 (= res!524845 (= (seekEntryOrOpen!0 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345517))))

(assert (=> b!775867 (= lt!345517 (Found!7945 j!159))))

(declare-fun b!775868 () Bool)

(declare-fun res!524852 () Bool)

(assert (=> b!775868 (=> (not res!524852) (not e!431754))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775868 (= res!524852 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20348 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!524850 () Bool)

(assert (=> start!67130 (=> (not res!524850) (not e!431747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67130 (= res!524850 (validMask!0 mask!3328))))

(assert (=> start!67130 e!431747))

(assert (=> start!67130 true))

(declare-fun array_inv!16231 (array!42504) Bool)

(assert (=> start!67130 (array_inv!16231 a!3186)))

(declare-fun b!775869 () Bool)

(declare-fun res!524844 () Bool)

(assert (=> b!775869 (=> (not res!524844) (not e!431749))))

(declare-datatypes ((List!14389 0))(
  ( (Nil!14386) (Cons!14385 (h!15493 (_ BitVec 64)) (t!20695 List!14389)) )
))
(declare-fun arrayNoDuplicates!0 (array!42504 (_ BitVec 32) List!14389) Bool)

(assert (=> b!775869 (= res!524844 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14386))))

(declare-fun b!775870 () Bool)

(declare-fun res!524847 () Bool)

(assert (=> b!775870 (=> (not res!524847) (not e!431747))))

(assert (=> b!775870 (= res!524847 (and (= (size!20769 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20769 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20769 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775871 () Bool)

(assert (=> b!775871 (= e!431748 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345517))))

(declare-fun b!775872 () Bool)

(declare-fun res!524846 () Bool)

(assert (=> b!775872 (=> (not res!524846) (not e!431754))))

(assert (=> b!775872 (= res!524846 e!431753)))

(declare-fun c!85911 () Bool)

(assert (=> b!775872 (= c!85911 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775873 () Bool)

(assert (=> b!775873 (= e!431753 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345518))))

(declare-fun b!775874 () Bool)

(assert (=> b!775874 (= e!431755 true)))

(declare-fun lt!345519 () SeekEntryResult!7945)

(assert (=> b!775874 (= lt!345519 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775875 () Bool)

(assert (=> b!775875 (= e!431754 e!431751)))

(declare-fun res!524843 () Bool)

(assert (=> b!775875 (=> (not res!524843) (not e!431751))))

(declare-fun lt!345516 () SeekEntryResult!7945)

(assert (=> b!775875 (= res!524843 (= lt!345516 lt!345520))))

(declare-fun lt!345524 () array!42504)

(declare-fun lt!345521 () (_ BitVec 64))

(assert (=> b!775875 (= lt!345520 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345521 lt!345524 mask!3328))))

(assert (=> b!775875 (= lt!345516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345521 mask!3328) lt!345521 lt!345524 mask!3328))))

(assert (=> b!775875 (= lt!345521 (select (store (arr!20348 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775875 (= lt!345524 (array!42505 (store (arr!20348 a!3186) i!1173 k0!2102) (size!20769 a!3186)))))

(declare-fun b!775876 () Bool)

(declare-fun res!524851 () Bool)

(assert (=> b!775876 (=> (not res!524851) (not e!431747))))

(declare-fun arrayContainsKey!0 (array!42504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775876 (= res!524851 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775877 () Bool)

(assert (=> b!775877 (= e!431747 e!431749)))

(declare-fun res!524842 () Bool)

(assert (=> b!775877 (=> (not res!524842) (not e!431749))))

(declare-fun lt!345523 () SeekEntryResult!7945)

(assert (=> b!775877 (= res!524842 (or (= lt!345523 (MissingZero!7945 i!1173)) (= lt!345523 (MissingVacant!7945 i!1173))))))

(assert (=> b!775877 (= lt!345523 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67130 res!524850) b!775870))

(assert (= (and b!775870 res!524847) b!775861))

(assert (= (and b!775861 res!524840) b!775863))

(assert (= (and b!775863 res!524841) b!775876))

(assert (= (and b!775876 res!524851) b!775877))

(assert (= (and b!775877 res!524842) b!775865))

(assert (= (and b!775865 res!524849) b!775869))

(assert (= (and b!775869 res!524844) b!775862))

(assert (= (and b!775862 res!524848) b!775864))

(assert (= (and b!775864 res!524839) b!775868))

(assert (= (and b!775868 res!524852) b!775872))

(assert (= (and b!775872 c!85911) b!775873))

(assert (= (and b!775872 (not c!85911)) b!775866))

(assert (= (and b!775872 res!524846) b!775875))

(assert (= (and b!775875 res!524843) b!775860))

(assert (= (and b!775860 res!524853) b!775867))

(assert (= (and b!775867 res!524845) b!775871))

(assert (= (and b!775860 (not res!524838)) b!775874))

(declare-fun m!719481 () Bool)

(assert (=> b!775871 m!719481))

(assert (=> b!775871 m!719481))

(declare-fun m!719483 () Bool)

(assert (=> b!775871 m!719483))

(declare-fun m!719485 () Bool)

(assert (=> b!775877 m!719485))

(declare-fun m!719487 () Bool)

(assert (=> b!775869 m!719487))

(assert (=> b!775861 m!719481))

(assert (=> b!775861 m!719481))

(declare-fun m!719489 () Bool)

(assert (=> b!775861 m!719489))

(declare-fun m!719491 () Bool)

(assert (=> b!775860 m!719491))

(declare-fun m!719493 () Bool)

(assert (=> b!775860 m!719493))

(declare-fun m!719495 () Bool)

(assert (=> b!775876 m!719495))

(declare-fun m!719497 () Bool)

(assert (=> b!775865 m!719497))

(assert (=> b!775867 m!719481))

(assert (=> b!775867 m!719481))

(declare-fun m!719499 () Bool)

(assert (=> b!775867 m!719499))

(assert (=> b!775866 m!719481))

(assert (=> b!775866 m!719481))

(declare-fun m!719501 () Bool)

(assert (=> b!775866 m!719501))

(assert (=> b!775874 m!719481))

(assert (=> b!775874 m!719481))

(assert (=> b!775874 m!719501))

(declare-fun m!719503 () Bool)

(assert (=> b!775863 m!719503))

(assert (=> b!775873 m!719481))

(assert (=> b!775873 m!719481))

(declare-fun m!719505 () Bool)

(assert (=> b!775873 m!719505))

(declare-fun m!719507 () Bool)

(assert (=> b!775875 m!719507))

(declare-fun m!719509 () Bool)

(assert (=> b!775875 m!719509))

(declare-fun m!719511 () Bool)

(assert (=> b!775875 m!719511))

(assert (=> b!775875 m!719509))

(declare-fun m!719513 () Bool)

(assert (=> b!775875 m!719513))

(declare-fun m!719515 () Bool)

(assert (=> b!775875 m!719515))

(declare-fun m!719517 () Bool)

(assert (=> b!775868 m!719517))

(declare-fun m!719519 () Bool)

(assert (=> start!67130 m!719519))

(declare-fun m!719521 () Bool)

(assert (=> start!67130 m!719521))

(assert (=> b!775864 m!719481))

(assert (=> b!775864 m!719481))

(declare-fun m!719523 () Bool)

(assert (=> b!775864 m!719523))

(assert (=> b!775864 m!719523))

(assert (=> b!775864 m!719481))

(declare-fun m!719525 () Bool)

(assert (=> b!775864 m!719525))

(check-sat (not b!775869) (not b!775864) (not b!775876) (not b!775871) (not b!775873) (not b!775875) (not b!775863) (not b!775877) (not b!775865) (not start!67130) (not b!775867) (not b!775861) (not b!775874) (not b!775860) (not b!775866))
(check-sat)
