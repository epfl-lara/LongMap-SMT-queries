; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65766 () Bool)

(assert start!65766)

(declare-fun b!755840 () Bool)

(declare-fun res!510959 () Bool)

(declare-fun e!421491 () Bool)

(assert (=> b!755840 (=> (not res!510959) (not e!421491))))

(declare-datatypes ((array!41939 0))(
  ( (array!41940 (arr!20083 (Array (_ BitVec 32) (_ BitVec 64))) (size!20504 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41939)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755840 (= res!510959 (validKeyInArray!0 (select (arr!20083 a!3186) j!159)))))

(declare-fun b!755841 () Bool)

(declare-fun res!510950 () Bool)

(assert (=> b!755841 (=> (not res!510950) (not e!421491))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!755841 (= res!510950 (and (= (size!20504 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20504 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20504 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755842 () Bool)

(declare-fun e!421487 () Bool)

(declare-fun e!421483 () Bool)

(assert (=> b!755842 (= e!421487 e!421483)))

(declare-fun res!510953 () Bool)

(assert (=> b!755842 (=> res!510953 e!421483)))

(declare-datatypes ((SeekEntryResult!7683 0))(
  ( (MissingZero!7683 (index!33100 (_ BitVec 32))) (Found!7683 (index!33101 (_ BitVec 32))) (Intermediate!7683 (undefined!8495 Bool) (index!33102 (_ BitVec 32)) (x!64001 (_ BitVec 32))) (Undefined!7683) (MissingVacant!7683 (index!33103 (_ BitVec 32))) )
))
(declare-fun lt!336476 () SeekEntryResult!7683)

(declare-fun lt!336485 () SeekEntryResult!7683)

(assert (=> b!755842 (= res!510953 (not (= lt!336476 lt!336485)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41939 (_ BitVec 32)) SeekEntryResult!7683)

(assert (=> b!755842 (= lt!336476 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755843 () Bool)

(declare-fun res!510958 () Bool)

(declare-fun e!421486 () Bool)

(assert (=> b!755843 (=> (not res!510958) (not e!421486))))

(assert (=> b!755843 (= res!510958 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20083 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755844 () Bool)

(declare-fun e!421490 () Bool)

(assert (=> b!755844 (= e!421483 e!421490)))

(declare-fun res!510952 () Bool)

(assert (=> b!755844 (=> res!510952 e!421490)))

(declare-fun lt!336477 () (_ BitVec 64))

(declare-fun lt!336484 () (_ BitVec 64))

(assert (=> b!755844 (= res!510952 (= lt!336477 lt!336484))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755844 (= lt!336477 (select (store (arr!20083 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755845 () Bool)

(declare-fun e!421484 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755845 (= e!421484 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336485))))

(declare-fun b!755846 () Bool)

(declare-fun res!510947 () Bool)

(declare-fun e!421488 () Bool)

(assert (=> b!755846 (=> (not res!510947) (not e!421488))))

(declare-datatypes ((List!14085 0))(
  ( (Nil!14082) (Cons!14081 (h!15153 (_ BitVec 64)) (t!20400 List!14085)) )
))
(declare-fun arrayNoDuplicates!0 (array!41939 (_ BitVec 32) List!14085) Bool)

(assert (=> b!755846 (= res!510947 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14082))))

(declare-fun b!755847 () Bool)

(declare-fun res!510962 () Bool)

(declare-fun e!421493 () Bool)

(assert (=> b!755847 (=> (not res!510962) (not e!421493))))

(declare-fun lt!336481 () array!41939)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41939 (_ BitVec 32)) SeekEntryResult!7683)

(assert (=> b!755847 (= res!510962 (= (seekEntryOrOpen!0 lt!336484 lt!336481 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336484 lt!336481 mask!3328)))))

(declare-fun b!755848 () Bool)

(declare-fun lt!336483 () SeekEntryResult!7683)

(assert (=> b!755848 (= e!421493 (= lt!336483 lt!336476))))

(declare-fun b!755849 () Bool)

(declare-datatypes ((Unit!26112 0))(
  ( (Unit!26113) )
))
(declare-fun e!421482 () Unit!26112)

(declare-fun Unit!26114 () Unit!26112)

(assert (=> b!755849 (= e!421482 Unit!26114)))

(declare-fun b!755850 () Bool)

(assert (=> b!755850 (= e!421491 e!421488)))

(declare-fun res!510965 () Bool)

(assert (=> b!755850 (=> (not res!510965) (not e!421488))))

(declare-fun lt!336478 () SeekEntryResult!7683)

(assert (=> b!755850 (= res!510965 (or (= lt!336478 (MissingZero!7683 i!1173)) (= lt!336478 (MissingVacant!7683 i!1173))))))

(assert (=> b!755850 (= lt!336478 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755851 () Bool)

(declare-fun e!421489 () Bool)

(assert (=> b!755851 (= e!421486 e!421489)))

(declare-fun res!510960 () Bool)

(assert (=> b!755851 (=> (not res!510960) (not e!421489))))

(declare-fun lt!336474 () SeekEntryResult!7683)

(declare-fun lt!336482 () SeekEntryResult!7683)

(assert (=> b!755851 (= res!510960 (= lt!336474 lt!336482))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41939 (_ BitVec 32)) SeekEntryResult!7683)

(assert (=> b!755851 (= lt!336482 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336484 lt!336481 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755851 (= lt!336474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336484 mask!3328) lt!336484 lt!336481 mask!3328))))

(assert (=> b!755851 (= lt!336484 (select (store (arr!20083 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755851 (= lt!336481 (array!41940 (store (arr!20083 a!3186) i!1173 k0!2102) (size!20504 a!3186)))))

(declare-fun b!755852 () Bool)

(declare-fun res!510964 () Bool)

(assert (=> b!755852 (=> (not res!510964) (not e!421486))))

(declare-fun e!421492 () Bool)

(assert (=> b!755852 (= res!510964 e!421492)))

(declare-fun c!82828 () Bool)

(assert (=> b!755852 (= c!82828 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755853 () Bool)

(declare-fun res!510957 () Bool)

(assert (=> b!755853 (=> (not res!510957) (not e!421488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41939 (_ BitVec 32)) Bool)

(assert (=> b!755853 (= res!510957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755854 () Bool)

(declare-fun res!510963 () Bool)

(assert (=> b!755854 (=> (not res!510963) (not e!421488))))

(assert (=> b!755854 (= res!510963 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20504 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20504 a!3186))))))

(declare-fun b!755855 () Bool)

(assert (=> b!755855 (= e!421489 (not e!421487))))

(declare-fun res!510949 () Bool)

(assert (=> b!755855 (=> res!510949 e!421487)))

(get-info :version)

(assert (=> b!755855 (= res!510949 (or (not ((_ is Intermediate!7683) lt!336482)) (bvslt x!1131 (x!64001 lt!336482)) (not (= x!1131 (x!64001 lt!336482))) (not (= index!1321 (index!33102 lt!336482)))))))

(assert (=> b!755855 e!421484))

(declare-fun res!510948 () Bool)

(assert (=> b!755855 (=> (not res!510948) (not e!421484))))

(assert (=> b!755855 (= res!510948 (= lt!336483 lt!336485))))

(assert (=> b!755855 (= lt!336485 (Found!7683 j!159))))

(assert (=> b!755855 (= lt!336483 (seekEntryOrOpen!0 (select (arr!20083 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755855 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336480 () Unit!26112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26112)

(assert (=> b!755855 (= lt!336480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755856 () Bool)

(declare-fun res!510956 () Bool)

(assert (=> b!755856 (=> (not res!510956) (not e!421491))))

(declare-fun arrayContainsKey!0 (array!41939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755856 (= res!510956 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755857 () Bool)

(assert (=> b!755857 (= e!421492 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) (Found!7683 j!159)))))

(declare-fun b!755858 () Bool)

(declare-fun res!510961 () Bool)

(assert (=> b!755858 (=> (not res!510961) (not e!421491))))

(assert (=> b!755858 (= res!510961 (validKeyInArray!0 k0!2102))))

(declare-fun res!510951 () Bool)

(assert (=> start!65766 (=> (not res!510951) (not e!421491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65766 (= res!510951 (validMask!0 mask!3328))))

(assert (=> start!65766 e!421491))

(assert (=> start!65766 true))

(declare-fun array_inv!15879 (array!41939) Bool)

(assert (=> start!65766 (array_inv!15879 a!3186)))

(declare-fun b!755859 () Bool)

(assert (=> b!755859 (= e!421490 true)))

(assert (=> b!755859 e!421493))

(declare-fun res!510955 () Bool)

(assert (=> b!755859 (=> (not res!510955) (not e!421493))))

(assert (=> b!755859 (= res!510955 (= lt!336477 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336475 () Unit!26112)

(assert (=> b!755859 (= lt!336475 e!421482)))

(declare-fun c!82827 () Bool)

(assert (=> b!755859 (= c!82827 (= lt!336477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755860 () Bool)

(declare-fun lt!336479 () SeekEntryResult!7683)

(assert (=> b!755860 (= e!421492 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336479))))

(declare-fun b!755861 () Bool)

(declare-fun Unit!26115 () Unit!26112)

(assert (=> b!755861 (= e!421482 Unit!26115)))

(assert (=> b!755861 false))

(declare-fun b!755862 () Bool)

(assert (=> b!755862 (= e!421488 e!421486)))

(declare-fun res!510954 () Bool)

(assert (=> b!755862 (=> (not res!510954) (not e!421486))))

(assert (=> b!755862 (= res!510954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20083 a!3186) j!159) mask!3328) (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336479))))

(assert (=> b!755862 (= lt!336479 (Intermediate!7683 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65766 res!510951) b!755841))

(assert (= (and b!755841 res!510950) b!755840))

(assert (= (and b!755840 res!510959) b!755858))

(assert (= (and b!755858 res!510961) b!755856))

(assert (= (and b!755856 res!510956) b!755850))

(assert (= (and b!755850 res!510965) b!755853))

(assert (= (and b!755853 res!510957) b!755846))

(assert (= (and b!755846 res!510947) b!755854))

(assert (= (and b!755854 res!510963) b!755862))

(assert (= (and b!755862 res!510954) b!755843))

(assert (= (and b!755843 res!510958) b!755852))

(assert (= (and b!755852 c!82828) b!755860))

(assert (= (and b!755852 (not c!82828)) b!755857))

(assert (= (and b!755852 res!510964) b!755851))

(assert (= (and b!755851 res!510960) b!755855))

(assert (= (and b!755855 res!510948) b!755845))

(assert (= (and b!755855 (not res!510949)) b!755842))

(assert (= (and b!755842 (not res!510953)) b!755844))

(assert (= (and b!755844 (not res!510952)) b!755859))

(assert (= (and b!755859 c!82827) b!755861))

(assert (= (and b!755859 (not c!82827)) b!755849))

(assert (= (and b!755859 res!510955) b!755847))

(assert (= (and b!755847 res!510962) b!755848))

(declare-fun m!703943 () Bool)

(assert (=> b!755853 m!703943))

(declare-fun m!703945 () Bool)

(assert (=> b!755856 m!703945))

(declare-fun m!703947 () Bool)

(assert (=> b!755851 m!703947))

(declare-fun m!703949 () Bool)

(assert (=> b!755851 m!703949))

(declare-fun m!703951 () Bool)

(assert (=> b!755851 m!703951))

(declare-fun m!703953 () Bool)

(assert (=> b!755851 m!703953))

(assert (=> b!755851 m!703949))

(declare-fun m!703955 () Bool)

(assert (=> b!755851 m!703955))

(declare-fun m!703957 () Bool)

(assert (=> start!65766 m!703957))

(declare-fun m!703959 () Bool)

(assert (=> start!65766 m!703959))

(declare-fun m!703961 () Bool)

(assert (=> b!755857 m!703961))

(assert (=> b!755857 m!703961))

(declare-fun m!703963 () Bool)

(assert (=> b!755857 m!703963))

(assert (=> b!755862 m!703961))

(assert (=> b!755862 m!703961))

(declare-fun m!703965 () Bool)

(assert (=> b!755862 m!703965))

(assert (=> b!755862 m!703965))

(assert (=> b!755862 m!703961))

(declare-fun m!703967 () Bool)

(assert (=> b!755862 m!703967))

(assert (=> b!755860 m!703961))

(assert (=> b!755860 m!703961))

(declare-fun m!703969 () Bool)

(assert (=> b!755860 m!703969))

(declare-fun m!703971 () Bool)

(assert (=> b!755858 m!703971))

(declare-fun m!703973 () Bool)

(assert (=> b!755846 m!703973))

(assert (=> b!755845 m!703961))

(assert (=> b!755845 m!703961))

(declare-fun m!703975 () Bool)

(assert (=> b!755845 m!703975))

(declare-fun m!703977 () Bool)

(assert (=> b!755850 m!703977))

(declare-fun m!703979 () Bool)

(assert (=> b!755843 m!703979))

(assert (=> b!755855 m!703961))

(assert (=> b!755855 m!703961))

(declare-fun m!703981 () Bool)

(assert (=> b!755855 m!703981))

(declare-fun m!703983 () Bool)

(assert (=> b!755855 m!703983))

(declare-fun m!703985 () Bool)

(assert (=> b!755855 m!703985))

(assert (=> b!755842 m!703961))

(assert (=> b!755842 m!703961))

(assert (=> b!755842 m!703963))

(assert (=> b!755844 m!703951))

(declare-fun m!703987 () Bool)

(assert (=> b!755844 m!703987))

(declare-fun m!703989 () Bool)

(assert (=> b!755847 m!703989))

(declare-fun m!703991 () Bool)

(assert (=> b!755847 m!703991))

(assert (=> b!755840 m!703961))

(assert (=> b!755840 m!703961))

(declare-fun m!703993 () Bool)

(assert (=> b!755840 m!703993))

(check-sat (not b!755840) (not start!65766) (not b!755862) (not b!755855) (not b!755846) (not b!755856) (not b!755857) (not b!755851) (not b!755845) (not b!755858) (not b!755842) (not b!755850) (not b!755853) (not b!755860) (not b!755847))
(check-sat)
