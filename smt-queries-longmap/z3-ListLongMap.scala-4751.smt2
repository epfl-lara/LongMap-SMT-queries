; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65694 () Bool)

(assert start!65694)

(declare-fun b!749800 () Bool)

(declare-fun e!418487 () Bool)

(declare-fun e!418489 () Bool)

(assert (=> b!749800 (= e!418487 e!418489)))

(declare-fun res!505674 () Bool)

(assert (=> b!749800 (=> (not res!505674) (not e!418489))))

(declare-datatypes ((SeekEntryResult!7534 0))(
  ( (MissingZero!7534 (index!32504 (_ BitVec 32))) (Found!7534 (index!32505 (_ BitVec 32))) (Intermediate!7534 (undefined!8346 Bool) (index!32506 (_ BitVec 32)) (x!63600 (_ BitVec 32))) (Undefined!7534) (MissingVacant!7534 (index!32507 (_ BitVec 32))) )
))
(declare-fun lt!333317 () SeekEntryResult!7534)

(declare-fun lt!333318 () SeekEntryResult!7534)

(assert (=> b!749800 (= res!505674 (= lt!333317 lt!333318))))

(declare-datatypes ((array!41737 0))(
  ( (array!41738 (arr!19978 (Array (_ BitVec 32) (_ BitVec 64))) (size!20398 (_ BitVec 32))) )
))
(declare-fun lt!333311 () array!41737)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!333313 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!749800 (= lt!333318 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333313 lt!333311 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749800 (= lt!333317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333313 mask!3328) lt!333313 lt!333311 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!41737)

(assert (=> b!749800 (= lt!333313 (select (store (arr!19978 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749800 (= lt!333311 (array!41738 (store (arr!19978 a!3186) i!1173 k0!2102) (size!20398 a!3186)))))

(declare-fun b!749801 () Bool)

(declare-fun res!505668 () Bool)

(declare-fun e!418482 () Bool)

(assert (=> b!749801 (=> (not res!505668) (not e!418482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749801 (= res!505668 (validKeyInArray!0 (select (arr!19978 a!3186) j!159)))))

(declare-fun b!749802 () Bool)

(declare-fun res!505670 () Bool)

(declare-fun e!418491 () Bool)

(assert (=> b!749802 (=> (not res!505670) (not e!418491))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749802 (= res!505670 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20398 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20398 a!3186))))))

(declare-fun e!418486 () Bool)

(declare-fun lt!333314 () SeekEntryResult!7534)

(declare-fun b!749803 () Bool)

(assert (=> b!749803 (= e!418486 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!333314))))

(declare-fun b!749804 () Bool)

(declare-fun e!418483 () Bool)

(assert (=> b!749804 (= e!418489 (not e!418483))))

(declare-fun res!505671 () Bool)

(assert (=> b!749804 (=> res!505671 e!418483)))

(get-info :version)

(assert (=> b!749804 (= res!505671 (or (not ((_ is Intermediate!7534) lt!333318)) (bvslt x!1131 (x!63600 lt!333318)) (not (= x!1131 (x!63600 lt!333318))) (not (= index!1321 (index!32506 lt!333318)))))))

(declare-fun e!418485 () Bool)

(assert (=> b!749804 e!418485))

(declare-fun res!505677 () Bool)

(assert (=> b!749804 (=> (not res!505677) (not e!418485))))

(declare-fun lt!333316 () SeekEntryResult!7534)

(declare-fun lt!333312 () SeekEntryResult!7534)

(assert (=> b!749804 (= res!505677 (= lt!333316 lt!333312))))

(assert (=> b!749804 (= lt!333312 (Found!7534 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!749804 (= lt!333316 (seekEntryOrOpen!0 (select (arr!19978 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41737 (_ BitVec 32)) Bool)

(assert (=> b!749804 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25693 0))(
  ( (Unit!25694) )
))
(declare-fun lt!333310 () Unit!25693)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25693)

(assert (=> b!749804 (= lt!333310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749805 () Bool)

(declare-fun res!505683 () Bool)

(assert (=> b!749805 (=> (not res!505683) (not e!418491))))

(assert (=> b!749805 (= res!505683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749806 () Bool)

(declare-fun res!505678 () Bool)

(assert (=> b!749806 (=> (not res!505678) (not e!418482))))

(assert (=> b!749806 (= res!505678 (validKeyInArray!0 k0!2102))))

(declare-fun b!749807 () Bool)

(declare-fun e!418488 () Bool)

(assert (=> b!749807 (= e!418488 (validKeyInArray!0 lt!333313))))

(declare-fun b!749808 () Bool)

(declare-fun res!505669 () Bool)

(assert (=> b!749808 (=> (not res!505669) (not e!418487))))

(assert (=> b!749808 (= res!505669 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19978 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749809 () Bool)

(declare-fun res!505681 () Bool)

(assert (=> b!749809 (=> res!505681 e!418483)))

(assert (=> b!749809 (= res!505681 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) lt!333313))))

(declare-fun b!749810 () Bool)

(declare-fun e!418484 () Unit!25693)

(declare-fun Unit!25695 () Unit!25693)

(assert (=> b!749810 (= e!418484 Unit!25695)))

(declare-fun b!749811 () Bool)

(declare-fun res!505680 () Bool)

(assert (=> b!749811 (=> (not res!505680) (not e!418482))))

(assert (=> b!749811 (= res!505680 (and (= (size!20398 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20398 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20398 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749812 () Bool)

(declare-fun res!505684 () Bool)

(assert (=> b!749812 (=> res!505684 e!418483)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!749812 (= res!505684 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!333312)))))

(declare-fun b!749813 () Bool)

(assert (=> b!749813 (= e!418491 e!418487)))

(declare-fun res!505682 () Bool)

(assert (=> b!749813 (=> (not res!505682) (not e!418487))))

(assert (=> b!749813 (= res!505682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19978 a!3186) j!159) mask!3328) (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!333314))))

(assert (=> b!749813 (= lt!333314 (Intermediate!7534 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749814 () Bool)

(assert (=> b!749814 (= e!418483 e!418488)))

(declare-fun res!505667 () Bool)

(assert (=> b!749814 (=> res!505667 e!418488)))

(assert (=> b!749814 (= res!505667 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!749814 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!333315 () Unit!25693)

(assert (=> b!749814 (= lt!333315 e!418484)))

(declare-fun c!82451 () Bool)

(assert (=> b!749814 (= c!82451 (= (select (store (arr!19978 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749815 () Bool)

(assert (=> b!749815 (= e!418482 e!418491)))

(declare-fun res!505679 () Bool)

(assert (=> b!749815 (=> (not res!505679) (not e!418491))))

(declare-fun lt!333309 () SeekEntryResult!7534)

(assert (=> b!749815 (= res!505679 (or (= lt!333309 (MissingZero!7534 i!1173)) (= lt!333309 (MissingVacant!7534 i!1173))))))

(assert (=> b!749815 (= lt!333309 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749816 () Bool)

(declare-fun res!505676 () Bool)

(assert (=> b!749816 (=> (not res!505676) (not e!418482))))

(declare-fun arrayContainsKey!0 (array!41737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749816 (= res!505676 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!505672 () Bool)

(assert (=> start!65694 (=> (not res!505672) (not e!418482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65694 (= res!505672 (validMask!0 mask!3328))))

(assert (=> start!65694 e!418482))

(assert (=> start!65694 true))

(declare-fun array_inv!15837 (array!41737) Bool)

(assert (=> start!65694 (array_inv!15837 a!3186)))

(declare-fun b!749817 () Bool)

(declare-fun res!505675 () Bool)

(assert (=> b!749817 (=> (not res!505675) (not e!418491))))

(declare-datatypes ((List!13887 0))(
  ( (Nil!13884) (Cons!13883 (h!14961 (_ BitVec 64)) (t!20194 List!13887)) )
))
(declare-fun arrayNoDuplicates!0 (array!41737 (_ BitVec 32) List!13887) Bool)

(assert (=> b!749817 (= res!505675 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13884))))

(declare-fun b!749818 () Bool)

(declare-fun Unit!25696 () Unit!25693)

(assert (=> b!749818 (= e!418484 Unit!25696)))

(assert (=> b!749818 false))

(declare-fun b!749819 () Bool)

(assert (=> b!749819 (= e!418486 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) (Found!7534 j!159)))))

(declare-fun b!749820 () Bool)

(assert (=> b!749820 (= e!418485 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19978 a!3186) j!159) a!3186 mask!3328) lt!333312))))

(declare-fun b!749821 () Bool)

(declare-fun res!505673 () Bool)

(assert (=> b!749821 (=> (not res!505673) (not e!418487))))

(assert (=> b!749821 (= res!505673 e!418486)))

(declare-fun c!82450 () Bool)

(assert (=> b!749821 (= c!82450 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65694 res!505672) b!749811))

(assert (= (and b!749811 res!505680) b!749801))

(assert (= (and b!749801 res!505668) b!749806))

(assert (= (and b!749806 res!505678) b!749816))

(assert (= (and b!749816 res!505676) b!749815))

(assert (= (and b!749815 res!505679) b!749805))

(assert (= (and b!749805 res!505683) b!749817))

(assert (= (and b!749817 res!505675) b!749802))

(assert (= (and b!749802 res!505670) b!749813))

(assert (= (and b!749813 res!505682) b!749808))

(assert (= (and b!749808 res!505669) b!749821))

(assert (= (and b!749821 c!82450) b!749803))

(assert (= (and b!749821 (not c!82450)) b!749819))

(assert (= (and b!749821 res!505673) b!749800))

(assert (= (and b!749800 res!505674) b!749804))

(assert (= (and b!749804 res!505677) b!749820))

(assert (= (and b!749804 (not res!505671)) b!749812))

(assert (= (and b!749812 (not res!505684)) b!749809))

(assert (= (and b!749809 (not res!505681)) b!749814))

(assert (= (and b!749814 c!82451) b!749818))

(assert (= (and b!749814 (not c!82451)) b!749810))

(assert (= (and b!749814 (not res!505667)) b!749807))

(declare-fun m!699909 () Bool)

(assert (=> b!749814 m!699909))

(declare-fun m!699911 () Bool)

(assert (=> b!749814 m!699911))

(declare-fun m!699913 () Bool)

(assert (=> b!749816 m!699913))

(declare-fun m!699915 () Bool)

(assert (=> b!749815 m!699915))

(declare-fun m!699917 () Bool)

(assert (=> start!65694 m!699917))

(declare-fun m!699919 () Bool)

(assert (=> start!65694 m!699919))

(declare-fun m!699921 () Bool)

(assert (=> b!749819 m!699921))

(assert (=> b!749819 m!699921))

(declare-fun m!699923 () Bool)

(assert (=> b!749819 m!699923))

(assert (=> b!749812 m!699921))

(assert (=> b!749812 m!699921))

(assert (=> b!749812 m!699923))

(assert (=> b!749801 m!699921))

(assert (=> b!749801 m!699921))

(declare-fun m!699925 () Bool)

(assert (=> b!749801 m!699925))

(declare-fun m!699927 () Bool)

(assert (=> b!749806 m!699927))

(declare-fun m!699929 () Bool)

(assert (=> b!749800 m!699929))

(declare-fun m!699931 () Bool)

(assert (=> b!749800 m!699931))

(declare-fun m!699933 () Bool)

(assert (=> b!749800 m!699933))

(declare-fun m!699935 () Bool)

(assert (=> b!749800 m!699935))

(assert (=> b!749800 m!699931))

(assert (=> b!749800 m!699909))

(declare-fun m!699937 () Bool)

(assert (=> b!749817 m!699937))

(assert (=> b!749803 m!699921))

(assert (=> b!749803 m!699921))

(declare-fun m!699939 () Bool)

(assert (=> b!749803 m!699939))

(declare-fun m!699941 () Bool)

(assert (=> b!749805 m!699941))

(assert (=> b!749804 m!699921))

(assert (=> b!749804 m!699921))

(declare-fun m!699943 () Bool)

(assert (=> b!749804 m!699943))

(declare-fun m!699945 () Bool)

(assert (=> b!749804 m!699945))

(declare-fun m!699947 () Bool)

(assert (=> b!749804 m!699947))

(declare-fun m!699949 () Bool)

(assert (=> b!749807 m!699949))

(declare-fun m!699951 () Bool)

(assert (=> b!749808 m!699951))

(assert (=> b!749820 m!699921))

(assert (=> b!749820 m!699921))

(declare-fun m!699953 () Bool)

(assert (=> b!749820 m!699953))

(assert (=> b!749809 m!699909))

(assert (=> b!749809 m!699911))

(assert (=> b!749813 m!699921))

(assert (=> b!749813 m!699921))

(declare-fun m!699955 () Bool)

(assert (=> b!749813 m!699955))

(assert (=> b!749813 m!699955))

(assert (=> b!749813 m!699921))

(declare-fun m!699957 () Bool)

(assert (=> b!749813 m!699957))

(check-sat (not b!749817) (not b!749800) (not b!749820) (not b!749803) (not b!749813) (not b!749801) (not b!749819) (not b!749812) (not b!749816) (not start!65694) (not b!749815) (not b!749806) (not b!749805) (not b!749807) (not b!749804))
(check-sat)
