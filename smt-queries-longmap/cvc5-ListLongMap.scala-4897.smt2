; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67560 () Bool)

(assert start!67560)

(declare-fun b!781951 () Bool)

(declare-fun e!434862 () Bool)

(declare-fun e!434867 () Bool)

(assert (=> b!781951 (= e!434862 e!434867)))

(declare-fun res!529051 () Bool)

(assert (=> b!781951 (=> (not res!529051) (not e!434867))))

(declare-datatypes ((SeekEntryResult!8021 0))(
  ( (MissingZero!8021 (index!34452 (_ BitVec 32))) (Found!8021 (index!34453 (_ BitVec 32))) (Intermediate!8021 (undefined!8833 Bool) (index!34454 (_ BitVec 32)) (x!65408 (_ BitVec 32))) (Undefined!8021) (MissingVacant!8021 (index!34455 (_ BitVec 32))) )
))
(declare-fun lt!348477 () SeekEntryResult!8021)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781951 (= res!529051 (or (= lt!348477 (MissingZero!8021 i!1173)) (= lt!348477 (MissingVacant!8021 i!1173))))))

(declare-datatypes ((array!42663 0))(
  ( (array!42664 (arr!20421 (Array (_ BitVec 32) (_ BitVec 64))) (size!20842 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42663)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42663 (_ BitVec 32)) SeekEntryResult!8021)

(assert (=> b!781951 (= lt!348477 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781952 () Bool)

(declare-fun res!529052 () Bool)

(declare-fun e!434868 () Bool)

(assert (=> b!781952 (=> res!529052 e!434868)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348474 () (_ BitVec 64))

(assert (=> b!781952 (= res!529052 (= (select (store (arr!20421 a!3186) i!1173 k!2102) index!1321) lt!348474))))

(declare-fun b!781953 () Bool)

(declare-fun res!529046 () Bool)

(assert (=> b!781953 (=> (not res!529046) (not e!434867))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781953 (= res!529046 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20842 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20842 a!3186))))))

(declare-fun b!781954 () Bool)

(declare-fun res!529054 () Bool)

(assert (=> b!781954 (=> (not res!529054) (not e!434862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781954 (= res!529054 (validKeyInArray!0 k!2102))))

(declare-fun b!781955 () Bool)

(declare-fun e!434864 () Bool)

(declare-fun e!434869 () Bool)

(assert (=> b!781955 (= e!434864 e!434869)))

(declare-fun res!529045 () Bool)

(assert (=> b!781955 (=> (not res!529045) (not e!434869))))

(declare-fun lt!348478 () SeekEntryResult!8021)

(declare-fun lt!348479 () SeekEntryResult!8021)

(assert (=> b!781955 (= res!529045 (= lt!348478 lt!348479))))

(declare-fun lt!348473 () array!42663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42663 (_ BitVec 32)) SeekEntryResult!8021)

(assert (=> b!781955 (= lt!348479 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348474 lt!348473 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781955 (= lt!348478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348474 mask!3328) lt!348474 lt!348473 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!781955 (= lt!348474 (select (store (arr!20421 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781955 (= lt!348473 (array!42664 (store (arr!20421 a!3186) i!1173 k!2102) (size!20842 a!3186)))))

(declare-fun b!781957 () Bool)

(declare-fun res!529059 () Bool)

(assert (=> b!781957 (=> res!529059 e!434868)))

(declare-fun lt!348476 () SeekEntryResult!8021)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42663 (_ BitVec 32)) SeekEntryResult!8021)

(assert (=> b!781957 (= res!529059 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20421 a!3186) j!159) a!3186 mask!3328) lt!348476)))))

(declare-fun b!781958 () Bool)

(declare-fun res!529048 () Bool)

(assert (=> b!781958 (=> (not res!529048) (not e!434862))))

(declare-fun arrayContainsKey!0 (array!42663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781958 (= res!529048 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781959 () Bool)

(declare-datatypes ((Unit!26972 0))(
  ( (Unit!26973) )
))
(declare-fun e!434866 () Unit!26972)

(declare-fun Unit!26974 () Unit!26972)

(assert (=> b!781959 (= e!434866 Unit!26974)))

(assert (=> b!781959 false))

(declare-fun b!781960 () Bool)

(assert (=> b!781960 (= e!434867 e!434864)))

(declare-fun res!529061 () Bool)

(assert (=> b!781960 (=> (not res!529061) (not e!434864))))

(declare-fun lt!348475 () SeekEntryResult!8021)

(assert (=> b!781960 (= res!529061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20421 a!3186) j!159) mask!3328) (select (arr!20421 a!3186) j!159) a!3186 mask!3328) lt!348475))))

(assert (=> b!781960 (= lt!348475 (Intermediate!8021 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781961 () Bool)

(declare-fun res!529050 () Bool)

(assert (=> b!781961 (=> (not res!529050) (not e!434864))))

(assert (=> b!781961 (= res!529050 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20421 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781962 () Bool)

(declare-fun res!529047 () Bool)

(assert (=> b!781962 (=> (not res!529047) (not e!434864))))

(declare-fun e!434870 () Bool)

(assert (=> b!781962 (= res!529047 e!434870)))

(declare-fun c!86860 () Bool)

(assert (=> b!781962 (= c!86860 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781963 () Bool)

(declare-fun res!529060 () Bool)

(assert (=> b!781963 (=> (not res!529060) (not e!434862))))

(assert (=> b!781963 (= res!529060 (validKeyInArray!0 (select (arr!20421 a!3186) j!159)))))

(declare-fun b!781964 () Bool)

(assert (=> b!781964 (= e!434870 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20421 a!3186) j!159) a!3186 mask!3328) lt!348475))))

(declare-fun b!781965 () Bool)

(declare-fun res!529055 () Bool)

(assert (=> b!781965 (=> (not res!529055) (not e!434867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42663 (_ BitVec 32)) Bool)

(assert (=> b!781965 (= res!529055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781956 () Bool)

(declare-fun res!529049 () Bool)

(assert (=> b!781956 (=> (not res!529049) (not e!434862))))

(assert (=> b!781956 (= res!529049 (and (= (size!20842 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20842 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20842 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!529053 () Bool)

(assert (=> start!67560 (=> (not res!529053) (not e!434862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67560 (= res!529053 (validMask!0 mask!3328))))

(assert (=> start!67560 e!434862))

(assert (=> start!67560 true))

(declare-fun array_inv!16217 (array!42663) Bool)

(assert (=> start!67560 (array_inv!16217 a!3186)))

(declare-fun e!434863 () Bool)

(declare-fun b!781966 () Bool)

(assert (=> b!781966 (= e!434863 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20421 a!3186) j!159) a!3186 mask!3328) lt!348476))))

(declare-fun b!781967 () Bool)

(assert (=> b!781967 (= e!434870 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20421 a!3186) j!159) a!3186 mask!3328) (Found!8021 j!159)))))

(declare-fun b!781968 () Bool)

(assert (=> b!781968 (= e!434869 (not e!434868))))

(declare-fun res!529057 () Bool)

(assert (=> b!781968 (=> res!529057 e!434868)))

(assert (=> b!781968 (= res!529057 (or (not (is-Intermediate!8021 lt!348479)) (bvslt x!1131 (x!65408 lt!348479)) (not (= x!1131 (x!65408 lt!348479))) (not (= index!1321 (index!34454 lt!348479)))))))

(assert (=> b!781968 e!434863))

(declare-fun res!529056 () Bool)

(assert (=> b!781968 (=> (not res!529056) (not e!434863))))

(declare-fun lt!348470 () SeekEntryResult!8021)

(assert (=> b!781968 (= res!529056 (= lt!348470 lt!348476))))

(assert (=> b!781968 (= lt!348476 (Found!8021 j!159))))

(assert (=> b!781968 (= lt!348470 (seekEntryOrOpen!0 (select (arr!20421 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781968 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348472 () Unit!26972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26972)

(assert (=> b!781968 (= lt!348472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781969 () Bool)

(assert (=> b!781969 (= e!434868 true)))

(assert (=> b!781969 (= (select (store (arr!20421 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348471 () Unit!26972)

(assert (=> b!781969 (= lt!348471 e!434866)))

(declare-fun c!86859 () Bool)

(assert (=> b!781969 (= c!86859 (= (select (store (arr!20421 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781970 () Bool)

(declare-fun Unit!26975 () Unit!26972)

(assert (=> b!781970 (= e!434866 Unit!26975)))

(declare-fun b!781971 () Bool)

(declare-fun res!529058 () Bool)

(assert (=> b!781971 (=> (not res!529058) (not e!434867))))

(declare-datatypes ((List!14423 0))(
  ( (Nil!14420) (Cons!14419 (h!15539 (_ BitVec 64)) (t!20738 List!14423)) )
))
(declare-fun arrayNoDuplicates!0 (array!42663 (_ BitVec 32) List!14423) Bool)

(assert (=> b!781971 (= res!529058 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14420))))

(assert (= (and start!67560 res!529053) b!781956))

(assert (= (and b!781956 res!529049) b!781963))

(assert (= (and b!781963 res!529060) b!781954))

(assert (= (and b!781954 res!529054) b!781958))

(assert (= (and b!781958 res!529048) b!781951))

(assert (= (and b!781951 res!529051) b!781965))

(assert (= (and b!781965 res!529055) b!781971))

(assert (= (and b!781971 res!529058) b!781953))

(assert (= (and b!781953 res!529046) b!781960))

(assert (= (and b!781960 res!529061) b!781961))

(assert (= (and b!781961 res!529050) b!781962))

(assert (= (and b!781962 c!86860) b!781964))

(assert (= (and b!781962 (not c!86860)) b!781967))

(assert (= (and b!781962 res!529047) b!781955))

(assert (= (and b!781955 res!529045) b!781968))

(assert (= (and b!781968 res!529056) b!781966))

(assert (= (and b!781968 (not res!529057)) b!781957))

(assert (= (and b!781957 (not res!529059)) b!781952))

(assert (= (and b!781952 (not res!529052)) b!781969))

(assert (= (and b!781969 c!86859) b!781959))

(assert (= (and b!781969 (not c!86859)) b!781970))

(declare-fun m!724859 () Bool)

(assert (=> b!781966 m!724859))

(assert (=> b!781966 m!724859))

(declare-fun m!724861 () Bool)

(assert (=> b!781966 m!724861))

(declare-fun m!724863 () Bool)

(assert (=> b!781961 m!724863))

(declare-fun m!724865 () Bool)

(assert (=> b!781954 m!724865))

(declare-fun m!724867 () Bool)

(assert (=> b!781951 m!724867))

(assert (=> b!781963 m!724859))

(assert (=> b!781963 m!724859))

(declare-fun m!724869 () Bool)

(assert (=> b!781963 m!724869))

(assert (=> b!781964 m!724859))

(assert (=> b!781964 m!724859))

(declare-fun m!724871 () Bool)

(assert (=> b!781964 m!724871))

(declare-fun m!724873 () Bool)

(assert (=> b!781958 m!724873))

(declare-fun m!724875 () Bool)

(assert (=> b!781955 m!724875))

(declare-fun m!724877 () Bool)

(assert (=> b!781955 m!724877))

(declare-fun m!724879 () Bool)

(assert (=> b!781955 m!724879))

(declare-fun m!724881 () Bool)

(assert (=> b!781955 m!724881))

(assert (=> b!781955 m!724881))

(declare-fun m!724883 () Bool)

(assert (=> b!781955 m!724883))

(assert (=> b!781967 m!724859))

(assert (=> b!781967 m!724859))

(declare-fun m!724885 () Bool)

(assert (=> b!781967 m!724885))

(declare-fun m!724887 () Bool)

(assert (=> b!781965 m!724887))

(assert (=> b!781968 m!724859))

(assert (=> b!781968 m!724859))

(declare-fun m!724889 () Bool)

(assert (=> b!781968 m!724889))

(declare-fun m!724891 () Bool)

(assert (=> b!781968 m!724891))

(declare-fun m!724893 () Bool)

(assert (=> b!781968 m!724893))

(assert (=> b!781969 m!724875))

(declare-fun m!724895 () Bool)

(assert (=> b!781969 m!724895))

(assert (=> b!781960 m!724859))

(assert (=> b!781960 m!724859))

(declare-fun m!724897 () Bool)

(assert (=> b!781960 m!724897))

(assert (=> b!781960 m!724897))

(assert (=> b!781960 m!724859))

(declare-fun m!724899 () Bool)

(assert (=> b!781960 m!724899))

(declare-fun m!724901 () Bool)

(assert (=> b!781971 m!724901))

(declare-fun m!724903 () Bool)

(assert (=> start!67560 m!724903))

(declare-fun m!724905 () Bool)

(assert (=> start!67560 m!724905))

(assert (=> b!781957 m!724859))

(assert (=> b!781957 m!724859))

(assert (=> b!781957 m!724885))

(assert (=> b!781952 m!724875))

(assert (=> b!781952 m!724895))

(push 1)

